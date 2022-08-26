Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D970ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:44:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.35573.1661510690971625538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j7J0W13g;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id o4so1257832pjp.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3WNLDu6sHHE7wohZpqkNpZN8xSUQB2ca27roxGkPh4w=;
        b=j7J0W13gAA+c88KER6i1wOY+YbAVNbgp7vNca2OAR4YxqO81vm26YErnpq9glrnOqY
         s8RvXmv9MS+BdMCglabfL07YZWd8bfrNkDB6b6zk8yfkCxVJoWknlxw48UCs5lw505zu
         JbkHiwHsO89WhXMT6pPObhT5A3WlikpN8+ns3LwjY9FPEzz4qMjfGK3b3oWAsFjHxZlL
         MJ+9O+EWgVQZ2STYflsdcBA6W0xXqJMuMqiBgl8pD28i3rpk3Q89jfguPDn7bf0I1/2v
         +P0T1ckReB9RqJBp+yxvM4a4XI4jBhjzN4lvMifrvVWHUA4gI46kEixH11RPfEpWvnDn
         zTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3WNLDu6sHHE7wohZpqkNpZN8xSUQB2ca27roxGkPh4w=;
        b=NKretlsBk03/9pjeiM81fUyGtlTpS5T/BTMmD2f7WjRaL4dWekNKYPbDqdeqWL+zH/
         Q827SQJ6Xi4S0eW6vyKE2CNAoSVl3ayhyn2+KzDe9Fe+/+HKS4nGsAKxmnNfSQJKGd2e
         2yiHPmBI88PYV7A2vf6eIMWzZgND7qoMAW8HVnBS2t7Ixie13G76b3KI0DeRPTgXtURs
         e9JUkrZUMD9+tK6l/dmXqybRTQclCy29x4RY4bWbzLgLps7ZKla4JOuo8ARmpNPA3frs
         3PHskh3JmfZ/oSenI4bGIqkglBf/cwWnTkmxKwCd/66V6sbG3AWwi/HUWUpPnS/RKeNP
         DGIQ==
X-Gm-Message-State: ACgBeo3m9UgPpYFxBPEmGNLM4Z0bgAYovEed1WbklahlFeph2afNH9Jf
	BPTTHf+DTpZoh93bvGZdJzQKyCtUyrKY0v3Ol5sFvHnRzGY=
X-Google-Smtp-Source: 
 AA6agR7cPNoih9YwK/mdyT/J3RkHT4kLjdTrzqfx2hvW3gm171S1VtNaDTOWZjgPxqZ+RoAZhPAxWDDak5cpN9HzXDY=
X-Received: by 2002:a17:90a:c782:b0:1f7:a4ed:11a1 with SMTP id
 gn2-20020a17090ac78200b001f7a4ed11a1mr3790318pjb.12.1661510690409; Fri, 26
 Aug 2022 03:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <41c4c0ec-06e0-2709-33e6-982f320ed091@electromag.com.au>
In-Reply-To: <41c4c0ec-06e0-2709-33e6-982f320ed091@electromag.com.au>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 26 Aug 2022 11:44:39 +0100
Message-ID: 
 <CANPvuRn+ppJafFEgyHw6Eo_g3b_khDGuYDk+dzJdarGfifTLJQ@mail.gmail.com>
Subject: Re: [OE-core] bitbake fetchall & populate_sdk
To: Phil Reid <preid@electromag.com.au>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007e139605e7229a45"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 10:44:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169911

--0000000000007e139605e7229a45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phil,

To fetch all recipes needed to run a specified task you can run:

bitbake -c populate_sdk myimage --runall=3Dfecth

Jose

Phil Reid <preid@electromag.com.au> escreveu no dia sexta, 26/08/2022 =C3=
=A0(s)
06:25:

> G'day All,
>
> How can I run fetchall so that it will also fetch all package sources
> related to the sdk as well as the image.
>
> ie: "bitbake -c fetchall myimage" gets all the sources to build myimage,
> allowing a build to proceed without network access later.
>
> Out sdk however includes a few extra total for development purposes, so
> additional recipes need to download stuff when I run:
> bitbake -c populate_sdk myimage
>
> Done some googling and found one other person asking this, and the
> solution was to run
> bitbake -c fetchall universe
>
> Which seems a bit of overkill for the couple of extra packages I'm after.
>
>
> --
> Regards
> Phil Reid
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169902):
> https://lists.openembedded.org/g/openembedded-core/message/169902
> Mute This Topic: https://lists.openembedded.org/mt/93264443/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007e139605e7229a45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Phil,</div><div><br></div>To fetch all=
 recipes needed to run a specified task you can run:<br><br>bitbake -c popu=
late_sdk myimage --runall=3Dfecth<br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Jose</div><d=
iv dir=3D"ltr" class=3D"gmail_attr"><br>Phil Reid &lt;<a href=3D"mailto:pre=
id@electromag.com.au">preid@electromag.com.au</a>&gt; escreveu no dia sexta=
, 26/08/2022 =C3=A0(s) 06:25:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">G&#39;day All,<br>
<br>
How can I run fetchall so that it will also fetch all package sources relat=
ed to the sdk as well as the image.<br>
<br>
ie: &quot;bitbake -c fetchall myimage&quot; gets all the sources to build m=
yimage, allowing a build to proceed without network access later.<br>
<br>
Out sdk however includes a few extra total for development purposes, so add=
itional recipes need to download stuff when I run:<br>
bitbake -c populate_sdk myimage<br>
<br>
Done some googling and found one other person asking this, and the solution=
 was to run<br>
bitbake -c fetchall universe<br>
<br>
Which seems a bit of overkill for the couple of extra packages I&#39;m afte=
r.<br>
<br>
<br>
-- <br>
Regards<br>
Phil Reid<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169902): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169902" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169902</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93264443/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93264443/5052612</a><br>
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

--0000000000007e139605e7229a45--

