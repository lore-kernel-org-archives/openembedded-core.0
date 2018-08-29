Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 21542793B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:44:28 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id l202-v6so9553218oig.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VvfUdHfgCUHffL9L3wSnf0/B8gojeps2hDM2wZKvW9c=;
	b=Hs7Kay7zwxoynigWASEkfkRbwnTv74MO6DdQ3MYjAtAmwT1m6+RSN2TNrzJxqSNkXJ
	rmkFLG67oBnaW69kao3zMxmn3WxdeqHJOmKJtKRdaZ1nGFxYFg/ZP8nuJ/fOoax+OtmQ
	aN4ctOD92+74KDWxE0kTMQjHCTBz+yksqK5oZ8jlo2awKz4PKWVqZ123ba+V/19NZ+W0
	/1zMU1RzXH6SBSeoF6luQ5rR4vWB2XFal2RqAlWu6TE4NFM+3EVmCi3eToabGot6IiIY
	vxk1BHQQ4U6Cv9hQ3kZjixs7LSXDwPwr187V4/Kw1xzp0ZgdGK8tjxpSVQKv6RUMFG57
	6iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VvfUdHfgCUHffL9L3wSnf0/B8gojeps2hDM2wZKvW9c=;
	b=NrZkQv+fpHa7uRC4WcfMX3ib2UvKA8xeh96BupGNR2EeywJmkieMqbdvGNyZPxm3KY
	sM+OJ6hE0TtMNOi5lWrFkURkUzjVNmnzTTj7X7/bCJ8AXJsTKSezVdptzs28zlT5qZKK
	XvnfHQHqfKf/qcX/wFag5ultMFXCf2dJQmA4tb1iXn9lzbyQ6E9uZkDeJJbFokJ7BQBv
	W3aMBLu0vdhcYPSlrMCxAa+Nvq5N8HHXB4QEqQPgzEmPwTAkJmmf2MeDTZmXvfxDNcNM
	eBorRKhwu7guK7UHvNcoaWwgINHD6f3z0TVc7imCUdXQbZTMuYujO36RmPuFw4BkfBqq
	thYQ==
X-Gm-Message-State: APzg51D9urVD0mtNCJBchqVBDlUjvacYByWCMBM4dhg5PZ5yjOUcYTwc
	fwrJ3yDqA89KDfm2Emu7xWLA+EV8/iN63U3klKnqUg==
X-Google-Smtp-Source: ANB0VdaAl1plz0G0fuCGDLGGk3puCnQzlXctmeTA4wrUxsRpp4r2iEniJVt1c8mzbOjy4H+poqnzZszDdq/32Scy8aY=
X-Received: by 2002:aca:d015:: with SMTP id
	h21-v6mr3215382oig.142.1535553868894; 
	Wed, 29 Aug 2018 07:44:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Wed, 29 Aug 2018 07:44:28
	-0700 (PDT)
In-Reply-To: <1535553827-23904-1-git-send-email-alex.kanavin@gmail.com>
References: <1535553827-23904-1-git-send-email-alex.kanavin@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Aug 2018 16:44:28 +0200
Message-ID: <CANNYZj8WMNgS_HAk7rpaTcf8JmEWg5XBca8nJ1iQ1NF5RGCPqQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] openssl: do not tweak so names, use PRIVATE_LIBS instead
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
X-List-Received-Date: Wed, 29 Aug 2018 14:44:28 -0000
Content-Type: text/plain; charset="UTF-8"

This is supplementary to yesterdays' openssl 1.1 patchset.

Alex

2018-08-29 16:43 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> The tweaking was not sufficient to prevent package dependency issues,
> but there is a standard mechanism to do exactly that kind of prevention
> which I wasn't aware of.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> index 1917c33..3f4e19f 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> @@ -149,14 +149,10 @@ do_install_append_class-nativesdk () {
>
>  do_install_ptest () {
>         cp -r * ${D}${PTEST_PATH}
> -
> -       # Putting .so files in ptest package will mess up the dependencies of the main openssl package
> -       # so we rename them to .so.ptest and patch the test accordingly
> -       mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
> -       mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
> -       sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
>  }
>
> +PRIVATE_LIBS_${PN}-ptest = "libcrypto.so.1.1 libssl.so.1.1"
> +
>  # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
>  # package RRECOMMENDS on this package. This will enable the configuration
>  # file to be installed for both the openssl-bin package and the libcrypto
> --
> 2.7.4
>

