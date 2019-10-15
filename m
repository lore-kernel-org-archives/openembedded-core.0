Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 183B47F352
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:01:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f21so9795126plj.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8tUjTKFo6UtYPI45Q1ZzMTefarVnuLF6YK3MTs8ptW4=;
	b=eCtBN5Dvt7X3Wd5Lqg0FDOxRlX9pkzraYajwbEuXkwYE0HEK5s116hB/YLVH7xlET1
	yDMf21cNDSsSf3NBHxvdVwhy7uea3YZ7fogpeJb3XMo4oYRdjt1/mN09tibltt5AIiol
	NWGMveY+tNCQ5DCUwGpORSnDbmXqBD12P1xut1MzmQKF4m33Y2kn0dvJhrYd66W7N9sU
	plQSeQU5LvzuCMNuou6jraTOfnTuB0/0Dn5pic0fN5TYsBiQIlYx8qv6pT1y6L8vm8gb
	tY9qmTpOPhCtU1itFQTidkGOT1iHQvja9VY0yKHsnWF2hNJ0a05UNl/ZS9hh9VnGQcis
	osgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=8tUjTKFo6UtYPI45Q1ZzMTefarVnuLF6YK3MTs8ptW4=;
	b=Gu7gGFPAr6PLGuM/HkDywynqGL/7D14jx0cPbFCQUT/8miXWMun2KWXeQP9RCgNC35
	BROd/BFsobnMcU+fArzbPXTKpDIGGTlvUkUNtr8IKb+1zTsOofztyuUvXEqthLLqZQSZ
	APn903g2qJLSQVAOh/b32gPht0N+Dr2Zi7id5iPXFtDkiMQR3dk3pQXKYRyM7+K3ceY6
	4oFCsgBHi+bFwEqYit1W35v5O8935tGRy1N/G7jyKY6MXI7aF7KKFyIOx85g1ELir/0Q
	6kIOrAKCy8NEdSqBuOKZXSHQXVagqCj3+E9RcqrngpIUzfN77yRBaifqfhVdtxACka/C
	j0Qg==
X-Gm-Message-State: APjAAAVJFl+Jlxayd+H4oh/DtYi165fYNLi1xlDQUuhu+jpuLI5flSI7
	Xc4kSqyZh0+lwz4hGRFCQ1TNUw/D
X-Google-Smtp-Source: APXvYqxIssL1vABLi7k+S3nsQp3sJy+pmy2pQwwNDlimVoFIe6Svn9b1u8lLn0P5cF4+EIwbWkkcVw==
X-Received: by 2002:a17:902:724b:: with SMTP id
	c11mr36767064pll.6.1571155266615; 
	Tue, 15 Oct 2019 09:01:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655?
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	f74sm25289286pfa.34.2019.10.15.09.01.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Oct 2019 09:01:05 -0700 (PDT)
To: shuagr@microsoft.com, openembedded-core@lists.openembedded.org
References: <1571084536-74960-1-git-send-email-shuagr@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fb340b87-6f4a-bbd8-90b3-fb916b4bc6ee@gmail.com>
Date: Tue, 15 Oct 2019 09:01:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571084536-74960-1-git-send-email-shuagr@microsoft.com>
Subject: Re: [thud][PATCH v2] sqlite3: CVE fix
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
X-List-Received-Date: Tue, 15 Oct 2019 16:01:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 10/14/19 1:22 PM, shuagr97@gmail.com wrote:
> From: Shubham Agrawal <shuagr@microsoft.com>
>
> CVE:CVE-2019-161680
Does not match patch name.
> Status: Backport
>
> whitelist as changes already there due to previous patches in upstream
> CVE:CVE-2018-20346
> Status: Backported
>
> Sign off: Shubham Agrawaslshuagr@microsoft.com

This need to be fixed in Master then Warrior.
> ---
>  .../sqlite/files/CVE-2019-16168.patch              | 37 ++++++++++++++=
++++++++
>  meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-16168.pa=
tch
>
> diff --git a/meta/recipes-support/sqlite/files/CVE-2019-16168.patch b/m=
eta/recipes-support/sqlite/files/CVE-2019-16168.patch
> new file mode 100644
> index 0000000..d8e93c0
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/CVE-2019-16168.patch
> @@ -0,0 +1,37 @@
> +From fc8bb8d6ae2d4cd024546e9e7bbab115427c3f41 Mon Sep 17 00:00:00 2001=

> +From: Shubham Agrawal <shuagr@microsoft.com>
> +Date: Fri, 11 Oct 2019 20:20:18 +0000
> +Subject: [PATCH] sqlite3 CVE: CVE-2019-16168 Status: backported Sign o=
ff:
> + Shubham Agrawal<shuagr@microsoft.com>
> +Reply-To: shuagr@microsoft.com
> +
Add this kind of information into the patch itself.

CVE:CVE-2018-20346
Status: Backported

Sign off: Shubham Agrawaslshuagr@microsoft.com

See https://patchwork.openembedded.org/patch/165800/ as an example


> +---
> + sqlite3.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 0f71a44..c480e53 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -101836,7 +101836,9 @@ static void decodeIntArray(
> +       if( sqlite3_strglob("unordered*", z)=3D=3D0 ){
> +         pIndex->bUnordered =3D 1;
> +       }else if( sqlite3_strglob("sz=3D[0-9]*", z)=3D=3D0 ){
> +-        pIndex->szIdxRow =3D sqlite3LogEst(sqlite3Atoi(z+3));
> ++        int sz =3D sqlite3Atoi(z+3);
> ++        if( sz<2 ) sz =3D 2;
> ++        pIndex->szIdxRow =3D sqlite3LogEst(sqlite3Atoi(sz));
> +       }else if( sqlite3_strglob("noskipscan*", z)=3D=3D0 ){
> +         pIndex->noSkipScan =3D 1;
> +       }
> +@@ -137151,6 +137153,7 @@ static int whereLoopAddBtreeIndex(
> +     ** it to pNew->rRun, which is currently set to the cost of the in=
dex
> +     ** seek only. Then, if this is a non-covering index, add the cost=
 of
> +     ** visiting the rows in the main table.  */
> ++    assert( pSrc->pTab->szTabRow>0 );
> +     rCostIdx =3D pNew->nOut + 1 + (15*pProbe->szIdxRow)/pSrc->pTab->s=
zTabRow;
> +     pNew->rRun =3D sqlite3LogEstAdd(rLogSize, rCostIdx);
> +     if( (pNew->wsFlags & (WHERE_IDX_ONLY|WHERE_IPK))=3D=3D0 ){
> +--=20
> +2.7.4
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recip=
es-support/sqlite/sqlite3_3.23.1.bb
> index 7df61cd..e2e9b50 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> @@ -8,6 +8,7 @@ SRC_URI =3D "\
>    file://CVE-2018-20505.patch \
>    file://CVE-2018-20506.patch \
>    file://CVE-2019-8457.patch \
> +  file://CVE-2019-16168.patch \
>    "
>  SRC_URI[md5sum] =3D "99a51b40a66872872a91c92f6d0134fa"
>  SRC_URI[sha256sum] =3D "92842b283e5e744eff5da29ed3c69391de7368fccc4d0e=
e6bf62490ce555ef25"



