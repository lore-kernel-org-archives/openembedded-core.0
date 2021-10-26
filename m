Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D246AC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 20:40:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.2438.1635280858366000144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 13:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z6o4etjD;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v16so387869ple.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sc+aNuuhnxRYgKdc7xTAgorCkvp8skFLwJRst6FcEQo=;
        b=Z6o4etjDybK9UJ5IqTRk/tlkQst3B+jrZwTHw3/zMtGCxw1vNy0uGZPozy1aqC/WWL
         YpV5vPGSUM7FDCYwLaRNe7NR9A95IUBS1gT0+QbnXg31P7QoikRLqMfCWLfq2f4W0w5v
         4mgrVBY8ktC0Usn5k64vMotOQrucaUFz3VdLoASEahWInExzTF3XCLhqBMw4BvaBx5YE
         Xh0IXAKObazITkKGJPcy7FTePh1JqAToFThdZ6OYEqgxcvOQ5msOROUvNiM3Aryw2WBZ
         HinbiCq0tuzhD78PvyODsHYxqXeZ3gvWNXJi5zMUPquTIqJnORKduR7aUOMc2446OL3s
         kszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sc+aNuuhnxRYgKdc7xTAgorCkvp8skFLwJRst6FcEQo=;
        b=0JiGS/bRRFtycBau9g6cU2MJE4EQeXxqnZbARNxkVdQNJ6tx897WSPo2r9JIFK1wtV
         /ET2DX2v94OLHGHSQz/igzKzng32dQ55uKN42rIw/uKCjuLk2IRoq3ZLYHdvNbktD4pv
         UIETJtWA/+VMaOUbfMv+Ya/3WrSqQJbPntadltcVtYpgusvWS3KFdemb4v+s4vbfYGWD
         ElQAuZ1EtLZzT7ayo29NWJycAt5hJiXX86prYHYftwivn5TafcY1LseNn4yA2RibXpl0
         Xb1dbPrudRr97kC8EkN/ETfS/vHbuwQz0ar+Z5NdOkLKyAJZd1c/nI+HEeQcKyMPUBfq
         EkoA==
X-Gm-Message-State: AOAM530vOBHHFzWU90HC+4umskf6jC601i3lmtTpssBncO/SzIQ10arn
	c8zSehpWInlntmcBBrC8iGujmP/z8/fy3kLf5Qk=
X-Google-Smtp-Source: 
 ABdhPJzQT36sL7J87Uifs4Y9X1Isy8n82bHAxwh7oC/zez6bYc1s4hy9CMGqPsm1zP9qLG0LrzHm9WpdaLKSDBrLSgI=
X-Received: by 2002:a17:90a:fe8a:: with SMTP id
 co10mr1121277pjb.183.1635280857931;
 Tue, 26 Oct 2021 13:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
 <CANNYZj8NPhV_b9QapAG=SYqhy60Z6cRxqE76Cpxs=qpjQ0F=7g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8NPhV_b9QapAG=SYqhy60Z6cRxqE76Cpxs=qpjQ0F=7g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Oct 2021 22:40:46 +0200
Message-ID: 
 <CA+chaQc13DNKNTFUc4u1EBvOs3ejtNaFiggEVL7rqtfXymq-Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a524b905cf477eba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 20:40:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157453

--000000000000a524b905cf477eba
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 10:07 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

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

No, this one was with opengl enabled, which was failing in do_configure do
to missing gperf-native, but now when that was fixed it fails in do_compile.

Build without opengl still works with works with my patch.

--000000000000a524b905cf477eba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 26, 2021 at 10:07 PM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
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
engl, and you&#39;ll see the issue.<br></div></div></div></blockquote><div>=
<br></div><div>No, this one was with opengl enabled, which was failing in d=
o_configure do to missing gperf-native, but now when that was fixed it fail=
s in do_compile.</div><div><br></div><div>Build without opengl still works =
with works with my patch.</div></div></div>

--000000000000a524b905cf477eba--

