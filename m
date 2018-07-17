Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id C1509789BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:26:49 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 13-v6so789165ois.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lZcdNo1NzQh4bANrV3k2IElh3KHeW2XwikZpsSGKZ5Q=;
	b=s52nW3QK0VqrXSd2/f5ko39S4NgukCFGEGDMfEhvddxVDC3prb2DRkgMpLjSH1wbAe
	scpb5ff9HTBAaKHhrCmyc+kBSoqkfmTR29gcvQ6mycP8I2q9CKq3rPNEg3fFE/svbSrw
	yMoUoIbjvlhmxXeTlOqayMF2qhQnc4Dyr5UKGxdlnlX6bkUXxPEdavmkd61QZN6g53ms
	jTyYnRqO9FGw8I1714uSvbwOdwpBwQTnGnYzxNi/gvTPtjXAtUI9/vfWYTBGMLTW0O22
	TQsw8kTX+eYVaiGrRHs1FZIJ6mgy/td7mUPO13mcAQ28kGQds7HS2wfwc1pS45RqyA93
	DaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lZcdNo1NzQh4bANrV3k2IElh3KHeW2XwikZpsSGKZ5Q=;
	b=UovxwmWe69XBF0WT29DW97kIcs8wmUgM+YMA0ZCIBvw4gOyaY/EYj+oowbYsCxMFTO
	33zHLz970R2f2dc1iJl6UVlfC7hX+fUk0MEwlz5pBaMCpDO6sy4Na78mAeiA/+O72P5s
	4fVDrieps+bfehSkxp0BOurMSslrS/j8AG6TFx6OUh2squo8LCM1XPM1Bp1Ue+IWZO/v
	+JkHVUMdhNvxYJi93ltNL3flipFQhItC9AkeTgjKmo25PPYHdI+R/Za0cH77U/iyX6pu
	URU1mKT3yt7uB21hjn8fdhn3uBviMytdPKvTdd5qrLcP/etW8ErxBfgeE7DQxqrr4+KO
	/cXw==
X-Gm-Message-State: AOUpUlE15mPh5XyLie2/qk6p1cpmoc2BkosJNF/bvWmGC1iMN33clMR6
	7tdAQ2G1iRdK2Kh3XvmRTcjt6hfOHWyefVUXkns=
X-Google-Smtp-Source: AAOMgpfmnroDo7+57f/Lkw1UqZyzWVLs0WsZL4H9io2yIj4o+++pvxBdlBE4dE9xv1bqWRlrQs6xpHXeRIC8as2KqUU=
X-Received: by 2002:aca:3882:: with SMTP id
	f124-v6mr748114oia.195.1531819610780; 
	Tue, 17 Jul 2018 02:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180716081759.5747-1-nick83ola@gmail.com>
	<30a8009d-b30f-b55b-bb31-ac1330273835@windriver.com>
In-Reply-To: <30a8009d-b30f-b55b-bb31-ac1330273835@windriver.com>
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 17 Jul 2018 10:26:39 +0100
Message-ID: <CABPh3UME_1ekHMRe7iXB1wdTNNuXFfTL6CYZGbEo8PufXq3G4w@mail.gmail.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][poky][PATCH v2] systemd: resolved linked even if the option is disabled
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
X-List-Received-Date: Tue, 17 Jul 2018 09:26:50 -0000
Content-Type: multipart/alternative; boundary="000000000000c2baeb05712e8b0f"

--000000000000c2baeb05712e8b0f
Content-Type: text/plain; charset="UTF-8"

Hi Chen Qi,
Thanks I didn't see your previous response.
I will have a look and post my considerations.

Best Regards
Nicola Lunghi

On Mon, 16 Jul 2018 at 10:09, ChenQi <Qi.Chen@windriver.com> wrote:

