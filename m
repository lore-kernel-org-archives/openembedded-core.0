Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 252EE731E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 20:53:07 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ik10so40590316igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bfkLlODPRd63I9RuEQWdrbE38gzB4vw2mUrK5bhadEE=;
	b=t/Xaco7ALiMUSdr7JUiaqx7pv4jLFby+p/U/ESGWohTOx9UPuUgiJkslRch5OP2TdX
	wBgOmta9IAaQ9t3CObr3U61C94/ufQgCX7hYOwEfDfI5noP6is8p60dGG1qCDPCI6Gmy
	6XmVGVlOvvRA4sfvvHhKBpVAyz9E1dSRnebR+iXu+HsfcnsjbyvaiCY19W9U5RBj+0pm
	73YuF9lnb0CKo4qsBEYuP4lOPAidRLvjjJJ2Sl3HhCXksmp9gBZSJxJhUHTJG4kAFt2Q
	8m1wJ8MEvMobZVTVj/Pfe68F3HDr5A4ZjnRQVU86V0F4+5MPERo307dZD9iu6i9RDExt
	opHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bfkLlODPRd63I9RuEQWdrbE38gzB4vw2mUrK5bhadEE=;
	b=lr0mSkzl/tVzQDu5nbABvFBPjrmI+Xp09oWfxaG6SEhNJAxvB9LkvDUsHFHmGUFnwv
	8MuEY40zxsrvqpK/KFiIZP6B3HrBK2vD+VrjlYx2z5peu5Y2Eu4z72G4Pg3HEwJcxu0Y
	/c9MB6oCuK+/rMCkgmi+18hYRpxxafDBaT3slgZSzX81Zk/XXCdJgidrRHnpkZgkQHmy
	yPweNkoW7FlXe1K0tV03/tXYJT/tF4dOplFhpipEoqyWIUfTKhzN1PUyRD1SbjXz/Ri5
	EHBB+iqhd7qKzsYiETTAfD5gJPTlISc3z68IDCicx8yWWpxzrD+/XpoA3/eX41fczFRe
	WjCA==
X-Gm-Message-State: ALoCoQk6NwhIsuOoh96kNF9Szz2VMQBaC/C0IkZRFkgfDddJM14W+p/dvOApJaLY6JWkcT9xdtunkMnvxmZf7twebty/72N3GNOva/04JnSbglWz5uaaxc8=
X-Received: by 10.50.13.100 with SMTP id g4mr10456778igc.64.1452113588320;
	Wed, 06 Jan 2016 12:53:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 6 Jan 2016 12:52:48 -0800 (PST)
In-Reply-To: <CAMKF1sqcepBb723aJ7AAW50WyCmQT29QrJdO7QjQ3C_Lo-MxMg@mail.gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
	<2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
	<8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
	<CAJTo0LazG6N2L898BLyr0jCZ-Xv5UK=GBs0DoXP+AK4_geQouQ@mail.gmail.com>
	<CAMKF1sqcepBb723aJ7AAW50WyCmQT29QrJdO7QjQ3C_Lo-MxMg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jan 2016 20:52:48 +0000
Message-ID: <CAJTo0LY+K=TuzR1KmZQ81WZJNQBW-djLTLpuJR+tkpfLKcV8yg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 20:53:08 -0000
Content-Type: multipart/alternative; boundary=089e013c66149b1a1f0528b08adc

--089e013c66149b1a1f0528b08adc
Content-Type: text/plain; charset=UTF-8

On 6 January 2016 at 15:40, Khem Raj <raj.khem@gmail.com> wrote:

> fsl ppc build fails are due to glibc or some other reason
>

They're entirely down the their layer (broken fetch, broken recipes).

Ross

--089e013c66149b1a1f0528b08adc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2016 at 15:40, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":166" class=3D"a3s" styl=
e=3D"overflow:hidden">fsl ppc build fails are due to glibc or some other re=
ason<br></div></blockquote></div><br>They&#39;re entirely down the their la=
yer (broken fetch, broken recipes).</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--089e013c66149b1a1f0528b08adc--
