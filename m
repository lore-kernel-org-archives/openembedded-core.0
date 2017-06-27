Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id F392071A88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 14:14:38 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id r36so18220285ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aHFwlbqFDpAxyDowzKYUJl947rOcl9ZLdg1K3JPeboQ=;
	b=pejw+LftWbi4a81vQhWBptXYnbfvHaUP5m+Pt7p2xDgULRwEhH8J+3ZNsEqNvkqMxW
	C4zok5BN4Ad+kjx3fSSfuN6caC8djSTBwhiSZd0bFq2lDwNOSgqbr07uGy2DDr7eY6cU
	vH95DwzcK4pZN9uKEV7wjVTRK2bOyDmclMnzf7x+YKEyGgjOoMFVw1M+Vl8K0yaxTutb
	PQBox1zyDAJp0k2gw9yHfx6PpjsW1D3jH8Q2E7v9I0hbQdcm5XojCVaKfBSNReEPunmA
	ScN9nFmfa1ToXJfsNv9Ekx6TZQ+EBzwfhGb3CT+5bBfopct2nXIHJXsCrFSvfHVxHRVx
	Ao8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aHFwlbqFDpAxyDowzKYUJl947rOcl9ZLdg1K3JPeboQ=;
	b=dRdJAnjxD5FjrrRQRYBESgOltOZxxUm7xPih056ejs+VqNur6y5Roy9N3EFHLOIzYJ
	9zm/GIYKAW8LeT9miKH4XtfdGIN6qN7S63Pr2wYovtew1qnF0O/3SfIeeLFeVskhnObf
	EK5CYCnyluUvqCdbRT5qSgxCSk6XeI/cmUelglAOHtXBw7xJJAZ7qfuBcBHZTsmXCZIt
	xDtGsSMGbGqhDe//31oJaXJtYN1pHMed89LsOJpVsdeJKe9FfgivzQAcdU9RYgPU5PVS
	8K00MWvfIlFeVub3/qcg0WYEmetwkhHzwWJkUl0QP8CLzeTzMySCTD0Fx4W/77rSradV
	dBHA==
X-Gm-Message-State: AKS2vOzxyPfJwgBdeiCmhsyTFCxFlcfD9RCpTpGlY51vTNb3dFr5XE0M
	ypN0CeAxBRZQNQ==
X-Received: by 10.107.149.69 with SMTP id x66mr7111926iod.104.1498572880046;
	Tue, 27 Jun 2017 07:14:40 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.googlemail.com with ESMTPSA id
	t7sm1528555ita.1.2017.06.27.07.14.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 07:14:39 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: otavio.salvador@ossystems.com.br, openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 10:14:22 -0400
Message-Id: <cover.1498512911.git.maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Tue, 27 Jun 2017 14:14:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building an application with android toolchain there is no problem, but
using another toolchain that doesn't define the macro, cmake exit with en error.

The following changes since commit b8358bc61435ec996ecd6931fb6d6d41bb4f710b:

  bitbake: bitbake-selftest: add bb.tests.event to bitbake-selftest (2017-06-23 14:14:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mroussin/fix_cmake_find_cuda_not_android
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mroussin/fix_cmake_find_cuda_not_android

Maxime Roussin-Bélanger (1):
  cmake: Use find_program if find_host_program is not available

 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 ...e-find_program-if-find_host_program-is-no.patch | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch

-- 
2.1.4


