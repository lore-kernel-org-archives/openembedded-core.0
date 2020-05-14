Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.1187.1589475809809573658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eBQDTzCv;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id f4so1461941iov.11
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=6i1U7tREjdDyGWq/UcsPnggMVc5gqAAtSgms5FvHTjc=;
        b=eBQDTzCvF3B/q2rUjXm+HbaPtSYnyp/qyMG07xHb+RhFaAp7O34jLnelavideuJIwP
         P9fdps+L+p84C3fSYtP9w165dAaYdDclG/BnYa9x/jkHAyswIYYa53MCK7iC6I6FmTJW
         HRLESN0TJz5h2FKuzjHJC8In2gEibxdQDs6Q7E4xixHG3BEEbfrkj/fX16DhfYlT8BpG
         VpcYQJ3Fidb9r33UCMzO1sGTTNdhQFmqxeL8FtB2xLjAsgCJ/BnEVUklVWUvuTMCMdjk
         PJaI7YFttt7I9yFlI93QEsosI7eXAG+O3bP0lD6VAhwaFBDtNohpP6haFcIrSNSlixKd
         Kb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=6i1U7tREjdDyGWq/UcsPnggMVc5gqAAtSgms5FvHTjc=;
        b=V8P2uHpJt+Cvp+7+8FH2X/3oEdISqnUVNplpgyqPAbAjYB61P4KkQbRAqDuB5dt+Rk
         MFyE91i/zpxJZVuD+6Vf3VI4RtXBgZ/3417VOAdMoaSA6Blgetd/W0Wy+IVwQkE97HDg
         dsQ4+t1wGcYRZiqMAar8a4tx2VGWd8yt/uO3BxGkgV79TSkG+UDM9gpgbDBiUFjEBoiD
         3e8nLzBWZ8G8fS1XkOfW2Av2T/0qyAg3azcAfROdZynEhIFLUuGFdxp0npzNhbaZmvhI
         LfrRme4ZZqCTF80lcXtO5zaeZ1d2Xa9VScwNML8/r+2X1mc2wCuATqBzJJHdsCmPErU0
         3txQ==
X-Gm-Message-State: AOAM53372hRe+A/Bm7mGZb5rPKLKG8hDdqrTPtNm7d8MoaH541VsEKlr
	TK14LdblDoHGSyeTRJLRths=
X-Google-Smtp-Source: ABdhPJyZDkfuJts7ufr+VpOWCixkgjqn/aiW/4os3BKyxLszEje98owY1mAFK1celjv3V9hoQug8Zw==
X-Received: by 2002:a02:5b89:: with SMTP id g131mr5402223jab.75.1589475808976;
        Thu, 14 May 2020 10:03:28 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:1041:f567:5747:59e9? ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id y18sm1318489ilq.52.2020.05.14.10.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:03:28 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: support merging .cfg files for UBOOT_CONFIG
To: Ming Liu <liu.ming50@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Cc: Stefan Agner <stefan.agner@toradex.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Ming Liu <ming.liu@toradex.com>
References: <20200406192216.23434-1-liu.ming50@gmail.com>
 <CALatG=6MMcB8z5MdKFLt27Lub9u7jyPTLW-x6rzWraKPxzTpCg@mail.gmail.com>
Message-ID: <30b524a7-80a3-7bd7-b105-0090b8cb01b6@gmail.com>
Date: Thu, 14 May 2020 12:03:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALatG=6MMcB8z5MdKFLt27Lub9u7jyPTLW-x6rzWraKPxzTpCg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A18CDDBBB0D00E6BB1D96BA0"
Content-Language: en-US

--------------A18CDDBBB0D00E6BB1D96BA0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/14/20 9:13 AM, Ming Liu wrote:
> Hi, maintainers:
>
> Ping! May I get some comments about this patch? It's been pending for 
> weeks.


I was just thinking about something like this the other day.... but I 
wonder if we want to apply the fragments to each config. It might be 
nice if there was a way to filter out which config fragments got applied 
to which u-boot configs?


