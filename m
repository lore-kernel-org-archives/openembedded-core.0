Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C19C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:42:43 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.209421.1672332160476756247
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+t3mMrI;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id y25so28240706lfa.9
        for <Openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERVmBD/UG5Cd9IJO1RdhJ2BKwX1wYUSecjS7qTnMSm0=;
        b=O+t3mMrI/t9xuwvW/hUoMo7kGSnbBu4+ChB6DhxeAiSJDVX7okumIDgcT2Ba7EOdv1
         8rYlolVzn2GDwoxvDRKdLhpt1N7M+jZnnnMHbdzCsf/QJCSc0ti5jqxJysNJ3L24USX/
         Ovr9JtwnjTIA8R0DiT/rs7TRXjzi3euHDGIatu3tOh/kXh9/X93MrI/ib7WpjXeFwUYY
         BCj/udhU2D5dLkDfnocqnK7Ow7dYd5QmNrhR4f4vdl3kTUsf5sPXBLOAWpXoCutxOELq
         0ZBwlTWNaV7/SMZ7ITizwdPcBCXmfwNn3AOCHnF0ktJzO0B7FUdUrPEEZs/H/4Fh0Fia
         YYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERVmBD/UG5Cd9IJO1RdhJ2BKwX1wYUSecjS7qTnMSm0=;
        b=mTWySMQo9Lu477JJ7d+BCnOI1DAZHSSmsWwQ8ls2HkuWKlohTiDhq3+oT9A8EhA+Zb
         5VV+KNsZbHZmPdjMXjnj1267VsPgeEHeWwTQtsmO4LI77KvjdTBYLFWeZdShtNL7Ize6
         wnu52++7oPzMFoUZw/V8KHcbWsQUHCcRtv0TRkzVtEE+t/EVrm6utXF+HGA6NJeK1x+l
         KT7TgfVJ68m/Stz492XLMpW4ylAbzJwD1ukgEC61Rp0Dnm+or1rG8IAKSbCl0mrs2wgK
         EmSdPaETBB8Z/KPQ+vClugXWXH/ZAAji+glANjiy6X81MVl6NgFScoQkAc8pCrRP/c61
         Rb0w==
X-Gm-Message-State: AFqh2korVP24NO8+uc/1PxtEtwFSuTDGahRdvVXPzrIg9AEUfg98Zgrx
	Zqdq1TrqMlqHyycBXPq0tmc=
X-Google-Smtp-Source: AMrXdXsjFKd0nQbCAk7vHJNonFdMBzK65pqAsCAbZA4l2+onVA5BwHQZYjL64Qn8nQaPVIx07od4hQ==
X-Received: by 2002:ac2:4f0c:0:b0:4b5:5f2e:3cc6 with SMTP id k12-20020ac24f0c000000b004b55f2e3cc6mr8041521lfr.47.1672332158501;
        Thu, 29 Dec 2022 08:42:38 -0800 (PST)
Received: from [10.133.216.80] ([185.253.97.10])
        by smtp.gmail.com with ESMTPSA id u1-20020ac243c1000000b004b18163476esm3109004lfl.112.2022.12.29.08.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 08:42:38 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------RIblVbSsB6QpQvPfsHtBgTWa"
Message-ID: <75a1d66a-ce1d-964a-1150-2f513adb044d@gmail.com>
Date: Thu, 29 Dec 2022 17:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: lukas.funke@weidmueller.com, stefan.herbrechtsmeier@weidmueller.com,
 wonsang.ryu@lge.com, =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20221222150246.91423-1-uvv.mail@gmail.com>
 <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
 <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
 <3d6e9c54-6d00-9400-d8ef-25109e95b775@gmail.com>
 <CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175121

This is a multi-part message in MIME format.
--------------RIblVbSsB6QpQvPfsHtBgTWa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.12.2022 10:59, Martin Jansa wrote:
>
> Please try recipetool changes on your go-mod recipes and provide feedback.
>

Coincidentally, I also needed grpc-web recipe, which original patchset 
was tested on.
I applied the series on my kirkstone branch of poky and tried to run the 
command:

