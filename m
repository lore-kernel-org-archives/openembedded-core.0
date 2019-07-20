Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 470077EE84
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 18:21:41 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id y26so34411739qto.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fDUY4eHnFjizcZYDsIZxxp+95Vd/GcmX7ZSlNdy9PiQ=;
	b=U+V1PB6IKv1RX61UKk9cg1JJeo7e89cZQ1JZdEE5uaUUh23XoAQi84gl+yUW4qshLu
	ob9xYdWWs9CXWSNkFMLLCtkRPH4Zd/4m/4tkby5abZyexKw00PqpyUaZF98O1fk81fi9
	sWO+7DwE7XAp+/dyd3welFbg4Qm6EoD4mYCiOjnB++GGJZW0wNwZXORs4RIvvAV5Gt+P
	wUxn6QO4l0s8MoImQ8tIcjTM/QWPu1LC7b5y6L1wIaNgd5UHHj8PpcLtlupfx/9cCFud
	N6MpIWukG82GMZk5aAPuVgavEzORyVYmXyGfZr3JaZergEyGnDx6/QfFC9Xd4rbd9x/0
	bVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fDUY4eHnFjizcZYDsIZxxp+95Vd/GcmX7ZSlNdy9PiQ=;
	b=tK/zueaLUXf/yBmluw0OB/81n9c8tf41LS4pwqTqAfd3HC7cG+91l6IF+ZHpwQT8Xl
	sosoXEOAfY49Qys2/uJXe91/x8eCeSrx7rXZyOk8cP+cSnAV1y4S4A7xMoHBBVgAcAJ2
	UvX6g0nYUmpqNI2Mn9QAEWd3bTLWp3T49BBts0QsKmnMrwkf1hzY6CO602TgIfccdyhn
	mvG+TJZCppbnXZteYCtY4AH5gAk4d2bJ+KqbuyOiMLYol9mIY9fSWZ0O9Cqe3K0YpzaD
	Hb5l3P/nmgEucQl9uvbPP9SA194ov9GZMPUeXABQ9N/F9Sv/SVyMetRhPWqSge21eug+
	OSZw==
X-Gm-Message-State: APjAAAW+NMnjks6pCSULuHu7PNkEWOuI1vdzLzgJ2t0HChTgzi1P7OtI
	KG0s5GrhLnNE46BfP3wqpytqdGADyefnQRXgRvvU032B
X-Google-Smtp-Source: APXvYqxTr1csZd+Dd+NEqu1ZbtI3k2LLzKqTRxznkJhJ2QInNxXcTaRoeeBahxLWFrSMGxznbTYVGLCyq9o69/eqK8s=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr42377746qtn.378.1563646901899;
	Sat, 20 Jul 2019 11:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190720160929.31232-1-ayoub.zaki@embexus.com>
In-Reply-To: <20190720160929.31232-1-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Jul 2019 11:21:15 -0700
Message-ID: <CAMKF1sqog+Ry8GhR=c9nizfP+5A4JKBAKgTNUGY_jPbw86buWQ@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] pegtl: Initial recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 18:21:41 -0000
Content-Type: text/plain; charset="UTF-8"

wong mailing list.

On Sat, Jul 20, 2019 at 9:09 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Introduce the Parsing Expression Grammar Template Library (PEGTL)
> a zero-dependency C++ header-only parser combinator library for creating parsers
> according to the Parsing Expression Grammar (PEG).
>
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
> ---
>  meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
>
> diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
> new file mode 100644
> index 000000000..ca175f868
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
> +HOMEPAGE="https://github.com/taocpp/PEGTL"
> +LICENSE="MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
> +
> +SRC_URI="https://github.com/taocpp/PEGTL/archive/${PV}.tar.gz"
> +SRC_URI[md5sum] = "fe96a704913523763642a2c4c4618091"
> +SRC_URI[sha256sum] = "5699558ce06e8fad0530143199eeaefd29128fb4584879975c87947c8ad0395f"
> +
> +inherit cmake
> +
> +S="${WORKDIR}/PEGTL-${PV}"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

