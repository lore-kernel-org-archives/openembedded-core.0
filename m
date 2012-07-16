Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SqtcA-0002Yp-9H
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 00:18:02 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 9911220A1E;
	Mon, 16 Jul 2012 18:06:45 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 16 Jul 2012 18:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=gbUsatLd7h+6ZK0DUjCUmr
	w0pJM=; b=c4vjp71YL1CaG1OAUw8f4id5AUm2dBUcmiTvq0HIzhoFxdHF+PSeZF
	jQkY1wsIfWBu1rkHUGMQ8+63qwp1dowucRvVr60O/Apx+3PvfZNbFSLUwBqIVpmM
	fhWbzV16AJLDHm7fJcd7OxWBzDANs2aBV5BXPQjVpBBtThqYXN43M=
X-Sasl-enc: tslNOrc9+sAEaSDhOZghZQ9x12D4ezIwjIo47NLMmNMu 1342476405
Received: from [192.168.43.202] (unknown [166.248.8.148])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3073F8E01F4;
	Mon, 16 Jul 2012 18:06:45 -0400 (EDT)
Message-ID: <1342476368.29989.2.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 18:06:08 -0400
In-Reply-To: <CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
X-Mailer: Evolution 3.4.3 (3.4.3-1.fc17) 
Mime-Version: 1.0
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 22:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 15:00 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Jul 10, 2012 at 8:32 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Originally, git was something new, not installed everywhere and had commandline
> > stability problems. This has changed and git it no longer makes sense to
> > continually build this when the system installed version is likely sufficient.
> >
> > This speeds up build since recipes no longer have to wait for git-native to build
> > if they're fetched from a git:// SRC_URI.
> >
> > Also add git to the sanity checks and drop the no unneeded svn reference.
> 
> What about testing the host system for presence of certain things?
> Then one could
> 
> 1) yum/apt/etc install the needed items

We do something like this in GNOME/jhbuild, but there's no version
comparison:

https://bugzilla.gnome.org/show_bug.cgi?id=564373

This is mainly targeted for system libraries which have pkg-config
files, but we're discussing extending it to executables and
non-pkg-config headers:

https://bugzilla.gnome.org/show_bug.cgi?id=671042




