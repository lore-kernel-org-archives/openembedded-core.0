Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.849.1626804638055758451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 11:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=49338 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1m5uCS-00AnTO-K6
	for openembedded-core@lists.openembedded.org; Tue, 20 Jul 2021 14:10:36 -0400
Received: from [136.2.16.182] ([136.2.16.182]) by crashcourse.ca (Horde
 Framework) with HTTPS; Tue, 20 Jul 2021 14:10:36 -0400
Date: Tue, 20 Jul 2021 14:10:36 -0400
Message-ID: <20210720141036.Horde.1xKhG703pWHO03wVaIbF-Yi@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] how to configure an image with *full* debugging info in the libs and binaries?
References: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca>
 <CAAnfSTv+ig=Fzi6hWXGHV7vOFsAB7wX8bnAjTJvPr15z+6zkPw@mail.gmail.com>
 <CAJ86T=VZd=7eNTBR0aX2BGKtRBae6MFayMDrjdHAtqkUK8MXrw@mail.gmail.com>
In-Reply-To: <CAJ86T=VZd=7eNTBR0aX2BGKtRBae6MFayMDrjdHAtqkUK8MXrw@mail.gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Andre McCurdy <armccurdy@gmail.com>:

> On Mon, Jul 19, 2021 at 5:06 PM Ross Burton <ross@burtonini.com> wrote:
>> On Fri, 16 Jul 2021 at 20:10, Robert P. J. Day  
>> <rpjday@crashcourse.ca> wrote:
>> >   colleague just asked me what it would take to generate an image
>> > where the executables and libraries contain all the gdb-related
>> > debugging info in the same files (that is, not broken out in the
>> > .debug directories).
>> >
>> >   i pointed out that this would increase the size of the installable
>> > target image substantially but, apparently, that is of no concern.
>>
>> This is where I have to ask "why?".  All known debugging tools can
>> handle split-out debuginfo, and getting them all installed into an
>> image is as simple as IMAGE_FEATURES += dbg-pkgs, as Khem says.
>
> Why is an interesting side discussion. Getting back to the original
> question though, either OE officially supports creating unstripped
> binaries or it doesn't. The documentation should perhaps be updated to
> make that clear (and if there's legacy support for creating unstripped
> binaries still lurking in the code but we don't want anyone to use it,
> then maybe it should be removed...).

It *appears* the combination of:

INHIBIT_PACKAGE_STRIP = '1'
INHIBIT_PACKAGE_DEBUG_SPLIT = '1'

does what I want (at least at first glance). As to "why", I have been
told there is a build/test infrastructure in place that works with just
this format, and they would like to just keep doing that. And, frankly,
that's a perfectly good reason.

rday





