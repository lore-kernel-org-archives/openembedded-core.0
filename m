Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id D1C576069D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:16:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n21so454262675qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 08:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fkVKjhmtMi6pWXfrR25GnXl6XstYNi6gAoSsb2YrZj0=;
	b=D087TERkydjRBHS7sZOQNA/OttdkGCBAgAxNU/7UBFV74nWb6dMc6BgcsB3zeQLm2m
	gTXunXapwgZyuvcOO580cWzgrYxZXeUTvXDC7gQDMVQTwyD9KD2qNR5Znu5u7NmEHNwa
	mLZEzrgtd5QRl6K9sAhuqfZv5RCk5SfFw9vTQv1knmBFUx7sLrTWKAzdZqcnnP2GSVvl
	M6yE3JVOMfSomq3lj7wARWWTVVZO/9ICIQtRargDI2xT6RQo+X7z4lw2CSvQEl4YAd4j
	9HzYjYX71FTL/BUb2rF4qyACk/vHn9HlXIBez2J9hBT/GEI0iDVq90HFXYkyApXpgXAH
	9eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fkVKjhmtMi6pWXfrR25GnXl6XstYNi6gAoSsb2YrZj0=;
	b=cXX+FErizfNrsedx7s3BEZNZT6DpXG14UwmwhjxIjdQ+QTDPpeZe36s6D8M9VNvY9i
	/RAtrR7+wTltLE4Jihjch7Z/Oe/WOH36RzGdsXFSi97OgSIEJ6ohOsWq6xDwPORV81Ag
	4Vn0BDrsKPwfCjf8S7SGyK9FNhFvEDW+hqxrDNbObFCMcd55PArw9pkhJBf6MGAobhZI
	gn1H38OHwcRFV90JkMaHidUUsn+msUdnLBMcNAr5jNeNBdaL4hxdsMphVJctjsKd2Lwl
	WAPgBYo9eqXCFS+QUKXKhAe8XC5TCO/wwZRHYuxeMREpKGEXfnG0qooqP0UDGlldt8t9
	jLMg==
X-Gm-Message-State: AKaTC0121hidebtpXZ2R/AP5kVWnoPCYJxMXdpW9AKKoI83h1iJazdH59o9g80XapwRaPSRsPRQuL2W8Mbf++No0
X-Received: by 10.55.207.78 with SMTP id e75mr75785577qkj.36.1481213810965;
	Thu, 08 Dec 2016 08:16:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 8 Dec 2016 08:16:30 -0800 (PST)
In-Reply-To: <62473423-1805-cbb9-240f-c070f729fe16@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-3-git-send-email-obi@opendreambox.org>
	<CAJTo0LbsxuA6wMm8gY1LJJhxq15k10x9HoD0qBBHi4tSoQa8SA@mail.gmail.com>
	<62473423-1805-cbb9-240f-c070f729fe16@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Dec 2016 16:16:30 +0000
Message-ID: <CAJTo0LbxmC2BBj0V2BXWo1UqJmgALSdSK=GmCh4dZeMyxFp3gg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/33] dpkg: update-alternatives-dpkg should conflict with other providers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2016 16:17:01 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b80a1acf054327f796

--001a1145b7b80a1acf054327f796
Content-Type: text/plain; charset=UTF-8

With PACKAGE_CLASSES="package_rpm package_deb" this happens:

ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-native is
trying to install files into a shared area when those files already exist.
Those files and their manifest location are:

 /data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/update-alternatives
 Matched in b'manifest-x86_64-opkg-utils-native.populate_sysroot'

Whilst I agree that building multiple package types at the same time is a
bit weird, it's always worked in the past.

Ross

On 7 December 2016 at 01:30, Andreas Oberritter <obi@opendreambox.org>
wrote:

> On 06.12.2016 20:52, Burton, Ross wrote:
> > This needs more than just RCONFLICTS:
> >
> > ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-native
> > is trying to install files into a shared area when those files already
> > exist. Those files and their manifest location are:
> >
> >  /data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/
> update-alternatives
> >
> > I have both package_deb and package_rpm enabled, and have a build from
> > master before trying your branch.
>
> I'm going to address this in "dpkg: implement offline mode for update-
> alternatives" with the following additions:
>
> +PROVIDES = "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives',
> 'virtual/update-alternatives', '', d)}"
>
> [...]
>
> +UA = "update-alternatives"
> +UA_native = "${@['', 'update-alternatives'][d.getVar('PREFERRED_PROVIDER_
> virtual/update-alternatives-native', True) == 'dpkg-native']}"
> +
> +PACKAGECONFIG ??= "${UA}"
> +PACKAGECONFIG[update-alternatives] = "--enable-update-alternatives,
> --disable-update-alternatives"
>
> Because update-alternative-dpkg and update-alternatives-opkg are using
> incompatible databases, I don't think there are much better ways to
> avoid this conflict.
>
> Regards,
> Andreas
>

--001a1145b7b80a1acf054327f796
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With PACKAGE_CLASSES=3D&quot;package_rpm package_deb&quot;=
 this happens:<div><br></div><div><div>ERROR: dpkg-native-1.18.7-r0 do_popu=
late_sysroot: The recipe dpkg-native is trying to install files into a shar=
ed area when those files already exist. Those files and their manifest loca=
tion are:</div><div>=C2=A0 =C2=A0/data/poky-master/tmp-glibc/sysroots/x86_6=
4-linux/usr/bin/update-alternatives</div><div>=C2=A0Matched in b&#39;manife=
st-x86_64-opkg-utils-native.populate_sysroot&#39;</div></div><div><br></div=
><div>Whilst I agree that building multiple package types at the same time =
is a bit weird, it&#39;s always worked in the past.</div><div><br></div><di=
v>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 7 December 2016 at 01:30, Andreas Oberritter <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 06.12.2016 20:52, Burton, Ross wrote:<br>
&gt; This needs more than just RCONFLICTS:<br>
&gt;<br>
&gt; ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-nati=
ve<br>
&gt; is trying to install files into a shared area when those files already=
<br>
&gt; exist. Those files and their manifest location are:<br>
&gt;<br>
&gt;=C2=A0 /data/poky-master/tmp-glibc/<wbr>sysroots/x86_64-linux/usr/bin/<=
wbr>update-alternatives<br>
&gt;<br>
&gt; I have both package_deb and package_rpm enabled, and have a build from=
<br>
&gt; master before trying your branch.<br>
<br>
</span>I&#39;m going to address this in &quot;dpkg: implement offline mode =
for update-<br>
alternatives&quot; with the following additions:<br>
<br>
+PROVIDES =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39=
;update-alternatives&#39;, &#39;virtual/update-alternatives&#39;, &#39;&#39=
;, d)}&quot;<br>
<br>
[...]<br>
<br>
+UA =3D &quot;update-alternatives&quot;<br>
+UA_native =3D &quot;${@[&#39;&#39;, &#39;update-alternatives&#39;][d.<wbr>=
getVar(&#39;PREFERRED_PROVIDER_<wbr>virtual/update-alternatives-<wbr>native=
&#39;, True) =3D=3D &#39;dpkg-native&#39;]}&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${UA}&quot;<br>
+PACKAGECONFIG[update-<wbr>alternatives] =3D &quot;--enable-update-alternat=
ives,<wbr>--disable-update-alternatives&quot;<br>
<br>
Because update-alternative-dpkg and update-alternatives-opkg are using<br>
incompatible databases, I don&#39;t think there are much better ways to<br>
avoid this conflict.<br>
<br>
Regards,<br>
Andreas<br>
</blockquote></div><br></div>

--001a1145b7b80a1acf054327f796--
