Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7FC77469
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 16:31:02 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id j15so23598669oih.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S5/IPrJcMXrFPFozWFHLqWNYA/VJLrewMzKXtPJ9zhc=;
	b=NbkpNDjL/sNpZ76HqFU2tuB20Fe5ufQAoq17IE51lAcfyNJJVxl0C5olCalvu7aFd1
	Mg9Bd3T03iGiaAfXddYQuZ0BceEJ/N/uPjZaIIjM5FaH8fsPEOer/NueiaapoaVsTeE0
	j4vcIOMALwwc7ZU0S13ZpGp7a+F2eZCPAty3aZIrq0K8nHUt0PQYB+ezIok1BXgdtfxR
	F51/+quRavrl18RgkqnOZdZayF1r05q7VgXK3xsmK4pF3Yygk8w7aSWexnRrafYtM4cn
	uQ1tyEJDu49IyhkTVuVUfErbBElOlevgXh113X6ehHd5f4RzhPwehDaoBv0uEAQVtGdz
	wLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S5/IPrJcMXrFPFozWFHLqWNYA/VJLrewMzKXtPJ9zhc=;
	b=Oaq3N2fcip5OINye6i5NArl6Xr8+XyazDkhH+Ck3Ctd7phXdLtiL9cE0pgoSQyqxj3
	9nSXoqGTr6CC/Udl5uCPjbwFSpUsui2920m1Mayzp/gTVq/oBY1yZvCMMI+4w4prjIbP
	vjhoYCti0Nz8GRBXoOgT3MIJvr6zbwLgp8IWGIVPLx84Va46iMY5l8j5DfpuwAIVo0cu
	O7fLWA66ENVV2a/ZHs5YCFqnqJnsPDQjzwIs76NYUjqY5EIXZRUPKg2CMqMyy1VFNU+d
	2SmxJ2EmiwzOXlI1f3KY67YWfTXAzlVlReSLnBsOJ6lFNosxhEbzRYo00Xf8xAP4TsUO
	wXqQ==
X-Gm-Message-State: AMke39k2WWTVZTYa+vvOEcYOf967ju09uA9JsElz/5zbRjNNT3MHWLGZ0RaDatIVtT0zXIjhHHuxUiX8lFfIng==
X-Received: by 10.202.85.10 with SMTP id j10mr4981290oib.102.1486744263018;
	Fri, 10 Feb 2017 08:31:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Fri, 10 Feb 2017 08:30:42 -0800 (PST)
In-Reply-To: <20170209160144.72820-1-stephano.cetola@linux.intel.com>
References: <20170209160144.72820-1-stephano.cetola@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 10 Feb 2017 09:30:42 -0700
Message-ID: <CABcZANnY82w7Ypxo7W22K0eqa97vaz+w6Qw1E6igzCTZvEmfuA@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: print QA message correctly
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
X-List-Received-Date: Fri, 10 Feb 2017 16:31:03 -0000
Content-Type: multipart/alternative; boundary=001a113d2a68ab525d05482f9f2d

--001a113d2a68ab525d05482f9f2d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 9, 2017 at 9:01 AM, Stephano Cetola <
stephano.cetola@linux.intel.com> wrote:

> When checking for ".debug" files, print QA message correctly.
>
> Fixes [YOCTO #11014]
>
> introduced in OE-core revision 1dcb38ca9d6
>
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
>

Just a note that nowhere in this commit message does it actually say what
the problem is. It=E2=80=99s now correct, so what was it doing before? It=
=E2=80=99s not
ideal to have to go check the bug tracking system to find out exactly what
problem a commit is fixing.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113d2a68ab525d05482f9f2d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Feb 9, 2017 at 9:01 AM, Stephano Cetola <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.ce=
tola@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":1cn" class=3D"a3s aXjCH m15a239d43c7dd533">When checking for =
&quot;.debug&quot; files, print QA message correctly.<br>
<br>
Fixes [YOCTO #11014]<br>
<br>
introduced in OE-core revision 1dcb38ca9d6<br>
<br>
Signed-off-by: Stephano Cetola &lt;<a href=3D"mailto:stephano.cetola@linux.=
intel.com">stephano.cetola@linux.intel.<wbr>com</a>&gt;</div></blockquote><=
/div><br>Just a note that nowhere in this commit message does it actually s=
ay what the problem is. It=E2=80=99s now correct, so what was it doing befo=
re? It=E2=80=99s not ideal to have to go check the bug tracking system to f=
ind out exactly what problem a commit is fixing.<br>-- <br><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphi=
cs</div></div></div></div>
</div></div>

--001a113d2a68ab525d05482f9f2d--
