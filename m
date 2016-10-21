Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0AA71A93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 16:11:21 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e203so11792043itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=vjeMSozmhCvZQDVxqvqjSIHc9a2c7fLGHn8jpPtvGE4=;
	b=eLtng8u0DiGGmHJh1IpakB11C8sJ7kqhaoRl0kcARkmJ0pyPebc0ZQmEUhI2FcMOXd
	LjLZo/tt+fcDO2K4VK1IeEP1+BxcIOLSKXEyio9DgPVQKa/j5+8T5kQsdL7YbzAjv6gk
	SiBPBKsDqqsNe8N56ytc4a3NP8CD4T+eh90IWTPO52z3+xmKzkx1uKDl3EAO3Ss6DTjg
	7f1/LhHG0i82xqXnSl1GruZ8isCZ1fOamPG4/NTMbuOjUGR5jAbB74pUMpCx76wPGY8y
	Wzk+1y/wloiK+AupFQkn5dPfp/ErkcMNCBSPGyZS1JneDy1BC6yQ5sHX67i6RoOdeThC
	jL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=vjeMSozmhCvZQDVxqvqjSIHc9a2c7fLGHn8jpPtvGE4=;
	b=FZSsDCj/NhI09DCSuaZ0AQG3J7PvB+e2ywBg7kygM3ANx3hUpLhRFvI6kH2dGrNlwG
	oo4el3SQxGBw8ZtbvnvF+7XC8TE7DErQIENWNAEZaKgkAsiaflkdRxQyd5edUqnXo0mu
	23PDFoPN8RYEcIgO3LSo2JrY8zWgusvFvWK6+JnCldSF0eeVbGdaCXSIiCisWdoL101g
	Q5wD27YgSXIzxbsUwUV49dLsDgmyMglUcp5YlTIekdIf6I6XavqWV1cZFPAzRBTWCCfQ
	EDvHQ7QSAFoHEsQu5onQVW4Re4viwlulpLCWzZdisrXi8+lKH8GrAr1p5yD6lgdlYxqZ
	Fl6A==
X-Gm-Message-State: AA6/9Rmrn0geRJCM4iWSyoDLPprzwUC2rUb9GxaKxMql7AujUymCGXJ5MLX4Evaa9RmSRGAuGbEZjLvxEC5Dpw==
X-Received: by 10.202.84.69 with SMTP id i66mr11218252oib.93.1477066283275;
	Fri, 21 Oct 2016 09:11:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Fri, 21 Oct 2016 09:11:02 -0700 (PDT)
In-Reply-To: <1477057467-25114-1-git-send-email-o.mandel@menlosystems.com>
References: <1477057467-25114-1-git-send-email-o.mandel@menlosystems.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 21 Oct 2016 09:11:02 -0700
X-Google-Sender-Auth: ozr8Tx5T6bdJcUnId6B0XX_tLFI
Message-ID: <CABcZANnh3P7JAiigdGpafaBt2N6UCDj1T2JCFDDi7hLgjs-EUw@mail.gmail.com>
To: Olaf Mandel <o.mandel@menlosystems.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] texi2html: Allow compiling out-of-source
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
X-List-Received-Date: Fri, 21 Oct 2016 16:11:23 -0000
Content-Type: multipart/alternative; boundary=001a113ac7981fdcb4053f624b93

--001a113ac7981fdcb4053f624b93
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2016 at 6:44 AM, Olaf Mandel <o.mandel@menlosystems.com>
wrote:

> Compiling texi2html 5.0 out-of-source with USE_NLS set to no failed
> because it trieed to copy from srcdir without using that variable.
> Fix this issue.
>
> No need to send upstream: current trunk already contains this.
>
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
>

Missing Upstream-Status in the patch file.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ac7981fdcb4053f624b93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Oct 21, 2016 at 6:44 AM, Olaf Mandel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:o.mandel@menlosystems.com" target=3D"_blank">o.mandel@menlosyste=
ms.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
2rq" class=3D"a3s aXjCH m157e78d67f10ce72">Compiling texi2html 5.0 out-of-s=
ource with USE_NLS set to no failed<br>
because it trieed to copy from srcdir without using that variable.<br>
Fix this issue.<br>
<br>
No need to send upstream: current trunk already contains this.<br>
<br>
Signed-off-by: Olaf Mandel &lt;<a href=3D"mailto:o.mandel@menlosystems.com"=
>o.mandel@menlosystems.com</a>&gt;</div></blockquote></div><br>Missing Upst=
ream-Status in the patch file.<br>-- <br><div class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113ac7981fdcb4053f624b93--
