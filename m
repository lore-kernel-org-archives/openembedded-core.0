Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C08EC77B73
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 06:00:03 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.22566.1682229595255777576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 22:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=VXwGvhbc;
 spf=pass (domain: mvista.com, ip: 209.85.208.180, mailfrom: skulkarni@mvista.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2a8bae45579so28856491fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 22:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682229593; x=1684821593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IH65uhZctsfackKCAsyfzbGdY+1UMcyXKqCsoruP4Yg=;
        b=VXwGvhbcqss2GEU8tD4CT+AxnKwp/L11HBgMtUTBRYTTYo6T3Ut7zlWPoqF8/f1pyA
         KGKS0Lovae52P3/LR4c6EozjZpu4g7Xg1mSUC+GUhBpKNvs6TtF+XawfAbaiG9OY3Rg7
         jM+yhQq3vGONWKsy12LV7mqNIJ1ZkCirXk868=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682229593; x=1684821593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH65uhZctsfackKCAsyfzbGdY+1UMcyXKqCsoruP4Yg=;
        b=GxWS8do3iw0E8H9cHbylrc3R8o4SRK9HsRoZbl7m4j+DnsguK5QTt08o1MgkGh5HE9
         ba3Pje7d66xyqHob0Etu9JLKLoAbtbgVcKu9KPG2HzOK0SrwN8o8VDyEcVR0fBUHaoH1
         YfKqjyn4rDPbCJ1ud5GKIkxbtvLu9cTGn0scvlXcDqRrnxUgAXdocZwpIXCsR+vucaUI
         T0DOqQcPoUqXfvkGqbVLpAecPrYQQ9MtPXPjFpCToZyFp/Zot3M+QZKueLD+lg3Bx0dg
         sWSoLfuLviYz55N4XJu0CfyShsUsDhB4ZlYaSi6yTEHwpYLsFCt9NIYprnvZHIRaPGup
         bMvw==
X-Gm-Message-State: AAQBX9fXedIcwedq0Gqh0M/SlHr749hAes6E2M8jScfenTIKQdUtYz9x
	oCpOUv1znGlYY8Ays2SZhv5zRuXa5wf6eAVNupW9xw==
X-Google-Smtp-Source: AKy350YiCWzWd5SRfS+RY9/vWY6SaS/3h7jf+doitSUeijdkZrXr/gYAVQ1OSq3XD5SysLg+STJqcVHm5gJr4qcI9rw=
X-Received: by 2002:a2e:884f:0:b0:2a8:a5b8:184a with SMTP id
 z15-20020a2e884f000000b002a8a5b8184amr1991254ljj.40.1682229592949; Sat, 22
 Apr 2023 22:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230421112447.21966-1-skulkarni@mvista.com> <CAKzga+z6NaV9QyyzQKFuAniM9VkZvuC4zm2xyQQaGaQPa+JJog@mail.gmail.com>
 <CAOSpxdZxCLXJWba62z7Js-y0sS3ax14mC26jcZvZZ3fRY7MHcQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZxCLXJWba62z7Js-y0sS3ax14mC26jcZvZZ3fRY7MHcQ@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Sun, 23 Apr 2023 11:29:41 +0530
Message-ID: <CAKzga+yaXYPsoHxqEoAjp=AWmPUm-qYTyMQUJype-BFipQmZVg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Ignore CVE-2022-1705
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000519c3605f9fa99da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 06:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180327

--000000000000519c3605f9fa99da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I resent the patch (
https://lists.openembedded.org/g/openembedded-core/message/180326). Please
let me know if this is ok OR shall I need to send it as v2 ?

Thanks,
Shubham

On Sun, Apr 23, 2023 at 3:52=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:

> I don't see the patch on this list or in patchworks.  Could you please
> resend?
>
> Thanks,
>
> Steve
>
> On Sat, Apr 22, 2023 at 6:12=E2=80=AFAM Shubham Kulkarni <skulkarni@mvist=
a.com>
> wrote:
> >
> > Hi Steve,
> >
> > Is there any issue with this patch? It's not included in the patch
> review list email.
> >
> > Thanks,
> > Shubham
> >
> > On Fri, 21 Apr, 2023, 4:54 pm Shubham Kulkarni, <skulkarni@mvista.com>
> wrote:
> >>
> >> From: Shubham Kulkarni <skulkarni@mvista.com>
> >>
> >> The vulnerability was introduced in go1.15beta1 with commit d5734d4.
> >> Dunfell uses go1.14 version which does not contain the affected code.
> >>
> >> Ref: https://security-tracker.debian.org/tracker/CVE-2022-1705
> >>
> >> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> ---
> >>  meta/recipes-devtools/go/go-1.14.inc | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> >> index 8df9d62612..961e233fe6 100644
> >> --- a/meta/recipes-devtools/go/go-1.14.inc
> >> +++ b/meta/recipes-devtools/go/go-1.14.inc
> >> @@ -85,3 +85,6 @@ CVE_CHECK_WHITELIST +=3D "CVE-2022-30630"
> >>
> >>  # This is specific to Microsoft Windows
> >>  CVE_CHECK_WHITELIST +=3D "CVE-2022-41716"
> >> +
> >> +# Issue introduced in go1.15beta1, does not exist in 1.14
> >> +CVE_CHECK_WHITELIST +=3D "CVE-2022-1705"
> >> --
> >> 2.40.0
> >>
>

--000000000000519c3605f9fa99da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>I resent the patch (<a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/180326">http=
s://lists.openembedded.org/g/openembedded-core/message/180326</a>). Please =
let me know if this is ok OR shall I need to send it as v2 ?</div><div><br>=
</div><div>Thanks,</div><div>Shubham</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 23, 2023 at 3:52=E2=
=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakom=
an.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">I don&#39;t see the patch on this list or in patchworks.=C2=A0 Could =
you please resend?<br>
<br>
Thanks,<br>
<br>
Steve<br>
<br>
On Sat, Apr 22, 2023 at 6:12=E2=80=AFAM Shubham Kulkarni &lt;<a href=3D"mai=
lto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Is there any issue with this patch? It&#39;s not included in the patch=
 review list email.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Shubham<br>
&gt;<br>
&gt; On Fri, 21 Apr, 2023, 4:54 pm Shubham Kulkarni, &lt;<a href=3D"mailto:=
skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com"=
 target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The vulnerability was introduced in go1.15beta1 with commit d5734d=
4.<br>
&gt;&gt; Dunfell uses go1.14 version which does not contain the affected co=
de.<br>
&gt;&gt;<br>
&gt;&gt; Ref: <a href=3D"https://security-tracker.debian.org/tracker/CVE-20=
22-1705" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debi=
an.org/tracker/CVE-2022-1705</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mv=
ista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/go/go-1.14.inc | 3 +++<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-d=
evtools/go/go-1.14.inc<br>
&gt;&gt; index 8df9d62612..961e233fe6 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/go/go-1.14.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14.inc<br>
&gt;&gt; @@ -85,3 +85,6 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-30630&qu=
ot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # This is specific to Microsoft Windows<br>
&gt;&gt;=C2=A0 CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-41716&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# Issue introduced in go1.15beta1, does not exist in 1.14<br>
&gt;&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-1705&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.40.0<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000519c3605f9fa99da--

