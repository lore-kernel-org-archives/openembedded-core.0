Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 716A06BD7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 11:45:43 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so2245820pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 04:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=zVYCYaLz2IY2XVifyBMPZRTIzgil+evNyalhnDSTlxI=;
	b=IzshbhkXk+rwmRnxuKxWLxfXwsBagoJXx8pNljnHTy70WM3EDz+1W9i7Ufm7II/w++
	+9YPe36eztHY8BTV9S6VuR5ZiMHvQxtkK9cs8CsG2j8/A8ZQiDdPmZeh87La81Cnv7Tn
	ACAYZCMFb8V0hV4emE0GFWxf3SZx0E43H19hqqX27YFo567tpNNkpYurRH0UGvRx/7nM
	sG1wSrAAW2gxMZaF3CPqiK4G1vATJP84c/RMVLHYJi+FCEROIniysfg/6yhkbo8+mbXh
	SI1t4NFlJe6nnWuD/dF3LUsKAK8m8ry9vYcc28kRvjlTYOWyy04YZRFEsVMC3QUIjLtr
	rWxw==
X-Gm-Message-State: ALoCoQmR8rG/qj4wVwidCF9kjVmJdM2x27dUpIhUkXBixd9bXcCUXyjvbB4hHMAFq78jyANiKVAK
MIME-Version: 1.0
X-Received: by 10.66.228.234 with SMTP id sl10mr10197724pac.149.1377863144377; 
	Fri, 30 Aug 2013 04:45:44 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Fri, 30 Aug 2013 04:45:44 -0700 (PDT)
Date: Fri, 30 Aug 2013 12:45:44 +0100
X-Google-Sender-Auth: 3KKiLln2ejLkLHdn0VxrnT3mBBE
Message-ID: <CAOMwXhN=mJMrePAXftb8CX_WOshN=S6ufC3BaXwfjY9WYGat+A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Bug: 5089
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
X-List-Received-Date: Fri, 30 Aug 2013 11:45:44 -0000
Content-Type: multipart/alternative; boundary=047d7b15a1654524fe04e528c3c3

--047d7b15a1654524fe04e528c3c3
Content-Type: text/plain; charset=ISO-8859-1

Hi,

there was this change which also goes undocumented. Unfortunately, this is
causing a lot of headache for me, but I expect that for others, too.

I would like to propose the default kernel and module name from:

uImage--3.2.1...

to:

uImage-3.2.1...

This would avoid a lot of work for people. I have been trying to fix issues
for one day due to this which is unfortunate.

Also, the double dash on its looks silly IMO. It should be either '-0-' or
'-'. I prefer the latter for compatibility reasons, although someone could
argue about that the former is more readable.

I heard Jama's opinion about it on IRC. I wonder what others think?

Cheers,
Laszlo

PS.: Note, this is a different proposal to the documentation update.

--047d7b15a1654524fe04e528c3c3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>there was this change which also go=
es undocumented. Unfortunately, this is causing a lot of headache for me, b=
ut I expect that for others, too.</div><div><br></div><div>I would like to =
propose the default kernel and module name from:</div>
<div><br></div><div>uImage--3.2.1...</div><div><br></div><div>to:</div><div=
><br></div><div>uImage-3.2.1...</div><div><br></div><div>This would avoid a=
 lot of work for people. I have been trying to fix issues for one day due t=
o this which is unfortunate.</div>
<div><br></div><div>Also, the double dash on its looks silly IMO. It should=
 be either &#39;-0-&#39; or &#39;-&#39;. I prefer the latter for compatibil=
ity reasons, although someone could argue about that the former is more rea=
dable.</div>
<div><br></div><div>I heard Jama&#39;s opinion about it on IRC. I wonder wh=
at others think?</div><div><br></div><div>Cheers,</div><div>Laszlo</div><di=
v><br></div><div>PS.: Note, this is a different proposal to the documentati=
on update.</div>
</div>

--047d7b15a1654524fe04e528c3c3--
