Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2836C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:25:23 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.1986.1700501113778003108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amngutaE;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b3ec45d6e9so3129422b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 09:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700501113; x=1701105913; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oFeNDVYob8lX02rQd/bdAWuXM2IRd9XtVkZWCxJjtYM=;
        b=amngutaEElE19cgW/n0NFBW79XvnWSdI8LZyXly7dTr8sr6d040KTq+Z5iP2HCn4kt
         XwzoDMq8TdcndcEmEf/YRlT0okRH3acEwah7OJOkdB+qkrPQdr2qdfwN+bPnMvM90i81
         IrtV40tzuZksOqx2ZcbldYJWaiD8uK+1rCAzTLrKgB+x7FpCpr8Arn6BONaf4YLGGppQ
         DNNCLxEQ4fTF2WKN01goFu6ImciCmbVfH0fWoWZ1whUBURYE0OU9FS+EhyJBGhI8m14P
         ZMiNg17Rm13Z4/b9CgEqLB/C2NvOX6DdYM7NV1BlO8V3wjwH+OTU9+MoS8QHJt5baGYD
         lpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501113; x=1701105913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFeNDVYob8lX02rQd/bdAWuXM2IRd9XtVkZWCxJjtYM=;
        b=abEIHeDXMI53J9ljqTzsKQHRWfTmV+SooDtdBNhqn5YInEZmaJqQv5VZRfFlv19PTo
         LvAGf2p/EQdc/mYRUPJC42ACRR5LNqm4115XoOmtYdane+NZGkDFadllK+IAv7MlYJ4Z
         IoBhtfLGLxr+9iTlYX5wJxmyvlpXN1IvAt+DjLOHQg2JIf8MOiZEmEqt9VTFpVhUnM7o
         mMsfQlTXxK0aEpA+4Gfkb3Y2kHgPJZuhIN0zEP5xa+ssI5QkElZzRD+NJ6JpQ+uGdI4r
         GWyBaUtnO3SwkisE0IgbrozTeOGMp+gqWOd7rkjFHEkHusPK0ber+mMVg/ouQzYiXJN0
         CDcg==
X-Gm-Message-State: AOJu0Yzaocle/rCKPPErSaxrv2fW9p9YIoTIdfGxkH0TSeCZ/o2CP0D6
	C8zZOh94IZ8o8woDAwXK1s8QNLYTFo/3iEd8pl0=
X-Google-Smtp-Source: AGHT+IHrzEefbttrNIhwXxgFAeBdyI7ntRt5aVvcdAR7DgB886tSIpo3iU5SYmVIdZVrA9giMKeTE3ZwrBbjHcfcQgc=
X-Received: by 2002:a05:6358:2991:b0:16d:e922:f002 with SMTP id
 j17-20020a056358299100b0016de922f002mr60439rwc.18.1700501112102; Mon, 20 Nov
 2023 09:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
 <20231120144628.52664-3-adrian.freihofer@siemens.com> <17996456E4E8A103.7061@lists.openembedded.org>
In-Reply-To: <17996456E4E8A103.7061@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 Nov 2023 17:25:01 +0000
Message-ID: <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
To: quaresma.jose@gmail.com
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000ba213a060a98c46a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 17:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190927

--000000000000ba213a060a98c46a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia segunda, 20/11/2023 =C3=
=A0(s)
17:17:

> Hi Adrian,
>
> Adrian Freihofer <adrian.freihofer@gmail.com> escreveu no dia segunda,
> 20/11/2023 =C3=A0(s) 14:46:
>
>> Provide an easy way to enable cmake-qemu e.g. on distro level for all
>> recipes inheriting the cmake.bbclass.
>>
>> Therefore a new variable is introduced: OECMAKE_EXEWRAPPER_QEMU.
>>
>> If set to "1" all recipes built with CMake can use qemu to execute
>> cross-compiled binaries on the build machine.
>> One use case is the execution of cross-compiled unit tests or ptests,
>> e.g. in an SDK context. Therefore, a variable that activates Qemu for
>> all CMake recipes is much more useful than just providing the optional
>> cmake-qemu.bbclass.
>> Further information can be found in the CMake documentation in the
>> CMAKE_CROSSCOMPILING_EMULATOR section.
>>
>> There are some use cases for qemu-user, but users should not be
>> encouraged to use it as an alternative for clean cross-compilation.
>> Since the core does not need it either it is optional.
>>
>
> Are you sure this works in the majority of scenarios?
> Last time I worked on this qemu user mode failed to run
> multithreading applications.
>

