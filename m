Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C48A77227
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:35:02 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c10so5318501pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DT1MeAs1mIRx8ZqGSEZY9oKILaDOjQCjrg31/ieFxaU=;
	b=x1cWdRYxjHuhWuiHcQUf0AK5JVClMEECJTi2Fl1tTCIOBXinjQRJVdNFE1KRjwOR2U
	oshJN3j5SgVJptR/FCF7c0djyoTv7NnViGn3Bm5s1FejsI5seysf2M0ZciqAkfqEmHHM
	7VO98loljCnuOPgzozv0JAlZI7KBAV5fUwkor+/D2bOev23gSXs8NYk+2dE9+GYtjeqD
	h6Cb/0uzcYwFnG5NuzFpk/FSkmpkvH/tK0ZhXV0t2zBjsILby80AhtBC8A7qR76AQrjy
	FfcvSXCRKDjgM062mnfTQG80/knr2VIePDBSus9ULXwbSWWOr0hS/Q+ly23Q5PXH/uql
	2iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DT1MeAs1mIRx8ZqGSEZY9oKILaDOjQCjrg31/ieFxaU=;
	b=YvvolVBwEfGPqSEluaUrjhXoS+jXeb1lumBtb+rHOmH+rc71OBm7lCz1BnpL2FPRje
	wyBRbWsg9gp/45RIzxqF7wkOoCjW9RSnQb3xD4ClBNquWfzrcGKCzAkPvtqod1QD9cjZ
	PLXbC/eAoCLSJj7S4E13z86Abv1ql4k8a2wVpmzXNKj6BCIrdwMckccI7G/Vc/wat0uk
	QhP7kd2ydF6sW1kUEOJAZKe+V+sG3Z7Oi/ZGaLPR8wcfruUQDx1ASq/8/UG7vEdPhI/5
	XM67oxrmDblWC2m7kRh5O4DxFc140Xca9zUKjGN+aMP915jn6KzAsmCITOdfucE+pZ8s
	tzkA==
X-Gm-Message-State: AG10YORpL5e/8kNdLfKwV96bl5YPwi93ZcKsdgDMuOHkiMnJtmmFSzeNt4h9OarB2REYxg==
X-Received: by 10.98.12.21 with SMTP id u21mr23040993pfi.36.1454708103574;
	Fri, 05 Feb 2016 13:35:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f4sm13813513pfj.0.2016.02.05.13.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 13:35:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 13:34:51 -0800
Message-Id: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/5] gstreamer1.0: musl fixes + updates for git recipes
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
X-List-Received-Date: Fri, 05 Feb 2016 21:35:05 -0000

v2 changes:

 - Update comments to clarify why compiler warnings only need to be
   fixed in git recipes.

 - Move gstreamer1.0 fix into gstreamer1.0.inc (ie also apply to the
   1.6.3 recipe).

 - Move the gstreamer1.0-plugins-base freetype dependency into the
   1.6.3 recipe.

Andre McCurdy (5):
  gstreamer1.0: avoid including <sys/poll.h> directly
  gstreamer1.0-plugins-good_git: avoid including <sys/poll.h> directly
  gstreamer1.0-plugins-bad_git: avoid including <sys/poll.h> directly
  gstreamer1.0-plugins-base_git: update to git master 1.7.1-79-g6414289
  gstreamer1.0-plugins-base: move freetype dependency into 1.6.3 recipe

 .../avoid-including-sys-poll.h-directly.patch      | 30 +++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  3 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb   |  6 +++
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |  6 ++-
 .../avoid-including-sys-poll.h-directly.patch      | 44 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  3 ++
 8 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch

-- 
1.9.1


