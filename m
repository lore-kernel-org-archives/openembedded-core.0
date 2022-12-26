Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DF7C4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 09:39:09 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.133791.1672047539698001390
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 01:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RHjYiNDj;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id o6so15378005lfi.5
        for <Openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 01:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzfSz0TcGr2BqjzHOSY6Uuf+vrI1wAyJV+gmMEshQCA=;
        b=RHjYiNDjGnyqrdmZBr1IPBaVMzf5bZJH3OKWx46iLekouplV9PI2MFNg+498MZLpWP
         RRQqhiPMJVgj0ryd7qqFiLZQh5iA3znH6ErZG7Ja6hR+yV5Nee+sxzq0aLj0b3gYmNqA
         6sN9L8ZCyeeze+3OSrcgj5EV/fd56CXDndG/zU+2AvWyYtMY0GLNLG0HwroQUERmBcuv
         a12wJbnFlAixs3xVYNiY9lDKwzDqe0v0wDayqq29sjiTEjHRW5qbdYrNu+UGOiriM5zi
         mO7jGDSVvNx6Jxj/gHJ9krnIiQo89Uq35PXQqXCRuVrsF/usDYmT6eROT4wujiJN4WGQ
         MZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzfSz0TcGr2BqjzHOSY6Uuf+vrI1wAyJV+gmMEshQCA=;
        b=G3PLS2hsehcywWY2cpm5yQKu48uYMUvj2iTV0JCKxWN6oQUWdUKT9EHu8FFlBNDoOi
         Am1yAH9k23QiFkW9xLmPBmbC6FB9qF1gmONWCb1z5GUJtifim7j2i2dLztgCqDPokC7+
         se/2MRx0TBlEGJi2MtzPBKtJY+YCxgKVDLGsrPe5H+MaZF+v69X6v1PYRLOuHhu0pUKc
         xAk2X6wPB/hJ7lDPwfLulypwJjFC1G37Xks7QbOwEUYAM84DLozX7BYRrmeKtXf80HOV
         dAHPfLrlOCCQOuwqgIFVZnPuOo5EHnoWCTnUfeJZJWu+dza1btFxfF4wmUK0daP2gnNL
         KeuQ==
X-Gm-Message-State: AFqh2krwOFOqCHFhLocz9NA5rSujziO2fwqe2a3pgxX94kB7BpZpvzKz
	6yKcsS4mcV1Uv1EgCdskdJ0=
X-Google-Smtp-Source: AMrXdXsmqCmvtApnytIQ7xnaTD65R2QFy6Ga/lyxhAx9MZU3ARwP9OwPN4TAkPaP7cp9bh7fKFTPPQ==
X-Received: by 2002:a19:5218:0:b0:4bc:4ad0:4148 with SMTP id m24-20020a195218000000b004bc4ad04148mr4496325lfb.8.1672047537814;
        Mon, 26 Dec 2022 01:38:57 -0800 (PST)
Received: from [10.133.222.121] ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a45edc1de2sm1716031lfs.239.2022.12.26.01.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 01:38:57 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------bfJ9YPS8Vz4LcqFxuFdTg0jy"
Message-ID: <3d6e9c54-6d00-9400-d8ef-25109e95b775@gmail.com>
Date: Mon, 26 Dec 2022 10:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>, lukas.funke@weidmueller.com,
 stefan.herbrechtsmeier@weidmueller.com, wonsang.ryu@lge.co,
 =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20221222150246.91423-1-uvv.mail@gmail.com>
 <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
 <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 09:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175016

This is a multi-part message in MIME format.
--------------bfJ9YPS8Vz4LcqFxuFdTg0jy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Martin, I did see that patch series, but I was not sure about its state, 
therefore I didn't try it. If I understood correctly, that partially 
solves the issue, but the proper solution should involve the fetcher, 
that's why it's not yet merged to master. Am I missing something?

Regards,
Slava

