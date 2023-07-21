Return-Path: <ycnakajsph@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C87EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:25:09 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.3525.1689931506047853983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 02:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fIY6mxiB;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: ycnakajsph@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-579de633419so19487067b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689931505; x=1690536305;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qimfTMilOur/Kpt1tj95qvB5dWAkY6+8+zsXu+K6uGA=;
        b=fIY6mxiBX0VRw/DcEi2dk0ss6Y2mN5MfGqjPIdJaw4L4+bbcR3GPFlLeMUTOdNnBdX
         WOFYgPqfEct0PZBpYJxYz7+1+cJvhhk8fQsTG2PjDsWmqioh1HuEuoonumkwDP0FKMk4
         KpuCN4icMI++XxVdO7G0fjRV/NXGwhaw1fwz37aBn+gs7J6K3Meec8qYr7lyRzG2FOC+
         FOKyyr4n2fn5QBqrtZfbrOq0PS1EuIGPnLwws+LKXS6YkQiY2vlz7EFXogBzwphY2q9A
         6cdUHceVUBUpm3YUYz8NjBEjpe1HY1XMO4JuW+tvQuR6t6DOpyDkKeihG/6uNh3J5aSF
         8mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689931505; x=1690536305;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qimfTMilOur/Kpt1tj95qvB5dWAkY6+8+zsXu+K6uGA=;
        b=lAPFmxlHUIaLHbzSUtO7NXaVQ+JNdWfAa4JSgQ7fDEtHRcnlSByb9o414GnEVZdoMR
         XbvKyF8NV4YZ+QoJnm0ZyrTSJJjuiE8/mZ7IQRDrJeX4VzaiHWpQiz7JFMJu8oYZs/vK
         z1rQSQ75CbZDtNQ973ANwCroQe9iNkmSuYYG83Xz7CIghm2kSGUmh8J8dYz/TjuuYaUQ
         AaumdNsDN/N/O0uTWz9x8f7rW9zhyJrZLEIpkOc+3JcdR5dvpCat/6fJyFgQfvONrett
         qSa+HvyYgLxn3FrJ8FdXuUHzX8SZsX3UfmXPrdtNc1bKGHq+hwnrA6kf7bK4cPIyEKhl
         K6rg==
X-Gm-Message-State: ABy/qLalLActU9XuhMaeUGYyJpCB+Rn1fMPto+FeQwCGXpYghk18QLJa
	fhw31g6HaI/P4Tm6nbf78EP9pqKQLaQPc8kRSTjv0AAFdko=
X-Google-Smtp-Source: APBJJlHLc9z3yB3c2/lsI+AXYb+gJ2irNN3q9zQ26phEwE5v4j3oYdD9MBfI3F/0OiebJHIWxftygNc4jOOazAt6FuE=
X-Received: by 2002:a81:5a55:0:b0:56d:3d83:15cb with SMTP id
 o82-20020a815a55000000b0056d3d8315cbmr1298771ywb.44.1689931504900; Fri, 21
 Jul 2023 02:25:04 -0700 (PDT)
MIME-Version: 1.0
From: Yann CARDAILLAC Pro <yann.cardaillac@gmail.com>
Date: Fri, 21 Jul 2023 11:24:53 +0200
Message-ID: <CAC3TgA+XEUtkpJ4U98Nn=CeRt9+CWWPj1XuZ8A0x+UVti4fv7g@mail.gmail.com>
Subject: [yocto][bitbake] variable expansion in files
To: openembedded-core@lists.openembedded.org
Cc: mbadreau.ext@esme-solutions.com, contact@coreycothrum.com, 
	ycardaillac.ext@esme-solutions.com
Content-Type: multipart/alternative; boundary="0000000000000b61780600fbd71a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184678

--0000000000000b61780600fbd71a
Content-Type: text/plain; charset="UTF-8"

Hi,

There's something that has always been missing in my experience of Yocto,
it's the ability to simply configure files with yocto variables.

