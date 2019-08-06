Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 30C3D7F304
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 02:27:08 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c2so37168517plz.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 19:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=9DPp+80OOIui7lm9xp/XS97RXi0U7oSWAWkySLvHVeE=;
	b=bT3nmR2uyn476PY9vLC0QAKAXnOplFw7WIA+kWy40jWV3ZNkAQqt0orcWNUEutcqsh
	3haQ7uvAty0M6J0L4Fmww42eyTghjZIjBOPjbjinwrXyf2gYV7BdrqZr+6nbfl8jbOpW
	3tmBA8a/ruBsC/1tbOuRi2YdABWSgS9MLBKGYJ1gaB4OQdNvXGxy0h6BmEO7kkN/4bfA
	QP+8o6YAWz6RCVD3ihnxrQQKfozcAI+Y/vs5gtSP7kVlVk46Zx5yYiCTGp862NEu2mq9
	F8OliPl7lOxiQ+YvdSv1hHIZFkvqTl5HBPwQu81ROQLBlReJvp1rO2sNiVOW1cki5iZT
	SREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=9DPp+80OOIui7lm9xp/XS97RXi0U7oSWAWkySLvHVeE=;
	b=avVo5Wq/cuigI0WqBbBeXEzYbQAGhD4oQrRgQ8a3QZDEKw6rm/GLBsB7Jr5q4y09N+
	/BTBMULPDfRoAvplcOx+CFQiJOPKD5RsRzDKpGko0TRLiFpjxtzwrNgDYpzIa3AWuHMr
	91IYHFBl+WvzP1v8vmFJIj5bMln6kdblBXin29LlxNYRy16tllryeIcoD4fCgev6/1p2
	DbTPRPiX1tt20QBOCy2Gz/FnIjM2/E3xmq+9ltsWssAuMJ5rhde2ZezfWb6sxUVOsJJM
	tLQcAnXzE2xAQegadwnb+BFVuurwyKLJj+UvX+FQ9Bioir3CMlevGGCu5oVn2tIC+p3A
	ItPw==
X-Gm-Message-State: APjAAAVhNcYV9Bu6ga72DwizAXBhpeJonljAgV2kFo7N4AFzDNGy6ETS
	Q2sWMrJllqqIQLohWnCTTYcbggb82dE=
X-Google-Smtp-Source: APXvYqzqWboLZT7+MAgPBAGv4n04PCp8GyVBvErBmcXi+uh2zAOFkK9ZdvWwQmZZ2IX9HubRilTMUA==
X-Received: by 2002:a17:902:2f:: with SMTP id 44mr783261pla.5.1565058428690;
	Mon, 05 Aug 2019 19:27:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::31f9? ([2601:646:8500:6bc6::31f9])
	by smtp.gmail.com with ESMTPSA id
	z63sm59745694pfb.98.2019.08.05.19.27.07
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 19:27:08 -0700 (PDT)
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190806020537.155456-1-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <3555e672-2136-1310-8f57-155df4449df3@gmail.com>
Date: Mon, 5 Aug 2019 19:27:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806020537.155456-1-mark.hatle@windriver.com>
Subject: Re: [PATCH v2] glibc-package.inc: Add linux-libc-headers-dev to glibc-dev
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
X-List-Received-Date: Tue, 06 Aug 2019 02:27:08 -0000
X-Groupsio-MsgNum: 127538
Content-Type: multipart/mixed; boundary="------------4D10D74B33BF1BC397FC23F1"
Content-Language: en-US

--------------4D10D74B33BF1BC397FC23F1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8/5/19 7:05 PM, Mark Hatle wrote:
> Without linux-libc-headers-dev being added to the libc6-dev as a RDEPEN=
DS,
> the system may fail to install the necessary libc headers.
>
> This can happen when NO_RECOMMENDATIONS =3D "1" is defined.
>
> During the 'testsdk' this results in failures that look like:
>
>     fatal error: linux/errno.h: No such file or directory
>     # include <linux/errno.h>
>               ^~~~~~~~~~~~~~~
>
> This also matches the behavior of musl, which does not suffer from this=

> problem.


this patch is fine.

>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-c=
ore/glibc/glibc-package.inc
> index b150a34..f796876 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -36,6 +36,7 @@ FILES_${PN}-pic =3D "${libdir}/*_pic.a ${libdir}/*_pi=
c.map ${libdir}/libc_pic/*.o"
>  FILES_libsotruss =3D "${libdir}/audit/sotruss-lib.so"
>  FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
>  FILES_${PN}-dev +=3D "${libdir}/*_nonshared.a ${base_libdir}/*_nonshar=
ed.a ${base_libdir}/*.o ${datadir}/aclocal"
> +RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
>  FILES_${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
>  FILES_nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_u=
nitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
>                ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/=
98_nscd ${localstatedir}/db/nscd"

--------------4D10D74B33BF1BC397FC23F1
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
y6U=3D
=3DsChK
-----END PGP PUBLIC KEY BLOCK-----

--------------4D10D74B33BF1BC397FC23F1--
