Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9663BC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 10:51:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.9017.1664448670882885514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 03:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c+UtgH7y;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so534108wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lfr+GthgjRCudiZidq8dvyol7yS3ihoAv/zO72knRps=;
        b=c+UtgH7yERxasUQvpJXUQdXYIbn6ljBAC9MbzgaCBIcPpWqbzvPrUgGkSv6ZmjOEBT
         x74HeHSx+rzPYyYL9dGld1qd9P3h+RJcVAh28ZAhBXgysZHNsQ2cDr+qTswUH2eHgGpe
         xfzSC9tBGL15teciePgO4hX3mwfL3f974w7DW09qetB+ERY4a/V6xA+p0sikxssed2sW
         47dnsi7lzK2xc83pKGT34epzF2N49F5VQcxeOtuaNlPE3bernT5tPPxYxQKqv2MU9Pa8
         a8TbaEy20VdxAe0S+v7GBywHi7nd2uclg6JNL8Zy9lkzcgcoBqU5Ija4MIHrKtCDWVFO
         q4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lfr+GthgjRCudiZidq8dvyol7yS3ihoAv/zO72knRps=;
        b=wwpwKR2J04WJWe/tSf71QP0Gsk5ZwhLcUPnUf4lc3p5ALuWMUSx42UKfuW2cl+CkP1
         LkAJgg6ZwXjKk41EsN7BqFNjBt/Yqe8Ed66h+RyxJ55Izzc/gpklwcok5/E6af446B1Y
         tT7wh09Hxw0HV/tfMCLV6khNGC/k4CCiA7it54oYTJOBNp/gdqRUwCtRiwhvkacR76gN
         WT3hxTZMaElPOQCoySNSN9YmxFG8BXM7AKbkH45h4VCdL6qSxvdQfkqA0PCVJbdIKyt6
         3Av4YBGD+6xWZpNRCzpfTvudlqeUtrmcZOiZCKEiBf2C8bpMiR8lkBGKCZXiEpC8h79S
         u2iw==
X-Gm-Message-State: ACrzQf3wCU4gybUg23K4anAUr+fusf0+RAlXv5sUqcUeexwsVDjZTtZn
	FgzYqfhbRSnXu9q3ODKgOdKAPZV5ghq7llgL08Q=
X-Google-Smtp-Source: 
 AMsMyM4Or4puja6odL06K2ra7xV/sG0fqMX28BENGpFMOst+O4D22qKdU1ysIeLOPyxGuXA81iuqxBLLpa0U/N0QD2U=
X-Received: by 2002:a05:600c:211a:b0:3b4:75ee:c63e with SMTP id
 u26-20020a05600c211a00b003b475eec63emr10428631wml.44.1664448669108; Thu, 29
 Sep 2022 03:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220929095813.3207562-1-philippe.coval@astrolabe.coop>
In-Reply-To: <20220929095813.3207562-1-philippe.coval@astrolabe.coop>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Sep 2022 12:50:58 +0200
Message-ID: 
 <CA+chaQe5hFd58fpAJFGOcVC-ucJ4qMqXHynYAeTzqu034w_=MA@mail.gmail.com>
Subject: Re: [OE-core] [openembedded-core][PATCH] graphics: Hotfix for eGalax
 Touchscreen
To: philippe.coval@astrolabe.coop
Cc: openembedded-core@lists.openembedded.org,
	philippe.coval.pro+openembedded-core-lists.yoctoproject.org@gmail.com,
	Philippe Coval <philippe.coval@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000ab4f8c05e9cea77d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 10:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171180

--000000000000ab4f8c05e9cea77d
Content-Type: text/plain; charset="UTF-8"

Was this sent by accident? The overrides are all wrong and recipe from
oe-core surely shouldn't have a .bbappend in oe-core.

On Thu, Sep 29, 2022 at 11:58 AM <philippe.coval@astrolabe.coop> wrote:

> From: Philippe Coval <philippe.coval@astrolabe.coop>
>
> For unsupported screens (which X axis is inverted)
>
> For the record issue was observed with this CVL1010 device:
>
> http://www.cartft.com/en/catalog/il/1589#
>
> For more details check related links:
>
> Forwarded:
> https://lists.openembedded.org/g/openembedded-core/search?q=philippe.coval
> Relate-to
> <https://lists.openembedded.org/g/openembedded-core/search?q=philippe.covalRelate-to>:
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/665
> Relate-to
> <https://gitlab.freedesktop.org/libinput/libinput/-/issues/665Relate-to>:
> https://at.projects.genivi.org/jira/si/jira.issueviews:issue-html/GDP-19/GDP-19.html
> Relate-to: https://git.ostc-eu.org/OSTC/planning/blueprints/-/issues/22
> Origin: https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/merge_requests/288
> Signed-off-by
> <https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/merge_requests/288Signed-off-by>:
> Philippe Coval <philippe.coval@huawei.com>
> Signed-off-by: Philippe Coval <philippe.coval@astrolabe.coop>
> ---
>  .../wayland/libinput/90-usb-0eef-0001.rules         |  1 +
>  meta/recipes-graphics/wayland/libinput_%.bbappend   | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644
> meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
>  create mode 100644 meta/recipes-graphics/wayland/libinput_%.bbappend
>
> diff --git a/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
> b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
> new file mode 100644
> index 0000000000..354629dbbb
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
> @@ -0,0 +1 @@
> +ACTION=="add|change", KERNEL=="event[0-9]*", ENV{ID_VENDOR_ID}=="0eef",
> ENV{ID_MODEL_ID}=="0001", ENV{ID_INPUT_TOUCHSCREEN}="1",
> ENV{ID_INPUT_TABLET}="0", ENV{ID_INPUT_MOUSE}="0",
> ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 1 0"
> diff --git a/meta/recipes-graphics/wayland/libinput_%.bbappend
> b/meta/recipes-graphics/wayland/libinput_%.bbappend
> new file mode 100644
> index 0000000000..281b499624
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput_%.bbappend
> @@ -0,0 +1,13 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +# SPDX-License-Identifier: Apache-2.0
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://90-usb-0eef-0001.rules"
> +
> +do_install_append() {
> +    install -d  "${D}/${sysconfdir}/udev/rules.d"
> +    install -m444 "${WORKDIR}/90-usb-0eef-0001.rules"
> "${D}/${sysconfdir}/udev/rules.d/"
> +}
> +
> +FILES_${PN} += "${sysconfdir}/udev/rules.d/90-usb-0eef-0001.rules"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171179):
> https://lists.openembedded.org/g/openembedded-core/message/171179
> Mute This Topic: https://lists.openembedded.org/mt/93991089/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ab4f8c05e9cea77d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Was this sent by accident? The overrides are all wrong and=
 recipe from oe-core surely shouldn&#39;t have a .bbappend in oe-core.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Sep 29, 2022 at 11:58 AM &lt;<a href=3D"mailto:philippe.coval@astrolabe.=
