Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.12223.1593189861451746740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 09:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DnUNgkvy;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id e18so5182887pgn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=r86t3khQmziJLFFc5WQsmsyr97Xzj/oqGBXW2tkA+T0=;
        b=DnUNgkvyBdkpHu92AuDBIo2A9dM32doMDgV0wAaMD0Ot8cB4vFjyNYvurr0tsI1/KQ
         sp+pWfyhMbZk4sGt0mjzlRjbPA4ic2RZelgtQRUm+yOex4XwtGT+E4+qpzdmzfrUsWW+
         kqTujnwJJ8t7K0e+PN1p4TJ4jnUHLT/GdZPHBgqLLbV6O8UWpkrNqWsOuZ8hT9e3W1cx
         ykcfwBXDGd3riCnhzbfK8H3cGOSFHD41XyXo5+L+TDp5AqopxgJyEfV2kjeIhTZPwtpt
         rGUVa5NEJzJsedtYUZewStIYiWIp/aeyTvJXZvct2squzbtU5xB+09IAZlBH8/7obpwZ
         aUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=r86t3khQmziJLFFc5WQsmsyr97Xzj/oqGBXW2tkA+T0=;
        b=UwCGg9rzgOH4Gn4PilDRam0wQzuZbNc9vWVzzUHP/7D2CYwodBGOMFfP8CzKpuHl1A
         KRRQalusIv1d4qM7+2SG6plEWP7BE19RZV8LcR3eGsN5WmOYEhLnlJq4gB1UqsOuyKbu
         ymoz09AU5JtI//0zuCF5iTjstx03kIk+AoshyoyEv9+e+Q7OnNwHzHgm3G0Mi0CWu6a6
         3ngG7fVu0NQocF3hlKCOGTmtsBz2ATdSDIPl2piy6sLyhokmZ/xSFRybxJMZbQRVJU7Z
         uBaRAkzNgNcuj0vvSiR5APfw27vIV2EVTCWI6oEknmsZe4I6eeO7JYxYvP9xFHN7P9wW
         yCdQ==
X-Gm-Message-State: AOAM533pRDITWmLfhfZhRpKnCoDtfMaDabPFe76qZgNQHcH9Pq0VxNkf
	uV2Yvx21/DPEzu3dN4duuVohC+rd
X-Google-Smtp-Source: ABdhPJwYDgSRccWb304pInqtAGir40oMwqhx5QGS560q57BOC3io2GiaVxjciPQ0snDOcyppgmckLg==
X-Received: by 2002:a63:e017:: with SMTP id e23mr3496454pgh.125.1593189860759;
        Fri, 26 Jun 2020 09:44:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5dd6:9daa:53f4:d130? ([2601:202:4180:a5c0:5dd6:9daa:53f4:d130])
        by smtp.gmail.com with ESMTPSA id 83sm5356125pfu.60.2020.06.26.09.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:44:20 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/6] libuv: move from meta-oe to core for bind update
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200622141915.31932-1-akuster808@gmail.com>
 <20200622141915.31932-2-akuster808@gmail.com>
 <CA+chaQcyFpghZzAAASfwL+-u7mcZfuqNy_NYodyyxZdYEhmk5g@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <715d72cf-ae4d-3bb4-4348-516b5036c750@gmail.com>
Date: Fri, 26 Jun 2020 09:44:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcyFpghZzAAASfwL+-u7mcZfuqNy_NYodyyxZdYEhmk5g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------24DFE80F65317FDE037DDC83"
Content-Language: en-US

