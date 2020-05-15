Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.8641.1589526210240645860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 00:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=asyTHAJU;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id f13so1147217wmc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/OO3/TwZ1zio/9wJPBJiqFhPNKKyqhV9TCWQLri6xc=;
        b=asyTHAJU82jFPUMMu7cPaO6YG4sSe6VLS438zkicKioyZ4491Lwcpj+HdEaNAwWSgm
         OeyYf6hDM0BNMz88KE6Q+7feoSiwzMIPqlvSiev2dn6XfCE+DTtT5N4atn2jlFZMgzdv
         +axJGEIZRvVzo3uGT6yZ8ywte379SgzD4ZDbw0NRb6B9saGevOA8mAJW2vqTKebJmbLx
         r76y99GwgrkxzOmrNSkNg+zFDRjoxY6rl2BdUQYKN3yftO0rTi2DCfC77hyHQV3LM1Jz
         4NkZAQjl3rWqtV1zdq8AFEWtGeaBcMiBrLWITESGtNSuuqRrfWusIsh1cUjR9Kp74w4g
         yNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/OO3/TwZ1zio/9wJPBJiqFhPNKKyqhV9TCWQLri6xc=;
        b=gik/N1Y04SyveHuQzpfHiQC/21pi7mMuX9RhbQeQ2zeyFddGLbiET1qXBrp6+Jsl6J
         NoBrb4EVMKUs0DS3SKrp/7kvc5dhVjB0C5Boq1lW0Dw4Pe5avkvl4i6pv+dDV9G1SrsQ
         1rXVi8a4LdY9jOo7wwuSmCizDKgs5tf3QN3hlp6SX8gR9HumzrObVF49NoqSWMEkZPNk
         X+FMN83wNT0RuFq6CHDCaXefk4BMknTxunVITFJFUZcVZ+0OhLff4nA6hgkmJMY6FTh6
         zUnABNLH5D+kQ9RRWkztRP+/prd404rr5DpZp3X8YAlvJpsc+quRU2RoPvyKKmZ5Hr/4
         yNSg==
X-Gm-Message-State: AOAM5316GEuEDYMPWAtDXUHqF/d5FEbr04VM8+0PZmwcXNfrHdTC14C7
	sDN2l0nqLDIUotw0UWTimvXmNGVbSCATOhUj/Vc=
X-Google-Smtp-Source: ABdhPJwO7G1KCSbuS8b/h6dlDpU5+xGHvHogAzZv+hovINV5cVTFdanmiqQ90SUfRoIROXXfLb8cCOo5EJwTxeIYdr4=
X-Received: by 2002:a1c:3187:: with SMTP id x129mr2347776wmx.27.1589526208655;
 Fri, 15 May 2020 00:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200406192216.23434-1-liu.ming50@gmail.com> <CALatG=6MMcB8z5MdKFLt27Lub9u7jyPTLW-x6rzWraKPxzTpCg@mail.gmail.com>
 <30b524a7-80a3-7bd7-b105-0090b8cb01b6@gmail.com>
In-Reply-To: <30b524a7-80a3-7bd7-b105-0090b8cb01b6@gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Fri, 15 May 2020 09:04:08 +0200
Message-ID: <CALatG=5eX+rAe+eK_nBgFQguq4YafZqw8FwY0nA5tR9RD3fHhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: support merging .cfg files for UBOOT_CONFIG
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, 
	Ming Liu <ming.liu@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000000738cb05a5aa69ac"

--0000000000000738cb05a5aa69ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I was just thinking about something like this the other day.... but I
wonder if we want to apply the fragments to each config. It might be nice
if there was a way to filter out which config fragments got applied to
which u-boot configs?

Thanks for the input, yes, that would be even nicer for sure, but after
some thinking, I could not figure out a way to implement that with the
current .scc design without a complete refactoring, do you have some ideas=
?

In our use cases, we use .scc files as some 'feature' fragments applied to
machine configs, usually we would like them to apply to all the configs, i=
f
there are some machine specific ones, they will be in the config file in
uboot source rather than being applied by .scc.

//Ming Liu

Joshua Watt <jpewhacker@gmail.com> =E6=96=BC 2020=E5=B9=B45=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:03=E5=AF=AB=E9=81=93=EF=BC=
=9A

