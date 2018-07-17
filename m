Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id E6F4876084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 10:05:49 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id k12-v6so936777oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AHsoXI8F/sfFFw/rNzrR1Q/XHicXDUFz/2YDlWOnrdc=;
	b=fx8Bd2ZNsUhChqXWsc2yPzqkoQrPcYGXlvCU3W+7fpdxsW5BfN7A4w4AdjY5eSsJ0T
	WthM1hv9I1H1ih846VPJQLiSWB0aI19t4erGPtEUsI+qDGL1WjNKnN+UAVKeAL/FdT1B
	wIeC7H94L2E17q/3zo9putWUmnZd15DUWwTLevFDQEeUHI3YWF4jjX5B6hOBMkJ1Tv+U
	L9JRcb4AW3qG2ARF06A9ZzMypy30JO0i+c1zHAsZ64qplk2Rqb5VLflu2BuAFW0OsBJI
	hsZ42KKZo0Vi/2CRpgL+4zPuy0FIqo6UDupGbyhe5saEmrsH69DC5j5B7xgvLB40tsaL
	xFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AHsoXI8F/sfFFw/rNzrR1Q/XHicXDUFz/2YDlWOnrdc=;
	b=ejO9GXaDZ521Cr3DApluydrX/pMKxb16etFR8Z4xnI/VyDjQkowyLY5plwafnbpTf9
	DEPCjwKn3i9BK8zOwbHXtfYySuSrbDnqltWOmtJjk4wGk5baP6xg5blNqEmp69iP+xXG
	vsLpIgiPk2hl/GTbJvneW+PgpftDrmf3Aj9+m4aCGTzFw+zbEd74i04AwCYdVlT3Y+/x
	1zFAdLTNNC7u/qA5QDw+hPEBgTHoAUCql4N5lE1M02ymu7mt2ty3+QAvIAEyxWyOXMC2
	T8W0RUGEPlHMUGZxx1yEcEa5q9PruNeHo1R0Oh4tqjLCV76ce94CaihtiRnfFuXEla5E
	pJUw==
X-Gm-Message-State: AOUpUlHVJ0J3t45ka65F83nClstOobcMLae6RV5xSADChhNP+X4CjQi+
	ZOX8HsHh+74mF6gcZrddjLmQlR5mT33g/8GiqT8=
X-Google-Smtp-Source: AAOMgperCk7UNFYTeX6UfEEnStUcDiBKivD43TrsGBACdBCZ6Pp3N5AhPi0ellvIM/U8XkrZlxiFX5bEC9lZRKFCXyc=
X-Received: by 2002:aca:4455:: with SMTP id
	r82-v6mr1005620oia.260.1531821950939; 
	Tue, 17 Jul 2018 03:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180716081759.5747-1-nick83ola@gmail.com>
	<30a8009d-b30f-b55b-bb31-ac1330273835@windriver.com>
In-Reply-To: <30a8009d-b30f-b55b-bb31-ac1330273835@windriver.com>
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 17 Jul 2018 11:05:39 +0100
Message-ID: <CABPh3UPFvQPxLzOCkGbr==exY6563k8aQankndPjN_wQs09H7g@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 10:05:50 -0000
Content-Type: multipart/alternative; boundary="0000000000003eb6cb05712f1710"

--0000000000003eb6cb05712f1710
Content-Type: text/plain; charset="UTF-8"

Hi

commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
> Author: Maxin B. John <maxin.john@intel.com> <maxin.john@intel.com>
> Date:   Mon Jun 12 18:10:21 2017 +0300
>
>     systemd: enable resolved and networkd
>
>     Enable systemd-resolved and systemd-networkd by default.
>     Make it co-exist with connman and  Fix associated problems
>     in read-only rootfs.
>
>
This part of the patch does nothing with the current version of systemd (or
does the wrong thing)


        else
                sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf -
