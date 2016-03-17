Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE3260116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:40 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so493726wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ihg/LtwtFkrMwGTUu4DxWEJmYO28ySlDE3U34aMKdU=;
	b=0b9Tvbda5W4enZ9ibDpShuU1jeCV8G9UsnZQ5CM95s+2Tje/6WIAwTdowFw8m0C7HB
	4FvT3lfuEbmjWtVvDkVKINS59Z5/l+DeqOkHDbw5rYFz1Drjx9o1+J4CM45sX3rzyKiz
	CkjniTZiDzXy/W4dN4M6nOY2DIDI16sxYapkGR/eZiKFiFsZMQnO6z90I2vJYekoB5fX
	D+NK+hG3cDxbX//Y9WA5STXsEhF5T0KZgYQTvjtXKrVOSONTisY+AMtMEDsWBLCJWNl2
	rYHUU/C3bOo0l8cFP9YHRfn8qe5z0W8hfjUw1Y0MfY9Mbs/XiMxE3NriYcEHtoP8MnPp
	ARFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ihg/LtwtFkrMwGTUu4DxWEJmYO28ySlDE3U34aMKdU=;
	b=S6E8/CzpPmftd1QY4G9VAjHu3HTxkj1EHhFMvnQsfTmsNvmhrIllfDtpfXpzjzFN9m
	f7RYjK8gERjoFVO8kS2xlFXTPb3jPyElIMj+6r+DZ2nVrlTLX9VnmhqovGsb7kYf6pqs
	BpqaZdHu5Q4aXTKHM8cdGgk5uiEY1RTIHmoCTkJdSIokhLZKNg9WzMCy16hb1e9ycwPv
	9QS9Eo5zkIWnR0HGUfaQ9yzI6gFZ9un+adiMazEYdKRDhCRAGixa08joLkME+XnO/q4J
	Rvw6DYbB+Qnhqhb1jiDuLj5W7oMnbuLnmgAC975CODb3QBddRisuScnmU6XbBD3UxHcf
	h+DA==
X-Gm-Message-State: AD7BkJKDTFgZ+0SCOfv2EWgPjLNnJiKr3hvsYE3F7tUEK1J9N4VQmjJS09OxHG/s2vsUSg==
X-Received: by 10.28.12.134 with SMTP id 128mr35335125wmm.18.1458235181178;
	Thu, 17 Mar 2016 10:19:41 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:24 -0700
Message-Id: <1458235169-9267-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/8] qemu.inc: add gobject-introspection-data to MACHINE_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:41 -0000

Enable gobject-introspection-data by default for all qemu machines.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index f44dbe6..70879bb 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -11,7 +11,7 @@ XSERVER ?= "xserver-xorg \
             xf86-video-fbdev \
             xf86-input-keyboard"
 
-MACHINE_FEATURES = "alsa bluetooth usbgadget screen"
+MACHINE_FEATURES = "alsa bluetooth gobject-introspection-data screen usbgadget"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-- 
1.9.1


