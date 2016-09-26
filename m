Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61BA2600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:46:17 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n24so9681734pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=O13WKLj+AO3jYdeodsYwmGhiP6Tks6uVbZ4oh+LJRKI=;
	b=dFiTq00V1kk9I3qHfc4n5mIRzovFR1M5hWWWs6vhYIvEXddavoptwF+gP+6cKg7ZzA
	FWXqS2smcQ40iGnMowISyWXbw9Sk5GuyFkA7YQXyyJg8IQe6kjwjE5WlqCZX3YbsEQlg
	DX6cjBCtdilquzj0kbU+KS6JBUYzHvXeKcSA++MThxZ9ZsUHtdbH7wfoveO/HSOCHdtJ
	ACsP5aneMAunvF62wl9ZmfDgBRmNEoHLUvlA9RNtQ1Ye5HJjHifK9zRQHBtBExPYMBg4
	461Vb/E/QBnmgfPOnak2IxImlqz2lueQuyqTyx8PBYq9I6B1pgcsPmzFzNGA2Q3g7VG3
	Kd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=O13WKLj+AO3jYdeodsYwmGhiP6Tks6uVbZ4oh+LJRKI=;
	b=f3p1x/xttKw51fXCYtxe2uROIMSOf0X6i2s9Rfi1pvONNrbQEbw31f+sKRrCnTODRQ
	yK8nFJuJ78k/jO99DjD5BnqJrfq5DBMX7D7NcL3C5BRv2HmovhkNqyjS8f+Wyj8cMrz/
	vNXiPyWICXbtO7nL1Bs+nNrEJZsy7ACHk25O/ZisNffkoOidjRSnEYyHu24+1xW1urKF
	CHMGPTPWyqxvfl8z2soStNKiG8F3leJiOAR6DU7cFBZ1lnk2Sm9grezVorUdXiUAZiKW
	rtf7mioFgi13SG1uFaxbvYLb6vGcsxXHFNwWA4edHWL7UNAavWE7TUFelUcMaGzWBlAt
	AuWQ==
X-Gm-Message-State: AE9vXwPGPcmvwomGh5V5rTnuYr2bsJqHu57WaMBQjMRYUG+7tZWLVI3FYosMmPeNwa1vvA==
X-Received: by 10.98.145.25 with SMTP id l25mr41996722pfe.63.1474929978936;
	Mon, 26 Sep 2016 15:46:18 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:6de2:3cb8:ce36:4a7f])
	by smtp.gmail.com with ESMTPSA id
	zh13sm32529210pab.4.2016.09.26.15.46.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 15:46:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 15:46:00 -0700
Message-Id: <cover.1474929712.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/14][v2] Krogoth next pull request
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
X-List-Received-Date: Mon, 26 Sep 2016 22:46:18 -0000

From: Armin Kuster <akuster@mvista.com>

Fixed several typos in the openssl commits. 
This includes a fix for systemd 
[Yocto # 10329]

The following changes since commit e6c1d03d3d161cbbda254a5dae7008ff7e37d874:

  oeqa/buildiptables: Switch from netfilter.org to yoctoproject.org mirror (2016-09-24 09:27:51 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Armin Kuster (9):
  openssl: Security fix CVE-2016-2178
  openssl: Security fix CVE-2016-2179
  openssl: Security fix CVE-2016-2180
  openssl: Security fix CVE-2016-2181
  openssl: Security fix CVE-2016-2182
  openssl: Security fix CVE-2016-6302
  openssl: Security fix CVE-2016-6303
  openssl: Security fix CVE-2016-6304
  openssl: Security fix CVE-2016-6306

Dengke Du (1):
  cracklib: Apply patch to fix CVE-2016-6318

Khem Raj (1):
  useradd.bbclass: Strip trailing ';' in cmd params

Martin Jansa (1):
  useradd: use bindir_native for pseudo PATH

Zhixiong Chi (2):
  wpa_supplicant: Security Advisory-CVE-2016-4476
  wpa_supplicant: Security Advisory-CVE-2016-4477

 meta/classes/useradd.bbclass                       |  18 +-
 .../openssl/openssl/CVE-2016-2178.patch            |  54 +++++
 .../openssl/openssl/CVE-2016-2179.patch            | 255 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-2180.patch            |  44 ++++
 .../openssl/openssl/CVE-2016-2181_p1.patch         |  91 ++++++++
 .../openssl/openssl/CVE-2016-2181_p2.patch         | 239 +++++++++++++++++++
 .../openssl/openssl/CVE-2016-2181_p3.patch         |  30 +++
 .../openssl/openssl/CVE-2016-2182.patch            |  70 ++++++
 .../openssl/openssl/CVE-2016-6302.patch            |  53 +++++
 .../openssl/openssl/CVE-2016-6303.patch            |  36 +++
 .../openssl/openssl/CVE-2016-6304.patch            |  75 ++++++
 .../openssl/openssl/CVE-2016-6306.patch            |  71 ++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  11 +
 ...parameter-set-with-invalid-passphrase-cha.patch |  55 +++++
 ...ject-a-Credential-with-invalid-passphrase.patch |  86 +++++++
 ...CRED-commands-with-newline-characters-in-.patch |  66 ++++++
 ...ines-from-wpa_supplicant-config-network-o.patch |  86 +++++++
 ...commands-with-newline-characters-in-the-s.patch |  54 +++++
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |   5 +
 .../0001-Apply-patch-to-fix-CVE-2016-6318.patch    | 105 +++++++++
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |   1 +
 21 files changed, 1496 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Remove-newlines-from-wpa_supplicant-config-network-o.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-Reject-SET-commands-with-newline-characters-in-the-s.patch
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch

-- 
2.7.4