% recipetool create -S c1971f71a28950d212b7ddc8df07b5563723031d -B 
master https://github.com/improbable-eng/grpc-web.git

Unfortunately this failed with the following log:

WARNING: go.mod files generated by Go < 1.17 might have incomplete 
indirect dependencies.
Traceback (most recent call last):
   File "/home/uvv/projects/poky/scripts/recipetool", line 111, in <module>
     ret = main()
   File "/home/uvv/projects/poky/scripts/recipetool", line 100, in main
     ret = args.func(args)
   File "/home/uvv/projects/poky/scripts/lib/recipetool/create.py", line 
746, in create_recipe
     handler.process(srctree_use, classes, lines_before, lines_after, 
handled, extravalues)
   File "/home/uvv/projects/poky/scripts/lib/recipetool/create_go.py", 
line 332, in process
     go_mod = self._go_mod_patch(patchfile, go_import, srctree, 
localfilesdir, extravalues, d)
   File "/home/uvv/projects/poky/scripts/lib/recipetool/create_go.py", 
line 291, in _go_mod_patch
     bb.process.run("go mod tidy", stderr=subprocess.STDOUT, env=runenv, 
shell=True, cwd=srctree)
   File "/home/uvv/projects/poky/bitbake/lib/bb/process.py", line 189, 
in run
     raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
