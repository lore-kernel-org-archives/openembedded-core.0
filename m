Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AE5CCA479
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 22:16:20 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.4610.1656454573326496340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fI27aI5C;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id r9so11271303ljp.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vCG4xMcV59MZHrewGZXxVKVW5pnsozzSuZGNY48NS7Y=;
        b=fI27aI5COQ7/0JOrwaGPIAqLhRwTROVEEyPcByC+8ekkfns1o1kD8p6SFje0k2LM7s
         r7a6cZsCJIfQR/l/OwyyYUYeSwyJUxQLMADlxpd7GF2wfXzAprNaGH/XCuiRuwv8pn31
         M7bvpeWMwKON591ao5/34/Ne0OzpYZKGyNNlmLZhF9ImpM9smjIXNf35+CuLx7yS/ICW
         8X3H8VOZgvSTD1ZzVg48IXWnI10pEmtey6KZmYsd3BSOh6RSkYwRhNW+airmrbR34gom
         BCsCe/j/PSAb39XLp4hKvlBXXF9xX/ZgtWi+j+33Zv2Tka6oQdYpVjsvgRwmLn7CsB2c
         n2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCG4xMcV59MZHrewGZXxVKVW5pnsozzSuZGNY48NS7Y=;
        b=cxPFwzzBEZDwD1wpMlz2+WbJpUncqp6FDOhQAXvDVRdgnimbZUMyas9bGx23sPypJV
         5j13jMnyROlsEI2a78Exk+eiUn5WNuopR+lFE9sg6BgUVeINi8bnDb6NlgEWtVzDCZbR
         3Y03ooSZRqfXtGyvMV9ilurStb3CFKc3wjAyK3HSZrnQoLZXu6aaNxoZK1JKm6CIV0cP
         lg37eX6v70/cHHF+CfGSbAZnIxycIBsO0LO2dmg+mxrPt/AN0Tg8UuI/53XWq10M4vtH
         VeryrxFO7Vyzh56Y/zL8CPfI+DgXq2VqtiSbRhXTjaZlO43HhcOBvDn+Fas4LiAUVAZA
         FSmw==
X-Gm-Message-State: AJIora9PHX1eTZKhjXfKZ8PTcfxR/CuVPpGA+l80gBgbSgut+rg4FTLO
	9WIyWTHE+ZjLeGTI6UIwwrjSdFGgV7IF0IRc0ZkuXph9
X-Google-Smtp-Source: 
 AGRyM1s4DJ25WMm5J9BMXKbKEHG9KJDEWZCYP4flpolFD2io/TZ+IkzIH6cqgSTiBgDTD8IYeuB2rdwMNj2zbnh0KTs=
X-Received: by 2002:a2e:a483:0:b0:25b:c3c6:8559 with SMTP id
 h3-20020a2ea483000000b0025bc3c68559mr33670lji.273.1656454571672; Tue, 28 Jun
 2022 15:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
 <20220628133713.3390786-3-davide.gardenal@huawei.com>
In-Reply-To: <20220628133713.3390786-3-davide.gardenal@huawei.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 28 Jun 2022 23:16:00 +0100
Message-ID: 
 <CANPvuRnfYG82y7Bzsk82G7rtiCqVAGgM-rqMtgBadGSSaUvX-A@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH 3/5] lib/oe/utils: create
 get_current_recipe_layer function
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000054c91305e289621f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 22:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167356

--00000000000054c91305e289621f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Davide,

Davide Gardenal <davidegarde2000@gmail.com> escreveu no dia ter=C3=A7a,
28/06/2022 =C3=A0(s) 14:38:

> get_current_recipe_layer returns the recipe layer given its
> file path.
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/lib/oe/utils.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 46fc76c261..4e17b1b40e 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -584,3 +584,11 @@ def directory_size(root, blocksize=3D4096):
>          total +=3D sum(roundup(getsize(os.path.join(root, name))) for na=
me
> in files)
>          total +=3D roundup(getsize(root))
>      return total
> +
> +def get_current_recipe_layer(d):
> +    """
> +    Extract the recipe layer from it's path.
> +    Returns the layer name.
> +    """
> +    fdir_name  =3D d.getVar("FILE_DIRNAME")
> +    return fdir_name.split("/")[-3]
>

This doesn't seem very safe as you are assuming that all layers use the
same directory structure for placing the recipes.
So for example dynamic layer will not work with this patch.

Jose


> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167341):
> https://lists.openembedded.org/g/openembedded-core/message/167341
> Mute This Topic: https://lists.openembedded.org/mt/92043904/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000054c91305e289621f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Davide,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Davide Gardenal &lt;<a href=3D"mailto:david=
egarde2000@gmail.com">davidegarde2000@gmail.com</a>&gt; escreveu no dia ter=
=C3=A7a, 28/06/2022 =C3=A0(s) 14:38:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">get_current_recipe_layer returns the recipe layer give=
n its<br>
file path.<br>
<br>
Signed-off-by: Davide Gardenal &lt;<a href=3D"mailto:davide.gardenal@huawei=
.com" target=3D"_blank">davide.gardenal@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/utils.py | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index 46fc76c261..4e17b1b40e 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -584,3 +584,11 @@ def directory_size(root, blocksize=3D4096):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total +=3D sum(roundup(getsize(os.path.jo=
in(root, name))) for name in files)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total +=3D roundup(getsize(root))<br>
=C2=A0 =C2=A0 =C2=A0return total<br>
+<br>
+def get_current_recipe_layer(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Extract the recipe layer from it&#39;s path.<br>
+=C2=A0 =C2=A0 Returns the layer name.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 fdir_name=C2=A0 =3D d.getVar(&quot;FILE_DIRNAME&quot;)<br>
+=C2=A0 =C2=A0 return fdir_name.split(&quot;/&quot;)[-3]<br></blockquote><d=
iv><br></div><div>This doesn&#39;t=C2=A0seem very safe as you are assuming =
that all layers use the same directory structure for placing the recipes.=
=C2=A0</div><div>So for example dynamic=C2=A0layer will not work with this =
patch.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167341): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167341" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167341</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92043904/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92043904/5052612</a><br>
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

--00000000000054c91305e289621f--

