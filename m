Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id C8FB47CB4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 02:14:17 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id v64so12591721pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 19:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=EojyyJxU3BNbme7lqeKsuacLrbkU0z/6eLnhkCv3tds=;
	b=RH8M8frObcQiSkpXP3nDVlByFQZYSfnU0YdGQijVFTV2GDHjnFFbFjWWLKC0QyG/6p
	8ebn74rdBLee/zlpfNy4zsf7201sQctN3ydIfMFRuAKRau4DEPK97Rv1MLSiWgrS1Jrg
	++5m/F1kyL+AT4gGcOJwhGo2XHpWsLq4DeH2kr2K1WbVxa0CkCapsVwXtUl1XK5G7sp5
	Cb7rFFD0ucAHAWznPaH6+D8rmrrKfgu3q0Sc0+KiC+z89gJtyTWjeVThrIVv5qZlKb4V
	JaIbnmdZMBABVzK7x5vaBYCenp2cukpIve2iQoQsg6chxm5j9V/BufCOGQ0YtIaH+hPd
	701g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EojyyJxU3BNbme7lqeKsuacLrbkU0z/6eLnhkCv3tds=;
	b=PzMlRmxxLBBDiWnLEedLD6pxg1/+/zouIUX8crn/bl8UNwlWpKoK+QPaQmTFgDgyEL
	6cQevicYBK3d+bFW8TdP/bB+NscOfX+OfdpO2R0WOD2sn+ECP5K4aCvfB8GeobOzKrrm
	AK5EBYutQKIMw5lbHVQXKyrMS1yO9nJ1Yhf9sTlG2LfRkpp2LITrBwJ8Y4N9dLldUxOx
	x/lXTLKc2X+3lkE5NyR8oqvKYPfzp21XaA8WKExVBiwNAr/Mso4uEjVIgBFyOewWTWTP
	8gX9CQYGCtKJ/sAmDwvp3aPTFhuBh07GsS7TmDXQfAXiMlobxt06QqYXKxLhXN1lV6Et
	VHfw==
X-Gm-Message-State: APjAAAVx3wPrpe8NdyTpKE0BPU/a2DcUAXVAa5bFfvtRj5yLXWm5sO/w
	URauYdfbYAUjS2/jZeo5TOTtmrkB
X-Google-Smtp-Source: APXvYqz9qCDDlpDoh42iyvOhFoSpiltFCJdporM3U+PwwTMoSmR4Axm70HEy0LdcQuCqo3DLHppVTQ==
X-Received: by 2002:a17:902:8203:: with SMTP id
	x3mr22983201pln.159.1552961658689; 
	Mon, 18 Mar 2019 19:14:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:97d:e5a7:4938:a8fe])
	by smtp.gmail.com with ESMTPSA id
	j1sm14015595pgp.84.2019.03.18.19.14.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Mar 2019 19:14:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 19:13:53 -0700
Message-Id: <cover.1552960566.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/13] Sumo patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 02:14:17 -0000

Responses should be made by Wed March 20th 21:00:00 UTC 2019

The following changes since commit b28f5672ab55ea303727e9f03bc594c7774d597e:

  bitbake: COW: Fix StopIteration warning (2019-03-13 14:38:56 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stable/sumo-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/sumo-next

Bruce Ashfield (1):
  linux-yocto/4.14: configuration cleanups

Chen Qi (2):
  systemd: fix CVE-2018-15686
  systemd: fix CVE-2018-15688

George McCollister (5):
  systemd: fix CVE-2018-15687
  systemd: Security fix CVE-2018-16864
  systemd: Security fix CVE-2018-16865
  systemd: fix CVE-2018-6954
  systemd: fix CVE-2019-6454

Marcus Cooper (1):
  systemd: Security fix CVE-2018-16866

Mingli Yu (1):
  logrotate.py: restore /etc/logrotate.d/wtmp

ROGEZ Matthieu (1):
  systemd: Fix typo in root home variable.

Richard Purdie (1):
  oeqa/runtime/dnf: Fix test error when static libs are enabled

Stefan Agner (1):
  run-postinsts: for dpkg/opkg, do not rely on /etc/*-postinsts

 meta/lib/oeqa/runtime/cases/dnf.py                 |    2 +-
 meta/lib/oeqa/runtime/cases/logrotate.py           |    6 +-
 ...sive-let-s-rework-the-recursive-logic-to-.patch |  252 +++
 ...eserializing-state-always-use-read_line-L.patch |  250 +++
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |   39 +
 ...n-t-resolve-pathnames-when-traversing-rec.patch |  643 +++++++
 .../systemd/systemd/0002-Make-tmpfiles-safe.patch  | 1828 ++++++++++++++++++++
 ...-not-store-the-iovec-entry-for-process-co.patch |  193 +++
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch |   60 +
 ...ote-set-a-limit-on-the-number-of-fields-i.patch |   79 +
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |   49 +
 .../systemd/systemd/CVE-2019-6454.patch            |  210 +++
 ...e-receive-an-invalid-dbus-message-ignore-.patch |   61 +
 meta/recipes-core/systemd/systemd_237.bb           |   13 +-
 .../run-postinsts/run-postinsts/run-postinsts      |   21 +-
 .../run-postinsts/run-postinsts.service            |    1 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |    2 +-
 19 files changed, 3697 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
 create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch

-- 
2.7.4


