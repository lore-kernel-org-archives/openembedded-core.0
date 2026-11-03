Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.179.1793725297738390531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 09:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xN/2JitD;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c6ce60697so61950706d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:01:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793725297; cv=none;
        d=google.com; s=arc-20260327;
        b=dJbXkbzdkfEQPDRJ3SSDwoMcABvJff1Lg1r863TnckzmyCvFNLxTCa7y6/pGqKEui2
         bvvU1S+KPyJc1qX2KFgEve7mE9cJr6e0Jfp1mwO9VRR3/IjwX1VZYHxrR+BDTLYuydL1
         oKeTaCFXEdQ/XSOcMR7xBK514+gXy5Elr+atqnLXHJ4q1JCeS9vzSCoz5J8kS80LnJG3
         i8fWufo5jczAjSDJ7JRZbyTh2icoTY1zsU86k76DAZ1kVQegAhifrM+f9qhbQcIlFzDS
         HuDzfYI7kUfHE+1TSHH76vege7ko1f2UvRhrddmFkMYA/rm2B4hIHKp8aNCI3LY9l9gK
         xkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lSJydbt2v35Cne2qkydUWjfyg0jlqkjzwqJnnGgwuH4=;
        fh=A70T00D8FJSYieM0kb4cL/ZwKD9oh+DDCqRW0XG/0No=;
        b=AEbxS81bcr1ggFNXY/8ZrH5T5pBIupgpGvvICMWEHY+7ALULjNLlib+VpZ5zoP9Y/Q
         CnozllOX01AQbhpl4gUQtMmn7eakBdMLZOCrhbTNThP1jWP/ORUYLfWRUqKP1393ok2Z
         Akl9GD2/M7+A4KscLB2P59cFUr1BW/LcLMbAh3F5aHdGpyuqfXGh4goGKHfkPRjYr2NH
         LT/R1nkNyY1SE7jPHkMt0qSXWUBpfMBxRp5B1jx6ffXhiNha9iQDg19ohEj4A1Q0t3Rb
         nP5lMeb/8zfaF5UM4rixv9mouyErYdGFtHxXELfSGLlBrJ+1c/zrNlyKPfpfqCauU1Kr
         hjfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725296; x=1794330096; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSJydbt2v35Cne2qkydUWjfyg0jlqkjzwqJnnGgwuH4=;
        b=xN/2JitDyelhDpq9mphnTDRYGDcmTU/ZuZ6RNrilc4qL5PcNJR/w3rG/uFPglkM6W3
         0A6J/CIf6W0VjKVYg1p6lJiRH1mXXot3fRWLJ0/5zUR/SJUhYJXtfc+ohGmetHfB8/+m
         UkbnEOuWMM5epF2gxbFGyaTssqorO7wagY7iKqWkl8GGgq8hHq0MwspyLOEML3WzCiRq
         DiPDjRm5lFBvaXCYLSQHFpL1oJD/bgFKSaL50rd3mqBJdT0oA6Ynbxpy1PzjCNW42P/r
         6P5kZAYXy8+JjkoY5aqsSSbM5ypMTP+KI4RNevROd+CJDjLr0s2PoL78BPndhzIhm5Hd
         wfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725297; x=1794330097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lSJydbt2v35Cne2qkydUWjfyg0jlqkjzwqJnnGgwuH4=;
        b=eVot2Gwhs7SSiiqWQNTsE1Je30dFpykAxph/2o2/4jWrY9gEZ/QNZ1NsqxW8a3/Rol
         ZMNUW1e9irTUCexTxeO13vVgDwTuW4E7aNGUaHCpDO+eCF7FyUO/t3EpI13hoJTpfpPc
         Ep0omj4ZiBK/oZLduVePKb3tK5GDUR2QZtSUixkuEZ8uHDQel/GD6KEZfl5wFt9rVGEz
         GiPHiqeQ5NNkksWZeYGTUX5enC4Z7i/AJ3fWTjr1i5tE5ZmQ6ogB751d+TXP7G6deGMr
         R/WY88gYpyw4hxBwR+leaSRObrRFLhHgM6FhXyNnuXhffrZRt1BRz/sJfzPohCAUeYiU
         Ybug==
X-Gm-Message-State: APuU4Z9WEibHs3QMaVVVAxmEjETaIODrGO08RrVBQxMmC+1QOlCbB3u3
	ACOJf7wdg+Z9qfdhI9Z9j8XHxadk1qRvyc0iP/tz9IsXgAYLVFHafGS25Z356c7W2LL56BlfzEv
	KJMmzBIJ/oG3Y4Xqc15f4hF/1gnNi0LE=
