Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 13C646011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:27:44 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id gy3so17018957igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tq2DDoAlf2wvnqCdoJviFe0HmgdiEF+j/q2ew8aJ5x8=;
	b=qZkvsH9HPT/DVXht9QO+u3CjEy6+4chUdtY+K5oG0GEvwMeZcFcpJfnL/l/h/0p2L5
	3p/URsHBCsUi2hegSapXkT4sHGD5WkfI8dDQIs+YMitekyysvF9it4HSkPzIMCpiMuUZ
	pGFr3rnOMevM+cvsgExl3nYKJviqSfsqJEowYyLqufeJ+WPITxpSUVnb3FEOquxYw3do
	G9q6n76lhS5i8GUrqgCuCbD3U+cPbpPeVYxTvhnM8pqry3wsEBJolBurored+rlbAEE4
	ejcIz7mKI8U1jyaYr0HeEd7yBdfe2W8K9gLTSYkyqqoDtRPHAWVWoGowmUoJ5fXB7l+/
	ftcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tq2DDoAlf2wvnqCdoJviFe0HmgdiEF+j/q2ew8aJ5x8=;
	b=SClr9u6RQY9FS6PBJMUeGCak4kFvZhSuMEJ+aDO1w8DKFAQEjthNjeVLJxRbZEIzQl
	77WwHAYxzONRSNLGYjeAkYgSvmrg81vwoYCplwXNZv+jhAseAeD+X3vvJWbXt/0HgNVo
	idiP1l2krmtNY51+TVZ0PVTHdxRZWDMJIpQJkpJ74MhZPlERBdKFrTu0NzYv09uYb/KT
	p0jg0E6Mr+qd/j6Mi/2gIcLj65HTmxz5tdp/OZU/v9AC0BSmJyv1x1manIJ13kZ3fjRE
	0HKP7zM8AsRFT8i7iMIB7RtTev5fqMt9vQ3Qv+z0pn9ZzlCaIzDT5C002IBUevjnvcGu
	UdMQ==
X-Gm-Message-State: AOPr4FXznHaI1hpVlJTxeH5UU7R/HTORmwDP76Hiy4wD/8OenLGV5URyVW9exWTeVWPbj0xLyl25PqV1OYE2IIiC
X-Received: by 10.50.78.8 with SMTP id x8mr21803850igw.78.1461011264873; Mon,
	18 Apr 2016 13:27:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 18 Apr 2016 13:27:25 -0700 (PDT)
In-Reply-To: <1dc231d4e16a29c432524c1dcbce24be1e5e61cc.1460947932.git.liezhi.yang@windriver.com>
References: <cover.1460947932.git.liezhi.yang@windriver.com>
	<1dc231d4e16a29c432524c1dcbce24be1e5e61cc.1460947932.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Apr 2016 21:27:25 +0100
Message-ID: <CAJTo0LY7wbsghY5ypPSKAQ5tPN=pJkmQ=ZsC8+8SjARBqh4zoQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta.bbclass: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Mon, 18 Apr 2016 20:27:46 -0000
Content-Type: multipart/alternative; boundary=089e01183a4c74c29f0530c83106

--089e01183a4c74c29f0530c83106
Content-Type: text/plain; charset=UTF-8

On 18 April 2016 at 03:57, Robert Yang <liezhi.yang@windriver.com> wrote:

> The recipe which inherits meta.bbclass doesn't require any default deps.
>

meta is only inherited by one class (populate_sdk_base.bbclass) and three
recipes (two of which indirectly inherit populate_sdk_base) so do we really
need this class?  Maybe we should drop it in the 2.2 cycle.

Ross

--089e01183a4c74c29f0530c83106
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2016 at 03:57, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":1nm" class=3D"">The r=
ecipe which inherits <span class=3D"">meta</span>.bbclass doesn&#39;t requi=
re any default deps.<br></div></blockquote></div><br>meta is only inherited=
 by one class (populate_sdk_base.bbclass) and three recipes (two of which i=
ndirectly inherit populate_sdk_base) so do we really need this class?=C2=A0=
 Maybe we should drop it in the 2.2 cycle.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--089e01183a4c74c29f0530c83106--
