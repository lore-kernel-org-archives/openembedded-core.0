Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0E23877519
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 22:16:40 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n127so94977028qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 14:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lyismjHoRBzq9uoYohn0cCcucdNXdBhAFzXqZOKSmgE=;
	b=1sTdQXiKZJFp2Op0tA8ytKqqxexR6HyXNhlCSnr8yGYiHn2NT+LrXDJwAI2lgJvplC
	v/DRwTgfSHI5/LBuQGECUSJ/iR1dQ0ulOlw+30v5QlIQZ45GS4ETo/epvcITRz+OQfZl
	VDfE3xHz9hK72pTqlCJmRyl670nNAa+Ehlb3ykiMOABTSUoeKpNrZeXk5nHKLeUOvH94
	PhQj6Wtx9g6JIcvUIIbOXrtRARVFqc9AHdgwLh40gFvtI1KBKeyPLymq2d6CsiSI5MaP
	Q1uAKgpjKV3o4DfH6EVaAW/F++Pbhqimr1N2v/qvRfl5Vbv7a/FkPSlUSnRDdZ+j6Xgf
	jWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lyismjHoRBzq9uoYohn0cCcucdNXdBhAFzXqZOKSmgE=;
	b=OUpex0gd21wBdj8j8mwxpEvpWMYiLB989hEnW3KYSF/BWvEj7VCziC/tRmR7desrHs
	BrYded8gNkSZm8EjbuK3yRnhLYGmh3Ff1CFW/NSc02Zcoxz+Wpr+cXyGfFlXtrjrt08R
	0kiqZgQJlTeE12w7adK/+whGACMXr+Mr6OSVu8HKrxWXJ8xxHxyv5FgoMpSRLS4Zvns5
	5oItJqXCL67YcpBNSmI0yYOLndCKzHawxO8/YG4+Q+ELDQNRRyRNwFMeMBx2jyXKTJM9
	xeH82AWdS00krK/me5GEA49YtbuxpTOARKbupmwQL6Le+dquCT+XP/KH6GFbfCsswwDF
	VGYA==
X-Gm-Message-State: AMke39mFHoXlvnjsc17gRIy5TaGNNlm+7K1FoWJyX+Y8Bk59u97fQ80v9Tz7w1wihyiWyDgthm4TWjru1H30L1wD
X-Received: by 10.55.47.4 with SMTP id v4mr13098759qkh.77.1488406601949; Wed,
	01 Mar 2017 14:16:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 1 Mar 2017 14:16:21 -0800 (PST)
In-Reply-To: <1488374504121.73746@bmw.de>
References: <1488374504121.73746@bmw.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Mar 2017 22:16:21 +0000
Message-ID: <CAJTo0LbRm5Miju2_SN1WWJWNisXPLi1zGbPigRfbfSOkMHTUGg@mail.gmail.com>
To: Hugo.Jacob@bmw.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildhistory.bbclass: Add license declaration to packages and recipes
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
X-List-Received-Date: Wed, 01 Mar 2017 22:16:48 -0000
Content-Type: multipart/alternative; boundary=001a114f4108cabd260549b2aa99

--001a114f4108cabd260549b2aa99
Content-Type: text/plain; charset=UTF-8

On 1 March 2017 at 13:21, <Hugo.Jacob@bmw.de> wrote:

>      pr = d.getVar('PR', True)
> +    license = d.getVar('LICENSE', True)
>

Can you rebase this to master please?  We dropped the use of True/False in
general some time ago and this patch doesn't apply cleanly anymore.

Ross

--001a114f4108cabd260549b2aa99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2017 at 13:21,  <span dir=3D"ltr">&lt;<a href=3D"mailto:Hugo.Jac=
ob@bmw.de" target=3D"_blank">Hugo.Jacob@bmw.de</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div id=3D":1fk" class=3D"a3s aXjCH m15a8a123c3=
cddfe8">=C2=A0 =C2=A0 =C2=A0pr =3D d.getVar(&#39;PR&#39;, True)<br>
+=C2=A0 =C2=A0 license =3D d.getVar(&#39;LICENSE&#39;, True)<br></div></blo=
ckquote></div><br>Can you rebase this to master please?=C2=A0 We dropped th=
e use of True/False in general some time ago and this patch doesn&#39;t app=
ly cleanly anymore.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a114f4108cabd260549b2aa99--
