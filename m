Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7F52A786EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 11:35:57 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id b5so1818236itc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 03:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W/BwRlrBTh+44lpEfSSFrnHOVDbhNn1T4B/bVDDQ80U=;
	b=e0KphHRRsJPZ6rg+N/2zO/TJi4FyjQEEdX9M7dqP4HWe76Gwqx+xPUAotl/bEDp9Uz
	mUiv4FN29Xh3CC+aism5F4BQ5qWZ9hambamrTbiJiix64PVQ1XH7skGPkIC8+QfS6jvX
	+08F4VZ7NpOKucZX1whJG9uUlDz1leyK8mLUHpb2VIAKldK84REOsbomAkLlTg+rRi76
	I5QL5Pwa0+tBXdKJoEbUOYXzSqzmtGP3qL6kAlMBq2WEaLfMOFDyhf1BBbtpTeDsDkGi
	0NOv82BFiGZttFTB0LMDYA1Ktun4A/xM3IJpzhNGDx9SNnH22e3Ni/q/uJMmG7W1Wclt
	icXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W/BwRlrBTh+44lpEfSSFrnHOVDbhNn1T4B/bVDDQ80U=;
	b=MntHL1JI6ClQ61FWKoiMOVDdOUlQYOhKm0iFRmvHZuZkYC3I7j97qp3E8O8Vu2GHRN
	vKtdNcJJj4rPONUG1uXQifsR6Pdpcr2rlM0ZVDNx9OjW/+i9QNQFHxS2EQdT96bgRMSB
	YT1wQ07kNiJygX1zC1Foe6fgv+QBLN4EOScStqcVoyOP1MNyVLSyA1BF+Hg4ARNj0pkK
	SwNJgcbPlIVydZUpClcI4da5M4RBg81jvAYr0VbX2ObzX1M17njRR97Pu4Uo+Cz82S/m
	HR8OssiMi3jcAezIqPgatYGEiL9y8deL04oSqMO4KrhQvyySpZerlNsKAOKeaxco14wD
	la+A==
X-Gm-Message-State: AKwxytfEA02M0wfaZfu4inkHzyO/XwU9bhmolsZQ6foweEUBuZLTDvKX
	705x5KklTH7jduQBhiyK+vSZ67a94QMaO06m/HQl0A==
X-Google-Smtp-Source: ACJfBotJvHLGf+WEm7LTl1YqKgaBPbne65dG8eQqB41lCHRA4Qp8o3iwF6GDeXpoE7y25FS6HtWtxUvlgMWwUrDnlRw=
X-Received: by 10.36.228.79 with SMTP id o76mr26318272ith.85.1516361759436;
	Fri, 19 Jan 2018 03:35:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 03:35:39 -0800 (PST)
In-Reply-To: <1516359976-26345-1-git-send-email-ole2mail@mail.com>
References: <1516359976-26345-1-git-send-email-ole2mail@mail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 11:35:39 +0000
Message-ID: <CAJTo0LYxWfHvpFQUGk8Qy=AG7A7=PCY6CSm4UWW_8qbCWTO5RA@mail.gmail.com>
To: Oleg Kokorin <ole2mail@mail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 11:35:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c1246da05cc7005631f7c60"

--94eb2c1246da05cc7005631f7c60
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 11:06, Oleg Kokorin <ole2mail@mail.com> wrote:

> diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
> b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-
> hashtable_iterator.patch
> new file mode 100644
> index 0000000..082f3b1
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-
> hashtable_iterator.patch
> @@ -0,0 +1,31 @@
> +Index: setup-scripts/build/tmp-angstrom_v2014_12-glibc/work/
> x86_64-linux/mtd-utils-native/1.5.1+gitAUTOINC+9f107132a6-
> r0/git/mkfs.ubifs/hashtable/hashtable_itr.h
>

This patch (the patch you add) needs a explanatory comment,
upstream-status, and signed-off-by:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Ross

--94eb2c1246da05cc7005631f7c60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 January 2018 at 11:06, Oleg Kokorin <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ole2mail@mail.com" target=3D"_blank">ole2mail@mail.=
com</a>&gt;</span> wrote:<div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex">
diff --git a/meta/recipes-devtools/mtd/<wbr>mtd-utils/mtd-utils-fix-<wbr>ha=
shtable_iterator.patch b/meta/recipes-devtools/mtd/<wbr>mtd-utils/mtd-utils=
-fix-<wbr>hashtable_iterator.patch<br>
new file mode 100644<br>
index 0000000..082f3b1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/mtd/<wbr>mtd-utils/mtd-utils-fix-<wbr>hashtable=
_iterator.patch<br>
@@ -0,0 +1,31 @@<br>
+Index: setup-scripts/build/tmp-<wbr>angstrom_v2014_12-glibc/work/<wbr>x86_=
64-linux/mtd-utils-native/<wbr>1.5.1+gitAUTOINC+9f107132a6-<wbr>r0/git/mkfs=
.ubifs/hashtable/<wbr>hashtable_itr.h<br></blockquote><div><br></div><div>T=
his patch (the patch you add) needs a explanatory comment, upstream-status,=
 and signed-off-by:</div><div><br></div><div><a href=3D"https://www.openemb=
edded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.or=
g/wiki/Commit_Patch_Message_Guidelines</a></div><div><br></div><div>Ross=C2=
=A0</div></div></div></div>

--94eb2c1246da05cc7005631f7c60--
