Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1583873FA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:01:16 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e65so101304822pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=NnRiqzjHOzEjKp5AYU05l+p2dUFlCU5Hu/fEom2N9Ow=;
	b=mN6TR7EJichh3FV76l58ZVb1PtldKzMmewTcR2uXju4dX9FkF8GcObzH3MY2mK4RNv
	HS/QwNFDG2srguc3PhuYmQizoYTLIdzzgjVQk57MV4zwf/DFCga+GfK5tGu1UsMyVMfO
	wtCriR1YpCSdw4vOWX9n/N5cDOg6vThQAbDTad/xIKoLB5pNM+oAASXpVbMpFSdjegji
	YWU+r2lK7YragaW+sKoGDkbOBvZy2o0r93qrFueUU/qFUQXaRlCOO7pgjR+paIemOp+S
	YMigc7hu++uJluHQNKG0zxqAUYbqoMBTBkhYb0Z3V7rr7pQLv7CjGSBt33m81JWTn26c
	NkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=NnRiqzjHOzEjKp5AYU05l+p2dUFlCU5Hu/fEom2N9Ow=;
	b=b/oGfSkPo1Ps8HMtgUIO3unRSlvAxMFOgtCyKw6djML0jBzm1vdbdXnmUKbpbn1YPd
	jieteppw/VOHAqpn1Zr8f9DJ5ilKr2q0GYgz+7LOyioWRYQh9PKJ/0NeW2OBJbSJPli9
	zD7nxe6Jegu4OXROKlx3dhPl/Sa0wqhpgGDMZo/lQcaV5YlvtwSwbxRTUParmIiaX3ir
	bz+i+4UOziU/xvCkcYbKsNesRNfVH1b1HWfNBWNqlrhRVX6pqm6vOT+y/fMseCHVgHdu
	EvPGerkQvQEn9vLlCg+u5hJxOBJPbG0M5ARRaMDDVONCqGpXpVfE1HTYkE4Divae/s5X
	Oagg==
X-Gm-Message-State: AG10YOSJLT8bJ3KuXV8GMWDe7aVC6WetAUbfHkw22i7VftVB2EIIyf7301QEQx8pytJh/Q==
X-Received: by 10.98.10.73 with SMTP id s70mr35001409pfi.85.1453824077276;
	Tue, 26 Jan 2016 08:01:17 -0800 (PST)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com.
	[209.85.192.173]) by smtp.gmail.com with ESMTPSA id
	r15sm2747280pfr.59.2016.01.26.08.01.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jan 2016 08:01:15 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f173.google.com with SMTP id n128so100821952pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:01:15 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.86.214 with SMTP id h83mr34721793pfj.112.1453824075074;
	Tue, 26 Jan 2016 08:01:15 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 26 Jan 2016 08:01:14 -0800 (PST)
In-Reply-To: <1453779264-8652-1-git-send-email-denis@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
Date: Tue, 26 Jan 2016 14:01:14 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoPmBQpmvChLUOADj1B2m-DUPJCeG-cB7Gk1BrPvk4byg@mail.gmail.com>
Message-ID: <CAP9ODKoPmBQpmvChLUOADj1B2m-DUPJCeG-cB7Gk1BrPvk4byg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 16:01:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 26, 2016 at 1:34 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> A clean room re-implementation and extension of the original stress tool.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> new file mode 100644
> index 0000000..2e92c53
> --- /dev/null
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A tool to load and stress a computer system"
> +HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
> +SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
> +
> +CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"

Where version comes from?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

