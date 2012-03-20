Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S9xeR-0005aI-GJ
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:54:55 +0100
Received: by ghbz2 with SMTP id z2so6056352ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yLzQzq7o/85/cGiNXB2Lq1d2IXH1bXvAnCT19fM4ioQ=;
	b=qvn+Iv1c7BAgIQBs475q9K2Zcz8di1UjHwk20qR5rV4OSkAX+0w0U61httlKws20MY
	jfQSeSi263xHsLr/KuTznZl+KrnK09rSXk+YnN8uBofObvxFSZNUTRz2lejd9EFyP8Cw
	zSqPulWeQel3sIecgjhcqRhq/XwIke+41+QCLDwUMgJ7Ftykb+y5CDRzWoNEBy8lMYZU
	aaOopDOLVzkQFCkSaCfCMRFGm3La1VpN6G/QqQN8BcqYuLLzUXrBZgUuo6mp+30gEPHC
	200pGiDgJFskSuaTbUU2Dcb/x05pMeLmpL7/LPR2H54MhY2t52M0K9ZzSYddYpe5tdvP
	i0MA==
MIME-Version: 1.0
Received: by 10.236.153.70 with SMTP id e46mr15906172yhk.29.1332243962668;
	Tue, 20 Mar 2012 04:46:02 -0700 (PDT)
Received: by 10.236.37.131 with HTTP; Tue, 20 Mar 2012 04:46:02 -0700 (PDT)
In-Reply-To: <CA+YB3rbZqhGf7cCbM=MR5i5OsM31qKZKvaz32eHQ0q92n24F-A@mail.gmail.com>
References: <CA+YB3rbZqhGf7cCbM=MR5i5OsM31qKZKvaz32eHQ0q92n24F-A@mail.gmail.com>
Date: Tue, 20 Mar 2012 12:46:02 +0100
Message-ID: <CA+chaQdv3x7-WEsATLbfoOh+cORMqVNRpPX18deEqMG3CKOR0Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: MINUTES: OE TSC 13 March 2012
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
X-List-Received-Date: Tue, 20 Mar 2012 11:54:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 19, 2012 at 11:10 PM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> (9:28:46 AM) RP__: For example, someone sends a patch X, it merges, it
> breaks things
> (9:29:11 AM) RP__: At present I spend a lot of time fixing things since the
> breakage starts affecting people who have no interest in the patch
> (9:29:35 AM) bluelightning: RP__: do you have some recent examples?
> (9:29:52 AM) RP__: bluelightning: Adding python to gdb-cross-candian
> (9:30:06 AM) bluelightning: ah yes :/
> (9:30:07 AM) RP__: took out meta-toolchain on rpm
> (9:30:23 AM) RP__: This kind of stuff becomes my problem :(

FWIW: I haven't seen any report of issues related to this ^ and I also
haven't interest in gdb-cross-canadian with python, but it was useful
to reveal bug in oe-core's SDK_PATH settings.

Cheers,


