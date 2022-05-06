Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90639C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:17:15 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.6736.1651821432216314338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i/n0Wrb6;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id p10so11085824lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CbUIjMK3v+NoPmW+tICsOOnfOX2BBhXMlKu4Vc5oDgQ=;
        b=i/n0Wrb6IxTXEV0xAlMzt8FdOVROktmyTwKkL+2UwkdnlPh123szdG8itP765E66Zy
         FJNETkpqhrzjPFG0hikfdTfdXtFitWHfE33hyMu/1GMxX+W9vnr438CvcP6P9cFUp+i1
         iEbSlBenaqJDc0evPRr+fLpizWxHOgkxQOynTmlWKqw7FGWqum5f2AMCXnPu/HqCgLRI
         K/Id+d1kL36q+UdJh2nJvlJvfFFCvFP1lrwXb9eA5KQXIL0wFCMWsB1NRq33TFzXmKm2
         kEuhg5KfqPGh2u/doTAjc4Et58KdvFD7JFZw0Yew/pzpUjAV9yZyIi+gEAzPqneWGdNK
         AoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CbUIjMK3v+NoPmW+tICsOOnfOX2BBhXMlKu4Vc5oDgQ=;
        b=ipAuTOvwLuAqfsWlaEcHmdla9a5VqfiyMcQArCbryBp+MHwqPNNQy55x+ljkKfENH6
         gFczRiMOT4i3+ZtciURdDS81zDE7Hzpa87JN0v47xJEWKiT4Bqv+QeZNRTo1dJfsvMbD
         hU92IiBOpKCL1qx7e8J0I6E6SRZJepi7qnmenEluJVOWPNZfy3ebc28gOEXMWnd/g7cA
         IaiI/p6js++I7k0xq9//qToKR0+vcvO7aiSZqSbzHziBRSexTK2qxZmWOaQirYh5cvcn
         EqJWOYCaeg3hNgW26qzTGKurFVgbUiVcVI0DEu5FP6u/QoHRxpfFDKXaEf+PSwsoE+r9
         AYzQ==
X-Gm-Message-State: AOAM530S029qfAjjO+ZNgT35F8QCG9e5/IwKzHKCe/HvF6kwbMwjgWzX
	L2ZTy2o52oT2LfjdNz0WUbgLoIYFJkc6lsjpNkzLSKuL+iY=
X-Google-Smtp-Source: 
 ABdhPJy4EmhIsrhxeZzjoLKEdFsn6Mxutm4zJKD17pIs9Pnr1FTMERxmJwiL868BS8sX8Oeb4VM4JQpnRfw124b4ugA=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr1498625lfo.358.1651821430567; Fri, 06
 May 2022 00:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220506065917.1375-5-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220506065917.1375-5-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 May 2022 09:16:59 +0200
Message-ID: 
 <CANNYZj8p-CCSWSSfw1TkqUs0wkbcsTCW5y_=-szZS0WHcetQCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] oe-selftest: add go recipe create selftest
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:17:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165332

Also here an explanation of what the test does would be useful.

Please keep in mind: writing code is only half the job. You need to
explain it to non-specialists too, we're already struggling with items
which are understood by few people, or in some cases only one person.

Alex