X-Gm-Gg: AYBFou2sGSRnBFOYdxuXuSnDvOoY1neYnTIDCNDZXnr1UgixL90mM8KWa0F1NqqXmlW
	okeJ5iZQlp1XS5jTmYdbj6xj0tUs5wUKeevcEhhVP3HAV3Sy8B+eNqarnfj/7I/euZHuPGMUCbF
	0MgQe0agTi0/wc0aqPRNVi8CYRZglcWedV6BXAPDLA/bxtr23QAYepjkASwfOUm7Y6kkYQ3HsJd
	o3Dh8hXAyyNvFMiHCREY9jwGDomjYOkYcMfGH6gd6icI020fX/W/d+Zq4hYWeZjbXiZhfcFpuy6
	9pIlRn5Oxut6aUcwfO2eIWgxNweGkHC9pW9Zb39JLNgSGcGrOrkFgSveKHuk60f9t6YSPi121An
	hTDXKaDtT13NLUunRohwcAZGqOSoTazdJzj+cP2DRs86wwLG+H6ha9m647isznT1n3Yb5sqnV
X-Received: by 2002:a05:6214:4404:b0:91c:6701:161e with SMTP id
 6a1803df08f44-91ca4b8ab52mr228651786d6.53.1793725296258; Tue, 03 Nov 2026
 09:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
 <20261103094531.39610-2-jaipaul.cheernam@est.tech> <CANNYZj_a3nx5kaDMSLT2wNaSQ1sBekvamBfiDL1hVT8okk7FgA@mail.gmail.com>
 <dd61a3c8-2dd4-43de-8d10-6d8cb1e71b2c@est.tech>
In-Reply-To: <dd61a3c8-2dd4-43de-8d10-6d8cb1e71b2c@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Nov 2026 18:01:24 +0100
X-Gm-Features: AclHuK9MgEPyeRpG9XzrLnrGZVpeWemY4oJ5qNhiJNTaNHcbl7qiRn2qUt63Zds
Message-ID: <CANNYZj8Jf5=ZsP7+2n9PhjGiiHBbg_y-K63aOX5_G1BSZ7mh4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] lttng-tools: Extend recipe for nativesdk variant
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001bb363065f6237ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 17:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249290

--0000000000001bb363065f6237ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 at 16:56, Jaipaul Cheernam <jaipaul.cheernam@est.tech>
wrote:

> Some of our product modules link directly against liblttng-ctl, so we
> need nativesdk-lttng-tools for the headers, libraries and .pc files in
> the SDK sysroot.
>
> We also use the LTTng host tools for development and testing against
> target hardware =E2=80=94 configuring sessions with lttng, receiving live=
 traces
> through lttng-relayd, and inspecting them with Babeltrace. Keeping these
> tools in the SDK also ensures the host tooling matches the LTTng version =
on
> the target and avoids version issues.
>
> So the goal is to support cross-linking and the complete host-side tracin=
g
> workflow, rather than adding lttng-tools to the target image.
>
The problem is that this variant isn't going to be tested in oe-core. So
someone might run 'bitbake nativesdk-lttng-tools' on master and it will
fail to build because the yocto autobuilder hasn't tested it. Or it will
build, but won't actually work when placed into a SDK.

There's also a broader problem is that it isn't going to be used in oe-core
for anything, and is there simply because one project user needs it for
their own proprietary work. If we start accepting such extensions, then we
might as well have every recipe extended to nativesdk and native variants.

I think you should keep this in .bbappends.

Alex

--0000000000001bb363065f6237ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 3 Nov 2026 at 16:56, Jaipaul Chee=
rnam &lt;jaipaul.cheernam@est.tech&gt; wrote:</div><div class=3D"gmail_quot=
e gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<u></u>

 =20
  <div><p><span>Some of our product modules link directly against </span><c=
ode><span>liblttng-ctl</span></code><span>,
        so we need </span><code><span>nativesdk-lttng-tools</span></code><s=
pan>
        for the headers, libraries and </span><code><span>.pc</span></code>=
<span>
        files in the SDK sysroot.</span></p>
    <p><span>We also use the LTTng host tools for development and
        testing against target hardware =E2=80=94 configuring sessions with=
 </span><code><span>lttng</span></code><span>,
        receiving live traces through </span><code><span>lttng-relayd</span=
></code><span>,
        and inspecting them with Babeltrace. Keeping these tools in the
        SDK also ensures the host tooling matches the LTTng version on
        the target and avoids version issues.</span></p><p><span>So the goa=
l is to support cross-linking and the complete
        host-side tracing workflow, rather than adding </span><code><span>l=
ttng-tools</span></code><span>
        to the target image.</span></p></div></blockquote><div>The problem =
is that this variant isn&#39;t going to be tested in oe-core. So someone mi=
ght run &#39;bitbake nativesdk-lttng-tools&#39; on master and it will fail =
to build because the yocto autobuilder hasn&#39;t tested it. Or it will bui=
ld, but won&#39;t actually work when placed into a SDK.</div><div><br></div=
><div>There&#39;s also a broader problem is that it isn&#39;t going to be u=
sed in oe-core for anything, and is there simply because one project user n=
eeds it for their own proprietary work. If we start accepting such extensio=
ns, then we might as well have every recipe extended to nativesdk and nativ=
e variants.</div><div><br></div><div>I think you should keep this in .bbapp=
ends.</div><div><br></div><div>Alex</div></div></div>

--0000000000001bb363065f6237ae--
