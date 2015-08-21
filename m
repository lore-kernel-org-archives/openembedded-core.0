Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 126C860557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 17:03:07 +0000 (UTC)
Received: by qgj62 with SMTP id 62so50467969qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KqKuaSdsca7XinhW9DW1r4q0x++vebJTelGKPbWSDqQ=;
	b=go0+KrL5vkGoZqNzYdQGr9q/4Q2ir9MLKotwW1H4P3n1I5xyHHK5GTCGKMQx3HUsKc
	9KyEPTPooth6b5FARTRrG5UguD4DAZCUFgXrn095+6uP42x1V3t0CDn3tR/3ATonDgwB
	tkChEHPuMsakgtMSnlVyTWJR8B52jrVxN5Ss6Lo4AGGAAfhdfbzm1tPRY28OspSrbfKC
	uoJG3xmAWPxTqpB0jo2zOiK8IRk1WA5avFzY2qArySIpxPmt59kfcTy3oeLS6DrJPDv6
	TKHhZx2exHkLPPbcDPW5Ot6XVagoOHvM2l/A5hKCPkCMQhXg+4clruOkkV8KAYZGGUf3
	Fz8g==
X-Gm-Message-State: ALoCoQmsZOsDnQg2B01ahkSIXCD+Ts33sV44Cva4+SSLvXghsVSkeXmSsKNkY04Bsrx+4MxcMsV0
X-Received: by 10.140.237.204 with SMTP id i195mr20908840qhc.93.1440176587247; 
	Fri, 21 Aug 2015 10:03:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 21 Aug 2015 10:02:47 -0700 (PDT)
In-Reply-To: <6F44F925AFE971408EDDDD548F9B486F198BD299@DEMUMBX005.nsn-intra.net>
References: <6F44F925AFE971408EDDDD548F9B486F198BD299@DEMUMBX005.nsn-intra.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 18:02:47 +0100
Message-ID: <CAJTo0LYUyMGtDs0VJgc2SRXXdW3ttpzDT5W-_nniXrSrCJX4Hw@mail.gmail.com>
To: "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Get patch of all manual changes done in sources.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Aug 2015 17:03:09 -0000
Content-Type: multipart/alternative; boundary=001a1135a030e5ade9051dd53dc0

--001a1135a030e5ade9051dd53dc0
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 17:04, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw) <
bartlomiej.kucharczyk@nokia.com> wrote:

> Hello!
>
> Is there any automated way to get diff of all manual changes done in
> recipe sources?
>
> Use case is:
> 1. bitbake something -c devshell
> 2. # manually modify sources #
> 3. bitbake image
> 4. bitbake something2 -c devshell
> 5. # manually modify sources #
> 6. bitbake image
> ...
> n. bitbake image
>
> And now I would like to automatically generate patch from changes in step
> #2, #5, and next. Is there any way in oe core to achieve such thing?
>
> And if needs to be implemented, do you have any suggestions how to start?
> (e.g. doing another task, create a bbclass, or? )


For this sort of iterative development in a source tree it's best to use
devtool instead of the devshell task.  There's a section on devtool in the
documentation.
Ross

--001a1135a030e5ade9051dd53dc0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 August 2015 at 17:04, Kucharczyk, Bartlomiej (Nokia =
- PL/Wroclaw) <span dir=3D"ltr">&lt;<a href=3D"mailto:bartlomiej.kucharczyk=
@nokia.com" target=3D"_blank">bartlomiej.kucharczyk@nokia.com</a>&gt;</span=
> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hello!<br>
<br>
Is there any automated way to get diff of all manual changes done in recipe=
 sources?<br>
<br>
Use case is:<br>
1. bitbake something -c devshell<br>
2. # manually modify sources #<br>
3. bitbake image<br>
4. bitbake something2 -c devshell<br>
5. # manually modify sources #<br>
6. bitbake image<br>
...<br>
n. bitbake image<br>
<br>
And now I would like to automatically generate patch from changes in step #=
2, #5, and next. Is there any way in oe core to achieve such thing?<br>
<br>
And if needs to be implemented, do you have any suggestions how to start? (=
e.g. doing another task, create a bbclass, or? )</blockquote><div><br></div=
><div style=3D"font-size:13px">For this sort of iterative development in a =
source tree it&#39;s best to use devtool instead of the devshell task.=C2=
=A0 There&#39;s a section on devtool in the documentation.</div><div class=
=3D"yj6qo ajU" style=3D"font-size:13px"></div><div>Ross=C2=A0</div></div></=
div></div>

--001a1135a030e5ade9051dd53dc0--
