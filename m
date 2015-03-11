Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9E30073996
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 21:02:55 +0000 (UTC)
Received: by qcwr17 with SMTP id r17so13765957qcw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 14:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+/kYC5A9W8rwk08erXJ3OrcsXD1as1mMwIuW4dzw1d0=;
	b=cmUaKdfXKPxBYK/C3SKK03JtujkYUR1kJEfQNkGuaa/Zc3xryHpzTN7OtFp4D6JNCU
	b98eFD4J6PeyRgylp7rfoH9bofAC4c/6a9DXD0D1C730a79OprG1NUvsiX3/BU4xRdya
	61pKdJxFn3vVnd1wvNpL4Tyjvmf+mO1vBtMy5lyS7/qzsTAMudTVsS/fpAMCZ71ch9Fx
	mgbm+8uvpmjILqhrPHdfAp0D/bs5sOAgt8j+Qc4B5fTddjmfkKXyY80WUg/5f9cVLwwm
	cJOqgkVVGbQciKdnnqRZsadCg6XvxpB2lmH4cuY+iuj53diyNCxLZ6TLdxDxAYam5KF7
	iuUA==
X-Gm-Message-State: ALoCoQlUHucjR79u+1OIouKI0B1YLwGrGLJSNqd5/QxMrUneLhs6Bk+BGPx8xHMd5Ix5pCnd9lcu
X-Received: by 10.55.21.152 with SMTP id 24mr22385948qkv.40.1426107777217;
	Wed, 11 Mar 2015 14:02:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 11 Mar 2015 14:02:36 -0700 (PDT)
In-Reply-To: <1426097234-10554-1-git-send-email-raj.khem@gmail.com>
References: <1426097234-10554-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Mar 2015 21:02:36 +0000
Message-ID: <CAJTo0LZ+voKVWoprGb=hpe3hi-mADqc=CMcSR1eFs5kk3QaTCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 21:02:58 -0000
Content-Type: multipart/alternative; boundary=001a1147a9b8790fae05110997a0

--001a1147a9b8790fae05110997a0
Content-Type: text/plain; charset=UTF-8

On 11 March 2015 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:

> +               grep -q "tmpfs /var/volatile" /proc/mounts || mount -t
> tmpfs -o strictatime tmpfs /var/volatile
>

What is someone uses tmpfs[tab]/var/volatile?  This should match on
arbitrary whitespace.

Ross

--001a1147a9b8790fae05110997a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2015 at 18:07, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":j6" class=3D"a3s" style=
=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0grep -q &quot;tmpfs /var/volatile&quot; /proc/mounts || mount -t tmpfs -=
o strictatime tmpfs /var/volatile<br></div></blockquote></div><br>What is s=
omeone uses tmpfs[tab]/var/volatile?=C2=A0 This should match on arbitrary w=
hitespace.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a1147a9b8790fae05110997a0--