- - - ../run/systemd/resolve/resolv.conf%g"
${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+               ln -s ../run/systemd/resolve/resolv.conf
${D}${sysconfdir}/resolv-conf.systemd
        fi

the check here was

     if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
apart from the part that the check is REVERSED ...
if the PACKAGECONFIG doesn't contain the resolved option systemd-resolved
is not build and no modification is done on the /lib/tmpfiles/etc/conf

see
https://github.com/systemd/systemd/blob/46659f7deb962f55c728e70597e37c2a3ab6326d/tmpfiles.d/etc.conf.m4#L16
m4_ifdef(`ENABLE_RESOLVE',
L! /etc/resolv.conf - - - - ../run/systemd/resolve/stub-resolv.conf
)m4_dnl

So the else branch can be safely removed.



>   commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
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
>
So here the error was introduced!!!!! read this patch carefully
If you read the deleted comment it was saying:
*if resolved is disabled*,
But this patch reverse it to

systemd: point to correct resolv.conf when resolved *is enabled*

        if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
-               # *if resolved is disabled*, it won't handle the link of
resolv.conf, so
-               # set it up ourselves
-               ln -s ../run/resolv.conf ${D}${sysconfdir}/resolv.conf
-               echo '*L! ${sysconfdir}/resolv.conf - - - -
../run/resolv.conf'* >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-               echo 'f /run/resolv.conf 0644 root root'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+               echo* 'L! ${sysconfdir}/resolv.conf - - - -
../run/systemd/resolve/resolv.conf'*
>>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+               echo 'd /run/systemd/resolve 0755 root root -'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+               echo 'f /run/systemd/resolve/resolv.conf 0644 root root'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+               ln -s ../run/systemd/resolve/resolv.conf
${D}${sysconfdir}/resolv.conf
+       else
+               sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf -
- - - ../run/systemd/resolve/resolv.conf%g"
${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
        fi
        install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON
${D}${systemd_unitdir}/systemd-sysv-install
 }







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
>
+       if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
+               # if resolved is disabled, it won't handle the link of
resolv.conf, so
+               # set it up ourselves
+               ln -s ../run/resolv.conf ${D}${sysconfdir}/resolv.conf
+               echo 'L! ${sysconfdir}/resolv.conf - - - -
../run/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+               echo 'f /run/resolv.conf 0644 root root'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+       fi
        install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON
${D}${systemd_unitdir}/systemd-sysv-install
 }

This patch was the right one the following
669edd04432f8e76e32bd7f34f4d9aa63eef4038 reversed the sense of the switch

Regards
Nicola Lunghi


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

--0000000000003eb6cb05712f1710
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><div><br><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF"><div class=3D"gm=
ail-m_-8033413996440123836moz-cite-prefix">
      commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
      <br>
      Author: Maxin B. John <a class=3D"gmail-m_-8033413996440123836moz-txt=
-link-rfc2396E" href=3D"mailto:maxin.john@intel.com" target=3D"_blank">&lt;=
maxin.john@intel.com&gt;</a>
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
      <br></div></div></blockquote><div><br></div><div>This part of the pat=
ch does nothing with the current version of systemd (or does the wrong thin=
g)<br></div><div><br></div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e &quot;s%^L! /etc/resolv.c=
onf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g&quo=
t; ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ../run/s=
ystemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi</div></div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">the check here was</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0=C2=
=A0 if ! ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;resolved&#39;, =
&#39;true&#39;, &#39;false&#39;, d)}; then<br></div><div class=3D"gmail_quo=
te">apart from the part that the check is REVERSED ...<br></div><div class=
=3D"gmail_quote">if the PACKAGECONFIG doesn&#39;t contain the resolved opti=
on systemd-resolved is not build and no modification is done on the /lib/tm=
pfiles/etc/conf</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">see<br></div><div class=3D"gmail_quote"><a href=3D"https://github=
.com/systemd/systemd/blob/46659f7deb962f55c728e70597e37c2a3ab6326d/tmpfiles=
.d/etc.conf.m4#L16">https://github.com/systemd/systemd/blob/46659f7deb962f5=
5c728e70597e37c2a3ab6326d/tmpfiles.d/etc.conf.m4#L16</a><br></div><div clas=
s=3D"gmail_quote"><table class=3D"gmail-highlight gmail-tab-size gmail-js-f=
ile-line-container"><tbody><tr><td id=3D"gmail-LC16" class=3D"gmail-blob-co=
de gmail-blob-code-inner gmail-js-file-line gmail-highlighted">m4_ifdef(`EN=
ABLE_RESOLVE&#39;,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC17" class=3D"gm=
ail-blob-code gmail-blob-code-inner gmail-js-file-line">L! /etc/resolv.conf=
 - - - - ../run/systemd/resolve/stub-resolv.conf</td>
      </tr>
      <tr>
        </tr></tbody></table>)m4_dnl<br></div><div class=3D"gmail_quote"><b=
r></div>So the else branch can be safely removed.<br></div><div></div><div>=
<br></div><div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF"><div class=3D"gm=
ail-m_-8033413996440123836moz-cite-prefix">=C2=A0
      commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
      <br>
      Author: Khem Raj <a class=3D"gmail-m_-8033413996440123836moz-txt-link=
-rfc2396E" href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt;raj.khe=
m@gmail.com&gt;</a>
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
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Khem Raj <a class=3D"gmail-m_-80334=
13996440123836moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Ross Burton <a class=3D"gmail-m_-80=
33413996440123836moz-txt-link-rfc2396E" href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">&lt;ross.burton@intel.com&gt;</a>
      <br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <a class=3D"gmail-m_=
-8033413996440123836moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">&lt;richard.purdie@linuxfoundation.org=
&gt;</a>
      <br>
      <br></div></div></blockquote><div><br></div><div>So here the error wa=
s introduced!!!!! read this patch carefully</div><div>If you read the delet=
ed comment it was saying:</div><div><b>if resolved is disabled</b>,</div><d=
iv>But this patch reverse it to <br></div><div><br></div><div style=3D"marg=
in-left:40px">systemd: point to correct resolv.conf when resolved <b>is ena=
bled</b></div><br><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ! ${@b=
b.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;resolved&#39;, &#39;true&#39=
;, &#39;false&#39;, d)}; then<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # <b>if resolved is disabled<=
/b>, it won&#39;t handle the link of resolv.conf, so<br>-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # set it=
 up ourselves<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ../run/resolv.conf ${D}${sysconfdir}/reso=
lv.conf<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 echo &#39;<b>L! ${sysconfdir}/resolv.conf - - - - ../=
run/resolv.conf&#39;</b> &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf=
<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 echo &#39;f /run/resolv.conf 0644 root root&#39; &gt;&gt;${=
D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo<b> &#39;L=
! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf&#39;=
</b> &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo =
&#39;d /run/systemd/resolve 0755 root root -&#39; &gt;&gt;${D}${exec_prefix=
}/lib/tmpfiles.d/systemd.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;f /run/systemd/reso=
lve/resolv.conf 0644 root root&#39; &gt;&gt;${D}${exec_prefix}/lib/tmpfiles=
.d/systemd.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ../run/systemd/resolve/resolv.conf ${D=
}${sysconfdir}/resolv.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sed -i -e &quot;s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf =
- - - - ../run/systemd/resolve/resolv.conf%g&quot; ${D}${exec_prefix}/lib/t=
mpfiles.d/etc.conf<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -Dm 0755 ${S}/src/systemctl=
/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install<=
br>=C2=A0}<br><br></div><div><br></div><div><br></div><div><br></div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div bgcolor=3D"#FFFFFF"><div class=3D"gmail-m_-8033413996440123836moz-cit=
e-prefix">
      commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89
      <br>
      Author: Christopher Larson <a class=3D"gmail-m_-8033413996440123836mo=
