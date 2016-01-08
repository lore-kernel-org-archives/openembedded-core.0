Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC4F731BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 16:25:06 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b14so179073095wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Np5T1dF6pA9nq5Ao6wRUSzHjr5FA9MJ/VINZ6tMepQQ=;
	b=TDvu4h4CMr4EbmP6jYS8etN5Mazzv/P/PrypUgj5qfUUym/rUCRKcCi3YZeC45Qk9z
	C26D0W27Ia+y469KXDHMMMoHP1I4s9U+In2R8QzPkas0+WEskTkmaGone902LF8ZoEJf
	hfolH0BShvMOEX8WxpQmF7NcT2LyiawMh6hOCKUHtipr2KKrPZvDMSpQzvurll6ndhES
	Pz+fcPQJs+Djw+9EGredJ1VNjHRNSJ/bh5+6ZFUzDgDii6Pv/OmPzeipDAbOEsWZiMn7
	TOOiLLePNaVlRAL23Vze/KcoQSFL0c0D5hQIihJTD3FdSnOjjb4ZDFIPg1uae+2Ctb1x
	iVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Np5T1dF6pA9nq5Ao6wRUSzHjr5FA9MJ/VINZ6tMepQQ=;
	b=Y84z1Ran39bfceotKvbvgjcIJjN27iRIFdoelPd/azZWeXnfsIlxs3dq9Z1Hxezweq
	t/6+tH763xBkNExrJXwn9swBoyRx0gsD+Yhw0/7qxx/Kulb1QLpABX8KrVm/rHjcp8Nd
	CsW+KMXvT7tTl56ytxfbk4/dUJNUp2l21nwSkWBaX3tPDQg7tEiuMZCb2lKY/E1mV7Ez
	1U9lbgHKK9ptJiZ1ekpoucqjg521MEXThh3R1DhcJY06iQKkW6CYqyoIqsR6qctvTlUW
	A4od0l776W0gI6lbMoBNurECtroB0DFNzr3i/WTtLdVmKsVR7hdfeE27DtMHY+J1Tbvh
	UBlw==
X-Gm-Message-State: ALoCoQk4414mKpcg6I/h0frVsRGnxNOlBZrsLVzlvVqJ4jfafcJwhXlLjHf14Qge68MZVz6dpAYs+IzwsUgFRAliVmC9/stUCA==
X-Received: by 10.194.117.5 with SMTP id ka5mr104888792wjb.20.1452270306930;
	Fri, 08 Jan 2016 08:25:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q4sm106979446wja.6.2016.01.08.08.25.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 08:25:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 16:25:04 +0000
Message-Id: <1452270304-28814-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] bitbake.conf: add virtual/libiconv-native to ASSUME_PROVIDED
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
X-List-Received-Date: Fri, 08 Jan 2016 16:25:07 -0000

It's possible for a native recipe to have virtual/libiconv-native as a build
dependency, but as we expect that the host provides that add it to
ASSUME_PROVIDED.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7289b7..2fe6b24 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -175,6 +175,7 @@ ASSUME_PROVIDED = "\
     python-native-runtime \
     tar-native \
     virtual/libintl-native \
+    virtual/libiconv-native \
     texinfo-native \
     bash-native \
     sed-native \
-- 
2.6.4


