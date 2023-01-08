Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6053FC54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 19:24:13 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.52689.1673205848206641024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 11:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: aehs29@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id d123so3556656iof.6
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 11:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEddzcvKxiNWmo3oFU9yasXb9Pvtjbtgt1it5tBksQM=;
        b=vr0/kKEvz1lTLu0GqGdA+IXZgfrzHwIIHKJuRHTa0vtkbLlGmLNMa64v2rNLwmlw6g
         xiOeGVNTbpRfBSDuFHKZODQPY0AKnjh8t4QS0TqeOichZ4sfORPBlK9C1KbPDcLN75T2
         c58juJrkgAXXi34R2fPXIuirqHDFdsjhMbPGybsXXU68gayBm9Nd2S9Y5rHLFtKvUonG
         B5YqH7/GZi7tb0ZNUfD2thyMGSXqpPA2QzKmXOqQzCoFgJV8Z5+kwY7Jid9wOgt3aZkI
         FcdvQGOsGqFYr4+C8MeZaHL4UfywbHEhS2uR3GGGbn40eqzWAZMM6mMnBgwF01dyChrS
         5Hug==
X-Gm-Message-State: AFqh2kq1L3FKuc4TSy15Qip/v4ViNOzfbFjR4sRQNY9rZbbx2iQEECGW
	jS+RLIDQRviokSu7HjVdBY5z5fWnwKGLbw==
X-Google-Smtp-Source: AMrXdXuiEuAJ/vOCZgGgAKMC+pYukLZANqVxf46x8RVLmfnuGBO5AvFMjgAH5SDzy0HYWdxI638Jwg==
X-Received: by 2002:a5d:9954:0:b0:6ea:558f:6e4b with SMTP id v20-20020a5d9954000000b006ea558f6e4bmr39296711ios.19.1673205847282;
        Sun, 08 Jan 2023 11:24:07 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id x3-20020a056e020f0300b002ffbf49a0d2sm2145252ilj.84.2023.01.08.11.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 11:24:07 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id v2so3570622ioe.4
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 11:24:06 -0800 (PST)
X-Received: by 2002:a02:cc65:0:b0:398:d917:5c51 with SMTP id
 j5-20020a02cc65000000b00398d9175c51mr4700290jaq.42.1673205846641; Sun, 08 Jan
 2023 11:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20230108191525.1312582-1-alejandro@enedino.org> <17386B65ADE81E78.3916@lists.openembedded.org>
In-Reply-To: <17386B65ADE81E78.3916@lists.openembedded.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sun, 8 Jan 2023 12:23:55 -0700
X-Gmail-Original-Message-ID: <CAHMutrYSwxHe6DBrJ0Ls0rA83gXOmPv7hShJs37Fzb=dc2APEQ@mail.gmail.com>
Message-ID: <CAHMutrYSwxHe6DBrJ0Ls0rA83gXOmPv7hShJs37Fzb=dc2APEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] oe-selftest: Add baremetal toolchain test
To: alejandro@enedino.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020140905f1c5981f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 19:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175639

--00000000000020140905f1c5981f
Content-Type: text/plain; charset="UTF-8"

My apologies, last minute typo on this one, sending v2

Alejandro


On Sun, 8 Jan 2023 at 12:15, Alejandro Hernandez Samaniego via
lists.openembedded.org <alejandro=enedino.org@lists.openembedded.org> wrote:

> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> ---
>  meta/lib/oeqa/selftest/cases/baremetal.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/baremetal.py
>
> diff --git a/meta/lib/oeqa/selftest/cases/baremetal.py
> b/meta/lib/oeqa/selftest/cases/baremetal.py
> new file mode 100644
> index 0000000000..3f70feebad
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/baremetal.py
> @@ -0,0 +1,13 @@
> +
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake
> +
> +class BaremetalTest(OESelftestTestCase):
> +        self.write_config('TCLIBC = "baremetal"')
> +        bitbake('baremetal-helloworld')
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175638):
> https://lists.openembedded.org/g/openembedded-core/message/175638
> Mute This Topic: https://lists.openembedded.org/mt/96137380/3619605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alejandro@enedino.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000020140905f1c5981f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">My apologies, last minute typo on this one, sendi=
ng v2</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-ser=
if;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,sans-serif;font-size:small">Alejandro</div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,sans-serif;font-size:small"><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sun, 8 Jan 2023 at 12:15, Alejandro Hernandez Samaniego via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;alejandro=3D<a h=
ref=3D"mailto:enedino.org@lists.openembedded.org">enedino.org@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=
=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</=
a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/baremetal.py | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/baremetal.py<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/baremetal.py b/meta/lib/oeqa/self=
test/cases/baremetal.py<br>
new file mode 100644<br>
index 0000000000..3f70feebad<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/baremetal.py<br>
@@ -0,0 +1,13 @@<br>
+<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import bitbake<br>
+<br>
+class BaremetalTest(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;TCLIBC =3D &quot;bareme=
tal&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;baremetal-helloworld&#39;)<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175638): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175638" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175638</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96137380/3619=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96137380/3619605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alejandro@enedino.org" tar=
get=3D"_blank">alejandro@enedino.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000020140905f1c5981f--

