Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E9C01605BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:45:39 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 5so74255041ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cksIl1UU2m04HgFmS6OIReMUholFTbGNL6DmaPFFfWs=;
	b=ddebNnQsZC5pujbtECqqn5Hc14+As/pCmyD7HSumIT40iCUMu+nFuaTrT+eRLAyOZJ
	DGv6r5tnXBktUNbpbvRBi96wquAsY23r18cMUSoLkS/UhWp5hPXnBDo92/k1RBZgTj88
	QUz/AuSEqh8Dl+d2zEjJbEmEV2vhU7wpKdd1edYaz9Ir/2bqU0UWao3JvT5N3HqSIi9k
	i1W6PslFQV362ykJHfxIzaHJiotRr8HIo3ZIZjZGeLjj5Ru1Q1A/Zb3aYalpNOR75NaG
	vEsWM3iX9+u4vG/1zGJp/xtP+2r0ird3rggLAJTZBqgsnT6djCFKJZnszahhuMcIfOCq
	2Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cksIl1UU2m04HgFmS6OIReMUholFTbGNL6DmaPFFfWs=;
	b=OTD/P/ws4VFMcl6LARCNNqHSeAiVo3h37sv2w400P+XDrotoBx0BI9OYZAphTA05zM
	PhVWbvEmyHVcBtKJ/ztXBOHcA+77kjWpEo3ayTLEIr9dJlRWVKKW70l231/CZW8NHrCO
	W8ubT093FbEtTEdx0YO+4uQ4WQzSLnelH1Al6M5sySWjftRdQprIGw3DHioJsuRyIf9A
	tXAudc41gNokQjoQ4aEf5aoSE9xfwN6Hr18fUmn2ahG38tBYJV0OHDTCbbPM+fMK+1no
	eXXVvtT2thS226CILp2gutmJhPBNlAB38OTJm0/26p59HjEq3/HsWjm6RWe1oUAn4hvf
	/UNw==
X-Gm-Message-State: ALyK8tJTQ9IWEUZXrmTB0ojiBu4qXfgCmAmKsB61eFH/qt4hkFEFT+oC9UTxKG/4jnN9p9n03IjJS0zccKM1AzkN
X-Received: by 10.107.138.201 with SMTP id c70mr1960577ioj.148.1466160340279; 
	Fri, 17 Jun 2016 03:45:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 17 Jun 2016 03:45:20 -0700 (PDT)
In-Reply-To: <1466157777-11573-1-git-send-email-d.falko@partner.samsung.com>
References: <1466157777-11573-1-git-send-email-d.falko@partner.samsung.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jun 2016 11:45:20 +0100
Message-ID: <CAJTo0LZzaZN3db7aE4-Gk1Dpmh-DM734wj+bFCLwVTByZfB5VA@mail.gmail.com>
To: Dmitriy Falko <d.falko@partner.samsung.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Alias _obstack_free to obstack_free to build binutils with uclibc
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
X-List-Received-Date: Fri, 17 Jun 2016 10:45:40 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a443dfd0535770e09

--001a113e8e6a443dfd0535770e09
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 11:02, Dmitriy Falko <d.falko@partner.samsung.com> wrote:

> Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
>

Please add a full explanation to the commit message and patch header to
explain what this patch does and why.  The commit message should reference
the bug number [YOCTO #9781], and the patch also needs an Upstream Status
tag.

Ross

--001a113e8e6a443dfd0535770e09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 June 2016 at 11:02, Dmitriy Falko <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:d.falko@partner.samsung.com" target=3D"_blank">d.falko@partner.samsung=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":11=
p" class=3D"a3s aXjCH m1555dd0e6fd75d30">Signed-off-by: Dmitriy Falko &lt;<=
a href=3D"mailto:d.falko@partner.samsung.com">d.falko@partner.samsung.com</=
a>&gt;<br></div></blockquote></div><br>Please add a full explanation to the=
 commit message and patch header to explain what this patch does and why.=
=C2=A0 The commit message should reference the bug number [YOCTO #9781], an=
d the patch also needs an Upstream Status tag.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113e8e6a443dfd0535770e09--
