Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DC1C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:43:14 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.4259.1667382190730877868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cj8EvhQM;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id b9so9392256ljr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT31b47bgDBOYT02hOMjoNsUKQ5sfcOVzxDJWIZCbCo=;
        b=cj8EvhQMZtgmtvyePfgLxLNqZy6Eg6lbva04xWq/VlmhHhox7RmAdaGnN9i1r4iVgA
         f3IdSlmTHHnL4NoVypmhBDA1b0tjSJKIHeLGhBV4ZnQ7U3oxrLz84pt6Ei00f9CAzmTh
         7tAPD12oO3KY8eRV9mQ7bHemZySLZgtfgJFtJn962KwqvPp1bpxjYhPbz4em7ZPf2YaI
         XFSqEDfRwAv9Anpz8zbqLmKHhsID0ChfzSIycnNLgjfe5oJCv/8gqArBbHiF7VObGHz+
         w6E562GpOA1fTqU+VWkaMzPLr74F6u+WJ7vGoN8vzbLtsYb/UoonEQeo6vezDb9+gBU2
         IAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT31b47bgDBOYT02hOMjoNsUKQ5sfcOVzxDJWIZCbCo=;
        b=aO7XwriI/opBequ4Bl9X53ZXYjrEKuAxG388/d2fouiNZ2CnLW3Yh4LHdxYnvEwtdY
         3KmECLsEQhexb7P/3KWYz+YsflT8ib/7MjB4d+ThT3pHic1YnGQoNAMklgw6Dh5kmHCh
         bcrCZ/TLm8F4jow4zCjh9UKXXWySfCdMJjInhKwlrxRV5u7BixXfXvSl5IiTfh20td7F
         7ytx47+5nKZhkM9KC8xHLGr4pfUn04u/BwvpfTEpvAXNd1PhOIfs+vWT7wcm4ze6aI4b
         KsrAwTRuavgINZDfgnYEpyyqxOSyIhBfe2Es6SgkwKwcVjLMAeAOHu4wFOMkXNoptHDx
         0Rqw==
X-Gm-Message-State: ACrzQf3tbr6Lv23wp/iz/Lz7TOwiVRwnatp+42pD+uOaP58d8BSeRG9k
	7MaBo9PpQiGDpqw0gt1hqwfsRuwL2knlfaVjdFA=
X-Google-Smtp-Source: AMsMyM5L2oGjN4BsGsH835FLL0NjunVSNBF5XpbQgss/deLChn6Z5wJIezOfTJncV64Rpqf1mWsvkv50SrqqMgmsp+w=
X-Received: by 2002:a2e:a785:0:b0:277:6076:31ba with SMTP id
 c5-20020a2ea785000000b00277607631bamr4722512ljf.159.1667382188690; Wed, 02
 Nov 2022 02:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221014152245.243292-1-jose.quaresma@foundries.io> <171DF8E2F2B472D4.2422@lists.openembedded.org>
In-Reply-To: <171DF8E2F2B472D4.2422@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Nov 2022 09:42:13 +0000
Message-ID: <CANPvuRntRt1e33kujzgs_=K_FSoOOj0N7KCKkyoiyrSynDJc9w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] archiver: avoid using machine variable as
 it breaks multiconfig
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000000fe53f05ec79abea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 09:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172581

--0000000000000fe53f05ec79abea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are there any issues with this patch or the oe-selftest in the previous one
that I need to address?

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 14/10/2022 =C3=A0(=
s)
16:24:

> From: Jose Quaresma <quaresma.jose@gmail.com>
>
> STAGING_KERNEL_DIR uses the MACHINE name so it breaks the multiconfig
> and in this cases it will run the shared recipes twice, one for each
> machine.
>
> STAGING_KERNEL_DIR it's been introduced in commit 5487dee2e1
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/archiver.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 0710c1ec5e..4049694d85 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -465,7 +465,7 @@ def is_work_shared(d):
>      pn =3D d.getVar('PN')
>      return pn.startswith('gcc-source') or \
>          bb.data.inherits_class('kernel', d) or \
> -        (bb.data.inherits_class('kernelsrc', d) and d.getVar('S') =3D=3D
> d.getVar('STAGING_KERNEL_DIR'))
> +        (bb.data.inherits_class('kernelsrc', d) and
> d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
>
>  # Run do_unpack and do_patch
>  python do_unpack_and_patch() {
> --
> 2.38.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171736):
> https://lists.openembedded.org/g/openembedded-core/message/171736
> Mute This Topic: https://lists.openembedded.org/mt/94328945/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000fe53f05ec79abea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Are there any issues with this patch or the=C2=A0oe-s=
elftest in the previous one that=C2=A0I need to address?</div><div><br></di=
v>Jose<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Jose Quaresma via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia sext=
a, 14/10/2022 =C3=A0(s) 16:24:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
<br>
STAGING_KERNEL_DIR uses the MACHINE name so it breaks the multiconfig<br>
and in this cases it will run the shared recipes twice, one for each<br>
machine.<br>
<br>
STAGING_KERNEL_DIR it&#39;s been introduced in commit 5487dee2e1<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/classes/archiver.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass<=
br>
index 0710c1ec5e..4049694d85 100644<br>
--- a/meta/classes/archiver.bbclass<br>
+++ b/meta/classes/archiver.bbclass<br>
@@ -465,7 +465,7 @@ def is_work_shared(d):<br>
=C2=A0 =C2=A0 =C2=A0pn =3D d.getVar(&#39;PN&#39;)<br>
=C2=A0 =C2=A0 =C2=A0return pn.startswith(&#39;gcc-source&#39;) or \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.inherits_class(&#39;kernel&#39;, =
d) or \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (bb.data.inherits_class(&#39;kernelsrc&#39;, d=
) and d.getVar(&#39;S&#39;) =3D=3D d.getVar(&#39;STAGING_KERNEL_DIR&#39;))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (bb.data.inherits_class(&#39;kernelsrc&#39;, d=
) and d.expand(&quot;${TMPDIR}/work-shared&quot;) in d.getVar(&#39;S&#39;))=
<br>
<br>
=C2=A0# Run do_unpack and do_patch<br>
=C2=A0python do_unpack_and_patch() {<br>
-- <br>
2.38.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171736): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171736" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171736</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94328945/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94328945/5052612</a><br>
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
 Quaresma</div></div></div></div></div>

--0000000000000fe53f05ec79abea--

