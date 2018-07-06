Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id D520F6093B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:09:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r16-v6so4531475wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lDvEwG6eg0esPoQTFagLqkWtzlxwUIA/I99wLSBzvaw=;
	b=jQBtmlcIavXibtBtXS7MMyAJ1ZqQSXxvk4FZumSsUx93RTiFz5lc4kAO7zb6qFDXls
	cHhJZJdi2ZadUt+caWXIE3a77hUdBnUwZZvjw9VFo1e7wbGEPOAl+kzghe321kNmZVbw
	1npAv9ugvTSaEeANCyhbGFx5Pxt2Zl4HZ4jgvqebnrWiOnDQ5KNRaa+Ze43Y/OgOg5hY
	JeHF/IXgZdaJrN9JmKGIhwTJCQXD8oGI9+JnH+kGL+qalgn+wfy56GL69t2UovgZ27J6
	bWyXqCyGyJws1pE1t3SJ7T7/WcSzk4zF8NI3pvWa9eFpQKtcGVAYhEhLCQzlBJ8snRRv
	izMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lDvEwG6eg0esPoQTFagLqkWtzlxwUIA/I99wLSBzvaw=;
	b=aSzxsNM5iULu0c9NSI+b8XWrL8LGfeWPyAl4x0hOotrZDhqlh7eeEcbvd6HFcK5xf3
	rktpizj+Jgoc0cay9JPswdPsJa1H1vXAEFsKyxzTZLY1p0YS2ukKtWgB9PrUBGItife7
	5crcPS5bXNEKuUx2JyZxAud5j+UflaaOIyeHt5gweAivXSRb8LjG0FtMTypz77YBlcba
	b4ma9QELhVe3YleIqqDFzmw00nujmROP9jAI6rTjqluumGhjKGSlv/erplHBeWo48q1V
	5xs7C0nFj/zjzha5VjemuzE5+zkssTLE/6gmew59K5L9I7NpLBhFoxsuIUBa4dUaHfKi
	TjBg==
X-Gm-Message-State: APt69E2TA8ifUEAlJ1XIcFWx6Y1LL0lwVKVSs9jM2jc315HUCiu5pXom
	A3zzsrMSsb0g6KPVUdp2tfRihigO
X-Google-Smtp-Source: AAOMgpf8eAuBbCUqAH2IMoqHa/EZrCUmQaS7pjNym0pDMbyAmrC+iMJ+Dik71rAsvkHonn0q1pABLw==
X-Received: by 2002:adf:9148:: with SMTP id
	j66-v6mr8255321wrj.118.1530889747491; 
	Fri, 06 Jul 2018 08:09:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j12-v6sm2831184wrn.29.2018.07.06.08.09.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:09:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 16:08:59 +0100
Message-Id: <20180706150859.28081-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180706150859.28081-1-ross.burton@intel.com>
References: <20180706150859.28081-1-ross.burton@intel.com>
Subject: [PATCH 2/2] distro_alias: remove obsolete python-distribute entry
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
X-List-Received-Date: Fri, 06 Jul 2018 15:09:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 58c110dbe42..1498e124413 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -305,14 +305,12 @@ DISTRO_PN_ALIAS_pn-ptest-runner = "OE-Core"
 DISTRO_PN_ALIAS_pn-pulseaudio-client-conf-sato = "OE-Core"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 DISTRO_PN_ALIAS_pn-python3 = "Fedora=python3 Debian=python3.2"
-DISTRO_PN_ALIAS_pn-python3-distribute = "Debian=python3-setuptools Fedora=python3-setuptools"
 DISTRO_PN_ALIAS_pn-python3-iniparse = "Fedora=python-iniparse Debian=python-iniparse"
 DISTRO_PN_ALIAS_pn-python3-pip = "OpenSuSE=python3-pip Debian=python3-pip"
 DISTRO_PN_ALIAS_pn-python3-pycurl = "Fedora=python-pycurl Debian=pycurl"
 DISTRO_PN_ALIAS_pn-python3-pygpgme = "Fedora=python-pygpgme Debian=pygpgme"
 DISTRO_PN_ALIAS_pn-python3-setuptools = "OpenSuSE=python3-setuptools Debian=python3-setuptools"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
-DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools Fedora=python-setuptools"
 DISTRO_PN_ALIAS_pn-python-git = "Debian=python-git Fedora=GitPython"
 DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako Opensuse=python-Mako"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
-- 
2.11.0