Sorry, I was wrong above.
The issue was not multithreading but with the fork system call.


>
> Jose
>
>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  meta/classes-recipe/cmake.bbclass | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes-recipe/cmake.bbclass
>> b/meta/classes-recipe/cmake.bbclass
>> index d978b88944..4d8e2a206f 100644
>> --- a/meta/classes-recipe/cmake.bbclass
>> +++ b/meta/classes-recipe/cmake.bbclass
>> @@ -14,6 +14,10 @@ B =3D "${WORKDIR}/build"
>>  # The supported options are "Unix Makefiles" or "Ninja".
>>  OECMAKE_GENERATOR ?=3D "Ninja"
>>
>> +# qemu-user can be used for special use cases, but not by default
>> +OECMAKE_EXEWRAPPER_QEMU ??=3D "0"
>> +inherit ${@'cmake-qemu' if d.getVar('OECMAKE_EXEWRAPPER_QEMU') else ''}
>> +
>>  python() {
>>      generator =3D d.getVar("OECMAKE_GENERATOR")
>>      if "Unix Makefiles" in generator:
>> --
>> 2.41.0
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190925):
> https://lists.openembedded.org/g/openembedded-core/message/190925
> Mute This Topic: https://lists.openembedded.org/mt/102708283/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ba213a060a98c46a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu no dia segunda, 20/11/2023 =C3=A0(s) 17:17:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi =
Adrian,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.com" t=
arget=3D"_blank">adrian.freihofer@gmail.com</a>&gt; escreveu no dia segunda=
, 20/11/2023 =C3=A0(s) 14:46:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Provide an easy way to enable cmake-qemu e.g. on distro level=
 for all<br>
recipes inheriting the cmake.bbclass.<br>
<br>
Therefore a new variable is introduced: OECMAKE_EXEWRAPPER_QEMU.<br>
<br>
If set to &quot;1&quot; all recipes built with CMake can use qemu to execut=
e<br>
cross-compiled binaries on the build machine.<br>
One use case is the execution of cross-compiled unit tests or ptests,<br>
e.g. in an SDK context. Therefore, a variable that activates Qemu for<br>
all CMake recipes is much more useful than just providing the optional<br>
cmake-qemu.bbclass.<br>
Further information can be found in the CMake documentation in the<br>
CMAKE_CROSSCOMPILING_EMULATOR section.<br>
<br>
There are some use cases for qemu-user, but users should not be<br>
encouraged to use it as an alternative for clean cross-compilation.<br>
Since the core does not need it either it is optional.<br></blockquote><div=
><br></div><div>Are you sure this works in the majority of scenarios?<br>La=
st time I worked on this qemu user mode failed to run multithreading=C2=A0a=
pplications.</div></div></div></blockquote><div><br>Sorry, I was wrong abov=
e.<br>The issue was not multithreading but with the fork system call.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div><br>Jose</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cmake.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.=
bbclass<br>
index d978b88944..4d8e2a206f 100644<br>
--- a/meta/classes-recipe/cmake.bbclass<br>
+++ b/meta/classes-recipe/cmake.bbclass<br>
@@ -14,6 +14,10 @@ B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0# The supported options are &quot;Unix Makefiles&quot; or &quot;Ninja=
&quot;.<br>
=C2=A0OECMAKE_GENERATOR ?=3D &quot;Ninja&quot;<br>
<br>
+# qemu-user can be used for special use cases, but not by default<br>
+OECMAKE_EXEWRAPPER_QEMU ??=3D &quot;0&quot;<br>
+inherit ${@&#39;cmake-qemu&#39; if d.getVar(&#39;OECMAKE_EXEWRAPPER_QEMU&#=
39;) else &#39;&#39;}<br>
+<br>
=C2=A0python() {<br>
=C2=A0 =C2=A0 =C2=A0generator =3D d.getVar(&quot;OECMAKE_GENERATOR&quot;)<b=
r>
=C2=A0 =C2=A0 =C2=A0if &quot;Unix Makefiles&quot; in generator:<br>
-- <br>
2.41.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190925): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190925" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190925</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102708283/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102708283/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000ba213a060a98c46a--

