Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBFC731D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 19:34:26 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 190so78906340iow.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gXAbAIQW7druo5j8MxpRFN0d3k9U1VDrI7x2on6dw28=;
	b=kkRZgLgyI1/m5Ycm0MtWDZ0Pq7I4WvhonwazdbCDV0/K/oeggKWthhGQKuVDjPsZcg
	Llha2KZ3HjPGFRMgrKIaHsJf6s8i0ps0pNl7tD24123RVk3oAUb2Xj/XVW8V3+5EmHMx
	WQEV5vvQxmLaKFlvKK0S/dPQg4JtkloBKDi0k8DHXy//rKGjcfj/piHCrtpLGI4SPMyD
	WCCotxyImWxVW2zAprU2eH0nk4ESqZZaU5mntqpVi6LAIJyDEw3y3Ix95mix5RusG1Do
	1n9Qu7JRWuFDWPPNpmD732u1vd0sZHyTe+3Br1qB/8NuqQ96qBUa9xf/CXk7ZOG8RPkl
	WSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gXAbAIQW7druo5j8MxpRFN0d3k9U1VDrI7x2on6dw28=;
	b=WchYPYqF6CpC2cQd35GIBrDhy6/DVHOOfuV/ZLbbuu5iaabFz5N9mSot7U9ODV+S7r
	/0cvXNMlen+onbOOrZ8ls4DtnLZs19O7Qf/LxZnq4q7fF06NjSNnivrLbg9RjD1Mk7Ui
	hr0RLd4Qb+XYk4crELxuuIHcqu1+5AoOLMo9SZwlU5oDDmZYVvfppE10NTS78X+cPlEg
	UCLEaPbLFwEocP7gBO8EXHN9qA0qGPMi2HVIS2KPIHmrUncDuaa/Tdj1K+hq24TtnHqY
	nCtpj5HKH4GKEm8sjcry7EDWvpH0o0NLd94XTi9wv4rGrsxTEVat2osbwMBZyKia4iPo
	uL9A==
X-Gm-Message-State: AOPr4FWOtKnQVVZAccWXf46fXiwZBHe6CtWJaw6/EM6cMRbt+r3uqoRDJnfw7VyTtuqwhTXT7MsOfXg+S1lUTfge
X-Received: by 10.107.135.211 with SMTP id r80mr7141977ioi.133.1463600066604; 
	Wed, 18 May 2016 12:34:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 12:34:07 -0700 (PDT)
In-Reply-To: <20160518153227.GE2579@jama>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
	<20160518141444.GC2579@jama> <01a701d1b119$a0f58a00$e2e09e00$@neuf.fr>
	<20160518153227.GE2579@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 20:34:07 +0100
Message-ID: <CAJTo0LYbJuGjP6RjGEbYMhj6NGnjjRL6ktwh024YQoeoSiTb6w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 19:34:27 -0000
Content-Type: multipart/alternative; boundary=001a113ed20a10485d053322f2cd

--001a113ed20a10485d053322f2cd
Content-Type: text/plain; charset=UTF-8

On 18 May 2016 at 16:32, Martin Jansa <martin.jansa@gmail.com> wrote:

> Please ignore what I said, os.path.join won't work anyway, because
> libdir starts with slash so os.path.join would just return that part.
>

Luckily we have oe.path.join which doesn't have the os.path.join semantics,
so I changed the patch when merging into mut to use that.

Ross

--001a113ed20a10485d053322f2cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2016 at 16:32, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6f2" class=3D"=
a3s aXjCH">Please ignore what I said, os.path.join won&#39;t work anyway, b=
ecause<br>
libdir starts with slash so os.path.join would just return that part.<br></=
div></blockquote></div><br>Luckily we have oe.path.join which doesn&#39;t h=
ave the os.path.join semantics, so I changed the patch when merging into mu=
t to use that.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a113ed20a10485d053322f2cd--
