Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA95C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 15:22:34 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.9383.1646148153826918478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 07:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F6HOw0Wk;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id p4so7367100edi.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 07:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5KIDNyyCfooeOvVGB+Tn07OoJJrwW/b8PpYb08XKGO8=;
        b=F6HOw0WkCCfXGpGKIPxktAVcb2SbCn60GOT3KI6I4UoqLhoF/tXLv4u+MHx94U99Q1
         GpfBIDMtJuqpbU/uySCF7+D0PWTuScuVLXlLfT2XPqZZMa1U+NEFYOHRaU4/3krOCC9s
         yVwiGR6u/Hb3kC7J43WrOeUS0zuUYhBgCBvkICgE0yL+sMrfko4YURKhjFF7L0blt6L1
         EIK0TfbBgud4ccDFMwxDpjCcALiL4swNVL5bUXFrYvntEHoTKaXMgxga/rMSstqsbtfC
         loC4Wo5dpRZjRNxuECyXbUxoB53dRAY5wia3D4agDTjEA4Zrk0Or/n7pwFFPR7YAZ1N+
         si1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5KIDNyyCfooeOvVGB+Tn07OoJJrwW/b8PpYb08XKGO8=;
        b=UJ5gaV0aOX/DhQUxWvJGF/Fg+EW8wx8RGo3YB0I6oU7bRWHOeTNgwTl/RcRmMUOoQo
         8dK6ybYlCv4FUx4c4j8Pqk3zp99/gABQ0IIo31c7VeQ4jDEvuRKPIt9nKYGw/XrDxkDp
         A2luWx562rPTjQK/T9aSLMuauAufU9nPkJ9Vw/cQg4KltZJJpE8ISp2A5PVgjypKRtQj
         x+n3O2Ipkjn6KGjvISvjfDxGeYtlSTOqUe24ca19ktXJSvsE+YTjW8ziKFFxt6FSpR/k
         2dIpTrvcfPHROIV+KZz5VfUK3b7vKkt6iTgILaCKLLEqSjYl4VrodhhYVFGAYoHPopEp
         7glg==
X-Gm-Message-State: AOAM531U1bcypis2ZKYCC1GysC0pAHU//I1Fm0ZVKkgoAAbC2SLXqEHD
	tEQvmvTNELX72n2XJubxIcSAmL//RfDET0p79cE=
X-Google-Smtp-Source: 
 ABdhPJwBet9ezY17Q9OdQtFA2RrArHHhNWicQLKDV+nwejXYZMoQoFP5WqYB9MfRKnWvJj5XnAUKv8Y9KIC4AzFwx4g=
X-Received: by 2002:aa7:cf10:0:b0:410:a59d:7317 with SMTP id
 a16-20020aa7cf10000000b00410a59d7317mr24824435edy.199.1646148151949; Tue, 01
 Mar 2022 07:22:31 -0800 (PST)
MIME-Version: 1.0
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Mar 2022 07:22:20 -0800
Message-ID: 
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d843b005d929bbee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 15:22:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162559

--000000000000d843b005d929bbee
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 1:42 AM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> - replace python3 prefix when guessing the wheel name
>   as there are still plenty of recipes out there that do use
>   python3 prefixes
> - remove all previously generated wheels matching the glob
>   to avoid installing any outdated blob
> - don't use PV in glob, as PV doesn't necessarily align with the
>   version used inside of the setuptools configuration.
>   this will avoid having the user set PYPA_WHEEL in a lot
>   of recipes
> - respect SETUPTOOLS_SETUP_PATH in PIP_INSTALL_DIST_PATH
>   and use B as a fallback only (in case this class is inherited
>   without setuptools3 class being there as well).
>   recipes like python3-smbus run in a subfolder of the
>   workspace and were failing in before this adjustment
>
> Thank you. These are patterns that were never seen during development, but
are painfully obvious now.
The wheel spec (PEP-427) allows for, for instance, dev/pre-release wheels
which we see with the
python3-dtc recipe from meta-virtualization.


> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>

Reviewed-by: Tim Orling <tim.orling@konsulko.com>

>

