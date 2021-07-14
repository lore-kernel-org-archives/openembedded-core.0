Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web09.6964.1626270982564849213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 06:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i3Zc+CSu;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id w13so966327vsa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z9H0UsQg0+PhmdpoYaGABTbk1BYQzO16rEPvTYIWnN0=;
        b=i3Zc+CSuNv4XCltACzeW8YyNRqds0O0XyDY0Or+LejPJDhyHilul1Y3vfORmQpViA0
         BhBRvLzu0W4DbqBdmxsAfHFSqC1QJhN3I2rudb8SvP/oFJ1YBQCfuYdk5Zb6x832ePk4
         Xb5wuGS9lUyMIhrxdB+g4qwB+xpQB2kO65yb3oXcgksdkLXjb5o5F7RMospYubMGEIDF
         dsTCGvbQEf2WpIUrXdGq+KOXGaDYb5gBNfKxB4+YBTSjdm4oBz9OD2wjPA9ehndfEDTt
         IYj0HkTJ1MiJGzoXn/RoZYEEc3ArTT+xw9ZEYMZhZMsZtV+4ePOsW/9krzccPwevlw5P
         dX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z9H0UsQg0+PhmdpoYaGABTbk1BYQzO16rEPvTYIWnN0=;
        b=pDDa/Rno4b/WIFhF45kUKXZw1QhPtCR8I1f5toYT6fiHucM+pxveSj/3B2KlYMJHXX
         SEUZFLhQxGVMXXqBxduL/l/UWJhw1dy7URh+KD1/s85s0Lr8cHynY9VH9Z1l8gL+CPcV
         /K/AqrA8Fao0Bjvf5XLQSNmROkItN5MndlLr6LGDdmQg5eEfdj5zA0hukfgeH6QcQNzK
         tOrI9uebmWDpdj/7h8eAEwf0+7AAN+VjM31JX3bYC3kokqnZWsNDLwOytAms9wm8WfXI
         VMfdRAr6P5k+uAucHWEODi0B/1jMtvJ0sDJYwD5uvJ9/oWsscaiTPd6VPakO58TrP+1W
         3OQg==
X-Gm-Message-State: AOAM532wwarE5jhOAJR8NeN5cvGZEdjEKg++7bQIrjgw4icztKBGaBAD
	L/ZieckOwqc2SCRpVTuqmnFtsb5rSL+q+VfK/fY=
X-Google-Smtp-Source: ABdhPJwDrdb08eUG9XiUqfeO0wIT+2bZPScJdI9Yl4Zf414d38+WeGh0GV5xXR3xpq+MwaAKAek775trWcNKjgDxxO0=
X-Received: by 2002:a05:6102:23dc:: with SMTP id x28mr13977030vsr.31.1626270981764;
 Wed, 14 Jul 2021 06:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134248.21366-1-JPEWhacker@gmail.com> <CANNYZj8QESeodwNfdV1Ve4GzfW5tQkLTtNA5qac1jt09wW5OMA@mail.gmail.com>
 <853bb8c3-6bc9-a154-613c-c5dfbfbb89ba@gmail.com>
In-Reply-To: <853bb8c3-6bc9-a154-613c-c5dfbfbb89ba@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 14 Jul 2021 15:56:10 +0200
Message-ID: <CANNYZj8zQRvtbObew21RU-o6=UFT-ntx+7bG9fDQ+eAHzVeMyQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002d38f505c715b8bb"

--0000000000002d38f505c715b8bb
Content-Type: text/plain; charset="UTF-8"

Right, but that still only sets up the infra and tests :) What will use it?

Alex

On Wed, 14 Jul 2021 at 15:51, Joshua Watt <jpewhacker@gmail.com> wrote:

