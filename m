Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id A35AA74D2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 14:38:36 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id t22-v6so13096839oih.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=sO27TAbIkBGiWNRDPhwxuAxNLcSH6mvJqtQtxlG6PZo=;
	b=SYr7r4zzcyXRfVXfUtIvu+nxCzXTdQyhJuHPztURvZ4OOjEFIhTAC1/c9E0p1ZmpU1
	flGvOUFXlDVpAnsi83qbK7WTrlNtren3mH94mEEoBzuwbztWhRDJ/4c5jx0Ba34LQp40
	KCg529YmnKHrV4qhEfB0K5wD8mLGXNOpYYHCcu/2RHUs9GXUSLpn574b2JE1ElbgOkG9
	Qr9GRXwjnsFT5ITbPO9eR9gP/OuUAcFJ8iuBGzgzX1+dS9bWT+EnUqy9Sb0atzYUxAOh
	TxROt6IH10uW7WwSboFmT1plQZi8YKkmzDmEje0zRmtlZwEZH51dMwt4j/yQB3Wkg6a7
	pvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=sO27TAbIkBGiWNRDPhwxuAxNLcSH6mvJqtQtxlG6PZo=;
	b=dgwfJ1I64Gin7viemKK3OwHhGmv3KLf4yZWeQ4u1fjfbhTkH0znXs+uks0ucI8q7UV
	bsjKsI1Zd87xDwZ1z5iL0F0uemdW09kA3sZIN/bcubp+pCuW4uHH2G+tbgNK/+2Dpssq
	MvRwxDzPj4wM2LHEj0J458HG1JLsV/Epyl5V2tAtaQEXa74tT42+SyXt/IXKdOqxNHye
	UhU6Diu8ot8FpL+u2ADaS6jhiM0Xg3pxuGptB4cQUdGXpl1vS9nbS34LHF+E90Kp5BTC
	kAwZBkbXUq/6+AgWD85qZN2eB6aNi80Fr3R3T3h3JFkWinifOFxiB79HR+K11Hw6/ZHi
	5XHw==
X-Gm-Message-State: APt69E0TKC5gmUqZpi4UJLHQZtXn92XYxJ+KO6Hcmy9IbvJe0q4gQZ22
	RF4wrTpqcMcYrV+076Sqp7rlyTGYTxxf7Tlw4As=
X-Google-Smtp-Source: ADUXVKJu9/Xq8BZ5ba33DhlMS+/8stTM2eFi4MHAC4HPISsW9msDdXiDmaFrFVMlMEI2xgqTleiEvgTztB+6MfH9g5c=
X-Received: by 2002:aca:5d0b:: with SMTP id
	r11-v6mr1591197oib.195.1527691117163; 
	Wed, 30 May 2018 07:38:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2927:0:0:0:0:0 with HTTP; Wed, 30 May 2018 07:38:16
	-0700 (PDT)
In-Reply-To: <CABPh3UMsooqLDJ+Aq1DiObxoi12a2Oj68nO51ALjgBet2SwkAw@mail.gmail.com>
References: <CABPh3UMsooqLDJ+Aq1DiObxoi12a2Oj68nO51ALjgBet2SwkAw@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 30 May 2018 15:38:16 +0100
Message-ID: <CABPh3UOQQha+o7L8kgqy61n5tdJyKBke+SD6PkFJRTyJzTAbWg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH] systemd: resolved linked even if the option is disabled
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
X-List-Received-Date: Wed, 30 May 2018 14:38:36 -0000
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ----------
From: nick83ola <nick83ola@gmail.com>
Date: 30 May 2018 at 14:24
Subject: [poky][PATCH] systemd: resolved linked even if the option is disabled
To: poky@yoctoproject.org


systemd: resolved linked even if the option is disabled

in the do_install function in systemd recipe the condition to check
if the resolved option is selected is reversed (wrong !).
This is for example true if we compile systemd with musl instead of
glibc (every poky-image-minimal recipe).

Also no link should be created if the option is not selected
nor an ALTERNATIVE set.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb
b/meta/recipes-core/systemd/systemd_237.bb
index 2e6558ded1..2eea6af508 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -256,14 +256,11 @@ do_install() {
     if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
         ${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed
-i -e "\$ad /run/systemd/netif/links 0755 root root -"
${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
     fi
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
+    if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
         echo 'L! ${sysconfdir}/resolv.conf - - - -
../run/systemd/resolve/resolv.conf'
>>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
         echo 'd /run/systemd/resolve 0755 root root -'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
         echo 'f /run/systemd/resolve/resolv.conf 0644 root root'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
         ln -s ../run/systemd/resolve/resolv.conf
${D}${sysconfdir}/resolv-conf.systemd
-    else
-        sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - -
- - ../run/systemd/resolve/resolv.conf%g"
${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-        ln -s ../run/systemd/resolve/resolv.conf
${D}${sysconfdir}/resolv-conf.systemd
     fi
     install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON
${D}${systemd_unitdir}/systemd-sysv-install

@@ -537,7 +534,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit

-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"

 ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -563,6 +560,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"

+ALTERNATIVE_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
'resolved', 'resolv-conf', '', d)}"
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
--
2.17.0




-- 

P.S. Le informazioni trasmesse attraverso la presente comunicazione
sono di esclusiva
spettanza dell'effettivo destinatario. Nel caso in cui le stesse
raggiungessero, per
qualunque motivo, soggetti non interessati, questi ultimi vorranno
darne immediata
notizia al mittente. In ogni caso, eventuali soggetti diversi dai
legittimi destinatari
della presente comunicazione e dei dati contenuti negli allegati, possono essere
sanzionati ai sensi del T.U. sul trattamento dei dati personali d.lgs.
196/2003, sia ai
sensi dell'art. 616 del Codice Penale che disciplina la violazione del
segreto sulla
corrispondenza.

