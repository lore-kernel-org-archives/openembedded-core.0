Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id DC27A7E1AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 15:51:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w25so1770144ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=9ucZ/mtzPfBvbKXCUg1Rvi6b4PdVr+XOiuU8X73RvyU=;
	b=bb5nzexRnunjTZn4OqF4LnWTeO1z502+25tBd43AwZCNYi+roS3mknILiUi5zkuaEc
	Mqh28U2XSWJyZMq6qETDLPGIkWc9D+nL7+oUeGCRnh1aIh4jG1nP4piBbRpRJNinxUUa
	UQ5Vea6Tvh0ccza2XNpokjPz3qtT6teeB5yRlFafgq6ohtw20Mc+3E82yR7hHHLggyNh
	0YChyLzzcZj0dhT/yERYrFPMWCX2JzzFoJwITdDch6j37IiDwgwV5jL6mYCG6w7aUimh
	zJPIlVoydpqNLBJX4oxFbA68Sk6sl4QSOCdvAKYUwfFpl5GN4lp1C4KCGy7oIsqP2THa
	V4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9ucZ/mtzPfBvbKXCUg1Rvi6b4PdVr+XOiuU8X73RvyU=;
	b=LTGXw7AMLnB7Rw7/TmCHEKi6RIDbnuNBOhB3cV0T1VSCVJgIjD2qmRH+A9GWOoe/01
	2CKb9rA/8BRgyV+j24JjLMeXmt0+hn5geqyPqI32kHe2rMBmgPjaBhBiprIxwAcECRpD
	AEMgWJ+obt2+A/cFvXwv442itcaSqVKjOFQVJFMFFbSP09miG+HUWALVLdeLwsVhevji
	YrNjS+XXKrxWBvIpi8odZD7Uj7ETkKvCc3ZpZkcrhjKNQeQUm5GDGt/HQpkxUk3zqLJ8
	tDet+cKR41IA/Lmsi3eMD0IiPP5V2w9vrCK6/7om8H1559uvaMq4nBsq6T3GIxkLpGVs
	i7jw==
X-Gm-Message-State: APjAAAVsvP+4QBdW+E2nruj2GaEfehpmFKfdQNl77IzFqcs//xFoaJct
	ynktfsQdGjlAcmu1Pvp8bA3+2OvJ
X-Google-Smtp-Source: APXvYqwQnp9eg5m/6TrUJC0HyEnAoOpk8ZNERXXLiZliQxfVjXotcfxfGuugxHhbwoZB3oa0eZLynQ==
X-Received: by 2002:a5d:9e55:: with SMTP id i21mr11424842ioi.307.1559922709620;
	Fri, 07 Jun 2019 08:51:49 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id j23sm949278itk.30.2019.06.07.08.51.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 08:51:48 -0700 (PDT)
Sender: Joshua Watt <jpewhacker@gmail.com>
From: Joshua Watt <JPEW.hacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
Message-ID: <ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
Date: Fri, 7 Jun 2019 10:51:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Fri, 07 Jun 2019 15:51:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Is there a reason for this change other than aesthetics?

FWIW, we maintain some recipes across several versions of poky, so this 
rename is going to cause me some headaches

On 6/7/19 10:48 AM, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../recipes-test/multiconfig/multiconfig-image-packager_0.1.bb  | 2 +-
>   meta/lib/oe/sstatesig.py                                        | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
> index 3dbc0f5d155..a76a6bea1b8 100644
> --- a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
> +++ b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
> @@ -8,7 +8,7 @@ MCIMGTYPE_virtclass-mcextend-tiny = "cpio.gz"
>   
>   MC_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
>   
> -do_install[mcdepends] += "multiconfig::${MCNAME}:core-image-minimal:do_image_complete multiconfig::${MCNAME}:virtual/kernel:do_deploy"
> +do_install[mcdepends] += "mc::${MCNAME}:core-image-minimal:do_image_complete mc::${MCNAME}:virtual/kernel:do_deploy"
>   
>   do_install () {
>       install -d ${D}/var/lib/machines/${MCNAME}
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 417943db902..13af16e473c 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -155,7 +155,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>           else:
>               def get_mc(tid):
>                   tid = tid.rsplit('.', 1)[0]
> -                if tid.startswith('multiconfig:'):
> +                if tid.startswith('mc:'):
>                       elems = tid.split(':')
>                       return elems[1]
>               def recipename_from_dep(dep):

