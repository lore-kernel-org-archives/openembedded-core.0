Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.7056.1626270691627240179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 06:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ql7BLp+J;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id b14-20020a056830310eb02904c7e78705f4so2477114ots.13
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=LNcoDp6tJQ8H5AiClnloNRwfJqyEDZR9D4DSDuaFacQ=;
        b=Ql7BLp+JZbSgM+rg/VKjtObqjFsak5cj4lv4IIJ2MBXjYsRVLw+Msplzr8IhTY5ZAK
         /67SISoyTSu9s1ldnI1SOZ1NuG8/yvZIb4goY1L0eOoO8RO+0NZX1kGKPtLaoVkcyKk0
         kMvE/3i8qI3OOsXtDDRoKhUeR0OuHky5GR+rWuKYJap17Gwod+CB/b6Q8cVriCE1+pvC
         626RgZ02PslX0Qw1MPuDqJDFFU+SQEt7BI5AuZN1yQWQBguHW3Nxkv5PpOyPiSPY12L7
         BGBSgziDDP475Q9BSs9CKOU6mf3DywIdHck5gC/UUPNFR/LGMPVweu+cjJShAm5Ysc2r
         ocZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=LNcoDp6tJQ8H5AiClnloNRwfJqyEDZR9D4DSDuaFacQ=;
        b=soXBkl53xaPMxIiGdG1uaiPNcqJkpz7NDEliqAkQwq0Aro7yERFG4n3DjsCg2AfABv
         SEbqfUBoArPgtpyLg4+TjMt4hM42TadtdrJjkC2+KpKti1XyKNgQL5YBShnlyHggVaLt
         jWSiNIVdu83hI8vvVpcnS+pO608EAPI0BpOOVzkPuHvcogsAcjl+4CzuZKaXyxP1Aaeg
         4WE+Kc+wGBeEMG8HQxJYMO3G8bfNE7qa9fIu4RPwfYU8dyLyiSV9D9G4CoSS9vHn0AzB
         MB6c6HqAV7d5D3zI1wspl23dwO+Mv2oEFckqZ+WPXq9L8MD7pr9zLHFiP/Vv2pg1HH8n
         TvGw==
X-Gm-Message-State: AOAM532CSkej7tDoR/MlsjoPHzeM7LjJfWfapAXuBcYHWIgYIYLrU/z0
	nQY0TXL67npBA4zl9k5VhX+lZi2JDzUeUA==
X-Google-Smtp-Source: ABdhPJz4W+9CI8GlGPp65fOyyHb3XXnTo+NNH0Um1qud2lDlzMjC8E8KSwXzeXrLtkGEm5Y26Svw6Q==
X-Received: by 2002:a05:6830:1455:: with SMTP id w21mr8332433otp.365.1626270690777;
        Wed, 14 Jul 2021 06:51:30 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id r1sm431929ooi.21.2021.07.14.06.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 06:51:30 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
 <CANNYZj8QESeodwNfdV1Ve4GzfW5tQkLTtNA5qac1jt09wW5OMA@mail.gmail.com>
Message-ID: <853bb8c3-6bc9-a154-613c-c5dfbfbb89ba@gmail.com>
Date: Wed, 14 Jul 2021 08:51:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8QESeodwNfdV1Ve4GzfW5tQkLTtNA5qac1jt09wW5OMA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------430858B8F597CD92238830AC"
Content-Language: en-US

--------------430858B8F597CD92238830AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/21 8:45 AM, Alexander Kanavin wrote:
> While I welcome the transition to zstd, I think the commit message 
> needs to be more descriptive. Needed by bitbake where and how? Is 
> there some patchset upcoming?


Ya, this is necessary for the patch: 
https://lists.openembedded.org/g/bitbake-devel/message/12385, which 
isn't merged yet.


