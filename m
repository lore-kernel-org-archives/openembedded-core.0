Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQElP-0008CA-2A
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 11:25:23 +0200
Received: by wgbdr1 with SMTP id dr1so2185952wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=jktPxlJsTM8sMBlqGolAf3aCdfnB89I7xgmlva26c1o=;
	b=W4Lb7WaRiSWm6YBrgbgzP0NVBKkhy2Bl4aZpORSH8TlVDT6K7Ftx8DP1TaPj/D99Lr
	vCxVvc8ajq9XJTrkYCJpeXM4vmJnwrn1B/dUl+C8bp1QeHWypilutaEnQXcypmybekKo
	6IBZF9Ez7c45u1ejFY0UeJg978NZW8yTF4lJ9+2qSgCUlyKZU8ULNkEQrG4IMlzC+e0V
	tTAj7SXYra9+wq/7V84DigO0ViSmJAqxqJkaylANj1h6yRkTU074oGXc5fHUIH22rYEg
	epz0yYsK2Wl3sp17CR2/LbNvZq/pWOHM5TcJHZPpfqOLHHqYJ/x8NrKB+rRMI7rmh2oI
	NSPg==
Received: by 10.180.104.65 with SMTP id gc1mr11025011wib.13.1336122936394;
	Fri, 04 May 2012 02:15:36 -0700 (PDT)
Received: from [192.168.1.35] (39.Red-81-33-71.dynamicIP.rima-tde.net.
	[81.33.71.39])
	by mx.google.com with ESMTPS id h8sm13079415wix.4.2012.05.04.02.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 02:15:35 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 4 May 2012 11:15:33 +0200
Message-Id: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
Subject: [meta-openembedded] [PATCH] networkmanager: silence systemd bbclass WARNING.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 09:25:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This patch fixes WARNING: /tool/yocto/meta-openembedded/meta-oe/
recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
.../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 474d98a..478d61e 100644
--- =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -54,7 +54,7 @@ do_install_append () {
	install -d ${D}/etc/NetworkManager/VPN
}

-SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_PACKAGES =3D "${PN}-systemd"
SYSTEMD_SERVICE =3D "NetworkManager.service"

PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests"=20
--=20
1.7.9.5