--------------24DFE80F65317FDE037DDC83
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 6/26/20 4:52 AM, Martin Jansa wrote:
> Looks like 1.34.2 was imported from meta-oe, but there was 1.38.0
> version (as removed
> in https://git.openembedded.org/meta-openembedded/commit/?id=4413f4cb70a5a4cf11c2f9c1881c4506860c588c)
> causing downgrade as shown by QA checks like:
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package
> libuv-src went backwards which would break package feeds (from
> 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package
> libuv-dbg went backwards which would break package feeds (from
> 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package
> libuv-staticdev went backwards which would break package feeds (from
> 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package
> libuv-dev went backwards which would break package feeds (from
> 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package
> libuv-doc went backwards which would break package feeds (from
> 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package
> libuv-locale went backwards which would break package feeds (from
> 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]
> log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0
> do_packagedata_setscene: QA Issue: Package version for package libuv
> went backwards which would break package feeds (from 0:1.38.0-r0 to
> 0:1.34.2-r0) [version-going-backwards]
>
> these 3 meta-oe commits are now missing in oe-core:
> https://git.openembedded.org/meta-openembedded/commit/?id=e03b48481438c747322f07ac1e1f04add541ffac
> https://git.openembedded.org/meta-openembedded/commit/?id=9b61f412d36b390f8d71ad1fb5875f5f6e32fd8a
> https://git.openembedded.org/meta-openembedded/commit/?id=644ea1ee145902b00e4e66856ebe8d8800dfc1f0
>

Oh, that is not good. I will be sending an upgrade patch soon.

-armin
> On Mon, Jun 22, 2020 at 4:19 PM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Armin Kuster <akuster@mvista.com <mailto:akuster@mvista.com>>
>
>     Signed-off-by: Armin Kuster <akuster@mvista.com
>     <mailto:akuster@mvista.com>>
>     ---
>      meta/conf/distro/include/maintainers.inc      |  1 +
>      .../libuv/libuv_1.34.2.bb <http://libuv_1.34.2.bb>               
>          | 19 +++++++++++++++++++
>      2 files changed, 20 insertions(+)
>      create mode 100644
>     meta/recipes-connectivity/libuv/libuv_1.34.2.bb
>     <http://libuv_1.34.2.bb>
>
>     diff --git a/meta/conf/distro/include/maintainers.inc
>     b/meta/conf/distro/include/maintainers.inc
>     index 6496a48e40..fc1b5272da 100644
>     --- a/meta/conf/distro/include/maintainers.inc
>     +++ b/meta/conf/distro/include/maintainers.inc
>     @@ -393,6 +393,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander
>     Kanavin <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>      RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>"
>      RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal
>     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>"
>      RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de
>     <mailto:sbabic@denx.de>>"
>     +RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com
>     <mailto:akuster@mvista.com>>"
>      RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>"
>      RECIPE_MAINTAINER_pn-libva-initial = "Anuj Mittal
>     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>"
>      RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal
>     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>"
>     diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
>     <http://libuv_1.34.2.bb>
>     b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
>     <http://libuv_1.34.2.bb>
>     new file mode 100644
>     index 0000000000..234cec37bb
>     --- /dev/null
>     +++ b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
>     <http://libuv_1.34.2.bb>
>     @@ -0,0 +1,19 @@
>     +SUMMARY = "A multi-platform support library with a focus on
>     asynchronous I/O"
>     +HOMEPAGE = "https://github.com/libuv/libuv"
>     +BUGTRACKER = "https://github.com/libuv/libuv/issues"
>     +LICENSE = "MIT"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
>     +
>     +SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
>     +SRC_URI = "git://github.com/libuv/libuv;branch=v1.x
>     <http://github.com/libuv/libuv;branch=v1.x>"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit autotools
>     +
>     +do_configure() {
>     +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
>     +    oe_runconf
>     +}
>     +
>     +BBCLASSEXTEND = "native"
>     -- 
>     2.17.1
>
>     
>


--------------24DFE80F65317FDE037DDC83
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/26/20 4:52 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQcyFpghZzAAASfwL+-u7mcZfuqNy_NYodyyxZdYEhmk5g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Looks like 1.34.2 was imported from meta-oe, but
        there was 1.38.0 version (as removed in <a
href="https://git.openembedded.org/meta-openembedded/commit/?id=4413f4cb70a5a4cf11c2f9c1881c4506860c588c"
          moz-do-not-send="true">https://git.openembedded.org/meta-openembedded/commit/?id=4413f4cb70a5a4cf11c2f9c1881c4506860c588c</a>)
        causing downgrade as shown by QA checks like:
        <div><span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv-src went backwards which would
            break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">
          <span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv-dbg went backwards which would
            break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">
          <span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv-staticdev went backwards which
            would break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">
          <span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv-dev went backwards which would
            break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">
          <span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv-doc went backwards which would
            break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">
          <span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv-locale went backwards which would
            break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">
          <span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:
            libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package
            version for package libuv went backwards which would break
            package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
            [version-going-backwards]</span><br>
        </div>
        <div><span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px"><br>
          </span></div>
        <div><span style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">these
            3 meta-oe commits are now missing in oe-core:</span></div>
        <div><a
href="https://git.openembedded.org/meta-openembedded/commit/?id=e03b48481438c747322f07ac1e1f04add541ffac"
            moz-do-not-send="true">https://git.openembedded.org/meta-openembedded/commit/?id=e03b48481438c747322f07ac1e1f04add541ffac</a><span
            style="color:rgb(33,33,33);font-family:&quot;Segoe
            UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI
            WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px"><br>
          </span></div>
        <div><a
href="https://git.openembedded.org/meta-openembedded/commit/?id=9b61f412d36b390f8d71ad1fb5875f5f6e32fd8a"
            moz-do-not-send="true">https://git.openembedded.org/meta-openembedded/commit/?id=9b61f412d36b390f8d71ad1fb5875f5f6e32fd8a</a><br>
        </div>
        <div><a
href="https://git.openembedded.org/meta-openembedded/commit/?id=644ea1ee145902b00e4e66856ebe8d8800dfc1f0"
            moz-do-not-send="true">https://git.openembedded.org/meta-openembedded/commit/?id=644ea1ee145902b00e4e66856ebe8d8800dfc1f0</a><br>
        </div>
      </div>
      <br>
    </blockquote>
    <br>
    Oh, that is not good. I will be sending an upgrade patch soon.<br>
    <br>
    -armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQcyFpghZzAAASfwL+-u7mcZfuqNy_NYodyyxZdYEhmk5g@mail.gmail.com">
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, Jun 22, 2020 at 4:19
          PM akuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Armin Kuster &lt;<a href="mailto:akuster@mvista.com"
            target="_blank" moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
          <br>
          Signed-off-by: Armin Kuster &lt;<a
            href="mailto:akuster@mvista.com" target="_blank"
            moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
          ---<br>
           meta/conf/distro/include/maintainers.inc      |  1 +<br>
           .../libuv/<a href="http://libuv_1.34.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">libuv_1.34.2.bb</a> 
                             | 19 +++++++++++++++++++<br>
           2 files changed, 20 insertions(+)<br>
           create mode 100644 meta/recipes-connectivity/libuv/<a
            href="http://libuv_1.34.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">libuv_1.34.2.bb</a><br>
          <br>
          diff --git a/meta/conf/distro/include/maintainers.inc
          b/meta/conf/distro/include/maintainers.inc<br>
          index 6496a48e40..fc1b5272da 100644<br>
          --- a/meta/conf/distro/include/maintainers.inc<br>
          +++ b/meta/conf/distro/include/maintainers.inc<br>
          @@ -393,6 +393,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander
          Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com"
            target="_blank" moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;"<br>
           RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling &lt;<a
            href="mailto:timothy.t.orling@linux.intel.com"
            target="_blank" moz-do-not-send="true">timothy.t.orling@linux.intel.com</a>&gt;"<br>
           RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal &lt;<a
            href="mailto:anuj.mittal@intel.com" target="_blank"
            moz-do-not-send="true">anuj.mittal@intel.com</a>&gt;"<br>
           RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic &lt;<a
            href="mailto:sbabic@denx.de" target="_blank"
            moz-do-not-send="true">sbabic@denx.de</a>&gt;"<br>
          +RECIPE_MAINTAINER_pn-libuv = "Armin Kuster &lt;<a
            href="mailto:akuster@mvista.com" target="_blank"
            moz-do-not-send="true">akuster@mvista.com</a>&gt;"<br>
           RECIPE_MAINTAINER_pn-libva = "Anuj Mittal &lt;<a
            href="mailto:anuj.mittal@intel.com" target="_blank"
            moz-do-not-send="true">anuj.mittal@intel.com</a>&gt;"<br>
           RECIPE_MAINTAINER_pn-libva-initial = "Anuj Mittal &lt;<a
            href="mailto:anuj.mittal@intel.com" target="_blank"
            moz-do-not-send="true">anuj.mittal@intel.com</a>&gt;"<br>
           RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal &lt;<a
            href="mailto:anuj.mittal@intel.com" target="_blank"
            moz-do-not-send="true">anuj.mittal@intel.com</a>&gt;"<br>
          diff --git a/meta/recipes-connectivity/libuv/<a
            href="http://libuv_1.34.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">libuv_1.34.2.bb</a>
          b/meta/recipes-connectivity/libuv/<a
            href="http://libuv_1.34.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">libuv_1.34.2.bb</a><br>
          new file mode 100644<br>
          index 0000000000..234cec37bb<br>
          --- /dev/null<br>
          +++ b/meta/recipes-connectivity/libuv/<a
            href="http://libuv_1.34.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">libuv_1.34.2.bb</a><br>
          @@ -0,0 +1,19 @@<br>
          +SUMMARY = "A multi-platform support library with a focus on
          asynchronous I/O"<br>
          +HOMEPAGE = "<a href="https://github.com/libuv/libuv"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/libuv/libuv</a>"<br>
          +BUGTRACKER = "<a href="https://github.com/libuv/libuv/issues"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/libuv/libuv/issues</a>"<br>
          +LICENSE = "MIT"<br>
          +LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a68902a430e32200263d182d44924d47">"file://LICENSE;md5=a68902a430e32200263d182d44924d47"</a><br>
          +<br>
          +SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"<br>
          +SRC_URI = "git://<a
            href="http://github.com/libuv/libuv;branch=v1.x"
            rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/libuv/libuv;branch=v1.x</a>"<br>
          +<br>
          +S = "${WORKDIR}/git"<br>
          +<br>
          +inherit autotools<br>
          +<br>
          +do_configure() {<br>
          +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"<br>
          +    oe_runconf<br>
          +}<br>
          +<br>
          +BBCLASSEXTEND = "native"<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------24DFE80F65317FDE037DDC83--
