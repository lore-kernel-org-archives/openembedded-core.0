Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8AEC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:55:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.13948.1672844102764857197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 06:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LqRSAAs0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h16so33184576wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 06:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWepRBcBsuepZoV45TGVnhDQO6oicfinv6h5yoqJE/k=;
        b=LqRSAAs0KNugmF24Fi8+yBLOD8ER3WqgwpgULA+f5BW8Rr7ZHdBj1eeyLHEvees5/x
         9kGLFjdYx2asR/d9JMU4aNr+Z1AFGdHFsQ/g4tnckGKprcnPd2IXRdrRY45vUghh+X/2
         hXUT9WHdkLFn8Q9QXK6r0HwjgH/1dOz7OV26dzwP2Lq01YpLS4JH11ek+YS8QVQEG2gp
         ayY2LOUEQXclSU58DZ+6ipGgJgOu5qwCSok86PX5pu1xplgsk22pXRvSAUWIwwPuWlIy
         5SZhKGN4iWLWIDSl+gFo0bCYijesJP3nZgQvoSaUsbVGsdt/mSsExfzS/lfZNte9eot8
         KMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWepRBcBsuepZoV45TGVnhDQO6oicfinv6h5yoqJE/k=;
        b=pX8jFj8bmKNOeJY87VlzP6D6u6AajdCfs3e0B20RC4CXk2iEWAun8lpkUsc079BMrQ
         YsCYmLzKtGaxYqlLFNFxdt82SOfbSNjIcNuMwppXn5DAsHeK04czG2Q55Ay9UqhhF5RA
         3dcHlteLjXWTY7ISn4b1nbe0FOibmzJ7bRJi7AKFSjA0+ehNu7kQUb9H5udfDcVoLbYu
         0zd/SMoEWCREIKLmaIwLi+FNejHrtPni0hzDsy3mF4QBEyP50c4jb5aoSB+va9c7i9Qx
         mSVEV6ez7XzERsMWdu5XRkKj4Ir89QOsjcnWJA0HgUjhaF5F4DXefzye5vKaMmO5n5j2
         Ohfw==
X-Gm-Message-State: AFqh2kqW4SvQWGuRqQmw2VL7uJdk8UK4lkG2FGEQWXFysIeqGzxFB/bp
	7MCJMPXin/w4OaGer7oTsbCixtvBIxRMa3z/o4g=
X-Google-Smtp-Source: AMrXdXthAzpmOjnGyozp+47zMS/FoS1bTcDRsdn3kzm7jEa2Xb66ukRkB6gv0/Ayz6QqonxUQA/UDFVfMiB0NWA3I3c=
X-Received: by 2002:adf:e8ca:0:b0:276:a8b0:38f with SMTP id
 k10-20020adfe8ca000000b00276a8b0038fmr776176wrn.204.1672844100794; Wed, 04
 Jan 2023 06:55:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672842927.git.steve@sakoman.com>
In-Reply-To: <cover.1672842927.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Jan 2023 15:54:44 +0100
Message-ID: <CA+chaQck-1UxfytM2r0PGzYeJfK5rqZrt_fke_RPaLRiGXsGwA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/29] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000647da205f1715e35"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 14:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175482

--000000000000647da205f1715e35
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 3:36 PM Steve Sakoman <steve@sakoman.com> wrote:

> The following changes since commit
> ada5e64a97d5f269886772540e0bb0c324088b21:
>
>   efibootmgr: update compilation with musl (2022-12-17 04:10:41 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-next
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next
>
> Alejandro Hernandez Samaniego (1):
>   baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
>
> Alexander Kanavin (5):
>   libnewt: update 0.52.21 -> 0.52.23
>   ruby: merge .inc into .bb
>   ruby: update 3.1.2 -> 3.1.3
>   tzdata: update 2022d -> 2022g
>   devtool/upgrade: correctly handle recipes where S is a subdir of
>     upstream tree
>
> Bruce Ashfield (3):
>   linux-yocto/5.10: update to v5.10.152
>   linux-yocto/5.10: update to v5.10.154
>   linux-yocto/5.10: update to v5.10.160
>
> Hitendra Prajapati (2):
>   systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with
>     a long backtrace
>

I'm a bit late, but this change seems to cause:

| ../git/src/shared/elf-util.c: In function 'parse_elf_object':
| ../git/src/shared/elf-util.c:792:27: error: void value not ignored as it
ought to be
|   792 |                         r = json_variant_dump(package_metadata,
JSON_FORMAT_FLUSH, json_out, NULL);
|       |                           ^

I'm trying to find out why this isn't failing for you, it might be
triggered with just some PACKAGECONFIG combination we have (we enable
coredump, elfutils, oomd, cgroupv2).

--000000000000647da205f1715e35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 4, 2023 at 3:36 PM Steve Sako=
man &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The following changes since commit ada5e64a97d5f269886772540e=
0bb0c324088b21:<br>
<br>
=C2=A0 efibootmgr: update compilation with musl (2022-12-17 04:10:41 -1000)=
<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/kirkstone-next<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/kirkstone-next" rel=3D"noreferrer" target=3D"_blank">http://c=
git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-ne=
xt</a><br>
<br>
Alejandro Hernandez Samaniego (1):<br>
=C2=A0 baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES<=
br>
<br>
Alexander Kanavin (5):<br>
=C2=A0 libnewt: update 0.52.21 -&gt; 0.52.23<br>
=C2=A0 ruby: merge .inc into .bb<br>
=C2=A0 ruby: update 3.1.2 -&gt; 3.1.3<br>
=C2=A0 tzdata: update 2022d -&gt; 2022g<br>
=C2=A0 devtool/upgrade: correctly handle recipes where S is a subdir of<br>
=C2=A0 =C2=A0 upstream tree<br>
<br>
Bruce Ashfield (3):<br>
=C2=A0 linux-yocto/5.10: update to v5.10.152<br>
=C2=A0 linux-yocto/5.10: update to v5.10.154<br>
=C2=A0 linux-yocto/5.10: update to v5.10.160<br>
<br>
Hitendra Prajapati (2):<br>
=C2=A0 systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash wit=
h<br>
=C2=A0 =C2=A0 a long backtrace<br></blockquote><div><br></div><div>I&#39;m =
a bit late, but this change seems to cause:</div><div><br></div><div>| ../g=
it/src/shared/elf-util.c: In function &#39;parse_elf_object&#39;:</div>| ..=
/git/src/shared/elf-util.c:792:27: error: void value not ignored as it ough=
t to be<br>| =C2=A0 792 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D json_variant_dump(package_metadata=
, JSON_FORMAT_FLUSH, json_out, NULL);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">I&#39;m trying to find out why this isn&#39;t failing for you, i=
t might be triggered with just some PACKAGECONFIG combination we have (we e=
nable coredump, elfutils, oomd, cgroupv2).</div></div>

--000000000000647da205f1715e35--

