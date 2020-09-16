Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web10.18171.1600246340889362475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 01:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iUSBSQ5e;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: samuli.piippo@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id y2so5722967ilp.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLoaHitvLIkGALp0+pcX4P4TcMgvuQDmFB/bfkCXnaA=;
        b=iUSBSQ5e70BLDisH9Qs/U8XRv+t36SAPsdZvcPos3pNnRtEl/CR8vsU+6tz0ITlyun
         edJ6nZGVLoh8YvL99TulyJm9/UGEujrVoQHjETHWI7b9zgXekLbIB7JV+6gQCrVzXQ8/
         ijZLG03oZ0h72sfNOXETm4xoK1OhoDLuKaKThfHZ1k6kFpzr6BABcgo99SJjWiUcnkhK
         DbsEsSlSsqKS4AFTpbkkCr2BGz+R/ythqpHm6nhzPOhbUVRlctVGQBAFgfpseUF4/1dY
         jpZa9gcszzW0Zzs9gcSJiEo19lW1c6I+rL55igPjTvfTuUhWpt+YgUokztOWYLFzI3Jv
         S6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLoaHitvLIkGALp0+pcX4P4TcMgvuQDmFB/bfkCXnaA=;
        b=gBHcQoj3oYNa0kNuW2JebYwufINZ6vZRZEdcEhScKhGov6Cr4NFDnpHPCxsE1QSOf9
         w+J8yoUBribUY6M1/flQhPEa0N4XUsqLIn/AZbMv+MPEfK2jYJ4ThIIKAxZprGHnP66k
         jsZZnGEogmHJDD4bd9zSa6QY3UruUnD3yQzelNfCQPNP1s/vDXFrRPKypq0vG6NshrNi
         VZJT8s3i3igT7D/W0DpqsufRSJftMnuPyke9MfQ4UEkcJZZLdbtAhhq2bIpLNDNf79t2
         YkstYocNkygQhr9WZtuK4EsJ401NgTz9F9B6ZwBjm+A7p9S48THX01QQbrQgKqzQrQir
         swgA==
X-Gm-Message-State: AOAM533Nk/7h3iamWDuPdqwG9fgKYn20yZx4g3auK8xXmHgTA9NH7j8v
	sQswiX3upH6SIvG1q3Wa0sG4Wh9gf0J8J+n6z38=
X-Google-Smtp-Source: ABdhPJykl/B2PWB7FqXB0le43uImDYhETdNyK5HpOwXXoSvH3v0yvJhxvVxOnzTyr3g055JB8JwrUSgjt5j5JtBbFAw=
X-Received: by 2002:a05:6e02:1114:: with SMTP id u20mr10892781ilk.1.1600246340160;
 Wed, 16 Sep 2020 01:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200506084629.120567-1-wenlin.kang@windriver.com>
 <2bad1f8d88656b45f7776d7124bd59ea0629e7f8.camel@intel.com> <d2ab7e09-e870-7382-f218-a1fdbe66840a@windriver.com>
In-Reply-To: <d2ab7e09-e870-7382-f218-a1fdbe66840a@windriver.com>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Wed, 16 Sep 2020 11:52:09 +0300
Message-ID: <CABXoSoWGOd92K1un+Losec5f0VSVwo+V_AFzpoAf-rgQesAiXA@mail.gmail.com>
Subject: Re: [OE-core][zeus][PATCH] populate_sdk_base.bbclass: fix warning: name not matched
To: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a890b805af6a62fe"

--000000000000a890b805af6a62fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

As I understand it, the original zip format support was done so that there
wouldn't be any symlinks in the sdk package.
https://git.openembedded.org/openembedded-core/commit/?id=3D57a33048a89a42=
2cfdc986d3489c67b2d297e1e7

With this change the symlinks are now back again which leads to broken SDK
when extracted with 7Zip.
Both commits were contributed from windriver, are you now using something
else to extract the zip?

-samuli

On Fri, 8 May 2020 at 07:34, wenlin.kang@windriver.com <
wenlin.kang@windriver.com> wrote:

