Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 005CC724B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 18:03:11 +0000 (UTC)
Received: by pdmh5 with SMTP id h5so15674176pdm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=TJfI6grggGDr9J2czQ8X0HmlufkSG15Iu7UfymcFBVA=;
	b=VcQgGJzLxsyiLHbuw4WhrYRbiO/PeeHuQJ0NzSIXM5xoqbAHZ4MDDVgKH4Jy/mcqmI
	JuPVxP2SjpSQ4nlWemhs23/m3BxRe074JdnTEygpqOKbXoavvK6hnKGsOofK7CLn/l0s
	r+ojQB+crz6vpPUb6O3lDWg4SHBMBhdr9xJ7H8LspveG/7gcKs4XxCV81XYv6zvral5j
	WjM7vs2aqEpBdQu1VjY0og1ujT68m7zuEhNF01cTc9EuqV7U6zgNhxXlVJGnUIqSVzXC
	fSLmW6OCqBmt2nO4WLosRu8mksLhc2MEKNW0WkdR0xojw81I1eXA/+Mu5OgewEvTDK52
	6w9A==
X-Received: by 10.66.90.168 with SMTP id bx8mr70693426pab.53.1427824992557;
	Tue, 31 Mar 2015 11:03:12 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:6:cdb2:cfe6:6df6?
	([2601:9:500:ece:6:cdb2:cfe6:6df6]) by mx.google.com with ESMTPSA id
	jd5sm14602256pbd.35.2015.03.31.11.03.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 31 Mar 2015 11:03:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1427815394.14020.359.camel@linuxfoundation.org>
Date: Tue, 31 Mar 2015 11:03:10 -0700
Message-Id: <C0E4E693-7B0A-4869-ABB5-DE4B87AFAF0D@gmail.com>
References: <1427815394.14020.359.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: insane: Add baremetal mappings to the QA arch test
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
X-List-Received-Date: Tue, 31 Mar 2015 18:03:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 31, 2015, at 8:23 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Add mappings for i586-elf, x86_64-elf and arm-eabi to binary lookup
> table which allows for a variety of baremetal toolchain generation.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 061ce5b..d0c6fea 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -53,6 +53,13 @@ def package_qa_get_machine_dict():
>             "darwin9" : {=20
>                         "arm" :       (40,     0,    0,          True, =
         32),
>                       },
> +            "eabi" : {=20
> +                        "arm" :       (40,     0,    0,          =
True,          32),
> +                      },

IIRC fsl ppc also uses eabi for baremetal

> +            "elf" : {=20
> +                        "i586" :      (3,      0,    0,          =
True,          32),
> +                        "x86_64":     (62,     0,    0,          =
True,          64),
> +                      },
>             "linux" : {=20
>                         "aarch64" :   (183,    0,    0,          True, =
         64),
>                         "aarch64_be" :(183,    0,    0,          =
False,         64),
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