> Hi Nicola,
>
> As I replied on poky mailing list to this patch, you need to first check
> the following three commits.
>
> commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
> Author: Maxin B. John <maxin.john@intel.com> <maxin.john@intel.com>
> Date:   Mon Jun 12 18:10:21 2017 +0300
>
>     systemd: enable resolved and networkd
>
>     Enable systemd-resolved and systemd-networkd by default.
>     Make it co-exist with connman and  Fix associated problems
>     in read-only rootfs.
>
>     Fixes [YOCTO #11331]
>
>     (From OE-Core rev: d9b6d538e3d81ab0d5e7b7b6adecef555d782217)
>
>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
> <maxin.john@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> <richard.purdie@linuxfoundation.org>
>
> commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
> Author: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
> Date:   Fri Dec 16 14:07:31 2016 -0800
>
>     systemd: point to correct resolv.conf when resolved is enabled
>
>     latest systemd has changed the resolved defaults which points to
>     127.0.0.53 port 53 on local network. If someone wants to use
>     host-local IP address then it can be pointed to copy in /lib/systemd
>
>     (From OE-Core rev: 99d1199fd0961f94732a1a533d66472ca17cf6f5)
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> <richard.purdie@linuxfoundation.org>
>
> commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89
> Author: Christopher Larson <chris_larson@mentor.com>
> <chris_larson@mentor.com>
> Date:   Wed Nov 4 20:19:19 2015 -0700
>
>     systemd: arrange for volatile /etc/resolv.conf
>
>     On sysvinit systems, volatiles is configured to make /etc/resolv.conf
> symlink
>     to a file in a volatile path, which lets us write to /etc/resolv.conf
> for
>     read-only-rootfs. For systemd, this isn't set up unless we enable
>     systemd-resolved, which we don't by default. When it's not enabled,
> create the
>     /etc/resolv.conf symlink and ensure the volatile path is created on
> boot with
>     tmpfiles.d.
>
>     (From OE-Core rev: 7f087f161e8942bcd35f88999dfca418f01cd7fa)
>
>     Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> <chris_larson@mentor.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> <richard.purdie@linuxfoundation.org>
>
> Best Regards,
> Chen Qi
>
>
> On 07/16/2018 04:17 PM, Nicola Lunghi wrote:
>
> From: Nicola Lunghi <nicola.lunghi@jci.com> <nicola.lunghi@jci.com>
>
> if resolved option is not selected the package systemd-resolved
> is not installed so it cannot provide an alternative for
> resolv.conf
>
> In this recipe the previous check was instead reversing the check (note the !).
>
> This patch avoid messing with resol.conf link if resolved is disabled in
> the package config.
>
> This in particular if we compile systemd with musl where systemd-resolved
> cannot be compiled.
>
> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com> <nicola.lunghi@jci.com>
> ---
>  meta/recipes-core/systemd/systemd_237.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index 3efca33e73..bd6dcef637 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -258,14 +258,11 @@ do_install() {
>  	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
>  		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
>  	fi
> -	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
>  		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>  		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
>  		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
>  		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
> -	else
> -		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> -		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
>  	fi
>  	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
>
> @@ -539,7 +536,7 @@ python __anonymous() {
>  # TODO:
>  # u-a for runlevel and telinit
>
> -ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
> +ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
>
>  ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
>  ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
> @@ -565,6 +562,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>  ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>
> +ALTERNATIVE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}" <$%7B@bb.utils.contains('PACKAGECONFIG','resolved','resolv-conf','',d)%7D>
>  ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
>  ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
>  ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c2baeb05712e8b0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi C<span style=3D"font-size:small;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">hen Qi,=C2=A0</span></div><div>Thanks I didn&#3=
9;t see your previous response.<br></div><div>I will have a look and post m=
y considerations.</div><div><br></div><div>Best Regards</div><div>Nicola Lu=
nghi</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 16 =
Jul 2018 at 10:09, ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.C=
hen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"m_4723485065661646968moz-cite-prefix">Hi Nicola,<br>
      <br>
      As I replied on poky mailing list to this patch, you need to first
      check the following three commits.<br>
      <br>
      commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
      <br>
      Author: Maxin B. John <a class=3D"m_4723485065661646968moz-txt-link-r=
fc2396E" href=3D"mailto:maxin.john@intel.com" target=3D"_blank">&lt;maxin.j=
ohn@intel.com&gt;</a>
      <br>
      Date:=C2=A0=C2=A0 Mon Jun 12 18:10:21 2017 +0300
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 systemd: enable resolved and networkd
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 Enable systemd-resolved and systemd-networkd by de=
fault.
      <br>
      =C2=A0=C2=A0=C2=A0 Make it co-exist with connman and=C2=A0 Fix associ=
ated problems
      <br>
      =C2=A0=C2=A0=C2=A0 in read-only rootfs.
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 Fixes [YOCTO #11331]
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 (From OE-Core rev: d9b6d538e3d81ab0d5e7b7b6adecef5=
55d782217)
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Maxin B. John <a class=3D"m_4723485=
065661646968moz-txt-link-rfc2396E" href=3D"mailto:maxin.john@intel.com" tar=
get=3D"_blank">&lt;maxin.john@intel.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <a class=3D"m_472348=
5065661646968moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">&lt;richard.purdie@linuxfoundation.org&gt;</a=
>
      <br>
      <br>
      commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
      <br>
      Author: Khem Raj <a class=3D"m_4723485065661646968moz-txt-link-rfc239=
6E" href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt;raj.khem@gmail=
.com&gt;</a>
      <br>
      Date:=C2=A0=C2=A0 Fri Dec 16 14:07:31 2016 -0800
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 systemd: point to correct resolv.conf when resolve=
d is enabled
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 latest systemd has changed the resolved defaults w=
hich points
      to
      <br>
      =C2=A0=C2=A0=C2=A0 127.0.0.53 port 53 on local network. If someone wa=
nts to use
      <br>
      =C2=A0=C2=A0=C2=A0 host-local IP address then it can be pointed to co=
py in
      /lib/systemd
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 (From OE-Core rev: 99d1199fd0961f94732a1a533d66472=
ca17cf6f5)
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Khem Raj <a class=3D"m_472348506566=
1646968moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">&lt;raj.khem@gmail.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Ross Burton <a class=3D"m_472348506=
5661646968moz-txt-link-rfc2396E" href=3D"mailto:ross.burton@intel.com" targ=
et=3D"_blank">&lt;ross.burton@intel.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <a class=3D"m_472348=
5065661646968moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">&lt;richard.purdie@linuxfoundation.org&gt;</a=
>
      <br>
      <br>
      commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89
      <br>
      Author: Christopher Larson <a class=3D"m_4723485065661646968moz-txt-l=
ink-rfc2396E" href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">&lt=
;chris_larson@mentor.com&gt;</a>
      <br>
      Date:=C2=A0=C2=A0 Wed Nov 4 20:19:19 2015 -0700
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 systemd: arrange for volatile /etc/resolv.conf
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 On sysvinit systems, volatiles is configured to ma=
ke
      /etc/resolv.conf symlink
      <br>
      =C2=A0=C2=A0=C2=A0 to a file in a volatile path, which lets us write =
to
      /etc/resolv.conf for
      <br>
      =C2=A0=C2=A0=C2=A0 read-only-rootfs. For systemd, this isn&#39;t set =
up unless we
      enable
      <br>
      =C2=A0=C2=A0=C2=A0 systemd-resolved, which we don&#39;t by default. W=
hen it&#39;s not
      enabled, create the
      <br>
      =C2=A0=C2=A0=C2=A0 /etc/resolv.conf symlink and ensure the volatile p=
ath is
      created on boot with
      <br>
      =C2=A0=C2=A0=C2=A0 tmpfiles.d.
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 (From OE-Core rev: 7f087f161e8942bcd35f88999dfca41=
8f01cd7fa)
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Christopher Larson <a class=3D"m_47=
23485065661646968moz-txt-link-rfc2396E" href=3D"mailto:chris_larson@mentor.=
com" target=3D"_blank">&lt;chris_larson@mentor.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Ross Burton <a class=3D"m_472348506=
5661646968moz-txt-link-rfc2396E" href=3D"mailto:ross.burton@intel.com" targ=
et=3D"_blank">&lt;ross.burton@intel.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <a class=3D"m_472348=
5065661646968moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">&lt;richard.purdie@linuxfoundation.org&gt;</a=
>
      <br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 07/16/2018 04:17 PM, Nicola Lunghi wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Nicola Lunghi <a class=3D"m_4723485065661646968moz-txt-lin=
k-rfc2396E" href=3D"mailto:nicola.lunghi@jci.com" target=3D"_blank">&lt;nic=
ola.lunghi@jci.com&gt;</a>

if resolved option is not selected the package systemd-resolved
is not installed so it cannot provide an alternative for
resolv.conf

In this recipe the previous check was instead reversing the check (note the=
 !).

This patch avoid messing with resol.conf link if resolved is disabled in
the package config.

This in particular if we compile systemd with musl where systemd-resolved
cannot be compiled.

Signed-off-by: Nicola Lunghi <a class=3D"m_4723485065661646968moz-txt-link-=
rfc2396E" href=3D"mailto:nicola.lunghi@jci.com" target=3D"_blank">&lt;nicol=
a.lunghi@jci.com&gt;</a>
---
 meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" target=3D"_bla=
nk">systemd_237.bb</a> | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" ta=
rget=3D"_blank">systemd_237.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_237.bb" target=3D"_blank">systemd_237.bb</a>
index 3efca33e73..bd6dcef637 100644
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" target=3D=
"_blank">systemd_237.bb</a>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" target=3D=
"_blank">systemd_237.bb</a>
@@ -258,14 +258,11 @@ do_install() {
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;networkd&#39;, &#39;:=
&#39;, &#39;sed -i -e &quot;\$ad /run/systemd/netif/links 0755 root root -&=
quot; ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf&#39;, d)}
 	fi
-	if ! ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;resolved&#39;, &#=
39;true&#39;, &#39;false&#39;, d)}; then
+	if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;resolved&#39;, &#39=
;true&#39;, &#39;false&#39;, d)}; then
 		echo &#39;L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/re=
solv.conf&#39; &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		echo &#39;d /run/systemd/resolve 0755 root root -&#39; &gt;&gt;${D}${exe=
c_prefix}/lib/tmpfiles.d/systemd.conf
 		echo &#39;f /run/systemd/resolve/resolv.conf 0644 root root&#39; &gt;&gt=
;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.s=
ystemd
-	else
-		sed -i -e &quot;s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ..=
/run/systemd/resolve/resolv.conf%g&quot; ${D}${exec_prefix}/lib/tmpfiles.d/=
etc.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.s=
ystemd
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${s=
ystemd_unitdir}/systemd-sysv-install
=20
@@ -539,7 +536,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
=20
-ALTERNATIVE_${PN} =3D &quot;init halt reboot shutdown poweroff runlevel re=
solv-conf&quot;
+ALTERNATIVE_${PN} =3D &quot;init halt reboot shutdown poweroff runlevel&qu=
ot;
=20
 ALTERNATIVE_TARGET[init] =3D &quot;${rootlibexecdir}/systemd/systemd&quot;
 ALTERNATIVE_LINK_NAME[init] =3D &quot;${base_sbindir}/init&quot;
@@ -565,6 +562,7 @@ ALTERNATIVE_TARGET[runlevel] =3D &quot;${base_bindir}/s=
ystemctl&quot;
 ALTERNATIVE_LINK_NAME[runlevel] =3D &quot;${base_sbindir}/runlevel&quot;
 ALTERNATIVE_PRIORITY[runlevel] ?=3D &quot;300&quot;
=20
+ALTERNATIVE_${PN} +=3D <a class=3D"m_4723485065661646968moz-txt-link-rfc23=
96E" href=3D"mailto:$%7B@bb.utils.contains(&#39;PACKAGECONFIG&#39;,&#39;res=
olved&#39;,&#39;resolv-conf&#39;,&#39;&#39;,d)%7D" target=3D"_blank">&quot;=
${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;resolved&#39;, &#39;reso=
lv-conf&#39;, &#39;&#39;, d)}&quot;</a>
 ALTERNATIVE_TARGET[resolv-conf] =3D &quot;${sysconfdir}/resolv-conf.system=
d&quot;
 ALTERNATIVE_LINK_NAME[resolv-conf] =3D &quot;${sysconfdir}/resolv.conf&quo=
t;
 ALTERNATIVE_PRIORITY[resolv-conf] ?=3D &quot;50&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
  </div>

-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000c2baeb05712e8b0f--