> On 7/14/21 8:45 AM, Alexander Kanavin wrote:
>
> While I welcome the transition to zstd, I think the commit message needs
> to be more descriptive. Needed by bitbake where and how? Is there some
> patchset upcoming?
>
>
> Ya, this is necessary for the patch:
> https://lists.openembedded.org/g/bitbake-devel/message/12385, which isn't
> merged yet.
>
>
>
> Alex
>
> On Wed, 14 Jul 2021 at 15:42, Joshua Watt <JPEWhacker@gmail.com> wrote:
>
>> Adds the command line compression tools which are needed by bitbake
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index f451ba6a47..3801db7d42 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp
>> comm cp cpio \
>>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr
>> false \
>>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip
>> gzip \
>> -    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo
>> mknod \
>> +    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir
>> mkfifo mknod \
>>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>> -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>> +    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed
>> seq sh \
>>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>>      sleep sort split stat strings strip tail tar tee test touch tr true
>> uname \
>> -    uniq wc wget which xargs \
>> +    uniq wc wget which xargs zstd \
>>  "
>>
>>  # Tools needed to run testimage runtime image testing
>> --
>> 2.32.0
>>
>>
>> 
>>
>>

--0000000000002d38f505c715b8bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, but that still only sets up the infra and test=
s :) What will use it?<br></div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1=
4 Jul 2021 at 15:51, Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com=
">jpewhacker@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
  
    
  
  <div>
    <div>On 7/14/21 8:45 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">
        <div>While I welcome the transition to zstd, I think the commit
          message needs to be more descriptive. Needed by bitbake where
          and how? Is there some patchset upcoming?<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Ya, this is necessary for the patch:
      <a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/12=
385" target=3D"_blank">https://lists.openembedded.org/g/bitbake-devel/messa=
ge/12385</a>,
      which isn&#39;t merged yet.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, 14 Jul 2021 at 15:42=
,
          Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=
=3D"_blank">JPEWhacker@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Adds
          the command line compression tools which are needed by bitbake<b=
r>
          <br>
          Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmai=
l.com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
          ---<br>
          =C2=A0meta/conf/bitbake.conf | 6 +++---<br>
          =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
          index f451ba6a47..3801db7d42 100644<br>
          --- a/meta/conf/bitbake.conf<br>
          +++ b/meta/conf/bitbake.conf<br>
          @@ -484,12 +484,12 @@ HOSTTOOLS +=3D &quot; \<br>
          =C2=A0 =C2=A0 =C2=A0[ ar as awk basename bash bzip2 cat chgrp ch=
mod chown
          chrpath cmp comm cp cpio \<br>
          =C2=A0 =C2=A0 =C2=A0cpp cut date dd diff diffstat dirname du ech=
o egrep env
          expand expr false \<br>
          =C2=A0 =C2=A0 =C2=A0fgrep file find flock g++ gawk gcc getconf g=
etopt git
          grep gunzip gzip \<br>
          -=C2=A0 =C2=A0 head hostname iconv id install ld ldd ln ls make =
md5sum
          mkdir mkfifo mknod \<br>
          +=C2=A0 =C2=A0 head hostname iconv id install ld ldd ln ls lz4c =
make
          md5sum mkdir mkfifo mknod \<br>
          =C2=A0 =C2=A0 =C2=A0mktemp mv nm objcopy objdump od patch perl p=
r printf pwd
          \<br>
          -=C2=A0 =C2=A0 python3 ranlib readelf readlink realpath rm rmdir=
 rpcgen
          sed seq sh \<br>
          +=C2=A0 =C2=A0 python3 pzstd ranlib readelf readlink realpath rm=
 rmdir
          rpcgen sed seq sh \<br>
          =C2=A0 =C2=A0 =C2=A0sha1sum sha224sum sha256sum sha384sum sha512=
sum \<br>
          =C2=A0 =C2=A0 =C2=A0sleep sort split stat strings strip tail tar=
 tee test
          touch tr true uname \<br>
          -=C2=A0 =C2=A0 uniq wc wget which xargs \<br>
          +=C2=A0 =C2=A0 uniq wc wget which xargs zstd \<br>
          =C2=A0&quot;<br>
          <br>
          =C2=A0# Tools needed to run testimage runtime image testing<br>
          -- <br>
          2.32.0<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--0000000000002d38f505c715b8bb--
