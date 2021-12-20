Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB45C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 10:45:26 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web08.3835.1639997125399098412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ll6SZRjk;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id y23so16814823uay.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VcWY2/uaaJ10tk8vZ1+mRtWOQhWwXe+O5Ci6pINOuiA=;
        b=ll6SZRjkt29IkelIWEThDWDYHkQTl/feBcdjSrRiPavPPNSUyp0d3HC3hfG2Gh3xUc
         rZTfJ2qf9CY2Q03b0EDVIZ/jThNOqNtjJznEcudixpMqbHG4wT/5nu0lnZE+1MgThr9z
         0pY5qOjBqS7A/BWsJdkqxBFUniVisIIGmMRK8FDVBULI4rfothaKg4cSN54TXcWkhvem
         pV8SNXj0QyjL9iR2ryKxjGQrlpLJ9DU4k3k2VPfTlmXU0Sr6u6hBsQY7csZLONFbC3E7
         pR6bls0Dl/Vnmre15HMYv6zHCKmrDS48Cfj6LDVTLxT7cRpanzYWUlU+/UmDWnkvF3qq
         StTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VcWY2/uaaJ10tk8vZ1+mRtWOQhWwXe+O5Ci6pINOuiA=;
        b=e2/RkZbkoBIT4JMJYtZCluP8I0wAeMUwA9Br8tC4JfaFqcYQ3QkLM5UBFZw5WoRdUE
         WXmvV65uqT8sImStLvGVR6L4c2V9mwRSF7VDt+2l+VK5sXQtgaSiAQqiiJuePY/ZvWh9
         kpmhq/CYNpPoj/2It1kpxKoivvOgxVQkmo2wwwCMcGGtNE6NMWzmcJdo1d16tUa9VRq0
         JCjAyaMkr+kQewgOHJKXODNJ3srTGe0M5axCtABt0/Kv27PdzPkd4BtJCS0xf2Q6o2ba
         1R0p/V0nfAYW+RlsuX3ZTiM1PuaVCYo6U7eyh2gaQopmyE4ebuPtgvuPtj0WshdtsyZj
         PEOQ==
X-Gm-Message-State: AOAM531I5BM52bDbcm4OeEoI8tiWQ9x0oewFEhzUpR2XkF3cMt8BK0Vd
	f1k8Qks6sQg7uvKZe8CWjTgrvkzyzTJOzH4kbkA=
X-Google-Smtp-Source: 
 ABdhPJwJQe6MnsNo4dJPs8AUUdpBC8tOqhIBOtnulTP32LbLivdzhEO3ALkjFnDFQrIaOYOQSnVz1k+LdTA4ZUNBZLM=
X-Received: by 2002:a67:f918:: with SMTP id t24mr458965vsq.73.1639997124489;
 Mon, 20 Dec 2021 02:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20211220101405.26735-1-max.krummenacher@toradex.com>
In-Reply-To: <20211220101405.26735-1-max.krummenacher@toradex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Dec 2021 13:45:13 +0300
Message-ID: 
 <CANNYZj_62yLhhpfa3VvCE3rJtA68ec1wge4sHL_Qr9q+5MC6Ow@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch v2 0/2] implement applying patches from a
 directory
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, bruce.ashfield@gmail.com,
	kweihmann@outlook.com, openembedded-core@lists.openembedded.org,
	quentin.schulz@theobroma-systems.com, richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000009b51505d3919619"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 10:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159862

--00000000000009b51505d3919619
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I still want to question the need for this. I=E2=80=99d rather allow only a=
n
explicit list giving an explicit order in the recipe.

Alex

On Mon 20. Dec 2021 at 13.15, Max Krummenacher <max.oss.09@gmail.com> wrote=
:

> The current developer manual [1] specifies that patches that are
> part of a directory which is given in SRC_URI are applied by
> the do_patch task. However that is not implemented in the
> current code.
>
> This patchset implements that, but deviates from what is
> documented. If the patches are applied I will send a patch
> for the documentation changing the relevant part to:
>
> ```
> If you have a directory full of patch files and you want to
> apply them all you can add the directory to SRC_URI and add
> the "apply=3Dyes" parameter. This will apply ALL files in the
> directiory, including files in subdirectories.
> The patches will be applied sorted by their filename. Files
> from subdirectories will be sorted into the list at the
> position given by the subdirectory name.
>
>    SRC_URI =3D " \
>        git://path_to_repo/some_package \
>        file://path_to_lots_of_patch_files;apply=3Dyes \
>        "
>
> In the previous example all the files in the directory holding
> the patch files would be applied as a patch.
> ```
>
> Changes in v2:
> - using python glob to get a directories content recursively as
>   proposed by Konrad Weihmann
> - dropped 'lib/oe/recipeutils.py: follow changed method argument list',
>   the use of glob allowed to keep the original argument list
> - added a oe-selftest which tests applying patches aspects
>
> Max
>
> [1]
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#re=
f-tasks-patch
>
> Max Krummenacher (2):
>   lib/oe/patch.py: apply patches from src_uri specified directories
>   oe-selftest: bbtests: add test_patching test
>
>  .../patchtest/patchtest/0001-10.patch         | 25 +++++
>  .../patchtest/patchtest/0001-111.patch        | 25 +++++
>  .../patchtest/patchtest/expected_source_file  | 11 +++
>  .../patchtest/patchtest/expected_src_patches  |  5 +
>  .../patchtest/patchtest/expected_src_sources  |  7 ++
>  .../patchtest/patchset1/0001-11.patch         | 25 +++++
>  .../patchtest/patchset2/0001-2.patch          | 25 +++++
>  .../patchset2/0002_subset1/0001-4.patch       | 27 ++++++
>  .../patchset2/0002_subset1/0002-6.patch       | 26 ++++++
>  .../patchtest/patchset2/0003-8.patch          | 25 +++++
>  .../patchtest/patchset3/0001-111.patch        | 25 +++++
>  .../patchtest/patchtest/src_patches           |  5 +
>  .../patchtest/patchtest/the_source_file       |  5 +
>  .../recipes-test/patchtest/patchtest_1.0.bb   | 37 ++++++++
>  meta/lib/oe/patch.py                          | 92 +++++++++++--------
>  meta/lib/oeqa/selftest/cases/bbtests.py       | 18 ++++
>  16 files changed, 346 insertions(+), 37 deletions(-)
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/0001-10.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/0001-111.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/expected_source_file
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/expected_src_patches
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/expected_src_sources
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/patchset1/0001-11.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/patchset2/0001-2.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/000=
1-4.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/000=
2-6.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/patchset2/0003-8.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/patchset3/0001-111.patch
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/src_patches
>  create mode 100644
> meta-selftest/recipes-test/patchtest/patchtest/the_source_file
>  create mode 100644 meta-selftest/recipes-test/patchtest/patchtest_1.0.bb
>
> --
> 2.20.1
>
>