On 22.12.2022 20:08, Martin Jansa wrote:
>
> Have you tried the changes submitted by Lukas/Stefan in:
> https://lists.openembedded.org/g/openembedded-architecture/message/1539
> ?
>
> It's not perfect, I was testing it on 
> https://github.com/influxdata/telegraf/blob/master/go.mod and I've 
> found some corner cases where it failed.
>
> But it seems like very good start and we should work with Lukas/Stefan 
> to get it merged in master. Then all branches could consume recipes 
> created in master and only the exceptions would need to have network 
> access (instead of the bbclass enabling it for every go-mod user - 
> go-vendor inherits go-mod as well).
>
> Lukas/Stefan: is there something we can do to help with v2 of your 
> patches?
>
> I wanted to submit better review on submitted patches after more 
> debugging, but here it is:
>
> 1) to resolve 2 deps:
> {'Path': 'gonum.org/v1/gonum <http://gonum.org/v1/gonum>', 'Version': 
> 'v0.12.0'} due to 404 "ERROR: Error while fetching redirect page: HTTP 
> Error 404: Not Found"
>
> {'Path': 'code.cloudfoundry.org/clock 
> <http://code.cloudfoundry.org/clock>', 'Version': 'v1.0.0', 
> 'Indirect': True} due to this being redirect to github.com 
> <http://github.com> and failing with "ERROR: Error while fetching 
> redirect page: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] 
> certificate verify failed: Hostname mismatch, certificate is not valid 
> for 'code.cloudfoundry.org <http://code.cloudfoundry.org>'. (_ssl.c:996)>"
> parse
>
> 2) some issues with LICENSEs:
> INFO: Please add the following line for 
> 'docs/LICENSE_OF_DEPENDENCIES.md' to a 'lib/recipetool/licenses.csv' 
> and replace `Unknown` with the license:
> c4807c5b058a56c02f592207b4e056b1,Unknown
> Traceback (most recent call last):
>   File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line 
> 111, in <module>
>     ret = main()
>           ^^^^^^
>   File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line 
> 100, in main
>     ret = args.func(args)
>           ^^^^^^^^^^^^^^^
>   File 
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py", line 
> 746, in create_recipe
>     handler.process(srctree_use, classes, lines_before, lines_after, 
> handled, extravalues)
>   File 
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py", 
> line 349, in process
>     self._rewrite_lic_uri(lines_before)
>   File 
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py", 
> line 380, in _rewrite_lic_uri
>     updated, newlines = bb.utils.edit_metadata(lines_before, 
> ['LIC_FILES_CHKSUM'], varfunc)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1382, in 
> edit_metadata
>     if handle_var_end():
>        ^^^^^^^^^^^^^^^^
>   File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1280, in 
> handle_var_end
>     (newvalue, newop, indent, minbreak) = varfunc(in_var, full_value, 
> op, newlines)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File 
> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py", 
> line 372, in varfunc
>     uri, chksum = license.split(';', 1)
>     ^^^^^^^^^^^
> ValueError: not enough values to unpack (expected 2, got 1)
>
> (the license was just '/')
>
> 3) some SRCREVs set to None leading to parsing failure:
>
>   File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line 762, in 
> _latest_revision
>     raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git 
> repository in git ls-remote output for %s" % \
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV, 
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception 
> FetchError: Fetcher failure: Unable to resolve 'None' in upstream git 
> repository in git ls-remote output for 
> github.com/googleapis/google-cloud-go 
> <http://github.com/googleapis/google-cloud-go>
> The variable dependency chain for the failure is: SRCPV -> PV -> BP -> 
> FILESPATH
>
> ERROR: Parsing newly created recipe failed, moving recipe to 
> /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefailed 
> for reference. If this looks to be caused by the recipe itself, please 
> report this error.
>
> It takes long time to fetch all telegraf dependencies, so I'll create 
> some test recipe to more easily debug these 3 issues in isolation.
>

--------------bfJ9YPS8Vz4LcqFxuFdTg0jy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Martin, I did see that patch series,
      but I was not sure about its state, therefore I didn't try it. If
      I understood correctly, that partially solves the issue, but the
      proper solution should involve the fetcher, that's why it's not
      yet merged to master. Am I missing something?<br>
      <br>
      Regards,<br>
      Slava<br>
      <br>
      On 22.12.2022 20:08, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <br>
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Have you tried the changes submitted by Lukas/Stefan in:</div>
          <div><a
