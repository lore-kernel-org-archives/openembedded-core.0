Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSx-0007e2-BZ
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:47 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:22 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so5957079wib.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=XdIUCauGoAvtsfWVrr8yKoY4JaPEATB7iTujO1Q8MYg=;
	b=SpiaTxTK4Je4JQ/j13iYo10x9lZ/CkopTI1KfWNesNN9GkwTm/eb4C578THKZOXCX+
	Bwxw2UzmI4WOq+Q6K61z/iMWEktBKG1ckhFFTv/smcRiKMYXeErB0UPXJyzhMwpEutfm
	ilfATLcjIQJvDcQzDSGjcNQtZwEv89M3KShT1MnhihjJtFdFkbRkdBYfS5U2AG7svYm2
	bSPgjUz7tuVCOppJ5NxVOypJg97ZoMROG/eOVgsxNKqRhtbKfDaP0LTvi4mfR1DzqWIM
	Db5Q/oy5q76rpJ8UxWQgVc30l3NEKF1PQ4egA6C0gVMqUNxvW17mYBrO1sv7EThdHEmO
	5u+g==
X-Received: by 10.194.87.200 with SMTP id ba8mr20078188wjb.22.1358635759979;
	Sat, 19 Jan 2013 14:49:19 -0800 (PST)
X-Received: by 10.194.87.200 with SMTP id ba8mr20078186wjb.22.1358635759936;
	Sat, 19 Jan 2013 14:49:19 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:08 +0000
Message-Id: <91837ad46ab5696d3fa63c4aba9ffa92c4a74ff9.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkJLQTDQ0XRTQgrrfZrkCwzJzwaZWchPFSqTpLGYVOj/D5j7n93YtX4OoljG6/cdN1h4wAfWsuaAjnNi80N2AwKMxngymRTb2dhP74GIA/gDanirfwbK1w3J8XiQhvIs+OsGYLsw0UAvxTeqVOC+JwhdRaAFsZgVKT84zi2GK/cdeP57691L4vkZFgTf8hfHthfE8+T
Subject: [PATCH 05/10] default-providers: Add systemd option to PREFERRED_PROVIDER_udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 23:04:47 -0000

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 89b6465..12a581d 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -37,4 +37,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
-PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','sysvinit','udev','',d)}"
+PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','sysvinit','udev','',d)}${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
-- 
1.7.10.4



