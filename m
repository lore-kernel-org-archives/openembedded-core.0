Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id B71EE74051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:28:52 +0000 (UTC)
Received: by qgf75 with SMTP id 75so3620132qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 04:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OfSZos3KbXie9bnSzV2sHR4N6FAM4xoQPpPO75hnA/s=;
	b=GR5sz7AVCvcSEWGHg7eyxY8N6+GgXzjZWQvE31dXEzcPUveA/E54bPf33yBk6kPKg0
	nBGYzC9B1aaKL3S0U8SAjJvxh+lTrab6Hd9gwHX1SF8xKFuoNJSieAaNHEp97cn9Q4fj
	svRsXQIQgmySiYBf2bSJ+JE6mzAQtJ22x90LQhan08ck3J4WHzbqf6xtLW1JNQqCD34a
	RviBWhI4gk1Y88f179x/Uqxi0yRXzIbvTpDeb7OzhEHSSlHipUnUe+oF7TxX6HSiX7JQ
	OS7EBz2LV+84MtaObAJBilLz/9wH5xje5DerBG1aHMi7Jp0H0lH+jHzo1EbKc5ZnZHMF
	pMJQ==
X-Gm-Message-State: ALoCoQlJpHnJDFw2rhciCFYCtIBBDMSIrI+XjNSOfi/cfg4BcmXQwKp8+sGGHmVsuyn/arCaHeWl
X-Received: by 10.140.231.19 with SMTP id b19mr42916379qhc.22.1434454133242;
	Tue, 16 Jun 2015 04:28:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 16 Jun 2015 04:28:32 -0700 (PDT)
In-Reply-To: <557F87E6.3000002@windriver.com>
References: <cover.1434013682.git.liezhi.yang@windriver.com>
	<135be24d84523a7ccfc166283a659109f238c713.1434013682.git.liezhi.yang@windriver.com>
	<CAJTo0LZgSPeeWf02swV4d7Aq_XxdywM+kogYboMuvTRUtAD66w@mail.gmail.com>
	<557F81FE.5050106@windriver.com> <557F87E6.3000002@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jun 2015 12:28:32 +0100
Message-ID: <CAJTo0LY1i7Z+zBe762c1fb0V7AXfOtiRv3HDJd2uy_eszFJ41A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libpcap: fix PACKAGECONFIG
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
X-List-Received-Date: Tue, 16 Jun 2015 11:28:54 -0000
Content-Type: multipart/alternative; boundary=001a11c12f000f0fa60518a0e1ca

--001a11c12f000f0fa60518a0e1ca
Content-Type: text/plain; charset=UTF-8

On 16 June 2015 at 03:20, Robert Yang <liezhi.yang@windriver.com> wrote:

> After more thoughts, add a dummy PACKAGECONFIG can avoid confusing
> the user, and avoid the warning, so I updated in the repo:
>

Yes, that's what I meant - thanks.

Ross

--001a11c12f000f0fa60518a0e1ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2015 at 03:20, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4jd" cla=
ss=3D"a3s" style=3D"overflow:hidden">After more thoughts, add a dummy PACKA=
GECONFIG can avoid confusing<br>
the user, and avoid the warning, so I updated in the repo:<br></div></block=
quote></div><br>Yes, that&#39;s what I meant - thanks.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c12f000f0fa60518a0e1ca--