bb.process.ExecutionError: Execution of 'go mod tidy' failed with exit 
code 1:
go: finding module for package google.golang.org/grpc/metadata
go: finding module for package google.golang.org/grpc
go: finding module for package github.com/golang/protobuf/protoc-gen-go
go: finding module for package golang.org/x/net/context
go: finding module for package google.golang.org/grpc/codes
go: finding module for package google.golang.org/grpc/grpclog
go: downloading golang.org/x/net v0.4.0
go: downloading google.golang.org/grpc v1.51.0
go: downloading github.com/golang/protobuf v1.5.2
go: finding module for package github.com/cenkalti/backoff/v4
go: downloading github.com/cenkalti/backoff/v4 v4.2.0
go: finding module for package github.com/desertbit/timer
go: downloading github.com/cenkalti/backoff v2.2.1+incompatible
go: finding module for package github.com/rs/cors
go: finding module for package golang.org/x/net/http2
go: finding module for package google.golang.org/grpc/health/grpc_health_v1
go: finding module for package google.golang.org/grpc/status
go: finding module for package nhooyr.io/websocket
go: downloading github.com/desertbit/timer 
v0.0.0-20180107155436-c41aec40b27f
go: finding module for package github.com/grpc-ecosystem/go-grpc-middleware
go: finding module for package 
github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus
go: downloading github.com/rs/cors v1.8.3
go: finding module for package github.com/grpc-ecosystem/go-grpc-prometheus
go: finding module for package github.com/mwitkow/go-conntrack
go: downloading nhooyr.io/websocket v1.8.7
go: finding module for package github.com/mwitkow/go-conntrack/connhelpers
go: downloading github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0
go: downloading github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
go: finding module for package github.com/mwitkow/grpc-proxy/proxy
go: finding module for package 
github.com/prometheus/client_golang/prometheus/promhttp
go: downloading github.com/mwitkow/go-conntrack 
v0.0.0-20190716064945-2f068394615f
go: finding module for package github.com/sirupsen/logrus
go: finding module for package github.com/spf13/pflag
go: finding module for package golang.org/x/net/trace
go: finding module for package google.golang.org/grpc/credentials
go: finding module for package github.com/golang/protobuf/ptypes/empty
go: downloading github.com/mwitkow/grpc-proxy 
v0.0.0-20220126150247-db34e7bfee32
go: finding module for package github.com/golang/protobuf/proto
go: downloading github.com/spf13/pflag v1.0.5
go: downloading github.com/sirupsen/logrus v1.9.0
go: finding module for package github.com/stretchr/testify/assert
go: finding module for package github.com/stretchr/testify/require
go: finding module for package github.com/stretchr/testify/suite
go: finding module for package google.golang.org/grpc/health
go: finding module for package 
google.golang.org/protobuf/reflect/protoreflect
go: downloading github.com/prometheus/client_golang v1.14.0
go: downloading github.com/stretchr/testify v1.8.1
go: finding module for package google.golang.org/protobuf/runtime/protoimpl
go: finding module for package 
google.golang.org/protobuf/types/known/emptypb
go: downloading google.golang.org/protobuf v1.28.1
go: found github.com/golang/protobuf/protoc-gen-go in 
github.com/golang/protobuf v1.5.2
go: found golang.org/x/net/context in golang.org/x/net v0.4.0
go: found google.golang.org/grpc in google.golang.org/grpc v1.51.0
go: found google.golang.org/grpc/codes in google.golang.org/grpc v1.51.0
go: found google.golang.org/grpc/grpclog in google.golang.org/grpc v1.51.0
go: found google.golang.org/grpc/metadata in google.golang.org/grpc v1.51.0
go: found github.com/cenkalti/backoff/v4 in 
github.com/cenkalti/backoff/v4 v4.2.0
go: found github.com/desertbit/timer in github.com/desertbit/timer 
v0.0.0-20180107155436-c41aec40b27f
go: found github.com/rs/cors in github.com/rs/cors v1.8.3
go: found golang.org/x/net/http2 in golang.org/x/net v0.4.0
go: found google.golang.org/grpc/health/grpc_health_v1 in 
google.golang.org/grpc v1.51.0
go: found google.golang.org/grpc/status in google.golang.org/grpc v1.51.0
go: found nhooyr.io/websocket in nhooyr.io/websocket v1.8.7
go: found github.com/grpc-ecosystem/go-grpc-middleware in 
github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
go: found github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus in 
github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
go: found github.com/grpc-ecosystem/go-grpc-prometheus in 
github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0
go: found github.com/mwitkow/go-conntrack in 
github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f
go: found github.com/mwitkow/go-conntrack/connhelpers in 
github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f
go: found github.com/mwitkow/grpc-proxy/proxy in 
github.com/mwitkow/grpc-proxy v0.0.0-20220126150247-db34e7bfee32
go: found github.com/prometheus/client_golang/prometheus/promhttp in 
github.com/prometheus/client_golang v1.14.0
go: found github.com/sirupsen/logrus in github.com/sirupsen/logrus v1.9.0
go: found github.com/spf13/pflag in github.com/spf13/pflag v1.0.5
go: found golang.org/x/net/trace in golang.org/x/net v0.4.0
go: found google.golang.org/grpc/credentials in google.golang.org/grpc 
v1.51.0
go: found github.com/golang/protobuf/ptypes/empty in 
github.com/golang/protobuf v1.5.2
go: found github.com/golang/protobuf/proto in github.com/golang/protobuf 
v1.5.2
go: found github.com/stretchr/testify/assert in 
github.com/stretchr/testify v1.8.1
go: found github.com/stretchr/testify/require in 
github.com/stretchr/testify v1.8.1
go: found github.com/stretchr/testify/suite in 
github.com/stretchr/testify v1.8.1
go: found google.golang.org/grpc/health in google.golang.org/grpc v1.51.0
go: found google.golang.org/protobuf/reflect/protoreflect in 
google.golang.org/protobuf v1.28.1
go: found google.golang.org/protobuf/runtime/protoimpl in 
google.golang.org/protobuf v1.28.1
go: found google.golang.org/protobuf/types/known/emptypb in 
google.golang.org/protobuf v1.28.1
go: downloading google.golang.org/genproto 
v0.0.0-20210401141331-865547bb08e2
go: downloading github.com/google/go-cmp v0.5.6
go: downloading github.com/klauspost/compress v1.10.3
go: downloading github.com/gin-gonic/gin v1.6.3
go: downloading github.com/gobwas/ws v1.0.2
go: downloading github.com/gorilla/websocket v1.4.1
go: downloading github.com/davecgh/go-spew v1.1.1
go: downloading github.com/pmezard/go-difflib v1.0.0
go: downloading gopkg.in/yaml.v3 v3.0.1
go: downloading github.com/jpillora/backoff v1.0.0
go: downloading github.com/prometheus/client_model v0.3.0
go: downloading github.com/prometheus/common v0.37.0
go: downloading golang.org/x/sys v0.3.0
go: downloading github.com/gin-contrib/sse v0.1.0
go: downloading github.com/mattn/go-isatty v0.0.12
go: downloading github.com/gobwas/httphead 
v0.0.0-20180130184737-2c6c146eadee
go: downloading github.com/gobwas/pool v0.2.0
go: downloading golang.org/x/text v0.5.0
go: downloading gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405
go: downloading github.com/beorn7/perks v1.0.1
go: downloading github.com/cespare/xxhash/v2 v2.1.2
go: downloading github.com/prometheus/procfs v0.8.0
go: downloading golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
go: downloading github.com/matttproud/golang_protobuf_extensions v1.0.1
go: downloading golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
go: downloading github.com/go-playground/validator/v10 v10.2.0
go: downloading github.com/ugorji/go/codec v1.1.7
go: downloading gopkg.in/yaml.v2 v2.4.0
go: downloading github.com/json-iterator/go v1.1.12
go: downloading github.com/ugorji/go v1.1.7
go: downloading github.com/gogo/protobuf v1.3.2
go: downloading github.com/go-playground/universal-translator v0.17.0
go: downloading github.com/leodido/go-urn v1.2.0
go: downloading github.com/modern-go/concurrent 
v0.0.0-20180228061459-e0a39a4cb421
go: downloading github.com/modern-go/reflect2 v1.0.2
go: downloading github.com/go-playground/locales v0.13.0
go: downloading github.com/google/go-cmp v0.5.8
go: downloading golang.org/x/sync v0.0.0-20220601150217-0de741cfad7f
go: downloading gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15
go: downloading github.com/modern-go/concurrent 
v0.0.0-20180306012644-bacd9c7ef1dd
go: downloading github.com/kr/pretty v0.1.0
go: downloading github.com/kr/text v0.1.0
go: downloading golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4
github.com/improbable-eng/grpc-web/go/grpcwebproxy imports
         github.com/mwitkow/grpc-proxy/proxy tested by
         github.com/mwitkow/grpc-proxy/proxy.test imports
         github.com/mwitkow/grpc-proxy/testservice imports
         golang.org/x/sync/errgroup loaded from 
