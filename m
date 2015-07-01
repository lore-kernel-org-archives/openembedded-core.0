Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 537C760017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 22:06:14 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so39997921qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 15:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ks0GxYIwgVsZknz+GXWLKu7ciBGHJqzaYK7MK0aTlak=;
	b=S4V8nYAttOmTSr8r1rYJVhUAAFIgHRf4cBWsdfPHn5MuLM5Uh0MsMp/m8EL9iWEeNm
	GOhiIfNR1eJo32GvPvWNxkoF/unM66rYAkOtmWbU7ss/N8GcfyK6xudUcgHv5ZPK4bni
	7m1LWLItM/gg3LmtHfsofjpSr5O1WJAqaBP2PE80GHGYjtX57plTJPbuADkkOFUU07hm
	kcdZLH7U0JiJu6WfBBvPKXwf6CMoVYs1MIM2OfGgJt5yb8dLKVMBjKDyVljZZ1MLQiK+
	TDxaQfCXQ1AqQoKOLJkoBjTBnxS7uwueIf9vzXRNju25hL79GuztRGqBmYIxsk1f8VD1
	ELFA==
X-Gm-Message-State: ALoCoQm3m2mU3xHZRSPKczisOWFUS0ylWl4hbPqAfjG3MaPhWBKpksY+lvuPO90GVX26XoqRPTk1
X-Received: by 10.140.231.19 with SMTP id b19mr37707630qhc.22.1435788374392;
	Wed, 01 Jul 2015 15:06:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 1 Jul 2015 15:05:54 -0700 (PDT)
In-Reply-To: <efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Jul 2015 23:05:54 +0100
Message-ID: <CAJTo0LZ50b1cQxR=pQ8pc4A-riXOSuQcAWkg+ju6UKNfeoZXOw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] weston: Upgrade weston_1.6.0.bb -> weston_1.8.0.bb
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
X-List-Received-Date: Wed, 01 Jul 2015 22:06:19 -0000
Content-Type: multipart/alternative; boundary=001a11c12f0007590d0519d78860

--001a11c12f0007590d0519d78860
Content-Type: text/plain; charset=UTF-8

On 1 July 2015 at 19:24, Khem Raj <raj.khem@gmail.com> wrote:
> +EXTRA_OECONF_append_qemux86 = "\
> +               WESTON_NATIVE_BACKEND=fbdev-backend.so \
> +               "
> +EXTRA_OECONF_append_qemux86-64 = "\
> +               WESTON_NATIVE_BACKEND=fbdev-backend.so \
> +               "

There's a qemuall override you can use here if you think that all qemu
machines will need this.

Ross

--001a11c12f0007590d0519d78860
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 1 July 2015 at 19:24, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; +EXTRA_OECO=
NF_append_qemux86 =3D &quot;\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>&gt; +EXTRA_OECONF_appe=
nd_qemux86-64 =3D &quot;\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br><br><div>There&#39;s a qem=
uall override you can use here if you think that all qemu machines will nee=
d this.</div><div><br></div><div>Ross</div></div>

--001a11c12f0007590d0519d78860--