href="https://lists.openembedded.org/g/openembedded-architecture/message/1539"
              moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-architecture/message/1539</a></div>
          <div>?</div>
          <div><br>
          </div>
          <div>It's not perfect, I was testing it on <a
              href="https://github.com/influxdata/telegraf/blob/master/go.mod"
              moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/influxdata/telegraf/blob/master/go.mod</a>
            and I've found some corner cases where it failed.</div>
          <div><br>
          </div>
          <div>But it seems like very good start and we should work with
            Lukas/Stefan to get it merged in master. Then all branches
            could consume recipes created in master and only the
            exceptions would need to have network access (instead of the
            bbclass enabling it for every go-mod user - go-vendor
            inherits go-mod as well).</div>
          <div><br>
          </div>
          <div>Lukas/Stefan: is there something we can do to help with
            v2 of your patches?</div>
          <div><br>
          </div>
          <div>I wanted to submit better review on submitted patches
            after more debugging, but here it is:</div>
          <div><br>
          </div>
          <div>1) to resolve 2 deps:</div>
          <div>{'Path': '<a href="http://gonum.org/v1/gonum"
              moz-do-not-send="true">gonum.org/v1/gonum</a>', 'Version':
            'v0.12.0'} due to 404 "ERROR: Error while fetching redirect
            page: HTTP Error 404: Not Found"<br>
          </div>
          <div><br>
          </div>
          <div>{'Path': '<a href="http://code.cloudfoundry.org/clock"
              moz-do-not-send="true">code.cloudfoundry.org/clock</a>',
            'Version': 'v1.0.0', 'Indirect': True} due to this being
            redirect to <a href="http://github.com"
              moz-do-not-send="true">github.com</a> and failing with
            "ERROR: Error while fetching redirect page: &lt;urlopen
            error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify
            failed: Hostname mismatch, certificate is not valid for '<a
              href="http://code.cloudfoundry.org" moz-do-not-send="true">code.cloudfoundry.org</a>'.
            (_ssl.c:996)&gt;"<br>
          </div>
          <div>parse</div>
          <div><br>
          </div>
          <div>2) some issues with LICENSEs:</div>
          <div>INFO: Please add the following line for
            'docs/LICENSE_OF_DEPENDENCIES.md' to a
            'lib/recipetool/licenses.csv' and replace `Unknown` with the
            license:<br>
            c4807c5b058a56c02f592207b4e056b1,Unknown<br>
            Traceback (most recent call last):<br>
              File
            "/OE/build/oe-core/openembedded-core/scripts/recipetool",
            line 111, in &lt;module&gt;<br>
                ret = main()<br>
                      ^^^^^^<br>
              File
            "/OE/build/oe-core/openembedded-core/scripts/recipetool",
            line 100, in main<br>
                ret = args.func(args)<br>
                      ^^^^^^^^^^^^^^^<br>
              File
            "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py",
            line 746, in create_recipe<br>
                handler.process(srctree_use, classes, lines_before,
            lines_after, handled, extravalues)<br>
              File
            "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
            line 349, in process<br>
                self._rewrite_lic_uri(lines_before)<br>
              File
            "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
            line 380, in _rewrite_lic_uri<br>
                updated, newlines = bb.utils.edit_metadata(lines_before,
            ['LIC_FILES_CHKSUM'], varfunc)<br>
                                   
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
              File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line
            1382, in edit_metadata<br>
                if handle_var_end():<br>
                   ^^^^^^^^^^^^^^^^<br>
              File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line
            1280, in handle_var_end<br>
                (newvalue, newop, indent, minbreak) = varfunc(in_var,
            full_value, op, newlines)<br>
                                                     
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
              File
            "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
            line 372, in varfunc<br>
                uri, chksum = license.split(';', 1)<br>
                ^^^^^^^^^^^<br>
            ValueError: not enough values to unpack (expected 2, got 1)<br>
          </div>
          <div><br>
          </div>
          <div>(the license was just '/')</div>
          <div><br>
          </div>
          <div>3) some SRCREVs set to None leading to parsing failure:</div>
          <div><br>
          </div>
          <div>  File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line
            762, in _latest_revision<br>
                raise bb.fetch2.FetchError("Unable to resolve '%s' in
            upstream git repository in git ls-remote output for %s" % \<br>
            bb.data_smart.ExpansionError: Failure expanding variable
            SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which
            triggered exception FetchError: Fetcher failure: Unable to
            resolve 'None' in upstream git repository in git ls-remote
            output for <a
              href="http://github.com/googleapis/google-cloud-go"
              moz-do-not-send="true">github.com/googleapis/google-cloud-go</a><br>
            The variable dependency chain for the failure is: SRCPV
            -&gt; PV -&gt; BP -&gt; FILESPATH<br>
            <br>
            ERROR: Parsing newly created recipe failed, moving recipe to
/OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefailed
            for reference. If this looks to be caused by the recipe
            itself, please report this error.</div>
          <div><br>
          </div>
          <div>It takes long time to fetch all telegraf dependencies, so
            I'll create some test recipe to more easily debug these 3
            issues in isolation.</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------bfJ9YPS8Vz4LcqFxuFdTg0jy--

