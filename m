Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6ks-0000Au-3u
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:09:14 +0100
Received: by lahd3 with SMTP id d3so1256199lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fpTRJmKI2nuBr/fsLCHc5Sjk6yJmV5PwBJQhoUOfDdo=;
	b=I/vQlkDBHDYbfNJORR/gtH0n7hLPIJOp/HFDQtSLEVEZ+WQfi4sem6qK6pGTRNJ1j0
	rtMqBB1r2FiB0zxYWc6BZj/SBQRxY5mpnKER3CHAPPOySy1DkiXkzAP0nENWUwa7Dd1v
	DKtAw0Qe15bWvTTh1P7R0CQJlLjgPqW0rD6aQ=
Received: by 10.152.134.179 with SMTP id pl19mr5884512lab.13.1323460942328;
	Fri, 09 Dec 2011 12:02:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 12:01:51 -0800 (PST)
In-Reply-To: <CAGiJk9c-Mw7ip+RbJCU9pupBoV+O5A0rE9kXH9OTynPPsygWHg@mail.gmail.com>
References: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
	<528C3B90-90CF-48F7-AD32-0200B1F16F82@dominion.thruhere.net>
	<CAGiJk9e1hij=EsWo8=nTmZxNjvptXMGjFRumKSJ3mKYf6-t3QA@mail.gmail.com>
	<CAJG6M_OAw=jfmJJzAc98_XSbcX8ki29Oz1G6zhk+3hSkQXSwdw@mail.gmail.com>
	<CAGiJk9c-Mw7ip+RbJCU9pupBoV+O5A0rE9kXH9OTynPPsygWHg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 12:01:51 -0800
Message-ID: <CAMKF1sqj7y4geCm+UNSxt=PAHqExHUxLE3hUMw_CKhXBB0uFzA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: On-screen- / virtual-keyboard
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
X-List-Received-Date: Fri, 09 Dec 2011 20:09:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2011 at 3:35 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> I've made a recipe for Florence, and run tested it with xfce-nm-image
> on an overo gumstix.
> It works with some issues but they are gconf related (more info in the
> coming patch).
>
> Now the question to the layer maintainers is,
> do you want the recipe in openembedded-core or meta-openembedded?
>

put it in meta-oe and if its used more commonly it will be pulled into oe-core
from there.