Basically the idea is to have a class that will automatically sed all
variables from yocto inside a file using a delimiter, or to reuse the way
it is done with .wks.in with the ${var} syntax, even if I can already see
some limitations with shell scripts.

What I intend to do is to provide some variables to a recipe and then to
use them to complete a template.

For instance I'd like to put some stuff inside my machine.conf and want
those variables to be filled inside my templated script.

Is there any official way to do this?

As far as I can see there's not, the only examples I've found are using
hand made seds. But I might not be looking in the right place.

If I'm right, I'm wondering why this is not generalized inside a poky
class. I've found this meta :
https://github.com/coreycothrum/meta-bitbake-variable-substitution doing
exactly what I needed, but since it's not mainline I assume that as always
there's a good reason why it's not something you want to have in mainline.

If that's only because there wasn't any submission and If you're up for it
going mainline, I can work (with coreycothrum if he wants to?) it through
the patch submission process.

Best regards,

Yann CARDAILLAC,
--------------------------------------------------------------------------------------------------------------------
Embedded Linux Engineer
Embedded Systems, Computer Science & Electronics, @Polytech Sorbone
--------------------------------------------------------------------------------------------------------------------
Phone : +33669909858
--------------------------------------------------------------------------------------------------------------------
Linkedin : https://www.linkedin.com/in/yann-c-39b64012b/
Website: https://ycardaillac.fr

--0000000000000b61780600fbd71a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>There&#39;s something th=
at has always been missing in my experience of Yocto, it&#39;s the ability =
to simply configure files with yocto variables.<br></div><div><br></div><di=
v>Basically the idea is to have a class that will automatically sed all var=
iables from yocto inside a file using a delimiter, or to reuse the way it i=
s done with .<a href=3D"http://wks.in">wks.in</a> with the ${var} syntax, e=
ven if I can already see some limitations with shell scripts.<br><br></div>=
<div>What I intend to do is to provide some variables to a recipe and then =
to use them to complete a template.=C2=A0</div><div><br></div><div>For inst=
ance I&#39;d like to put some stuff inside my machine.conf and want those v=
ariables to be filled inside my templated script.</div><div><br></div><div>=
Is there any official way to do this?<br></div><div><br></div><div>As far a=
s I can see there&#39;s not, the only examples I&#39;ve found are using han=
d made seds. But I might not be looking in the right place.<br></div><div><=
br></div><div>If I&#39;m right, I&#39;m wondering why this is not generaliz=
ed inside a poky class. I&#39;ve found this meta : <a href=3D"https://githu=
b.com/coreycothrum/meta-bitbake-variable-substitution">https://github.com/c=
oreycothrum/meta-bitbake-variable-substitution</a> doing exactly what I nee=
ded, but since it&#39;s not mainline I assume that as always there&#39;s a =
good reason why it&#39;s not something you want to have in mainline.</div><=
div><br></div><div>If that&#39;s only because there wasn&#39;t any submissi=
on and If you&#39;re up for it going mainline, I can work (with coreycothru=
m if he wants to?) it through the patch submission process.</div><div><br><=
/div><div>Best regards,<br></div><div><br></div><div><div><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r"><div>Yann CARDAILLAC,<br></div>-----------------------------------------=
---------------------------------------------------------------------------=
<br>
Embedded Linux Engineer<br>
Embedded Systems, Computer Science &amp; Electronics, @Polytech Sorbone<br>=
<div>
---------------------------------------------------------------------------=
-----------------------------------------</div><div>Phone : +33669909858</d=
iv><div>-------------------------------------------------------------------=
-------------------------------------------------</div><div>Linkedin :<a hr=
ef=3D"https://www.linkedin.com/in/yann-c-39b64012b/" target=3D"_blank"> htt=
ps://www.linkedin.com/in/yann-c-39b64012b/</a></div><div>Website: <a href=
=3D"https://ycardaillac.fr" target=3D"_blank">https://ycardaillac.fr</a></d=
iv></div></div></div></div></div>

--0000000000000b61780600fbd71a--

