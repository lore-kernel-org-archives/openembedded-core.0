Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8B4C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:22:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.15854.1702023734839135046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 00:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cGA0qV3w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3333224c7b9so1741588f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 00:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702023733; x=1702628533; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+qNDsdwkJVqw0+qu6GirJSHKsqkMlhYvxDXD8IO9fQ=;
        b=cGA0qV3wiO5wqpvSoPuFm+PXXbNKtRZ2xS+19lPdpmjipslEVTeXlZDoLJVckRSXnI
         OUEVUypRJovjRwyo8Raeysy2VU5S5v1Y+rKLRmaIj4aSIk19XaQ4EXYbZFxqxkV+ULAG
         XZIrD7n+ip+S1b+nmbHyfwq3NiwyuZ8WOCG+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702023733; x=1702628533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+qNDsdwkJVqw0+qu6GirJSHKsqkMlhYvxDXD8IO9fQ=;
        b=IZr/OVUbBylmt4xpZ6RqkooT/ADAHWlwbuPSp8DSeOeBNkLkv2o4mPFTjbQKY5/sYQ
         TorSVCctHpvGXoV8rGqPs0s5TQQVeZRRoJRJBjdaFmLy9R/RbA2oSDtIYHBOiQ9PmSPx
         VfANlscRGVVY5VNWeHpAea6O1k9veXqMfQoBxCtkWhous2BaF5PGcxvYLBzF1GRAtsT+
         Ml2dHpdaWVPrVpsp3AgQNpIHnhH5UjGuelJHSXGa/eyzamk1VeokvsTfUYwJGRRiTKUo
         /Rh+OGTqTDKZJQbLeMBtBnJQz57/rSHnrUEQJnjQACW8J1KmgBEkYMw0+sHNUczdtxCF
         Zl0g==
X-Gm-Message-State: AOJu0YzQihPNmHa9zOJqDWVrTQsoypM+OBbMqAVcxojsHhQ5GycW+iR/
	xbbQRD7BJj/CmumR8ii5pJIWHg==
X-Google-Smtp-Source: AGHT+IHoLQbOH7Oir7I3iz/hgsagQYqoG9YkYGqQSvByRLeTUxKNqxc/6CpQOvYSkg9RPlM0rB2AbQ==
X-Received: by 2002:a5d:61d0:0:b0:334:b369:2b18 with SMTP id q16-20020a5d61d0000000b00334b3692b18mr1394423wrv.60.1702023733166;
        Fri, 08 Dec 2023 00:22:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4cc1000000b0033350f5f94dsm1459580wrt.101.2023.12.08.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 00:22:12 -0800 (PST)
Message-ID: <3226028e5f4054034bc5b76e9170065e4b823db8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 09/10] oeqa/selftest/recipetool:
 appendsrfile: add test for machine
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Dec 2023 08:22:12 +0000
In-Reply-To: <20231205145636.960819-10-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
	 <20231205145636.960819-10-jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 08:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192015

On Tue, 2023-12-05 at 15:56 +0100, Julien Stephan wrote:
> Add a new test for machine specific bbappend override
>=20
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/lib/oeqa/selftest/cases/recipetool.py | 44 +++++++++++++++++++---
>  1 file changed, 38 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
> index 21cb350e8a6..c55025e7df6 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -1056,7 +1056,7 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
>              if p.scheme =3D=3D 'file':
>                  return p.netloc + p.path, uri
> =20
> -    def _test_appendsrcfile(self, testrecipe, filename=3DNone, destdir=
=3DNone, has_src_uri=3DTrue, srcdir=3DNone, newfile=3DNone, remove=3DNone, =
options=3D''):
> +    def _test_appendsrcfile(self, testrecipe, filename=3DNone, destdir=
=3DNone, has_src_uri=3DTrue, srcdir=3DNone, newfile=3DNone, remove=3DNone, =
machine=3DNone , options=3D''):
>          if newfile is None:
>              newfile =3D self.testfile
> =20
> @@ -1084,17 +1084,39 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
>          expectedlines =3D ['FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P=
N}:"\n',
>                           '\n']
> =20
> +        override =3D ""
> +        if machine:
> +            options +=3D ' -m %s' % machine
> +            override =3D ':append:%s' % machine
> +            expectedlines.extend(['PACKAGE_ARCH =3D "${MACHINE_ARCH}"\n'=
,
> +                                  '\n'])
> +
>          if remove:
>              for entry in remove:
> -                expectedlines.extend(['SRC_URI:remove =3D "%s"\n' % entr=
y,
> +                if machine:
> +                    entry_remove_line =3D 'SRC_URI:remove:%s =3D " %s"\n=
' % (machine, entry)
> +                else:
> +                    entry_remove_line =3D 'SRC_URI:remove =3D "%s"\n' % =
entry
> +
> +                expectedlines.extend([entry_remove_line,
>                                         '\n'])
> =20
>          if has_src_uri:
>              uri =3D 'file://%s' % filename
>              if expected_subdir:
>                  uri +=3D ';subdir=3D%s' % expected_subdir
> -            expectedlines.extend(['SRC_URI +=3D "%s"\n' % uri,
> -                                  '\n'])
> +            if machine:
> +                src_uri_line =3D 'SRC_URI%s =3D " %s"\n' % (override, ur=
i)
> +            else:
> +                src_uri_line =3D 'SRC_URI +=3D "%s"\n' % uri
> +
> +            expectedlines.extend([src_uri_line, '\n'])
> +
> +        with open("/tmp/tmp.txt", "w") as file:
> +            print(expectedlines, file=3Dfile)
> +
> +        if machine:
> +            filename =3D '%s/%s' % (machine, filename)
> =20
>          return self._try_recipetool_appendsrcfile(testrecipe, newfile, d=
estpath, options, expectedlines, [filename])
> =20
> @@ -1153,13 +1175,23 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsr=
cBase):
>          self.assertTrue(filepath, 'Unable to test, no file:// uri found =
in SRC_URI for %s' % testrecipe)
>          self._test_appendsrcfile(testrecipe, filepath, has_src_uri=3DFal=
se)
> =20
> -    def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(se=
lf):
> +    def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(se=
lf, machine=3DNone):
>          testrecipe =3D 'base-files'
>          subdir =3D 'tmp'
>          filepath, srcuri_entry =3D self._get_first_file_uri(testrecipe)
>          self.assertTrue(filepath, 'Unable to test, no file:// uri found =
in SRC_URI for %s' % testrecipe)
> =20
> -        self._test_appendsrcfile(testrecipe, filepath, subdir, remove=3D=
[srcuri_entry])
> +        self._test_appendsrcfile(testrecipe, filepath, subdir, machine=
=3Dmachine, remove=3D[srcuri_entry])
> +
> +    def test_recipetool_appendsrcfile_machine(self):
> +        # A very basic test
> +        self._test_appendsrcfile('base-files', 'a-file', machine=3D'myma=
chine')
> +

I think this is causing problems with other selftests, e.g. this set of
failures here:


https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2559/ste=
ps/14/logs/stdio

with errors like:

ERROR: When reparsing /home/pokybuild/yocto-worker/oe-selftest-armhost/buil=
d/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch, the basehash =
value changed from b720db5f2039a9a72917b5d400acd7f874d37014fec362112a44f905=
04ba79cd to 1b5f5a1ec1552e4a1e5798b2a1c23c062be5054be287d79c98e0e29da780c3b=
0. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_fetch -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_fetch -Sprintdiff


since this test is running on the same metadata as the other tests are
using. We need to keep modifications isolated from the other tests that
could be running.

Cheers,

Richard