coop">philippe.coval@astrolabe.coop</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Philippe Coval &lt;<a href=3D"mail=
to:philippe.coval@astrolabe.coop" target=3D"_blank">philippe.coval@astrolab=
e.coop</a>&gt;<br>
<br>
For unsupported screens (which X axis is inverted)<br>
<br>
For the record issue was observed with this CVL1010 device:<br>
<br>
<a href=3D"http://www.cartft.com/en/catalog/il/1589#" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.cartft.com/en/catalog/il/1589#</a><br>
<br>
For more details check related links:<br>
<br>
Forwarded: <a href=3D"https://lists.openembedded.org/g/openembedded-core/se=
arch?q=3Dphilippe.covalRelate-to" rel=3D"noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/search?q=3Dphilippe.coval<br=
>
Relate-to</a>: <a href=3D"https://gitlab.freedesktop.org/libinput/libinput/=
-/issues/665Relate-to" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/libinput/libinput/-/issues/665<br>
Relate-to</a>: <a href=3D"https://at.projects.genivi.org/jira/si/jira.issue=
views:issue-html/GDP-19/GDP-19.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://at.projects.genivi.org/jira/si/jira.issueviews:issue-html/GDP-19/GDP=
-19.html</a><br>
Relate-to: <a href=3D"https://git.ostc-eu.org/OSTC/planning/blueprints/-/is=
sues/22" rel=3D"noreferrer" target=3D"_blank">https://git.ostc-eu.org/OSTC/=
planning/blueprints/-/issues/22</a><br>
Origin: <a href=3D"https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/merge_requ=
ests/288Signed-off-by" rel=3D"noreferrer" target=3D"_blank">https://git.ost=
c-eu.org/OSTC/OHOS/meta-ohos/-/merge_requests/288<br>
Signed-off-by</a>: Philippe Coval &lt;<a href=3D"mailto:philippe.coval@huaw=
ei.com" target=3D"_blank">philippe.coval@huawei.com</a>&gt;<br>
Signed-off-by: Philippe Coval &lt;<a href=3D"mailto:philippe.coval@astrolab=
e.coop" target=3D"_blank">philippe.coval@astrolabe.coop</a>&gt;<br>
---<br>
=C2=A0.../wayland/libinput/90-usb-0eef-0001.rules=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/recipes-graphics/wayland/libinput_%.bbappend=C2=A0 =C2=A0| 13 ++=
+++++++++++<br>
=C2=A02 files changed, 14 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/libinput/90-usb-0eef=
-0001.rules<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/libinput_%.bbappend<=
br>
<br>
diff --git a/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules =
b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules<br>
new file mode 100644<br>
index 0000000000..354629dbbb<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules<br>
@@ -0,0 +1 @@<br>
+ACTION=3D=3D&quot;add|change&quot;, KERNEL=3D=3D&quot;event[0-9]*&quot;, E=
NV{ID_VENDOR_ID}=3D=3D&quot;0eef&quot;, ENV{ID_MODEL_ID}=3D=3D&quot;0001&qu=
ot;, ENV{ID_INPUT_TOUCHSCREEN}=3D&quot;1&quot;, ENV{ID_INPUT_TABLET}=3D&quo=
t;0&quot;, ENV{ID_INPUT_MOUSE}=3D&quot;0&quot;, ENV{LIBINPUT_CALIBRATION_MA=
TRIX}=3D&quot;-1 0 1 0 1 0&quot;<br>
diff --git a/meta/recipes-graphics/wayland/libinput_%.bbappend b/meta/recip=
es-graphics/wayland/libinput_%.bbappend<br>
new file mode 100644<br>
index 0000000000..281b499624<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/libinput_%.bbappend<br>
@@ -0,0 +1,13 @@<br>
+# SPDX-FileCopyrightText: Huawei Inc.<br>
+# SPDX-License-Identifier: Apache-2.0<br>
+<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://90-usb-0eef-0001.rules&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d=C2=A0 &quot;${D}/${sysconfdir}/udev/rules.d&quot;=
<br>
+=C2=A0 =C2=A0 install -m444 &quot;${WORKDIR}/90-usb-0eef-0001.rules&quot; =
&quot;${D}/${sysconfdir}/udev/rules.d/&quot;<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot;${sysconfdir}/udev/rules.d/90-usb-0eef-0001.rules&q=
uot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171179): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171179" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171179</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93991089/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93991089/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ab4f8c05e9cea77d--

