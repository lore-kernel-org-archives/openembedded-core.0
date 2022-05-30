Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BC9C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 09:38:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.35166.1653903507091580633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JI86VH8I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id z17so6009557wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=TzLHBGsqixGTnfnZgqNgt45H5fI4uJcDqCeRYXpHeWA=;
        b=JI86VH8INFZNtZWjwGVUuYpluRipFRNOBenZM5N/bcZa/FUyknfRqYZ0JVfKW5QMuM
         aIiiVADRRSF1fbge/FJVg8UDHfb3xwJCIBgt3q6PSyJq7QfDaOl/rnBkzNru6SS2fCKA
         /3Xwn6fKHjSmJgTm4lpr6587YV8isxVzYvRYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=TzLHBGsqixGTnfnZgqNgt45H5fI4uJcDqCeRYXpHeWA=;
        b=ufRE6rM3Z8qYM7Ki7xu7bF2LDTvJ7WkGMdSOjWks11pamhRwxHzpP0LpfTPl7wHM49
         rMlUxKhpA3ZB+qBcw5FWBV2GwW71fGGmli1oV7JRuMxHAX1DfpMmFql3TNEkA2wmToc0
         PYwC9XFPvU1AAIxYie27cBD7YADq3SEPFEjd7+Je298PmMKjga+wbR6GBL991X2QNBIH
         fNCcb38yQ0kDMn5syRDx1sbHT0SU/OxGO5DsLsLi2Hglsv2hRF0r/YbBbZ9IMCdAzAXn
         bIa4vB3Q2+tyF1WtBwOVEir7ZgjZ+nS4S9Cp5XRt7wLHH60E4SqQiVUQhOLH8vSHCLti
         a7YQ==
X-Gm-Message-State: AOAM531Ogemwx39MJd7L3c5iSyPyNglt9+3R1ZMbWzQoOR8ypXesdL1M
	5tm4xtGdnrywmmdeDb3R35cBlQ==
X-Google-Smtp-Source: 
 ABdhPJzEVR+rx5UghtSTD2qlGhKbXxXbLnMsu2VpJnlBuj/wjf3/CbG1v+0oxHiYcEixdX4CXB+oDA==
X-Received: by 2002:a05:600c:15c1:b0:397:6ec6:4342 with SMTP id
 v1-20020a05600c15c100b003976ec64342mr18079485wmf.79.1653903505590;
        Mon, 30 May 2022 02:38:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e4c:23fd:74c8:d908?
 ([2001:8b0:aba:5f3c:4e4c:23fd:74c8:d908])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6dac000000b0020feb9c44c2sm9580783wrs.20.2022.05.30.02.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 02:38:25 -0700 (PDT)
Message-ID: 
 <d0fa0038ee0e8952c6bd80921bcbde872b45c9d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] json-c: Add ptest for json-c
From: richard.purdie@linuxfoundation.org
To: Simone Weiss <simone.weiss@elektrobit.com>,
	openembedded-core@lists.openembedded.org
Cc: Kai Tomerius <kai.tomerius@elektrobit.com>
Date: Mon, 30 May 2022 10:38:24 +0100
In-Reply-To: 
 <36681a90-b7d3-4332-8860-b24dd9b7a35d@denue6es011.ebgroup.elektrobit.com>
References: 
	<36681a90-b7d3-4332-8860-b24dd9b7a35d@denue6es011.ebgroup.elektrobit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 09:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166276

On Mon, 2022-05-30 at 11:36 +0200, Simone Weiss wrote:
> Also add a script for executing the ptests. All tests were sucessful on a=
 trial
> run.
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
> Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc |  1 +
>  meta/recipes-devtools/json-c/json-c_0.16.bb     | 15 +++++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index a1ead90649..0bfcb60c76 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -22,6 +22,7 @@ PTESTS_FAST =3D "\
>      gettext-ptest \
>      glib-networking-ptest \
>      gzip-ptest \
> +    json-c-ptest \
>      json-glib-ptest \
>      libconvert-asn1-perl-ptest \
>      liberror-perl-ptest \
> diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-d=
evtools/json-c/json-c_0.16.bb
> index fdec5ec9af..3fa5ce2c49 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.16.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
> @@ -4,7 +4,10 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee21=
6f2"
> =20
> -SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar=
.gz"
> +SRC_URI =3D " \
> +    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> +    file://run-ptest \
> +"
> =20
>  SRC_URI[sha256sum] =3D "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d0=
30c5ba8a0288d96b"
> =20
> @@ -13,6 +16,14 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)=
-\d+"
> =20
>  RPROVIDES:${PN} =3D "libjson"
> =20
> -inherit cmake
> +inherit cmake ptest
> +
> +do_install_ptest() {
> +    cp -r ${B}/tests ${D}/${PTEST_PATH}
> +    cp -r ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
> +    cp -r ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
> +    cp -r ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
> +    cp -r ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
> +}
> =20
>  BBCLASSEXTEND =3D "native nativesdk"


I like the idea, thanks for the patch. I think it is missing the run-
ptest file?

Cheers,

Richard


