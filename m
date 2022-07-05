Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C83AC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 04:50:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.80926.1656996632016972157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CujH5WWD;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id b23so13090051ljh.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 21:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ZTdd9QhSQ8c8bmf7p4094YRaIaskNHVi+gpwoVdicoE=;
        b=CujH5WWDsd/ZNHlClOXnM9+8fX8qkFGEl8IpxAETxWKxZH+RrrXNR5jG5IU3EEYmp7
         kLnTlK8PDKLab9PFgOjuhE3TSwEEZnfhN1xGxgQMGWsuMI1/z3A/31ZS9BL0x4ETZs4D
         bQJFZRs4zG8tx2HZHgSfYGWxG/voQK36kfsVS7Ws0DDbPZVWP8Puz1igRsCZS/sE+VR9
         DWzzhjiuj1bgQUacEpKSSFNtpjm+s2qsgpStrOYt2YuaLAhq/E3W24bngT/PVyHX5cMY
         hNyG3qqpjCAqFyhqsEmJmZwFSeLq7tvftkGKT3kd+iQkZBkhOcEsj1W9BTFcwcXv8UB5
         1d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZTdd9QhSQ8c8bmf7p4094YRaIaskNHVi+gpwoVdicoE=;
        b=rSfdBvMBWK58Y8r4O45q+vOKJPwb+7QK/OuH9fnwnP68fAjpAGRfxtUUzMLgXGEP0e
         SQdNpd6Ydl3AMUwGte09dMEQ3eownqHkmjCo45WUDxMgRTvdd5bg4SGxpK/zp7uBER2t
         ttIM+KM7/5kEpO7o0qgQ9mfs90quqpHP/OiZZzPkllBfkeZU+XEF+ytGqjeKZfQY4HCH
         tCK/gGOPsYhjNTAWZ9wMW1QkiEncCKTr663f92TY8c+QBBvBqtbQtjBF7HJBQlEdVEd5
         BcIsYJrvsH1jdz+q9N10HyrKrZ8SZDl1OHCLjpVwptsEWDuE2kRS4772vnAfLHhpInE5
         d6nA==
X-Gm-Message-State: AJIora9POxsLfxs8s2jwOrivLDipsy/FGOhDKJrMwh2qEwcoobTCfPrs
	cSs+AuM7ZcG1Mn9pZ1qJ6LE=
X-Google-Smtp-Source: 
 AGRyM1st2UHLBOeMaG9Oba3MfpjpaUO5fr+jy4oiFactkWAkiy0ViyN4qncgAiM8J+QEg1HU+pL1aQ==
X-Received: by 2002:a2e:5706:0:b0:25d:3796:6fe0 with SMTP id
 l6-20020a2e5706000000b0025d37966fe0mr239325ljb.367.1656996630057;
        Mon, 04 Jul 2022 21:50:30 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 9-20020a2e0509000000b0025538905298sm5292766ljf.123.2022.07.04.21.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 21:50:29 -0700 (PDT)
Message-ID: <4d50da0a-0e08-1cdd-8067-a587cc06bfd5@gmail.com>
Date: Tue, 5 Jul 2022 06:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v6 6/7] utils: Add cmdline_shebang_wrapper util.
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220619192041.1113263-1-ptsneves@gmail.com>
 <20220619192041.1113263-6-ptsneves@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220619192041.1113263-6-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 04:50:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167638

On 6/19/22 21:20, Paulo Neves wrote:
> Useful to work around shebang relocation issues, where
> shebangs are too long or have arguments in them, thus preventing them
> from using the /usr/bin/env shebang.
> ---
>   .../wrapper/cmdline-shebang-wrapper-test.bb   | 21 ++++++++++++
>   .../recipes-test/wrapper/files/test.awk       |  2 ++
>   meta/classes/utils.bbclass                    | 34 +++++++++++++++++++
>   meta/lib/oeqa/selftest/cases/wrapper.py       | 11 ++++++
>   4 files changed, 68 insertions(+)
>   create mode 100644 meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
>   create mode 100644 meta-selftest/recipes-test/wrapper/files/test.awk
>   create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py
> 
> diff --git a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
> new file mode 100644
> index 0000000000..c4126a41fc
> --- /dev/null
> +++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Check that create_cmdline_shebang works"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +SRC_URI += "file://test.awk"
> +
> +EXCLUDE_FROM_WORLD = "1"
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
> +    sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
> +    create_cmdline_shebang_wrapper ${D}${bindir}/test
> +    if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
> +        bbfatal "Wrapper is broken"
> +    else
> +        bbnote "Wrapper is good"
> +    fi
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-selftest/recipes-test/wrapper/files/test.awk b/meta-selftest/recipes-test/wrapper/files/test.awk
> new file mode 100644
> index 0000000000..91429197b1
> --- /dev/null
> +++ b/meta-selftest/recipes-test/wrapper/files/test.awk
> @@ -0,0 +1,2 @@
> +#! @AWK_BIN@ -f
> +BEGIN { print "Don't Panic!" }
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index b4eb3d38ab..b58c22771f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -184,6 +184,40 @@ END
>   	chmod +x $cmd
>   }
>   
> +create_cmdline_shebang_wrapper () {
> +	# Create a wrapper script where commandline options are needed
> +	#
> +	# These are useful to work around shebang relocation issues, where shebangs are too
> +	# long or have arguments in them, thus preventing them from using the /usr/bin/env
> +	# shebang
> +	#
> +	# Usage: create_cmdline_wrapper FILENAME <extra-options>
> +
> +	cmd=$1
> +	shift
> +
> +	echo "Generating wrapper script for $cmd"
> +
> +	# Strip #! and get remaining interpreter + arg
> +	argument="$(sed -ne 's/^#! *//p;q' $cmd)"
> +	# strip the shebang from the real script as we do not want it to be usable anyway
> +	tail -n +2 $cmd > $cmd.real
> +	cmdname=$(basename $cmd)
> +	dirname=$(dirname $cmd)
> +	cmdoptions=$@
> +	if [ "${base_prefix}" != "" ]; then
> +		relpath=`python3 -c "import os; print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
> +		cmdoptions=`echo $@ | sed -e "s:${base_prefix}:\\$realdir/$relpath:g"`
> +	fi
> +	cat <<END >$cmd
> +#!/usr/bin/env bash
> +realpath=\`readlink -fn \$0\`
> +realdir=\`dirname \$realpath\`
> +exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real $cmdoptions "\$@"
> +END
> +	chmod +x $cmd
> +}
> +

Maybe this has already been raised before, but the wrapper above does a 
couple of addtitional forks, which could be avoided if we use a python 
wrapper script instead.

Jacob

>   create_wrapper () {
>   	# Create a wrapper script where extra environment variables are needed
>   	#
> diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py b/meta/lib/oeqa/selftest/cases/wrapper.py
> new file mode 100644
> index 0000000000..6de63310c0
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/wrapper.py
> @@ -0,0 +1,11 @@
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake
> +
> +class WrapperTests(OESelftestTestCase):
> +    def test_shebang_wrapper(self):
> +        """
> +        Summary:   Build a recipe which will fail if the cmdline_shebang_wrapper function is defective.
> +        Expected:  Exit status to be 0.
> +        Author:    Paulo Neves <ptsneves@gmail.com>
> +        """
> +        res = bitbake("cmdline-shebang-wrapper-test -c install", ignore_status=False)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167044): https://lists.openembedded.org/g/openembedded-core/message/167044
> Mute This Topic: https://lists.openembedded.org/mt/91863579/4454410
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

