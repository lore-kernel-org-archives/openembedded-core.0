Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id A4C907BEDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 08:14:16 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id x18so9946763vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 00:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+AOmlQc9yDZodtFVkSlpiGqmOH1bxxvVMB7y/sfjV7c=;
	b=hEbz2IzxsuS0/ryDyb0mtDL3re1idkBHIwv0vI6mFXDytB3JG5ena76yV8AKqWBVMO
	8RBURzI/3FGgFfgTuITf8CAh/rDTfHKhuuay9ytxFHpGDnqgCMFIUyGxfRpAFtfKhdgG
	2rq2P+55YbJ5ATPf8SkWFuLXZGu3ejsMBbCnQoojvUNe7AQEU5zWKQsRz/PHdaIB9GrB
	VvZoH68eowvwtNqSiSt5EtpzeFYhF+fZp9x0uZZdGtY2qLYiyPeZ3Mt5P3+XQRQlHhZb
	OW0JCfIAKe7bxnbFxjTMlHeeCbsf27O1DKzfK7d5lfduk6jyN1lj1P/39MjX2ILn47Gj
	s7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+AOmlQc9yDZodtFVkSlpiGqmOH1bxxvVMB7y/sfjV7c=;
	b=s3MXW3ZEynlB9AFDjMA11T32MM8Cc+uA0YZ42SnT5ZjD1D4xuykdckJKtaT1VKaou+
	rwRC5kFsGEZuiM0Vbb39nd2ZJXdObWG66Lx4bWKxDunyryTIl56oMQNRKIPDeDXEENfF
	BUxCHOjkXIK3L2qsukT8JsVTFJ7yuRDOop2O11UYL0yesvzZAWA5LNyJf0fiemv51pMC
	RTuvcwQS33gr3XfvMu1FFryRBmEYVpEAQbvDhQrrkeYO8vthwrbjgAbzTLPTpfG7Fn+q
	4cHEugvgBdY6RjvuG37/x7qm6QDYlpRgckLDh+NQdLufPqzjgkotAonemzOXuo04gs59
	a66g==
X-Gm-Message-State: APjAAAVZuRi+d1cbCU3hgDESfa5DLYOtWHmk6CGjgRwINFP8jzQ1q1kt
	c0IBsByAWxf+ZjEG0mhMagGgbwDgdqx2+SH+lvY=
X-Google-Smtp-Source: APXvYqxZPmoV2WZzoGuQ0jwm8AWcoFv4CtRiLV8BsLDuDVgbVzOOK7ZoD1UgEeUUGKiRJJZug+RB5zX6jZD6uDbHBxs=
X-Received: by 2002:a67:3187:: with SMTP id x129mr3800612vsx.23.1579076057447; 
	Wed, 15 Jan 2020 00:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
	<13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
	<e0a7cf43-7d0b-5318-22de-9009d702061f@windriver.com>
	<CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com>
	<700a9b55-e817-64ad-ac01-843a125ec8f7@windriver.com>
In-Reply-To: <700a9b55-e817-64ad-ac01-843a125ec8f7@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2020 09:14:06 +0100
Message-ID: <CANNYZj8YZoGziWZapPWaO67T3Sf_5-arEM4sfQnD3knd2X5Dew@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Wed, 15 Jan 2020 08:14:16 -0000
Content-Type: multipart/alternative; boundary="0000000000007a409d059c294bfc"

--0000000000007a409d059c294bfc
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2020 at 23:37, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> That's also what 'devtool latest-version vim' should currently report and
> 'devtool upgrade' upgrade to: I purposely cut off the point releases and
> left only the major.minor part there.
>
> Right. This will also give Oleg an excuse to try 'devtool upgrade' to
> compare manually upgrading. :)
>

Thanks, that is of course appreciated. Run 'devtool check-upgrade-status'
to get an overview of what needs updating, maybe you can help Oleg to pick
the easier updates from that list.

Alex

--0000000000007a409d059c294bfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 14 Jan 2020 at 23:37, Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>That&#39;s also what &#39;devtool latest-version vim&#39; should
            currently report and &#39;devtool upgrade&#39; upgrade to: I
            purposely cut off the point releases and left only the
            major.minor part there.<br>
          <blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote">
        </div>
      </div>
    </blockquote>
    <p>Right. This will also give Oleg an excuse to try &#39;devtool
      upgrade&#39; to compare manually upgrading. :)</p></div></blockquote>=
<div><br></div><div>Thanks, that is of course appreciated. Run &#39;devtool=
 check-upgrade-status&#39; to get an overview of what needs updating, maybe=
 you can help Oleg to pick the easier updates from that list.</div><div><br=
></div><div>Alex<br></div></div></div>

--0000000000007a409d059c294bfc--