---
> v3: remove in prepend to compile, not in install for obvious reasons
> v2: fix python3 prefix string
>
>  meta/classes/pip_install_wheel.bbclass | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/pip_install_wheel.bbclass
> b/meta/classes/pip_install_wheel.bbclass
> index 5b7e5cd706..789c25b68c 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -1,12 +1,13 @@
>  DEPENDS:append = " python3-pip-native"
>
>  def guess_pip_install_package_name(d):
> +    import re
>      '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> -    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
> +    return (d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "",
> d.getVar('BPN')).replace('-', '_'))
>
>  PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
> -PIP_INSTALL_DIST_PATH ?= "${B}/dist"
> -PYPA_WHEEL ??=
> "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
> +PIP_INSTALL_DIST_PATH ?= "${@d.getVar('SETUPTOOLS_SETUP_PATH') or
> d.getVar('B')}/dist"
> +PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
>
>  PIP_INSTALL_ARGS ?= "\
>      -vvvv \
> @@ -45,4 +46,9 @@ pip_install_wheel_do_install () {
>      done
>  }
>
> +do_compile:prepend() {
> +    # cleanup previously generated files
> +    rm -f ${PYPA_WHEEL}
> +}
> +
>  EXPORT_FUNCTIONS do_install
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162541):
> https://lists.openembedded.org/g/openembedded-core/message/162541
> Mute This Topic: https://lists.openembedded.org/mt/89472354/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d843b005d929bbee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 1:42 AM Konrad=
 Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>- replace python3 prefix when guessing the wheel name<br>
=C2=A0 as there are still plenty of recipes out there that do use<br>
=C2=A0 python3 prefixes<br>
- remove all previously generated wheels matching the glob<br>
=C2=A0 to avoid installing any outdated blob<br>
- don&#39;t use PV in glob, as PV doesn&#39;t necessarily align with the<br=
>
=C2=A0 version used inside of the setuptools configuration.<br>
=C2=A0 this will avoid having the user set PYPA_WHEEL in a lot<br>
=C2=A0 of recipes<br>
- respect SETUPTOOLS_SETUP_PATH in PIP_INSTALL_DIST_PATH<br>
=C2=A0 and use B as a fallback only (in case this class is inherited<br>
=C2=A0 without setuptools3 class being there as well).<br>
=C2=A0 recipes like python3-smbus run in a subfolder of the<br>
=C2=A0 workspace and were failing in before this adjustment<br>
<br></blockquote><div>Thank you. These are patterns that were never seen du=
ring development, but are painfully obvious now.</div><div>The wheel spec (=
PEP-427) allows for, for instance, dev/pre-release wheels which we see with=
 the</div><div>python3-dtc recipe from meta-virtualization.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com"=
 target=3D"_blank">kweihmann@outlook.com</a>&gt;</blockquote><div>Reviewed-=
by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@ko=
nsulko.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v3: remove in prepend to compile, not in install for obvious reasons<br>
v2: fix python3 prefix string<br>
<br>
=C2=A0meta/classes/pip_install_wheel.bbclass | 12 +++++++++---<br>
=C2=A01 file changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_inst=
all_wheel.bbclass<br>
index 5b7e5cd706..789c25b68c 100644<br>
--- a/meta/classes/pip_install_wheel.bbclass<br>
+++ b/meta/classes/pip_install_wheel.bbclass<br>
@@ -1,12 +1,13 @@<br>
=C2=A0DEPENDS:append =3D &quot; python3-pip-native&quot;<br>
<br>
=C2=A0def guess_pip_install_package_name(d):<br>
+=C2=A0 =C2=A0 import re<br>
=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<a href=3D"https://www.python.org/dev/pe=
ps/pep-0491/#escaping-and-unicode&#39;" rel=3D"noreferrer" target=3D"_blank=
">https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode&#39;</a>&#=
39;&#39;<br>
-=C2=A0 =C2=A0 return (d.getVar(&#39;PYPI_PACKAGE&#39;) or d.getVar(&#39;BP=
N&#39;)).replace(&#39;-&#39;, &#39;_&#39;)<br>
+=C2=A0 =C2=A0 return (d.getVar(&#39;PYPI_PACKAGE&#39;) or re.sub(r&quot;^p=
ython3-&quot;, &quot;&quot;, d.getVar(&#39;BPN&#39;)).replace(&#39;-&#39;, =
&#39;_&#39;))<br>
<br>
=C2=A0PIP_INSTALL_PACKAGE ?=3D &quot;${@guess_pip_install_package_name(d)}&=
quot;<br>
-PIP_INSTALL_DIST_PATH ?=3D &quot;${B}/dist&quot;<br>
-PYPA_WHEEL ??=3D &quot;${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${P=
V}-*.whl&quot;<br>
+PIP_INSTALL_DIST_PATH ?=3D &quot;${@d.getVar(&#39;SETUPTOOLS_SETUP_PATH&#3=
9;) or d.getVar(&#39;B&#39;)}/dist&quot;<br>
+PYPA_WHEEL ??=3D &quot;${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*=
.whl&quot;<br>
<br>
=C2=A0PIP_INSTALL_ARGS ?=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-vvvv \<br>
@@ -45,4 +46,9 @@ pip_install_wheel_do_install () {<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 # cleanup previously generated files<br>
+=C2=A0 =C2=A0 rm -f ${PYPA_WHEEL}<br>
+}<br>
+<br>
=C2=A0EXPORT_FUNCTIONS do_install<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162541): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162541" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162541</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89472354/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89472354/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d843b005d929bbee--

