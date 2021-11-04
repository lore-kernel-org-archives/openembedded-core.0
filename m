Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40539C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 20:04:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.3042.1636056264363584213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 13:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Esc9339D;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id g29so146658lfv.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 13:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mzJ1Hw1a9/860Oq6MRkoOdDDEBn+Ajs7YsgR1BIJVBY=;
        b=Esc9339D8eNCxAL1ItWyaoRdV7P2bRww3nNZqxQIQyHiLR/5/OCfoGh2+W/ApCe427
         OWNqriuDLsqJ2VXavC145h4kQL5hdBBhvp7E+JiX0d+2okGm1JnT2FTvndL2bacegFHQ
         AkZson+vW8ivwHFm6kzC4sYOGBdd9yQ+hb82ft15zSBclAHHqeSww/xbTq7uFVrv/R+j
         pnXO6SUWfvtEiWxcLTkJ4AegKdEzKhNVPTmFgMuvRl2765wVU5etJ8+d4CElJUQhdo9T
         qui/FcZfFztkcCWbtO5ETckg9OfAZDldl5/bhkOJQt0g4yU7IDSLRpIr7dIIuTbYhiD1
         Kq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mzJ1Hw1a9/860Oq6MRkoOdDDEBn+Ajs7YsgR1BIJVBY=;
        b=k92EeqnlpYRvvV5yh30ldWEWKbRTxhgOvJAxl2IqKP/QbH1FiRXGLzEolJr/94aH93
         eW6CQeUq5QMiHG8dGvcr+RINyeQhLfqaPcK+p9dFYhMv9QWO5d+Yfsxd+oIQ5/yUhkJ7
         BLWTkOJJ8S3X2J7T5StnS4A7uK13E6OUtmfjzmoF5I9LGHbJrM4Ldb4rcLAk+wGrZHUN
         zh+qlmufgu3vTYRaiSumsbgEjqPAiKI0Qafs0eGgeotJtl7RiWCdWTGclxm90Kffyq54
         3BNhResy4j06jRkTECsr0i10lY9zu3plZ74uXr1nKpjJ6NBTZKjgjDROLUBFVGTkGKY1
         1n6g==
X-Gm-Message-State: AOAM533Cq0aO0jcLYuyZpx1e1cb4teQ7bDJ0WtvN/3/RbgQKPuF804jN
	XlgdI/rblOc5Fe0S1Z+BCrldvREnsewF6A4i6ci83Qe6SnU=
X-Google-Smtp-Source: 
 ABdhPJxFGkwD5MrejEGyDH/bK8IlJxb5ZLfa5wE/qfz6uLnNVEUpZps5FN6nP1r1CMvXndtwNdvL7avchbZMWVLgfE0=
X-Received: by 2002:a05:6512:b21:: with SMTP id
 w33mr48173711lfu.447.1636056262630;
 Thu, 04 Nov 2021 13:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211102122639.2422915-1-ross.burton@arm.com>
 <bee9058cd7cf3c2d92f7eb7b85eb4ac382e9379b.camel@linuxfoundation.org>
In-Reply-To: 
 <bee9058cd7cf3c2d92f7eb7b85eb4ac382e9379b.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Nov 2021 20:04:11 +0000
Message-ID: 
 <CANPvuRkWwTe2LGHy3rzearuxiFESxWWt-FR_DcXfvDXjeOnb2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patch.bbclass: don't repr() the exception,
 use str()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005de3a905cffc0875"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 20:04:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157871

--0000000000005de3a905cffc0875
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
2/11/2021 =C3=A0(s) 12:36:

> On Tue, 2021-11-02 at 12:26 +0000, Ross Burton wrote:
> > repr() results in formatting characters such as extra quotation marks
> > which are pointless.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/patch.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> > index 8de7025491..079ee33e3c 100644
> > --- a/meta/classes/patch.bbclass
> > +++ b/meta/classes/patch.bbclass
> > @@ -155,7 +155,7 @@ python patch_do_patch() {
> >              resolver.Resolve()
> >          except bb.BBHandledException as e:
> >              bb.utils.remove(process_tmpdir, True)
> > -            bb.fatal("Applying patch '%s' on target directory '%s'\n%s=
"
> % (parm['patchname'], patchdir, repr(e).replace("\\n", "\n")))
>

Replace the "str(e)" with "repr(e).replace("\\n", "\n")" is a bit ugly, can
this be moved to bb.utils or something like that?

> +            bb.fatal("Applying patch '%s' on target directory '%s'\n%s"
> % (parm['patchname'], patchdir, str(e).replace("\\n", "\n")))
> >
> >      bb.utils.remove(process_tmpdir, True)
> >      del os.environ['TMPDIR']
>
> Full circle:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dec6edfc27f2cfa990d=
d0f8b2bbc6f9472a50a839
>
> :(
>
> (the original issue being that str(e) on exceptions can hide a lot of
> useful
> info)
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157776):
> https://lists.openembedded.org/g/openembedded-core/message/157776
> Mute This Topic: https://lists.openembedded.org/mt/86764324/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005de3a905cffc0875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia ter=C3=A7a, 2/11/2021 =C3=A0(s) 12:36:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Tue, 2021-11-02 at 12:26 +000=
0, Ross Burton wrote:<br>
&gt; repr() results in formatting characters such as extra quotation marks<=
br>
&gt; which are pointless.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/patch.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass<b=
r>
&gt; index 8de7025491..079ee33e3c 100644<br>
&gt; --- a/meta/classes/patch.bbclass<br>
&gt; +++ b/meta/classes/patch.bbclass<br>
&gt; @@ -155,7 +155,7 @@ python patch_do_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolver.Resolve()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.BBHandledException as e:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(proces=
s_tmpdir, True)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Applying pat=
ch &#39;%s&#39; on target directory &#39;%s&#39;\n%s&quot; % (parm[&#39;pat=
chname&#39;], patchdir, repr(e).replace(&quot;\\n&quot;, &quot;\n&quot;)))<=
br></blockquote><div><br></div><div>Replace the &quot;str(e)&quot; with &qu=
ot;repr(e).replace(&quot;\\n&quot;, &quot;\n&quot;)&quot; is a bit ugly, ca=
n this be moved to bb.utils or something like that?</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Applying pat=
ch &#39;%s&#39; on target directory &#39;%s&#39;\n%s&quot; % (parm[&#39;pat=
chname&#39;], patchdir, str(e).replace(&quot;\\n&quot;, &quot;\n&quot;)))<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bb.utils.remove(process_tmpdir, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 del os.environ[&#39;TMPDIR&#39;]<br>
<br>
Full circle:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dec6edfc27=
f2cfa990dd0f8b2bbc6f9472a50a839" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dec6edfc27f2cfa990dd0f8b2b=
bc6f9472a50a839</a><br>
<br>
:(<br>
<br>
(the original issue being that str(e) on exceptions can hide a lot of usefu=
l<br>
info)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157776): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157776" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157776</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86764324/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86764324/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000005de3a905cffc0875--

