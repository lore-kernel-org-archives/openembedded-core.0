Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE4DEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:00:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.2224.1687536018485429044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SjSPcCdr;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b479d53d48so14441331fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 09:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687536017; x=1690128017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VZxpzaJyT87bvbUzA4ou39XyFhvOR1j5pEUEYVf9L6E=;
        b=SjSPcCdrhUQTXJZZZaSKoLkuqi4zX/ejSrQecf82675t9xqZfPLLR4xK5R+Bz1M+Tl
         amnJ/0K64c+jwfrDpxhvsuBmjStl80Bizy+8UDrVjx6qX5BiVJcJ0zfB32HBvvKZqReL
         IANiI9PxIRAMTaXSd9m5gWBAXGNifaRxn34HpLDy4Dj8APYM7vcDM6Km3Ga6bYlahBwq
         LXrfOHEXtuXOdaKNpdiP7f72CGg7s4t6svgIa4BjxQh/9Fbec/1YJL7H0Y8Mqiesk6jl
         bMO9EE2JKfQwXTy7+kKP3JYl5+HrL5YVDm8LxPhAfQTbWKoyU3r/hogQVTXoeM4npu+F
         HEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687536017; x=1690128017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZxpzaJyT87bvbUzA4ou39XyFhvOR1j5pEUEYVf9L6E=;
        b=YzTtti+OKPSYZtbFjyrpYC9iGgFBRCGfLbKJHoA4tEWIyZyXuzOoLd/BRR6500LIIE
         U/zg63iJTWEVK2h9EjygXURcSW0uIrVdCBEPCXHgg5X3tsGti//lthQP3hyMUwbsbw8g
         +I321B8H6NzIor8b4gAJonCpCTSU8Yy5dKzWcGuMMSgLIRQKB1p+hd+AYs+T5fksZ0a1
         HqNRtxytJpgqQ6pdnSuPmYGLhoxtUCVFCLpLakCsSC2Av8CgRLAR+qLp9KjzgP4PZOxn
         10fSkI3RqcbDy/gJ9t1AKAnFNw+//0G3h8jCDA9dWwYKRgkQvQFqw6b2IubqIcn6rCoz
         vbmg==
X-Gm-Message-State: AC+VfDx75LhabojFDv/4mXwuV8qir3oEeGSfbu9UnyM9VneT/c9K6lDi
	eCu1elMNpKju0Ac8GQhgoiMXhYT8mciMLd1BvCM=
X-Google-Smtp-Source: ACHHUZ76fbPYKrkNwioTbpbhAzg0U7Nl3cgIOBGS7ya4FL1gwYW/TfuZ4X7ztXyzHOAxUjviwSUBvZoPROere578scg=
X-Received: by 2002:a2e:95d7:0:b0:2b4:65bf:d7b with SMTP id
 y23-20020a2e95d7000000b002b465bf0d7bmr11818339ljh.2.1687536016366; Fri, 23
 Jun 2023 09:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230623123250.726731-1-ross.burton@arm.com> <20230623123250.726731-3-ross.burton@arm.com>
In-Reply-To: <20230623123250.726731-3-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 23 Jun 2023 12:00:03 -0400
Message-ID: <CAApg2=Tc=rSXz6F76-dcXYjd9UEyRqJTeC+Ewecnts3Ea9e7Rw@mail.gmail.com>
Subject: Re: [PATCH 3/4] cve-update-nvd2-native: handle all configuration
 nodes, not just first
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cd243b05fece1822"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183336

--000000000000cd243b05fece1822
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023, 08:32 , <ross.burton@arm.com> wrote:

> From: Ross Burton <ross.burton@arm.com>
>
> Some CVEs, such as CVE-2013-6629, list multiple configurations which are
> vulnerable. The current JSON parser only considers the first
> configuration.
>
> Instead, consider every configuration. We don't yet handle the AND/OR
> logical operators, but this is a step in the right direction.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 2b585983ac7..0c627ef2623 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -323,11 +323,12 @@ def update_db(conn, elt):
>                  [cveId, cveDesc, cvssv2, cvssv3, date,
> accessVector]).close()
>
>      try:
> -        configurations = elt['cve']['configurations'][0]['nodes']
> -        for config in configurations:
> -            parse_node_and_insert(conn, config, cveId)
> +        for config in elt['cve']['configurations']:
> +            # This is suboptimal as it doesn't handle AND/OR and negate,
> but is better than nothing
> +            for node in config["nodes"]:
> +                parse_node_and_insert(conn, node, cveId)
>      except KeyError:
> -        bb.debug(2, "Entry without a configuration")
> +        bb.debug(2, "CVE %s has no configurations" % cveId)
>
>  do_fetch[nostamp] = "1"
>

Looks good to me, thank you Ross.

Regards,
Marta

>

--000000000000cd243b05fece1822
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 23 Jun 2023, 08:32 , &lt;<a href=3D"mailto:ros=
s.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.c=
om" target=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
<br>
Some CVEs, such as CVE-2013-6629, list multiple configurations which are<br=
>
vulnerable. The current JSON parser only considers the first<br>
configuration.<br>
<br>
Instead, consider every configuration. We don&#39;t yet handle the AND/OR<b=
r>
logical operators, but this is a step in the right direction.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a=
> | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-nativ=
e.bb</a> b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.=
bb</a><br>
index 2b585983ac7..0c627ef2623 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a=
><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a=
><br>
@@ -323,11 +323,12 @@ def update_db(conn, elt):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[cveId, cveDe=
sc, cvssv2, cvssv3, date, accessVector]).close()<br>
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 configurations =3D elt[&#39;cve&#39;][&#39;con=
figurations&#39;][0][&#39;nodes&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in configurations:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_insert(conn, conf=
ig, cveId)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in elt[&#39;cve&#39;][&#39;configur=
ations&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is suboptimal as it doesn=
&#39;t handle AND/OR and negate, but is better than nothing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for node in config[&quot;nodes&q=
uot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_ins=
ert(conn, node, cveId)<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Entry without a configuratio=
n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;CVE %s has no configurations=
&quot; % cveId)<br>
<br>
=C2=A0do_fetch[nostamp] =3D &quot;1&quot;<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Looks good to me, thank you Ross.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=
=3D"auto">Marta</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"></blockquote></div></div></div>

--000000000000cd243b05fece1822--