>
> On 5/14/20 9:13 AM, Ming Liu wrote:
>
> Hi, maintainers:
>
> Ping! May I get some comments about this patch? It's been pending for
> weeks.
>
>
> I was just thinking about something like this the other day.... but I
> wonder if we want to apply the fragments to each config. It might be nic=
e
> if there was a way to filter out which config fragments got applied to
> which u-boot configs?
>
>
>
> //Ming Liu
>
> <liu.ming50@gmail.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=886=E6=97=A5 =E9=
=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> From: Ming Liu <ming.liu@toradex.com>
>>
>> U-boot recipe supports .cfg files in SRC_URI, but they would be merged
>> to .config during do_configure only when UBOOT_MACHINE is set, we
>> should also support merging .cfg files for UBOOT_CONFIG.
>>
>> Signed-off-by: Ming Liu <ming.liu@toradex.com>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>> b/meta/recipes-bsp/u-boot/u-boot.inc
>> index 188e5295cf..9126fafe0b 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -77,7 +77,21 @@ def find_cfgs(d):
>>      return sources_list
>>
>>  do_configure () {
>> -    if [ -z "${UBOOT_CONFIG}" ]; then
>> +    if [ -n "${UBOOT_CONFIG}" ]; then
>> +        unset i j
>> +        for config in ${UBOOT_MACHINE}; do
>> +            i=3D$(expr $i + 1);
>> +            for type in ${UBOOT_CONFIG}; do
>> +                j=3D$(expr $j + 1);
>> +                if [ $j -eq $i ]; then
>> +                    KCONFIG_CONFIG=3D${S}/configs/${config%_*}_defconf=
ig
>> merge_config.sh -m ${S}/configs/${config%_*}_defconfig ${@"
>> ".join(find_cfgs(d))}
>> +                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
>> +                fi
>> +            done
>> +            unset  j
>> +        done
>> +        unset  i
>> +    else
>>          if [ -n "${UBOOT_MACHINE}" ]; then
>>              oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
>>          else
>> @@ -114,7 +128,6 @@ do_compile () {
>>                  j=3D$(expr $j + 1);
>>                  if [ $j -eq $i ]
>>                  then
>> -                    oe_runmake -C ${S} O=3D${B}/${config} ${config}
>>                      oe_runmake -C ${S} O=3D${B}/${config}
>> ${UBOOT_MAKE_TARGET}
>>                      for binary in ${UBOOT_BINARIES}; do
>>                          k=3D$(expr $k + 1);
>> --
>> 2.26.0
>>
>>
>=20
>
>

--0000000000000738cb05a5aa69ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; I was just thinking about something like this the oth=
er day.... but I wonder if we want to apply the fragments to each config. I=
t might be nice if there was a way to filter out which config fragments got=
 applied to which u-boot configs?<br><div><br></div><div>Thanks for the inp=
ut, yes, that would be even nicer for sure, but after some thinking, I coul=
d not figure out a way to implement that with the current .scc design witho=
ut a complete refactoring, do you have some ideas?</div><div><br></div><div=
>In our use cases, we use .scc files as some &#39;feature&#39; fragments ap=
plied to machine configs, usually we would like them to apply to all the co=
nfigs, if there are some machine specific ones, they will be in the config =
file in uboot source rather than being applied by .scc.</div><div><br></div=
><div>//Ming Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.co=
m">jpewhacker@gmail.com</a>&gt; =E6=96=BC 2020=E5=B9=B45=E6=9C=8814=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:03=E5=AF=AB=E9=81=93=EF=BC=9A<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
  
    
  
  <div>
    <p><br>
    </p>
    <div>On 5/14/20 9:13 AM, Ming Liu wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">
        <div>Hi, maintainers:</div>
        <div><br>
        </div>
        Ping! May I get some comments about this patch? It&#39;s been
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
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>//Ming Liu=C2=A0 =C2=A0</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:liu.mi=
ng50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;
          =E6=96=BC 2020=E5=B9=B44=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=80 =
=E4=B8=8B=E5=8D=889:21=E5=AF=AB=E9=81=93=EF=BC=9A<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" target=3D"_=
blank">ming.liu@toradex.com</a>&gt;<br>
          <br>
          U-boot recipe supports .cfg files in SRC_URI, but they would
          be merged<br>
          to .config during do_configure only when UBOOT_MACHINE is set,
          we<br>
          should also support merging .cfg files for UBOOT_CONFIG.<br>
          <br>
          Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.c=
om" target=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
          ---<br>
          =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--<=
br>
          =C2=A01 file changed, 15 insertions(+), 2 deletions(-)<br>
          <br>
          diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
          b/meta/recipes-bsp/u-boot/u-boot.inc<br>
          index 188e5295cf..9126fafe0b 100644<br>
          --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
          +++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
          @@ -77,7 +77,21 @@ def find_cfgs(d):<br>
          =C2=A0 =C2=A0 =C2=A0return sources_list<br>
          <br>
          =C2=A0do_configure () {<br>
          -=C2=A0 =C2=A0 if [ -z &quot;${UBOOT_CONFIG}&quot; ]; then<br>
          +=C2=A0 =C2=A0 if [ -n &quot;${UBOOT_CONFIG}&quot; ]; then<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset i j<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in ${UBOOT_MACHINE}; do<=
br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=3D$(expr $i + 1);<b=
r>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${UBOOT_C=
ONFIG}; do<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j=3D$(e=
xpr $j + 1);<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $j=
 -eq $i ]; then<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0
          KCONFIG_CONFIG=3D${S}/configs/${config%_*}_defconfig
          merge_config.sh -m ${S}/configs/${config%_*}_defconfig ${@&quot;
          &quot;.join(find_cfgs(d))}<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 oe_runmake -C ${S} O=3D${B}/${config}
          ${config}<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 j<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 i<br>
          +=C2=A0 =C2=A0 else<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_MACHINE}=
&quot; ]; then<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${=
S} O=3D${B} ${UBOOT_MACHINE}<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
          @@ -114,7 +128,6 @@ do_compile () {<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=
=3D$(expr $j + 1);<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 [ $j -eq $i ]<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0th=
en<br>
          -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 oe_runmake -C ${S} O=3D${B}/${config}
          ${config}<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0oe_runmake -C ${S} O=3D${B}/${config}
          ${UBOOT_MAKE_TARGET}<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0for binary in ${UBOOT_BINARIES}; do<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0k=3D$(expr $k + 1);<br>
          -- <br>
          2.26.0<br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>
</pre>
    </blockquote>
  </div>

</blockquote></div>

--0000000000000738cb05a5aa69ac--
