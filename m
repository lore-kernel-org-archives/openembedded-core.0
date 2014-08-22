Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC8E707D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 00:58:18 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id hz20so9095608lab.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=jPxnQPtrfU2EmsyUKoHKkW1MbSR3XERXcD9EuOH1Ym4=;
	b=n4i5GXxbcwfrRhXYdNcWrgSo2JhbXBT0RpquroH78qG/ngvFm4nXNjXcr5p6txM04T
	zEHE7Ynp0Bk9gNzkNd63wVWgsljANXNthica+O7ftyWZEGijcWWxpV6XjblIGWiLD1xI
	MHCzF+373IGUMqEsDMDwA8S6yFSx5cJbdqSc+52A1iTmyHM/EMYmtwMhlvrZ9r3rPb4W
	Z9MQQbqG9OY0of6YGX/OLeLfW+SjmT+kkt6XtByXjP5oBBs26cGzX0gyUOsFZ11UuCPR
	0IaI4SRwTK8j0Q/MRK1QzhB6CUH6Yiz4FJ8a6Yf8aHSLYFyMiR2iQFYbLEvWPa2PDJ1d
	TQAg==
X-Received: by 10.112.138.102 with SMTP id qp6mr1600921lbb.60.1408669099185;
	Thu, 21 Aug 2014 17:58:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Thu, 21 Aug 2014 17:57:59 -0700 (PDT)
In-Reply-To: <1408653988.1669.116.camel@ted>
References: <1408653988.1669.116.camel@ted>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 21 Aug 2014 17:57:59 -0700
X-Google-Sender-Auth: jFQ17qQ-9-cXQtTG-sq1MNkp2BU
Message-ID: <CABcZAN=cp3NHtPMQymoFFUhsoEXCtFUBtnx1ynmRmp+N=cX11w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/package_manager: Add utils function for multiprocess execution
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
X-List-Received-Date: Fri, 22 Aug 2014 00:58:20 -0000
Content-Type: multipart/alternative; boundary=089e01183292435cac05012d55ea

--089e01183292435cac05012d55ea
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 21, 2014 at 1:46 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Our usage of multitprocessing is problematic. In particular, there is a bug
> in python 2.7 multiprocessing where signals are not handled until command
> completion instead of immediately.


This looks good, but the subject is misleading, in my opinion:
"lib/oe/package_manager:
Add utils function for multiprocess execution". It should probably either
mention both utils and package_manager, or be split into two commits.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01183292435cac05012d55ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Aug 21, 2014 at 1:46 PM, Richard Purdie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Our usage of multitproces=
sing is problematic. In particular, there is a bug<br>
in python 2.7 multiprocessing where signals are not handled until command<b=
r>
completion instead of immediately.</blockquote><div>=C2=A0<br>This looks go=
od, but the subject is misleading, in my opinion: &quot;<span class=3D"">li=
b/oe/package_manager: Add utils function for multiprocess execution&quot;</=
span>. It should probably either mention both utils and package_manager, or=
 be split into two commits.<br clear=3D"all">

</div></div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Foun=
der - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Sof=
tware Engineer, Mentor Graphics
</div></div>

--089e01183292435cac05012d55ea--