--00000000000009b51505d3919619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I still want to question the need for this. I=E2=80=
=99d rather allow only an explicit list giving an explicit order in the rec=
ipe.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></d=
iv><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon 20. Dec 2021 at 13.15, Max Krummenacher &lt;<a href=3D"mailto=
:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">The current developer manual [1] specifies that=
 patches that are<br>
part of a directory which is given in SRC_URI are applied by<br>
the do_patch task. However that is not implemented in the<br>
current code.<br>
<br>
This patchset implements that, but deviates from what is<br>
documented. If the patches are applied I will send a patch<br>
for the documentation changing the relevant part to:<br>
<br>
```<br>
If you have a directory full of patch files and you want to<br>
apply them all you can add the directory to SRC_URI and add<br>
the &quot;apply=3Dyes&quot; parameter. This will apply ALL files in the<br>
directiory, including files in subdirectories.<br>
The patches will be applied sorted by their filename. Files<br>
from subdirectories will be sorted into the list at the<br>
position given by the subdirectory name.<br>
<br>
=C2=A0 =C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0git://path_to_repo/some_package \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://path_to_lots_of_patch_files;apply=3Dyes \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
In the previous example all the files in the directory holding<br>
the patch files would be applied as a patch.<br>
```<br>
<br>
Changes in v2:<br>
- using python glob to get a directories content recursively as<br>
=C2=A0 proposed by Konrad Weihmann<br>
- dropped &#39;lib/oe/recipeutils.py: follow changed method argument list&#=
39;,<br>
=C2=A0 the use of glob allowed to keep the original argument list<br>
- added a oe-selftest which tests applying patches aspects<br>
<br>
Max<br>
<br>
[1] <a href=3D"https://www.yoctoproject.org/docs/current/mega-manual/mega-m=
anual.html#ref-tasks-patch" rel=3D"noreferrer" target=3D"_blank">https://ww=
w.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patc=
h</a><br>
<br>
Max Krummenacher (2):<br>
=C2=A0 lib/oe/patch.py: apply patches from src_uri specified directories<br=
>
=C2=A0 oe-selftest: bbtests: add test_patching test<br>
<br>
=C2=A0.../patchtest/patchtest/0001-10.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 25 +++++<br>
=C2=A0.../patchtest/patchtest/0001-111.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
5 +++++<br>
=C2=A0.../patchtest/patchtest/expected_source_file=C2=A0 | 11 +++<br>
=C2=A0.../patchtest/patchtest/expected_src_patches=C2=A0 |=C2=A0 5 +<br>
=C2=A0.../patchtest/patchtest/expected_src_sources=C2=A0 |=C2=A0 7 ++<br>
=C2=A0.../patchtest/patchset1/0001-11.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 25 +++++<br>
=C2=A0.../patchtest/patchset2/0001-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 25 +++++<br>
=C2=A0.../patchset2/0002_subset1/0001-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
7 ++++++<br>
=C2=A0.../patchset2/0002_subset1/0002-6.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
6 ++++++<br>
=C2=A0.../patchtest/patchset2/0003-8.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 25 +++++<br>
=C2=A0.../patchtest/patchset3/0001-111.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
5 +++++<br>
=C2=A0.../patchtest/patchtest/src_patches=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 5 +<br>
=C2=A0.../patchtest/patchtest/the_source_file=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 5 +<br>
=C2=A0.../recipes-test/patchtest/<a href=3D"http://patchtest_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">patchtest_1.0.bb</a>=C2=A0 =C2=A0| 37 ++++++=
++<br>
=C2=A0meta/lib/oe/patch.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 92 +++++++++++--------<br>
=C2=A0meta/lib/oeqa/selftest/cases/bbtests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
8 ++++<br>
=C2=A016 files changed, 346 insertions(+), 37 deletions(-)<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/000=
1-10.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/000=
1-111.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/exp=
ected_source_file<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/exp=
ected_src_patches<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/exp=
ected_src_sources<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/pat=
chset1/0001-11.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/pat=
chset2/0001-2.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/pat=
chset2/0002_subset1/0001-4.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/pat=
chset2/0002_subset1/0002-6.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/pat=
chset2/0003-8.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/pat=
chset3/0001-111.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/src=
_patches<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/the=
_source_file<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/patchtest/<a href=3D"ht=
tp://patchtest_1.0.bb" rel=3D"noreferrer" target=3D"_blank">patchtest_1.0.b=
b</a><br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>
</div>

--00000000000009b51505d3919619--

