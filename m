Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A680C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 21:53:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.49406.1679954019133464091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 14:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=m70fElSu;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id j24so10274612wrd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679954017;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=te7ugFkUb3YHLj+TKCf2TcTHjLjN6isoJn5DMs8NfR0=;
        b=m70fElSu4MXBsu4VY/Ygbr47+B0tYlbwdWPGZNaOHjCMlqK9vBnE5oWQTuC64nzMGM
         wEiXLIxjT3fASm47uCdElMPMRDjgettsqN/X2p6/iQe0Iy1AKacKsQpGBJIdRQcCl1bf
         wAJUKyWIb3ZQxOSDaouU81rqpN54Ac4+oirMEN9iAHiLmYU0DZ1tO9LijpI45sVdlsd2
         l63rSqcEIMnM/0MX+mCqSDnroDog5kD4Lfa+5AKm+vFhfHvP29GgHnio2HclKSnRfISV
         efLnJjJ7xVUO663CNmX1sQ7U+/ysbIzDHAKVidtotQQVRE6R/RDiK8qLH4XiVlVh6dxN
         RQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679954017;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=te7ugFkUb3YHLj+TKCf2TcTHjLjN6isoJn5DMs8NfR0=;
        b=qh/cpwRmI8M5yIYrrbhgfEmEZdqF+U9dYdwdMo8/2hUui8RBZ5XUanVYEWY83V4Cjv
         BE62hc5JEUhXygTki+zQ5okU9b2MF/X+0uV0cZfuwxfNrbIdfeRiJRRyMBUoXzch+GeE
         3dMGygrd7Z/KwYAMxwOGX91OJUXgqmNrnI2iRHDcwoeaOEc/Slwjh6XdF+JgcaD9zfOi
         iiYqNsUuDw6i0Ka8QYv6gQOpuw+V7OK7eylgcaKeCF4FFXvI3HNq+IWBAbE69ORLmuFm
         0//IRGriU80nIkEU484MnhsY7xbXN3lXO020YbWeYu+vKF5qFFAy6yTLg9E7mK6Yh0cl
         QpSA==
X-Gm-Message-State: AAQBX9eZSpWjQx6TeIfpDaBhFpl7FQLpSfUpk496Hyq3m5hF6d8vCfqX
	7rxn5lnFipTEh41REfK948eWv3Xg6EhdmU2wuNI=
X-Google-Smtp-Source: AKy350b9AifcEYyKh65R5PfHP8EjVhfH+C2FL34Hx42iV+piF1qm0O2Evv7Bqk+JItqeWIcXPHQsJQ==
X-Received: by 2002:a5d:6b4b:0:b0:2dc:2431:67d0 with SMTP id x11-20020a5d6b4b000000b002dc243167d0mr10503897wrw.19.1679954017568;
        Mon, 27 Mar 2023 14:53:37 -0700 (PDT)
Received: from [192.168.0.33] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b002d24a188b64sm25974506wrx.112.2023.03.27.14.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 14:53:37 -0700 (PDT)
Message-ID: <3c6df532-b183-cdfc-9ba1-277a346bf76f@smile.fr>
Date: Mon, 27 Mar 2023 23:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] oeqa/selftest/cases/package.py: adding unittest
 for package rename conflicts
Content-Language: en-US
To: Fawzi KHABER <fawzi.khaber@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20230323095655.6319-1-fawzi.khaber@smile.fr>
 <20230323095655.6319-2-fawzi.khaber@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20230323095655.6319-2-fawzi.khaber@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 21:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179184

Hi Fawzi and list,

While looking at master-next, I found some mistakes in this series.
@maintainers, maybe wait for the v3 before merging into master?

Sorry for this, my internal review was not thorough enough :(

@Fawzi, please see the inline comments :
On 3/23/23 10:56, Fawzi KHABER wrote:
> This Unittest tries to rename a package, using an already used name and
> fails on do_package.
> 
> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
> Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> ---
>  .../packagenameconflict/packagenameconflict.bb         | 10 ++++++++++
>  meta/classes-global/package.bbclass                    |  3 +--
>  meta/lib/oeqa/selftest/cases/package.py                |  7 +++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
> 
> diff --git a/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb b/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
> new file mode 100644
> index 0000000000..5d19a4dd25
> --- /dev/null
> +++ b/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Test case that tries to rename a package to an existing one and fails"
> +DESCRIPTION = "This generates a packaging error when a package is renamed to a pre-existing name"
> +LICENSE = "MIT"
> +
> +# Add a new package ${PN}-renametest
> +PACKAGES += "${PN}-renametest"
> +# ... and try to rename the ${PN}-dev to the new ${PN}-renametest (conflict)
> +PKG:${PN}-dev = "${PN}-renametest"
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
> index 30dfd63d4f..21461ff314 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -498,13 +498,12 @@ python do_package () {
>  
>      # Check for conflict between renamed packages and existing ones
>      # for each package in PACKAGES, check if it will be renamed to an existing one
> -
This line ...
>      for p in packages:
>          localdata = bb.data.createCopy(d)
>          localdata.setVar('OVERRIDES', p)
>          rename = localdata.getVar('PKG')
>          if (rename != None) and rename in packages:         
> -            bb.fatal('package %s is renamed %s using PKG:%s, but package name already exists'%(p,rename,p))
> +            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but package name already exists'%(p,rename,p))
... and this line should be squashed with the patch 1/2 instead of the 2/2 of your series.

>
>      ###########################################################################
>      # Optimisations
> diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
> index 4f7cd10658..1aa6c03f8a 100644
> --- a/meta/lib/oeqa/selftest/cases/package.py
> +++ b/meta/lib/oeqa/selftest/cases/package.py
> @@ -89,6 +89,13 @@ class VersionOrdering(OESelftestTestCase):
>              self.assertEqual(status - 100, sort, "%s %s (%d) failed" % (ver1, ver2, sort))
>  
>  class PackageTests(OESelftestTestCase):
> +    # Verify that a recipe cannot rename a package into an existing one
> +    def test_package_name_conflict(self):
> +        res = bitbake("packagenameconflict", ignore_status=True)
> +        self.assertNotEqual(res.status, 0)
> +        err = "package name already exists"
> +        self.assertTrue(err in res.output)
> +
>      # Verify that a recipe which sets up hardlink files has those preserved into split packages
>      # Also test file sparseness is preserved
>      def test_preserve_sparse_hardlinks(self):

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