golang.org/x/sync@v0.0.0-20220601150217-0de741cfad7f,
         but go 1.16 would select v0.0.0-20220722155255-886fb9371eb4

To upgrade to the versions selected by go 1.16:
         go mod tidy -go=1.16 && go mod tidy -go=1.17
If reproducibility with go 1.16 is not needed:
         go mod tidy -compat=1.17
For other options, see:
https://golang.org/doc/modules/pruning


Kirkstone uses go1.17, but for some reason it's not detected properly.
Perhaps I'm doing something wrong?

Thanks,
Slava
--------------RIblVbSsB6QpQvPfsHtBgTWa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 26.12.2022 10:59, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com"><br>
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Please try recipetool changes on your go-mod recipes and
            provide feedback.</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Coincidentally, I also needed grpc-web recipe, which original
    patchset was tested on.<br>
    I applied the series on my kirkstone branch of poky and tried to run
    the command:<br>
    <br>
    % recipetool create -S c1971f71a28950d212b7ddc8df07b5563723031d -B
    master <a class="moz-txt-link-freetext" href="https://github.com/improbable-eng/grpc-web.git">https://github.com/improbable-eng/grpc-web.git</a><br>
    <br>
    Unfortunately this failed with the following log:<br>
    <br>
    WARNING: go.mod files generated by Go &lt; 1.17 might have
    incomplete indirect dependencies.<br>
    Traceback (most recent call last):<br>
      File "/home/uvv/projects/poky/scripts/recipetool", line 111, in
    &lt;module&gt;<br>
        ret = main()<br>
      File "/home/uvv/projects/poky/scripts/recipetool", line 100, in
    main<br>
        ret = args.func(args)<br>
      File "/home/uvv/projects/poky/scripts/lib/recipetool/create.py",
    line 746, in create_recipe<br>
        handler.process(srctree_use, classes, lines_before, lines_after,
    handled, extravalues)<br>
      File
    "/home/uvv/projects/poky/scripts/lib/recipetool/create_go.py", line
    332, in process<br>
        go_mod = self._go_mod_patch(patchfile, go_import, srctree,
    localfilesdir, extravalues, d)<br>
      File
    "/home/uvv/projects/poky/scripts/lib/recipetool/create_go.py", line
    291, in _go_mod_patch<br>
        bb.process.run("go mod tidy", stderr=subprocess.STDOUT,
    env=runenv, shell=True, cwd=srctree)<br>
      File "/home/uvv/projects/poky/bitbake/lib/bb/process.py", line
    189, in run<br>
        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)<br>
    bb.process.ExecutionError: Execution of 'go mod tidy' failed with
    exit code 1:<br>
    go: finding module for package google.golang.org/grpc/metadata<br>
    go: finding module for package google.golang.org/grpc<br>
    go: finding module for package
    github.com/golang/protobuf/protoc-gen-go<br>
    go: finding module for package golang.org/x/net/context<br>
    go: finding module for package google.golang.org/grpc/codes<br>
    go: finding module for package google.golang.org/grpc/grpclog<br>
    go: downloading golang.org/x/net v0.4.0<br>
    go: downloading google.golang.org/grpc v1.51.0<br>
    go: downloading github.com/golang/protobuf v1.5.2<br>
    go: finding module for package github.com/cenkalti/backoff/v4<br>
    go: downloading github.com/cenkalti/backoff/v4 v4.2.0<br>
    go: finding module for package github.com/desertbit/timer<br>
    go: downloading github.com/cenkalti/backoff v2.2.1+incompatible<br>
    go: finding module for package github.com/rs/cors<br>
    go: finding module for package golang.org/x/net/http2<br>
    go: finding module for package
    google.golang.org/grpc/health/grpc_health_v1<br>
    go: finding module for package google.golang.org/grpc/status<br>
    go: finding module for package nhooyr.io/websocket<br>
    go: downloading github.com/desertbit/timer
    v0.0.0-20180107155436-c41aec40b27f<br>
    go: finding module for package
    github.com/grpc-ecosystem/go-grpc-middleware<br>
    go: finding module for package
    github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus<br>
    go: downloading github.com/rs/cors v1.8.3<br>
    go: finding module for package
    github.com/grpc-ecosystem/go-grpc-prometheus<br>
    go: finding module for package github.com/mwitkow/go-conntrack<br>
    go: downloading nhooyr.io/websocket v1.8.7<br>
    go: finding module for package
    github.com/mwitkow/go-conntrack/connhelpers<br>
    go: downloading github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0<br>
    go: downloading github.com/grpc-ecosystem/go-grpc-middleware v1.3.0<br>
    go: finding module for package github.com/mwitkow/grpc-proxy/proxy<br>
    go: finding module for package
    github.com/prometheus/client_golang/prometheus/promhttp<br>
    go: downloading github.com/mwitkow/go-conntrack
    v0.0.0-20190716064945-2f068394615f<br>
    go: finding module for package github.com/sirupsen/logrus<br>
    go: finding module for package github.com/spf13/pflag<br>
    go: finding module for package golang.org/x/net/trace<br>
    go: finding module for package google.golang.org/grpc/credentials<br>
    go: finding module for package
    github.com/golang/protobuf/ptypes/empty<br>
    go: downloading github.com/mwitkow/grpc-proxy
    v0.0.0-20220126150247-db34e7bfee32<br>
    go: finding module for package github.com/golang/protobuf/proto<br>
    go: downloading github.com/spf13/pflag v1.0.5<br>
    go: downloading github.com/sirupsen/logrus v1.9.0<br>
    go: finding module for package github.com/stretchr/testify/assert<br>
    go: finding module for package github.com/stretchr/testify/require<br>
    go: finding module for package github.com/stretchr/testify/suite<br>
    go: finding module for package google.golang.org/grpc/health<br>
    go: finding module for package
    google.golang.org/protobuf/reflect/protoreflect<br>
    go: downloading github.com/prometheus/client_golang v1.14.0<br>
    go: downloading github.com/stretchr/testify v1.8.1<br>
    go: finding module for package
    google.golang.org/protobuf/runtime/protoimpl<br>
    go: finding module for package
    google.golang.org/protobuf/types/known/emptypb<br>
    go: downloading google.golang.org/protobuf v1.28.1<br>
    go: found github.com/golang/protobuf/protoc-gen-go in
    github.com/golang/protobuf v1.5.2<br>
    go: found golang.org/x/net/context in golang.org/x/net v0.4.0<br>
    go: found google.golang.org/grpc in google.golang.org/grpc v1.51.0<br>
    go: found google.golang.org/grpc/codes in google.golang.org/grpc
    v1.51.0<br>
    go: found google.golang.org/grpc/grpclog in google.golang.org/grpc
    v1.51.0<br>
    go: found google.golang.org/grpc/metadata in google.golang.org/grpc
    v1.51.0<br>
    go: found github.com/cenkalti/backoff/v4 in
    github.com/cenkalti/backoff/v4 v4.2.0<br>
    go: found github.com/desertbit/timer in github.com/desertbit/timer
    v0.0.0-20180107155436-c41aec40b27f<br>
    go: found github.com/rs/cors in github.com/rs/cors v1.8.3<br>
    go: found golang.org/x/net/http2 in golang.org/x/net v0.4.0<br>
    go: found google.golang.org/grpc/health/grpc_health_v1 in
    google.golang.org/grpc v1.51.0<br>
    go: found google.golang.org/grpc/status in google.golang.org/grpc
    v1.51.0<br>
    go: found nhooyr.io/websocket in nhooyr.io/websocket v1.8.7<br>
    go: found github.com/grpc-ecosystem/go-grpc-middleware in
    github.com/grpc-ecosystem/go-grpc-middleware v1.3.0<br>
    go: found
    github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus in
    github.com/grpc-ecosystem/go-grpc-middleware v1.3.0<br>
    go: found github.com/grpc-ecosystem/go-grpc-prometheus in
    github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0<br>
    go: found github.com/mwitkow/go-conntrack in
    github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f<br>
    go: found github.com/mwitkow/go-conntrack/connhelpers in
    github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f<br>
    go: found github.com/mwitkow/grpc-proxy/proxy in
    github.com/mwitkow/grpc-proxy v0.0.0-20220126150247-db34e7bfee32<br>
    go: found github.com/prometheus/client_golang/prometheus/promhttp in
    github.com/prometheus/client_golang v1.14.0<br>
    go: found github.com/sirupsen/logrus in github.com/sirupsen/logrus
    v1.9.0<br>
    go: found github.com/spf13/pflag in github.com/spf13/pflag v1.0.5<br>
    go: found golang.org/x/net/trace in golang.org/x/net v0.4.0<br>
    go: found google.golang.org/grpc/credentials in
    google.golang.org/grpc v1.51.0<br>
    go: found github.com/golang/protobuf/ptypes/empty in
    github.com/golang/protobuf v1.5.2<br>
    go: found github.com/golang/protobuf/proto in
    github.com/golang/protobuf v1.5.2<br>
    go: found github.com/stretchr/testify/assert in
    github.com/stretchr/testify v1.8.1<br>
    go: found github.com/stretchr/testify/require in
    github.com/stretchr/testify v1.8.1<br>
    go: found github.com/stretchr/testify/suite in
    github.com/stretchr/testify v1.8.1<br>
    go: found google.golang.org/grpc/health in google.golang.org/grpc
    v1.51.0<br>
    go: found google.golang.org/protobuf/reflect/protoreflect in
    google.golang.org/protobuf v1.28.1<br>
    go: found google.golang.org/protobuf/runtime/protoimpl in
    google.golang.org/protobuf v1.28.1<br>
    go: found google.golang.org/protobuf/types/known/emptypb in
    google.golang.org/protobuf v1.28.1<br>
    go: downloading google.golang.org/genproto
    v0.0.0-20210401141331-865547bb08e2<br>
    go: downloading github.com/google/go-cmp v0.5.6<br>
    go: downloading github.com/klauspost/compress v1.10.3<br>
    go: downloading github.com/gin-gonic/gin v1.6.3<br>
    go: downloading github.com/gobwas/ws v1.0.2<br>
    go: downloading github.com/gorilla/websocket v1.4.1<br>
    go: downloading github.com/davecgh/go-spew v1.1.1<br>
    go: downloading github.com/pmezard/go-difflib v1.0.0<br>
    go: downloading gopkg.in/yaml.v3 v3.0.1<br>
    go: downloading github.com/jpillora/backoff v1.0.0<br>
    go: downloading github.com/prometheus/client_model v0.3.0<br>
    go: downloading github.com/prometheus/common v0.37.0<br>
    go: downloading golang.org/x/sys v0.3.0<br>
    go: downloading github.com/gin-contrib/sse v0.1.0<br>
    go: downloading github.com/mattn/go-isatty v0.0.12<br>
    go: downloading github.com/gobwas/httphead
    v0.0.0-20180130184737-2c6c146eadee<br>
    go: downloading github.com/gobwas/pool v0.2.0<br>
    go: downloading golang.org/x/text v0.5.0<br>
    go: downloading gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405<br>
    go: downloading github.com/beorn7/perks v1.0.1<br>
    go: downloading github.com/cespare/xxhash/v2 v2.1.2<br>
    go: downloading github.com/prometheus/procfs v0.8.0<br>
    go: downloading golang.org/x/sync v0.0.0-20210220032951-036812b2e83c<br>
    go: downloading github.com/matttproud/golang_protobuf_extensions
    v1.0.1<br>
    go: downloading golang.org/x/xerrors
    v0.0.0-20200804184101-5ec99f83aff1<br>
    go: downloading github.com/go-playground/validator/v10 v10.2.0<br>
    go: downloading github.com/ugorji/go/codec v1.1.7<br>
    go: downloading gopkg.in/yaml.v2 v2.4.0<br>
    go: downloading github.com/json-iterator/go v1.1.12<br>
    go: downloading github.com/ugorji/go v1.1.7<br>
    go: downloading github.com/gogo/protobuf v1.3.2<br>
    go: downloading github.com/go-playground/universal-translator
    v0.17.0<br>
    go: downloading github.com/leodido/go-urn v1.2.0<br>
    go: downloading github.com/modern-go/concurrent
    v0.0.0-20180228061459-e0a39a4cb421<br>
    go: downloading github.com/modern-go/reflect2 v1.0.2<br>
    go: downloading github.com/go-playground/locales v0.13.0<br>
    go: downloading github.com/google/go-cmp v0.5.8<br>
    go: downloading golang.org/x/sync v0.0.0-20220601150217-0de741cfad7f<br>
    go: downloading gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15<br>
    go: downloading github.com/modern-go/concurrent
    v0.0.0-20180306012644-bacd9c7ef1dd<br>
    go: downloading github.com/kr/pretty v0.1.0<br>
    go: downloading github.com/kr/text v0.1.0<br>
    go: downloading golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4<br>
    github.com/improbable-eng/grpc-web/go/grpcwebproxy imports<br>
            github.com/mwitkow/grpc-proxy/proxy tested by<br>
            github.com/mwitkow/grpc-proxy/proxy.test imports<br>
            github.com/mwitkow/grpc-proxy/testservice imports<br>
            golang.org/x/sync/errgroup loaded from
    <a class="moz-txt-link-abbreviated" href="mailto:golang.org/x/sync@v0.0.0-20220601150217-0de741cfad7f">golang.org/x/sync@v0.0.0-20220601150217-0de741cfad7f</a>,<br>
            but go 1.16 would select v0.0.0-20220722155255-886fb9371eb4<br>
    <br>
    To upgrade to the versions selected by go 1.16:<br>
            go mod tidy -go=1.16 &amp;&amp; go mod tidy -go=1.17<br>
    If reproducibility with go 1.16 is not needed:<br>
            go mod tidy -compat=1.17<br>
    For other options, see:<br>
            <a class="moz-txt-link-freetext" href="https://golang.org/doc/modules/pruning">https://golang.org/doc/modules/pruning</a><br>
    <br>
    <br>
    Kirkstone uses go1.17, but for some reason it's not detected
    properly.<br>
    Perhaps I'm doing something wrong?<br>
    <br>
    Thanks,<br>
    Slava<br>
  </body>
</html>

--------------RIblVbSsB6QpQvPfsHtBgTWa--