>
> Alex
>
> On Wed, 14 Jul 2021 at 15:42, Joshua Watt <JPEWhacker@gmail.com 
> <mailto:JPEWhacker@gmail.com>> wrote:
>
>     Adds the command line compression tools which are needed by bitbake
>
>     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com
>     <mailto:JPEWhacker@gmail.com>>
>     ---
>      meta/conf/bitbake.conf | 6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>     index f451ba6a47..3801db7d42 100644
>     --- a/meta/conf/bitbake.conf
>     +++ b/meta/conf/bitbake.conf
>     @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>          [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath
>     cmp comm cp cpio \
>          cpp cut date dd diff diffstat dirname du echo egrep env
>     expand expr false \
>          fgrep file find flock g++ gawk gcc getconf getopt git grep
>     gunzip gzip \
>     -    head hostname iconv id install ld ldd ln ls make md5sum mkdir
>     mkfifo mknod \
>     +    head hostname iconv id install ld ldd ln ls lz4c make md5sum
>     mkdir mkfifo mknod \
>          mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>     -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed
>     seq sh \
>     +    python3 pzstd ranlib readelf readlink realpath rm rmdir
>     rpcgen sed seq sh \
>          sha1sum sha224sum sha256sum sha384sum sha512sum \
>          sleep sort split stat strings strip tail tar tee test touch
>     tr true uname \
>     -    uniq wc wget which xargs \
>     +    uniq wc wget which xargs zstd \
>      "
>
>      # Tools needed to run testimage runtime image testing
>     -- 
>     2.32.0
>
>
>     
>

--------------430858B8F597CD92238830AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 7/14/21 8:45 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8QESeodwNfdV1Ve4GzfW5tQkLTtNA5qac1jt09wW5OMA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>While I welcome the transition to zstd, I think the commit
          message needs to be more descriptive. Needed by bitbake where
          and how? Is there some patchset upcoming?<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Ya, this is necessary for the patch:
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/bitbake-devel/message/12385">https://lists.openembedded.org/g/bitbake-devel/message/12385</a>,
      which isn't merged yet.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8QESeodwNfdV1Ve4GzfW5tQkLTtNA5qac1jt09wW5OMA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, 14 Jul 2021 at 15:42,
          Joshua Watt &lt;<a href="mailto:JPEWhacker@gmail.com"
            moz-do-not-send="true">JPEWhacker@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Adds
          the command line compression tools which are needed by bitbake<br>
          <br>
          Signed-off-by: Joshua Watt &lt;<a
            href="mailto:JPEWhacker@gmail.com" target="_blank"
            moz-do-not-send="true">JPEWhacker@gmail.com</a>&gt;<br>
          ---<br>
           meta/conf/bitbake.conf | 6 +++---<br>
           1 file changed, 3 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
          index f451ba6a47..3801db7d42 100644<br>
          --- a/meta/conf/bitbake.conf<br>
          +++ b/meta/conf/bitbake.conf<br>
          @@ -484,12 +484,12 @@ HOSTTOOLS += " \<br>
               [ ar as awk basename bash bzip2 cat chgrp chmod chown
          chrpath cmp comm cp cpio \<br>
               cpp cut date dd diff diffstat dirname du echo egrep env
          expand expr false \<br>
               fgrep file find flock g++ gawk gcc getconf getopt git
          grep gunzip gzip \<br>
          -    head hostname iconv id install ld ldd ln ls make md5sum
          mkdir mkfifo mknod \<br>
          +    head hostname iconv id install ld ldd ln ls lz4c make
          md5sum mkdir mkfifo mknod \<br>
               mktemp mv nm objcopy objdump od patch perl pr printf pwd
          \<br>
          -    python3 ranlib readelf readlink realpath rm rmdir rpcgen
          sed seq sh \<br>
          +    python3 pzstd ranlib readelf readlink realpath rm rmdir
          rpcgen sed seq sh \<br>
               sha1sum sha224sum sha256sum sha384sum sha512sum \<br>
               sleep sort split stat strings strip tail tar tee test
          touch tr true uname \<br>
          -    uniq wc wget which xargs \<br>
          +    uniq wc wget which xargs zstd \<br>
           "<br>
          <br>
           # Tools needed to run testimage runtime image testing<br>
          -- <br>
          2.32.0<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------430858B8F597CD92238830AC--
