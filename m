Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B46AD7321C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:24:17 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b62so205920651iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8IxYEA2Xngwo5121q/CEs+GA3kR+k9YZM97cnD/g8OM=;
	b=ywuepxLESd3216t8h02ZbOukRN5Fp78YjCbn7BeuDgKS3guDFGE54+nDCG9oz+7ut2
	zrBdX21TjuauLL5XiNX1+TuVap7AZ3aJjd1BNwxJ9TjZFy5b9lCego4rCYm2M/cuDq0j
	ErLas/Vzk6pmjjCrteNnHn4yg+mlveZI0XSJuDHYbihMKUvmLphZQ8RkP/BwGbjdL+oF
	UimlyHwnAPlZ+LfrLIsIcdtklMS+vPXRw5KCCWqBJm3Y6lHINv2RyOzsrbfqW7RohxkX
	0ysB9Zf2k5hA0idGw9FbIN0RPTHdCcmDRRWxdTOpe3+FO3SZ9b1u+IvAzw1VNFT5UEKW
	V9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8IxYEA2Xngwo5121q/CEs+GA3kR+k9YZM97cnD/g8OM=;
	b=VycClUeAzVIKvxUfDR9uiRpDvJ+wC2Bqg/CdmGLEnmYupaAqCUZUqAG7gytGif/GOx
	v328H6fRSH2HFEbimrJFPo/Ewrld76GtY/7NHfUsKHlvXn04EhG7h+xS8XzkU6CAf/lX
	fldIA2BOWRz4k/TprbrW9Tb5WOxs9HrvZx0vmL0L9+MSmOAF7FzHHOKSrprfprReZ7eR
	HwBxQr1UKgCmelOsXkFSkixxii9yJyNVIvgwB8gwolWiVsKClg7Hf/eIX0H+OadAUrR5
	wVMXGLpFiJSP8gFaSyeUePbip2R9PQolN0Q0poB/pYW5MdhT4bfkLxe0/8FuWsc+HAzz
	zW5A==
X-Gm-Message-State: AEkoousKUSku0gf/b005FPhoDp95+4YJH5Wqe32PA7QZ2lgMzD0csdrZcDiO3mbJRoaNZBdQD9RdAsl2vakd3BqS
X-Received: by 10.107.135.142 with SMTP id r14mr67163777ioi.133.1470126258803; 
	Tue, 02 Aug 2016 01:24:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 01:23:58 -0700 (PDT)
In-Reply-To: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
References: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 09:23:58 +0100
Message-ID: <CAJTo0LbZbk_w+=G=EeG1O8U-9-hLH5B2N=MwEczyHcpzuaThxw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: augeas: oe-core removal warning
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
X-List-Received-Date: Tue, 02 Aug 2016 08:24:19 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc6e67fe05391271c3

--001a113eccbc6e67fe05391271c3
Content-Type: text/plain; charset=UTF-8

On 13 May 2016 at 08:15, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> I'm considering removing the augeas recipe from oe-core: it has not
> really been depended on by anything since Danny (rpm has a non-default
> PACKAGECONFIG but even that is accompanied by comments about no
> testing) and we have nothing testing its functionality. Please speak
> up now if you think augeas should stay in oe-core.
>

I think that it really should go and will likely be doing this shortly.

Ross

--001a113eccbc6e67fe05391271c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 May 2016 at 08:15, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ui" cla=
ss=3D"a3s aXjCH m154a8f9b343210fa">I&#39;m considering removing the <span c=
lass=3D"il">augeas</span> recipe from oe-core: it has not<br>
really been depended on by anything since Danny (rpm has a non-default<br>
PACKAGECONFIG but even that is accompanied by comments about no<br>
testing) and we have nothing testing its functionality. Please speak<br>
up now if you think <span class=3D"il">augeas</span> should stay in oe-core=
.</div></blockquote></div><br>I think that it really should go and will lik=
ely be doing this shortly.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a113eccbc6e67fe05391271c3--
