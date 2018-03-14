Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFE8788F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 12:50:33 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id z7-v6so3393133iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P/8BrmJnZyoaI9WTM0k7m5SpEvHrZO/1NBpnfYyhUfQ=;
	b=jv97nEgrPrwOSZZQEq14uuqK7cO+aYi1CRIK6rsIWuTA3TmLaXl1Spn0RJqPOJSMpp
	Mu3sjZP7TjtUvRlsdP12tkzYe7bbxHzk5/X5Orbh0drpDPoLVZ6DG9yHJJSxTfgQdkec
	4vVB7/vO5NJNtAH9nX4AWGmPAwoDNATLNxIilcX1GK+20kzstjmS2vFhnMOjt2vzFRBR
	NFVA6muUBneTuhKASo0ZodL97dWAGdzxma/phbqF+4m4xGrPMj2t8WXFOyvSOz0ZBqRt
	AkICwwdouBw/y0pUIIWCRGj0K3nWC4El5lpLgdslxlNKaa9+RVD0PQFKb6LJ31LYzoTr
	LEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P/8BrmJnZyoaI9WTM0k7m5SpEvHrZO/1NBpnfYyhUfQ=;
	b=UXWWYoLQmk+1Df4j0lLNPUwUzKMYY5SSI+V9nJn8szNhcAJaUH1Bov7oRS6MlegNFQ
	H4IWp9hYJJPbaZXhGqsoMsdCYVqdcA4gvrwuTZAXnEAJh0znaoUrx5y2ilq+WnLyiimL
	8tFFlH1Amc4L9kTDQqxtdg2tWOFBFPEzsv5NXcrWlkueafxfTuBE9OmcnERy1lf1p7Er
	ukbFrMY+hs+5PUZPmEyY+O9eC0NEkw3t+qNyAompYeya8K8Iah113E/auXS4Fmsr7Lbo
	9+6R5ZYwwm51GkMVGYa6Lstygkp85yW+66OyR3KKUx9yIWcaI2400ky8xt1Ok2IjGQr2
	/t1w==
X-Gm-Message-State: AElRT7HZ8knxXPKCbHrDuUsnDckeDCUyWNGWRi3j467Zat4T5No5/8qo
	BzTGufOZIZVxrn/UnBfOUwLt7fm/CeK9GMPkPZ9yTQ==
X-Google-Smtp-Source: AG47ELuKZQNDJvsr8alrmPJmIt1sHXONat1bXeTSMpcfh0Foo0zGiTeH0ltZv3lio0/nws6OhFBllBwT4Frt8ommkpQ=
X-Received: by 10.36.185.24 with SMTP id w24mr1748686ite.127.1521031834508;
	Wed, 14 Mar 2018 05:50:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 14 Mar 2018 05:50:14 -0700 (PDT)
In-Reply-To: <dbc5da75-f7b9-bda4-c9da-5be3088945ab@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0LZcrg5TmTEyEwjAW0_49RJ0T2A4ZBsuNmyJ=wSMFWtuZw@mail.gmail.com>
	<dbc5da75-f7b9-bda4-c9da-5be3088945ab@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Mar 2018 12:50:14 +0000
Message-ID: <CAJTo0LbY_61zJ=nCBGgmruLOY+x2Ky6Coj-D9X743iXBAFJ6+g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 14 Mar 2018 12:50:33 -0000
Content-Type: multipart/alternative; boundary="f403045d9a5030457205675ed267"

--f403045d9a5030457205675ed267
Content-Type: text/plain; charset="UTF-8"

On 14 March 2018 at 12:46, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> I'll revert this for now (or see if I can quickly move it to a debug
> kernel build), and yes, there is a better way to do this. I'm just not
> sure I can get it done in time for the release.
>

Thanks.  I'm desperately trying to be able to tell RP we can fire the M3
build so I'm +1 on reverting now, fixing later.

Ross

--f403045d9a5030457205675ed267
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 March 2018 at 12:46, Bruce Ashfield <span dir=3D"ltr=
">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bru=
ce.ashfield@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;ll rever=
t this for now (or see if I can quickly move it to a debug<br>
kernel build), and yes, there is a better way to do this. I&#39;m just not<=
br>
sure I can get it done in time for the release.<br></blockquote><div><br></=
div><div>Thanks.=C2=A0 I&#39;m desperately trying to be able to tell RP we =
can fire the M3 build so I&#39;m +1 on reverting now, fixing later.</div><d=
iv><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045d9a5030457205675ed267--
