Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6297719F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:02:52 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id j124so92825674ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 13:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hxcKtDikQaj5wyDVg+7wBDdusSprRjMPHaJA1Gtomu0=;
	b=CNNR4hhvG+zIMuGlzvnlF7rMoJ/MRRKp7IX1TymAqILMjWDw+n+M8u/6uL8H6z2rSp
	1JSNJDOAzoKR6iTAzyU4qCvViYqrdYRPpI/DvyWKjJNsLdQFSUmK+dIOSMw9mDXu7AkR
	0g2I4+T5m7KX1IiUjNyi68wIYckbG8/DGzP5lGax/SLCuJTaJkglPs1Vchl406ctvv7K
	IaAfEROkWdqFWYN80BlUPuF3r+s36temNcAOTwn5x1IO6FT9bjc5F9Utz/gkbhnk+Bmk
	MSmVlHM5ZwyNqtblSORyJcKVqk3tCR0DY0oslCKNuCrcyJc0KOj4L08nP4F2Cg4GFTqu
	wBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hxcKtDikQaj5wyDVg+7wBDdusSprRjMPHaJA1Gtomu0=;
	b=ijpQPHzH1t5AWlwVbbdDHaFNvKh4+9bWH0RkQO+DYWTFKB7AxNrxSTe7jOYXMXx2rZ
	DWUPYUd9uLAyCe2MslCRO4C6l5EWQqZwae6cQ+wFxhIFvbNnTxNuf7kJB/O5fI2EqCD6
	opwV7b459IkCLPm5qyROAr0uAr+yuopH3lOdLNsvfl68CHB7e0ERvcPCjS91dy91iBvn
	MRoVtfoQlvohdi1IMhxtMNRCfQ7P+1/MUjBVpOC7W2Vpr1ClJaglrCpMfwm05rgn9Oa0
	oNF21Ghuglwno0vrVasGXinvpr5EFY6tfRgQ8SLcFuqYI4TEOvi35ocBynCSla39uVnO
	hjYg==
X-Gm-Message-State: AEkoouspZfiF88J1MH2vPPucSd160v1XZfgBVAE2j6Ey5KQmdMzdHYeocUX8nNi1jjLe60LRJhH9jMO1N3pU2Psq
X-Received: by 10.36.87.140 with SMTP id u134mr21165730ita.38.1470686573606;
	Mon, 08 Aug 2016 13:02:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 13:02:33 -0700 (PDT)
In-Reply-To: <20160808180536.GP8521@denix.org>
References: <cover.1470672689.git.george.mccollister@gmail.com>
	<20160808180536.GP8521@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 21:02:33 +0100
Message-ID: <CAJTo0LZdBAtdp1Z5=OVWLLJz8n5+XACuopMJoi3k2w7tjw_yiw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Andrew Bradford <andrew.bradford@kodakalaris.com>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH v2 0/5] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 20:02:55 -0000
Content-Type: multipart/alternative; boundary=001a1135018ccc1fb5053994e612

--001a1135018ccc1fb5053994e612
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 19:05, Denys Dmytriyenko <denis@denix.org> wrote:

> The reason I'm bringing this up is because I've been working on this area
> recently and would like to contribute back some code (fixes,
> customizations).
> Since it depends on this patchset, I'm not sure if I should wait for it to
> get
> accepted or we'll just end up growing the patchset for another iteration...
>

I was attempting to merge bits of this earlier today and the $B stuff and
conflicts caused me to delete the branch, I was about to send a mail when
this appeared.  I'll try to merge it to my staging now, so please report
back if your testing is positive or negative.

Ross

--001a1135018ccc1fb5053994e612
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 19:05, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1z3" class=3D"a3s aX=
jCH m1566b55cb9b8f5b8">The reason I&#39;m bringing this up is because I&#39=
;ve been working on this area<br>
recently and would like to contribute back some code (fixes, customizations=
).<br>
Since it depends on this patchset, I&#39;m not sure if I should wait for it=
 to get<br>
accepted or we&#39;ll just end up growing the patchset for another iteratio=
n...</div></blockquote></div><br>I was attempting to merge bits of this ear=
lier today and the $B stuff and conflicts caused me to delete the branch, I=
 was about to send a mail when this appeared.=C2=A0 I&#39;ll try to merge i=
t to my staging now, so please report back if your testing is positive or n=
egative.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a1135018ccc1fb5053994e612--