On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/lib/oeqa/selftest/cases/recipetool.py | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> index 510dae6bad..bb36e7b6d5 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -530,6 +530,94 @@ class RecipetoolTests(RecipetoolBase):
>          libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'recipetool')
>          sys.path.insert(0, libpath)
>
> +    def test_recipetool_create_go(self):
> +        # Basic test to check go recipe generation
> +        def urifiy(url, version, path = None, subdir = None):
> +            path = ",path='%s'" % path if path else ''
> +            subdir = ",subdir='%s'" % subdir if subdir else ''
> +            return "${@go_src_uri('%s','%s'%s%s)}" % (url, path, subdir)
> +
> +        temprecipe = os.path.join(self.tempdir, 'recipe')
> +        os.makedirs(temprecipe)
> +        recipefile = os.path.join(temprecipe, 'edgex-go_git.bb')
> +        srcuri = 'https://github.com/edgexfoundry/edgex-go.git'
> +        srcrev = "v2.2.0-dev.54"
> +        result = runCmd('recipetool create -o %s %s -S %s' % (temprecipe, srcuri, srcrev))
> +        self.assertTrue(os.path.isfile(recipefile))
> +        checkvars = {}
> +        src_uri = ['git://${GO_IMPORT};nobranch=1;name=${BPN}']
> +        checkvars['LIC_FILES_CHKSUM'] = set(['file://src/${GO_IMPORT}/LICENSE;md5=71a6955f3cd81a809549da266346dc59'])
> +        checkvars['GO_IMPORT'] = "github.com/edgexfoundry/edgex-go"
> +        inherits = ['go-vendor']
> +        dependencies = \
> +            [
> +                ('bitbucket.org/bertimus9/systemstat'),
> +                ('github.com/edgexfoundry/go-mod-bootstrap','github.com/edgexfoundry/go-mod-bootstrap/v2'),
> +                ('github.com/edgexfoundry/go-mod-core-contracts''github.com/edgexfoundry/go-mod-core-contracts/v2'),
> +                ('github.com/edgexfoundry/go-mod-messaging','github.com/edgexfoundry/go-mod-messaging/v2'),
> +                ('github.com/edgexfoundry/go-mod-registry','github.com/edgexfoundry/go-mod-registry/v2'),
> +                ('github.com/edgexfoundry/go-mod-secrets','github.com/edgexfoundry/go-mod-secrets/v2'),
> +                ('github.com/fxamacker/cbor','github.com/fxamacker/cbor/v2'),
> +                ('github.com/golang-jwt/jwt','github.com/golang-jwt/jwt/v4'),
> +                ('github.com/gomodule/redigo'),
> +                ('github.com/google/uuid'),
> +                ('github.com/gorilla/mux'),
> +                ('github.com/lib/pq'),
> +                ('github.com/pelletier/go-toml'),
> +                ('github.com/spiffe/go-spiffe','github.com/spiffe/go-spiffe/v2'),
> +                ('github.com/stretchr/testify'),
> +                ('go.googlesource.com/crypto','golang.org/x/crypto'),
> +                ('gopkg.in/eapache/queue.v1'),
> +                ('gopkg.in/yaml.v3'),
> +                ('github.com/armon/go-metrics'),
> +                ('github.com/cenkalti/backoff'),
> +                ('github.com/davecgh/go-spew'),
> +                ('github.com/eclipse/paho.mqtt.golang'),
> +                ('github.com/edgexfoundry/go-mod-configuration','github.com/edgexfoundry/go-mod-configuration/v2'),
> +                ('github.com/fatih/color'),
> +                ('github.com/go-kit/log'),
> +                ('github.com/go-logfmt/logfmt'),
> +                ('github.com/go-playground/locales'),
> +                ('github.com/go-playground/universal-translator'),
> +                ('github.com/go-playground/validator','github.com/go-playground/validator/v10'),
> +                ('github.com/go-redis/redis','github.com/go-redis/redis/v7'),
> +                ('github.com/golang/protobuf'),
> +                ('github.com/gorilla/websocket'),
> +                ('github.com/hashicorp/consul','api'),
> +                ('github.com/hashicorp/errwrap'),
> +                ('github.com/hashicorp/go-cleanhttp'),
> +                ('github.com/hashicorp/go-hclog'),
> +                ('github.com/hashicorp/go-immutable-radix'),
> +                ('github.com/hashicorp/go-multierror'),
> +                ('github.com/hashicorp/go-rootcerts'),
> +                ('github.com/hashicorp/golang-lru'),
> +                ('github.com/hashicorp/serf'),
> +                ('github.com/leodido/go-urn'),
> +                ('github.com/mattn/go-colorable'),
> +                ('github.com/mattn/go-isatty'),
> +                ('github.com/mitchellh/consulstructure'),
> +                ('github.com/mitchellh/copystructure'),
> +                ('github.com/mitchellh/go-homedir'),
> +                ('github.com/mitchellh/mapstructure'),
> +                ('github.com/mitchellh/reflectwalk'),
> +                ('github.com/pebbe/zmq4'),
> +                ('github.com/pmezard/go-difflib'),
> +                ('github.com/stretchr/objx'),
> +                ('github.com/x448/float16'),
> +                ('github.com/zeebo/errs'),
> +                ('go.googlesource.com/net','golang.org/x/net'),
> +                ('go.googlesource.com/sys','golang.org/x/sys'),
> +                ('go.googlesource.com/text','golang.org/x/text'),
> +                ('github.com/googleapis/go-genproto','google.golang.org/genproto'),
> +                ('github.com/grpc/grpc-go','google.golang.org/grpc'),
> +                ('go.googlesource.com/protobuf','google.golang.org/protobuf'),
> +                ('gopkg.in/square/go-jose.v2'),
> +            ]
> +        src_uri = {urifiy(*d) for d in dependencies}
> +        checkvars['SRC_URI'] = set(src_uri)
> +        self.maxDiff = None
> +        self._test_recipe_contents(recipefile, checkvars, inherits)
> +
>      def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
>          dstdir = basedstdir
>          self.assertTrue(os.path.exists(dstdir))
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165327): https://lists.openembedded.org/g/openembedded-core/message/165327
> Mute This Topic: https://lists.openembedded.org/mt/90928692/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

