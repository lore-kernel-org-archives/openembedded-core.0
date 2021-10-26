Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FB8C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 20:21:48 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web08.2123.1635279704907649112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 13:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZfsxTskW;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id x3so624567uar.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCAJvuriMWYZFBN7NUCWjAdvBO22QWmiF6DpzOz6qkM=;
        b=ZfsxTskWqDlE58u6bWMkk7OsaM5wwLr3NzzKcik6tv1E5olUentyfnWxaJnGaPd1Oz
         cNlNXNRZ6RaECJuOdMbrUgElfjT2uG01zPBVrJFahQTMb7bMQax7Wl2S1tbaQeidTxVf
         hkiSHrVPxBzvrvrQCNgp4PafJqbr1XbG6H9gN6ndjgZV/D9c3sWa8c7E57kb+B1mMn17
         5BV5cRcuNGxptuJU2rw+8UOhqsLiI5ztXLeejBLkScUcEUBEYDOXeCu6WqZNW+StwCIf
         ez5VsL64gTmQwDZcvFWRD7kEEBbqeFmX4u1fbhry0HMnXdeUufCsLkswX+DGD83UJbrf
         Ifmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCAJvuriMWYZFBN7NUCWjAdvBO22QWmiF6DpzOz6qkM=;
        b=Gbfcsxoph0Y2K1GB48mDXvkokiZkd9mfeDSigYKy+CjZfvaPX9OEDxRapO8id/OZHa
         CqgwnwHc6xwsRSd+XAloGHZCwI08hZ+AspiAmqO8ZhUtpo9Ysnc3yBCgHqAXXBe3obIp
         CaAhmSvQxOzgEJbC/BxzdRkeMhdSfEz1scEp9vxf0IsY58UivuFN7NmTA1vKY4QIw6K5
         sqHMwB3v7aDVR+fq7fYOKFT0Uix71XJ+0x+OBNRUiV++qcilHki52TebesaYd40K9A39
         fD5xsRwaxFx02snvr3yXwyTVsX0WlRcEKBFYaw6InUbvqS0dWU1sd3Xispncfu4/+3vD
         GM5w==
X-Gm-Message-State: AOAM532ppeurtqQC8E7cVwoxMTTnrMgkF0HUqh3sqUy0ZWpnp1iK6qUG
	5ZXKuJUEwhPdASRqbUvUvfB3aOFCFYeKMlr6RRY=
X-Google-Smtp-Source: 
 ABdhPJxJ7x+J9pcDNnWSXjs0c0y8C1fUSaf5HmO1MPCghK17AKsSsuJb0L5sWISNnbDK8m4DfX5TGz77gid/iKRr6TQ=
X-Received: by 2002:a05:6102:a30:: with SMTP id
 16mr5985813vsb.1.1635279704083;
 Tue, 26 Oct 2021 13:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
 <16B1AD7283CD4D45.19566@lists.openembedded.org>
In-Reply-To: <16B1AD7283CD4D45.19566@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 22:21:32 +0200
Message-ID: 
 <CANNYZj8-nCE0RU5wJzrfRB8HARNFP2X7o_hNXf_sDYmPAu5+dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ded19805cf4739a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 20:21:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157452

--000000000000ded19805cf4739a4
Content-Type: text/plain; charset="UTF-8"

I'll run a build now to reproduce again.

Alex

On Tue, 26 Oct 2021 at 22:07, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Tue, 26 Oct 2021 at 21:38, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> 0200
>>
>>> +Subject: [PATCH] ANGLE: do not enable SSE on x86
>>> +
>>> +The code does not actually build there.
>>> +
>>> +Upstream-Status: Pending
>>> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>> +---
>>> + Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h
>>> b/Source/ThirdParty/ANGLE/src/common/platform.h
>>> +index 41f3cf4f..cab85a82 100644
>>> +--- a/Source/ThirdParty/ANGLE/src/common/platform.h
>>> ++++ b/Source/ThirdParty/ANGLE/src/common/platform.h
>>> +@@ -89,7 +89,7 @@
>>> + #if defined(_MSC_VER) && !defined(_M_ARM) && !defined(_M_ARM64)
>>> + #    include <intrin.h>
>>> + #    define ANGLE_USE_SSE
>>> +-#elif defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
>>> ++#elif defined(__GNUC__) && (defined(__x86_64__))
>>> + #    include <x86intrin.h>
>>> + #    define ANGLE_USE_SSE
>>> + #endif
>>>
>>
>> Can you improve the commit message of this patch to show what "does not
>> actually build there"?
>>
>> Because it fails to build here for qemux86 with:
>>
>> webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/ThirdParty/ANGLE/src/libANGLE/Constants.h:20:7:
>> error: 'size_t' does not name a type
>>    20 | const size_t kDefaultMaxProgramCacheMemoryBytes = 0;
>>       |       ^~~~~~
>>
>> and deleting this patch fixes the build.
>>
>
> Is it in the same 'building nodistro without enabling opengl' setup?
> Please try to use plain poky, with opengl, and you'll see the issue.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157451):
> https://lists.openembedded.org/g/openembedded-core/message/157451
> Mute This Topic: https://lists.openembedded.org/mt/86232785/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ded19805cf4739a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ll run a build now to reproduce again.</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, 26 Oct 2021 at 22:07, Alexander Kana=
vin via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 26 Oct 2021 at 21:38, Martin J=
ansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin=
.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">0200<br><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+Subject: [PATCH] ANGLE: do not enable SSE on x86<br>
+<br>
+The code does not actually build there.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h b/Source/ThirdP=
arty/ANGLE/src/common/platform.h<br>
+index 41f3cf4f..cab85a82 100644<br>
+--- a/Source/ThirdParty/ANGLE/src/common/platform.h<br>
++++ b/Source/ThirdParty/ANGLE/src/common/platform.h<br>
+@@ -89,7 +89,7 @@<br>
+ #if defined(_MSC_VER) &amp;&amp; !defined(_M_ARM) &amp;&amp; !defined(_M_=
ARM64)<br>
+ #=C2=A0 =C2=A0 include &lt;intrin.h&gt;<br>
+ #=C2=A0 =C2=A0 define ANGLE_USE_SSE<br>
+-#elif defined(__GNUC__) &amp;&amp; (defined(__x86_64__) || defined(__i386=
__))<br>
++#elif defined(__GNUC__) &amp;&amp; (defined(__x86_64__))<br>
+ #=C2=A0 =C2=A0 include &lt;x86intrin.h&gt;<br>
+ #=C2=A0 =C2=A0 define ANGLE_USE_SSE<br>
+ #endif<br></blockquote><div><br></div><div>Can you improve the commit mes=
sage of this patch to show what &quot;does not actually build there&quot;?<=
/div><div><br></div><div>Because it fails to build here for qemux86 with:</=
div><div><br></div><div>webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/ThirdPa=
rty/ANGLE/src/libANGLE/Constants.h:20:7: error: &#39;size_t&#39; does not n=
ame a type<br>=C2=A0 =C2=A020 | const size_t kDefaultMaxProgramCacheMemoryB=
ytes =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br></div>=
<div><br></div><div>and deleting this patch fixes the build.</div></div></d=
iv></blockquote><div><br></div><div>Is it in the same &#39;building nodistr=
o without enabling opengl&#39; setup? Please try to use plain poky, with op=
engl, and you&#39;ll see the issue.</div><div><br></div><div>Alex<br></div>=
</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157451): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157451" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157451</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86232785/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86232785/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ded19805cf4739a4--

