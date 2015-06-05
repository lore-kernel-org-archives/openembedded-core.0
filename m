Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id D0AAE6AC43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 12:02:37 +0000 (UTC)
Received: by qgg3 with SMTP id 3so5005969qgg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jun 2015 05:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rebqQvxPmFnqACDtTOI7N47IbzallsVQLYmMxDMbCNk=;
	b=Iu/qk/w6ahZS58dkraPT3UkRfp7XVnNyqh+pb/liKvd5HuCP1SLKjtxggw/autIdbF
	MHJ67oS7lN7EB0IkWJ6zA9Y16W9zhf9Fi0qqJqczqg2MeI6XoYAzjurqjNEAJOl8pd8w
	gHZBy5WGWaMu0E+GrAs5ULhQtFZWp3FyG2/ER+X9IvCxmXK8+nMmgCpL9g35W3dw4y1X
	tdIJJxYGo7v36hKPZ2nx0Kq3xtd5PEq0F31BPrPmzgojLKaKjilZQjF5TmUZO2NaeQEL
	90VWfpvU7XEn4QV4nfSpfWLGYWuuuaU2tIIG6QTmtGBuPzt/YasZhWc+OaS/AdHAAPl7
	9v0g==
X-Gm-Message-State: ALoCoQlG/BXKdHCx7B5E0zCMAsMhHNfltcewYzPQR/JTpG1Uc81Ly3Bye2DLH1g/6bR+2czGilwD
X-Received: by 10.229.185.68 with SMTP id cn4mr3725228qcb.12.1433505758082;
	Fri, 05 Jun 2015 05:02:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 5 Jun 2015 05:02:17 -0700 (PDT)
In-Reply-To: <1433492619-21508-1-git-send-email-wenzong.fan@windriver.com>
References: <1433492619-21508-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jun 2015 13:02:17 +0100
Message-ID: <CAJTo0LZtQh3Z4f+mvuQ4Um6mqeDxg2wNeQQOgoE1eRwpuZwq3A@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: Security Advisory - libxml2 - CVE-2015-1819
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
X-List-Received-Date: Fri, 05 Jun 2015 12:02:38 -0000
Content-Type: multipart/alternative; boundary=001a1134a4747ebc570517c41132

--001a1134a4747ebc570517c41132
Content-Type: text/plain; charset=UTF-8

On 5 June 2015 at 09:23, <wenzong.fan@windriver.com> wrote:

> +From 213f1fe0d76d30eaed6e5853057defc43e6df2c9 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Tue, 14 Apr 2015 17:41:48 +0800
> +Subject: [PATCH] CVE-2015-1819 Enforce the reader to run in constant
> memory
> +
> +One of the operation on the reader could resolve entities
> +leading to the classic expansion issue. Make sure the
> +buffer used for xmlreader operation is bounded.
> +Introduce a new allocation type for the buffers for this effect.
> +
> +Upstream-Status: Backport
>

No signed-off-by.

Ross

--001a1134a4747ebc570517c41132
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2015 at 09:23,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.f=
an@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":3lt" class=3D"a3s" s=
tyle=3D"overflow:hidden">+From 213f1fe0d76d30eaed6e5853057defc43e6df2c9 Mon=
 Sep 17 00:00:00 2001<br>
+From: Daniel Veillard &lt;<a href=3D"mailto:veillard@redhat.com">veillard@=
redhat.com</a>&gt;<br>
+Date: Tue, 14 Apr 2015 17:41:48 +0800<br>
+Subject: [PATCH] CVE-2015-1819 Enforce the reader to run in constant memor=
y<br>
+<br>
+One of the operation on the reader could resolve entities<br>
+leading to the classic expansion issue. Make sure the<br>
+buffer used for xmlreader operation is bounded.<br>
+Introduce a new allocation type for the buffers for this effect.<br>
+<br>
+Upstream-Status: Backport</div></blockquote></div><br>No signed-off-by.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a1134a4747ebc570517c41132--