z-txt-link-rfc2396E" href=3D"mailto:chris_larson@mentor.com" target=3D"_bla=
nk">&lt;chris_larson@mentor.com&gt;</a>
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
      <br></div></div></blockquote><div><br></div><div>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if ! ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;=
resolved&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
if resolved is disabled, it won&#39;t handle the link of resolv.conf, so<br=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 # set it up ourselves<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -s ../run/resolv.conf $=
{D}${sysconfdir}/resolv.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;L! ${sysconfdir}/resol=
v.conf - - - - ../run/resolv.conf&#39; &gt;&gt;${D}${exec_prefix}/lib/tmpfi=
les.d/etc.conf<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;f /run/resolv.conf 0644 root root&=
#39; &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}$=
{systemd_unitdir}/systemd-sysv-install<br>=C2=A0}<br><br></div><div>This pa=
tch was the right one the following 669edd04432f8e76e32bd7f34f4d9aa63eef403=
8 reversed the sense of the switch</div><div><br></div><div>Regards</div><d=
iv>Nicola Lunghi<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div bgcolor=3D"#FFFFFF"><div class=3D"gmail-m_-803341399=
6440123836moz-cite-prefix">
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 07/16/2018 04:17 PM, Nicola Lunghi wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Nicola Lunghi <a class=3D"gmail-m_-8033413996440123836moz-=
txt-link-rfc2396E" href=3D"mailto:nicola.lunghi@jci.com" target=3D"_blank">=
&lt;nicola.lunghi@jci.com&gt;</a>

if resolved option is not selected the package systemd-resolved
is not installed so it cannot provide an alternative for
resolv.conf

In this recipe the previous check was instead reversing the check (note the=
 !).

This patch avoid messing with resol.conf link if resolved is disabled in
the package config.

This in particular if we compile systemd with musl where systemd-resolved
cannot be compiled.

Signed-off-by: Nicola Lunghi <a class=3D"gmail-m_-8033413996440123836moz-tx=
t-link-rfc2396E" href=3D"mailto:nicola.lunghi@jci.com" target=3D"_blank">&l=
t;nicola.lunghi@jci.com&gt;</a>
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
+ALTERNATIVE_${PN} +=3D <a class=3D"gmail-m_-8033413996440123836moz-txt-lin=
k-rfc2396E" href=3D"mailto:$%7B@bb.utils.contains(&#39;PACKAGECONFIG&#39;,&=
#39;resolved&#39;,&#39;resolv-conf&#39;,&#39;&#39;,d)%7D" target=3D"_blank"=
>&quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;resolved&#39;, &#=
39;resolv-conf&#39;, &#39;&#39;, d)}&quot;</a>
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
</blockquote></div></div><div><br></div></div>

--0000000000003eb6cb05712f1710--