> On 2020/5/8 =E4=B8=8A=E5=8D=8811:04, Mittal, Anuj wrote:
>
> Hi,
>
> On Wed, 2020-05-06 at 01:46 -0700, wenlin.kang@windriver.com wrote:
>
> Fix below warning:
> zip warning: name not matched: sysroots/aarch64-wrs-
> linux/etc/udev/rules.d/80-net-setup-link.rules
> zip warning: name not matched: sysroots/aarch64-wrs-
> linux/etc/tmpfiles.d/etc.conf
> zip warning: name not matched: sysroots/aarch64-wrs-
> linux/etc/tmpfiles.d/home.conf
> zip warning: name not matched: sysroots/aarch64-wrs-
> linux/etc/systemd/network/80-wired.network
> zip warning: name not matched: sysroots/aarch64-wrs-
> linux/etc/resolv.conf
> zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/mtab
> zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/resolv-
> conf.systemd
> zip warning: name not matched: sysroots/aarch64-wrs-linux/var/lock
>
>
> Is this specific to zeus? I don't see this change in master/dunfell.
> It'd be great if you could include more details in commit message
> explaining what is happening.
>
>
> No, this issue can be seen in master too, but this patch is only to zeus=
,
> for master, I have sent patch too.
>
> Steps:
>
> 1. Setup poky[zeus] project
>
> 2. In local.conf, add:
> SDK_ARCHIVE_TYPE =3D "zip"
>
> 3. bitbake core-image-minimal -c populate_sdk
>
> 4.  check log file log.do_populate_sdk
>
>
> Thanks,
>
> Anuj
>
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com> <wenlin.kang@wind=
river.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass
> b/meta/classes/populate_sdk_base.bbclass
> index d03465b6fc..b5c004d832 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -55,7 +55,7 @@ python () {
>         d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
>         # SDK_ARCHIVE_CMD used to generate archived sdk
> ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir
> ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
>         # recommand to cd into input dir first to avoid archive with
> buildpath
> -       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip
> -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip
> -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
>      else:
>         d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
>         d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar
> ${SDKTAROPTS} -cf - . | xz -T 0 -9 >
> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>
>
>
> --
> Thanks,
> Wenlin Kang
>
>=20
>

--000000000000a890b805af6a62fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>As I understand it, the origi=
nal zip format support was done so that there wouldn&#39;t be any symlinks =
in the sdk package.=C2=A0<div><a href=3D"https://git.openembedded.org/opene=
mbedded-core/commit/?id=3D57a33048a89a422cfdc986d3489c67b2d297e1e7">https:/=
/git.openembedded.org/openembedded-core/commit/?id=3D57a33048a89a422cfdc986=
d3489c67b2d297e1e7</a></div><div><br><div>With this change the symlinks are=
 now=20

back

again  which leads to broken SDK when extracted with 7Zip.=C2=A0</div><div=
>Both commits were contributed from windriver, are you now using something =
else to extract the zip?</div><div><br></div><div>-samuli</div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, 8 May 2020 at 07:34, <a href=3D"mailto:wenlin.kang@windriver.com">wenlin.=
kang@windriver.com</a> &lt;<a href=3D"mailto:wenlin.kang@windriver.com">wen=
lin.kang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">

  
  <div>
    <div>On 2020/5/8 =E4=B8=8A=E5=8D=8811:04, Mittal, Anuj
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Hi,

On Wed, 2020-05-06 at 01:46 -0700, <a href=3D"mailto:wenlin.kang@windriver=
.com" target=3D"_blank">wenlin.kang@windriver.com</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>Fix below warning:
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/udev/rules.d/80-net-setup-link.rules
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/tmpfiles.d/etc.conf
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/tmpfiles.d/home.conf
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/systemd/network/80-wired.network
zip warning: name not matched: sysroots/aarch64-wrs-
linux/etc/resolv.conf
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/mtab
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/resolv-
conf.systemd
zip warning: name not matched: sysroots/aarch64-wrs-linux/var/lock

</pre>
      </blockquote>
      <pre>Is this specific to zeus? I don&#39;t see this change in master=
/dunfell.
It&#39;d be great if you could include more details in commit message
explaining what is happening.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>No, this issue can be seen in master too, but this patch is only
      to zeus, for master, I have sent patch too.</p>
    <p>Steps:</p>
    <p>1. Setup poky<span>[zeus]</span><span>=C2=A0</span>project</p>
    <p>2. In local.conf, add:<br>
      SDK_ARCHIVE_TYPE =3D &quot;zip&quot;</p>
    <p>3. bitbake
      core-image-minimal -c populate_sdk</p>
    <p>4.=C2=A0 check log file
      log.do_populate_sdk</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <pre>Thanks,

Anuj

</pre>
      <blockquote type=3D"cite">
        <pre>Signed-off-by: Wenlin Kang <a href=3D"mailto:wenlin.kang@wind=
river.com" target=3D"_blank">&lt;wenlin.kang@windriver.com&gt;</a>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass
b/meta/classes/populate_sdk_base.bbclass
index d03465b6fc..b5c004d832 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -55,7 +55,7 @@ python () {
        d.setVar(&#39;SDK_ARCHIVE_DEPENDS&#39;, &#39;zip-native&#39;)
        # SDK_ARCHIVE_CMD used to generate archived sdk
${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir
${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with
buildpath
-       d.setVar(&#39;SDK_ARCHIVE_CMD&#39;, &#39;cd ${SDK_OUTPUT}/${SDKPAT=
H}; zip
-r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .&#39;)
+       d.setVar(&#39;SDK_ARCHIVE_CMD&#39;, &#39;cd ${SDK_OUTPUT}/${SDKPAT=
H}; zip
-r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .&#39;)
     else:
        d.setVar(&#39;SDK_ARCHIVE_DEPENDS&#39;, &#39;xz-native&#39;)
        d.setVar(&#39;SDK_ARCHIVE_CMD&#39;, &#39;cd ${SDK_OUTPUT}/${SDKPAT=
H}; tar
${SDKTAROPTS} -cf - . | xz -T 0 -9 &gt;
${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}&#39;)

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
Thanks,
Wenlin Kang</pre>
  </div>

<br>
</blockquote></div>

--000000000000a890b805af6a62fe--