>
> //Ming Liu
>
> <liu.ming50@gmail.com <mailto:liu.ming50@gmail.com>> 於 2020年4月6日 週一 
> 下午9:21寫道：
>
>     From: Ming Liu <ming.liu@toradex.com <mailto:ming.liu@toradex.com>>
>
>     U-boot recipe supports .cfg files in SRC_URI, but they would be merged
>     to .config during do_configure only when UBOOT_MACHINE is set, we
>     should also support merging .cfg files for UBOOT_CONFIG.
>
>     Signed-off-by: Ming Liu <ming.liu@toradex.com
>     <mailto:ming.liu@toradex.com>>
>     ---
>      meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--
>      1 file changed, 15 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>     b/meta/recipes-bsp/u-boot/u-boot.inc
>     index 188e5295cf..9126fafe0b 100644
>     --- a/meta/recipes-bsp/u-boot/u-boot.inc
>     +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>     @@ -77,7 +77,21 @@ def find_cfgs(d):
>          return sources_list
>
>      do_configure () {
>     -    if [ -z "${UBOOT_CONFIG}" ]; then
>     +    if [ -n "${UBOOT_CONFIG}" ]; then
>     +        unset i j
>     +        for config in ${UBOOT_MACHINE}; do
>     +            i=$(expr $i + 1);
>     +            for type in ${UBOOT_CONFIG}; do
>     +                j=$(expr $j + 1);
>     +                if [ $j -eq $i ]; then
>     + KCONFIG_CONFIG=${S}/configs/${config%_*}_defconfig
>     merge_config.sh -m ${S}/configs/${config%_*}_defconfig ${@"
>     ".join(find_cfgs(d))}
>     +                    oe_runmake -C ${S} O=${B}/${config} ${config}
>     +                fi
>     +            done
>     +            unset  j
>     +        done
>     +        unset  i
>     +    else
>              if [ -n "${UBOOT_MACHINE}" ]; then
>                  oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
>              else
>     @@ -114,7 +128,6 @@ do_compile () {
>                      j=$(expr $j + 1);
>                      if [ $j -eq $i ]
>                      then
>     -                    oe_runmake -C ${S} O=${B}/${config} ${config}
>                          oe_runmake -C ${S} O=${B}/${config}
>     ${UBOOT_MAKE_TARGET}
>                          for binary in ${UBOOT_BINARIES}; do
>                              k=$(expr $k + 1);
>     -- 
>     2.26.0
>
>
> 

--------------A18CDDBBB0D00E6BB1D96BA0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/14/20 9:13 AM, Ming Liu wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CALatG=6MMcB8z5MdKFLt27Lub9u7jyPTLW-x6rzWraKPxzTpCg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Hi, maintainers:</div>
        <div><br>
        </div>
        Ping! May I get some comments about this patch? It's been
        pending for weeks.</div>
    </blockquote>
    <p><br>
    </p>
    <p>I was just thinking about something like this the other day....
      but I wonder if we want to apply the fragments to each config. It
      might be nice if there was a way to filter out which config
      fragments got applied to which u-boot configs?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CALatG=6MMcB8z5MdKFLt27Lub9u7jyPTLW-x6rzWraKPxzTpCg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>//Ming Liu   </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">&lt;<a
            href="mailto:liu.ming50@gmail.com" moz-do-not-send="true">liu.ming50@gmail.com</a>&gt;
          於 2020年4月6日 週一 下午9:21寫道：<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Ming Liu &lt;<a href="mailto:ming.liu@toradex.com"
            target="_blank" moz-do-not-send="true">ming.liu@toradex.com</a>&gt;<br>
          <br>
          U-boot recipe supports .cfg files in SRC_URI, but they would
          be merged<br>
          to .config during do_configure only when UBOOT_MACHINE is set,
          we<br>
          should also support merging .cfg files for UBOOT_CONFIG.<br>
          <br>
          Signed-off-by: Ming Liu &lt;<a
            href="mailto:ming.liu@toradex.com" target="_blank"
            moz-do-not-send="true">ming.liu@toradex.com</a>&gt;<br>
          ---<br>
           meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--<br>
           1 file changed, 15 insertions(+), 2 deletions(-)<br>
          <br>
          diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
          b/meta/recipes-bsp/u-boot/u-boot.inc<br>
          index 188e5295cf..9126fafe0b 100644<br>
          --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
          +++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
          @@ -77,7 +77,21 @@ def find_cfgs(d):<br>
               return sources_list<br>
          <br>
           do_configure () {<br>
          -    if [ -z "${UBOOT_CONFIG}" ]; then<br>
          +    if [ -n "${UBOOT_CONFIG}" ]; then<br>
          +        unset i j<br>
          +        for config in ${UBOOT_MACHINE}; do<br>
          +            i=$(expr $i + 1);<br>
          +            for type in ${UBOOT_CONFIG}; do<br>
          +                j=$(expr $j + 1);<br>
          +                if [ $j -eq $i ]; then<br>
          +                   
          KCONFIG_CONFIG=${S}/configs/${config%_*}_defconfig
          merge_config.sh -m ${S}/configs/${config%_*}_defconfig ${@"
          ".join(find_cfgs(d))}<br>
          +                    oe_runmake -C ${S} O=${B}/${config}
          ${config}<br>
          +                fi<br>
          +            done<br>
          +            unset  j<br>
          +        done<br>
          +        unset  i<br>
          +    else<br>
                   if [ -n "${UBOOT_MACHINE}" ]; then<br>
                       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}<br>
                   else<br>
          @@ -114,7 +128,6 @@ do_compile () {<br>
                           j=$(expr $j + 1);<br>
                           if [ $j -eq $i ]<br>
                           then<br>
          -                    oe_runmake -C ${S} O=${B}/${config}
          ${config}<br>
                               oe_runmake -C ${S} O=${B}/${config}
          ${UBOOT_MAKE_TARGET}<br>
                               for binary in ${UBOOT_BINARIES}; do<br>
                                   k=$(expr $k + 1);<br>
          -- <br>
          2.26.0<br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A18CDDBBB0D00E6BB1D96BA0--
