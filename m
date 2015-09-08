Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A448763F8;
	Tue,  8 Sep 2015 15:57:14 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so122434249wic.0;
	Tue, 08 Sep 2015 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=SzgmG01G3KYS6U4f1TzKfuuNHnFSA89+k88+fr9Ed5s=;
	b=kiqUA3g0UGyJ6OZ/wmAvHHsA9tnMb2jUwcENVepPsNoc0Yqs8geBcZgc9NpE1Boq42
	h1RjSu0nIO+LzvnJzn+hPEeql8vsiJNK8WfdLiviAmKjEWbcBPrFMG1Oys3OtORB6UUM
	HdSCvDFra2aqzWwgt75c7JdI28yuBfTLw/WfVMow5xrBdnyVHQNOvujAjpTDOUkfyEbG
	2WzuFbl85ghqJFTFOd61lsLw7c8Cp6n3RyZzzdQk3gOvi34aRUqJ3MnC7mgcfLdGizuO
	L54c9IcnG3SscHsp1ZEpUmRpnPcBYQv1xVIDUQ1OjHXQVe0MTrvqiemuhbw76JpGu4Tg
	Xeng==
X-Received: by 10.194.82.37 with SMTP id f5mr51767907wjy.36.1441727834551;
	Tue, 08 Sep 2015 08:57:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l9sm6480412wiy.10.2015.09.08.08.57.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:57:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 17:58:01 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150908155801.GD2381@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2015-09-08
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
X-List-Received-Date: Tue, 08 Sep 2015 15:57:16 -0000
X-Groupsio-MsgNum: 70829
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2014 at 03:46:13PM +0200, Martin Jansa wrote:
> ERROR: 63 issues were found in these recipes: android-tools dracut
> font-alias initramfs-framework initscripts ipsec-tools linux-firmware
> lmsensors oprofile oprofileui oprofileui-server
> polkit-group-rule-datetime polkit-group-rule-network ppp-dialin
> qt-demo-init resolvconf run-postinsts shr-theme-neo sysvinit
> terminus-font tipcutils ttf-arphic-uming ttf-dejavu ttf-droid
> ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-mplus
> ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei usbinit vpnc
> weston-init xfce4-session xl2tpd xserver-common xserver-nodm-init
> xuser-account

ERROR: 154 issues were found in these recipes: android-tools
cmake-modules-webos-native cpushareholder-stub cryptodev-tests dracut
initscripts ipsec-tools libauthen-sasl-perl libdigest-hmac-perl
libio-socket-ssl-perl libpbnjson librolegen linux-atm lmsensors
lttng-tools luna-next luna-prefs luna-service2 luna-sysmgr-common
luna-sysmgr-ipc luna-sysmgr-ipc-messages luna-webkit-api netmap nyx-lib
openlmi-networking openlmi-providers openlmi-storage oprofile oprofileui
oprofileui-server packagegroup-efl-sdk phpmyadmin pmloglib
pmloglib-private polkit-group-rule-datetime polkit-group-rule-network
qt5-creator qtquick1 qtwebkit qtwebkit-examples rdx-utils-stub
serviceinstaller shr-theme-neo terminus-font tipcutils ttf-arphic-uming
ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts ttf-inconsolata
ttf-liberation ttf-mplus ttf-sazanami ttf-tlwg ttf-ubuntu-font-family
ttf-wqy-zenhei xfce4-session xl2tpd xserver-common xserver-nodm-init
zabbix

Some of these are caused by cmake-modules-webos-native so I'll fix this
one first and then resend hopefully nicer-looking report.

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20150908_150743.log/

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXvBYcACgkQN1Ujt2V2gBzB0wCgiwzJGMeDqHs6dHX9Mq+BRebE
HmkAn2xnfVF34gaAplPuv7Ui3i4E9cYg
=2iVp
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
