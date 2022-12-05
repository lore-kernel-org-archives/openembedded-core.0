Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0759C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:34:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.5520.1670207648786209799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oPg/53/j;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207646; i=@fujitsu.com;
	bh=noqZCqDHciYI+ZsknUWenDKFluUKHiXrw8wtSQmPPXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oPg/53/jcmV9uT/Bg/uafYQYP31tuwHbmRgIG06NWLUafyB1qiJrujR2c454WeiI4
	 6goOXzTVCL+hJUgeIcug1zW5+V5ATl5zhFX1vLiWozpzrTJdh1v1fROgsPm9WsZzbQ
	 e7vsPyWyQeVzU5JiFt1XQgDAY93F4L85PjVdI5HrZ7sETygsCZi9pYqFgWdjXq8oip
	 Y1lpyRvQahMARUXsdJYlHdw4J1cTyndiBTOxxYjTZVawiG2vMFEZhFSKsdxtVOvg7T
	 8qR2F1cYOepdM5pwinKPTGj+vj2/Fjcb6T+MmKi37bDBaWeJU0t7jCwJnuTOClKJ5e
	 zBYVJYMjzV6dg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqDsvojf
  Z4MZhLos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPN8VksBf+5K3Y8msLYwHiCq4uRi0NI4DGj
  xKLFHSwQzjUmie5TNxi7GDmBnN2MEj9fZIDYbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0sYC6xdMIssFYWoPj/vpvMIDavgKPEh0lbmUBsCQEFiSkP34PFOQWcJDbu7YJa5Six8k
  EzG0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2qJlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaF6cWlaUW6Roa6SUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBAZvSnHy3R2Mncv/6B1ilORgUhLlVXrUnSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  jc6rDdZSLAoNT21Ii0zBxhJMGkJDh4lEV4hb6A0b3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUq
  XEeXvDgYoEQIoySvPgRsCi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV43X6ApPJl5JXC
  bXgEdwQR0xEb+LpAjShIRUlINTEEKV03y9nzpSw1WP9adNKNlPY/Mnr1xM8rPCVvvCnuwrn+p
  c/HdKUks/2bame17oSh1fvm7VQ926XBpZehPV9ZbueeZ36wH/m42kbWSD9Y2fmYv+yFt9PXOm
  zm2MQc+1pok31trL3xSQLRIi40nM2fJ3lRL8w2JsyQiTQr+sped+3XH6P+iaS+6Q5PeqT+t55
  XP3unM+Gh1xNEivxo3vSeJgiX1+Wc3Re2uPLrshIDQl/qZ+SyHLfW3zT0x4eeW73ue++WETN1
  jWFb/+pzfqqne95IZUkRi55nltgW6bUn8cnF3+YwKxuz6nb8OzvKeWKCx8D2zdtXuwJ8zUt5o
  L1n4767v/972Q4laF+brByqxFGckGmoxFxUnAgCwGXRBZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1670207645!128595!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18364 invoked from network); 5 Dec 2022 02:34:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:34:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A1F76100182
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:34:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 96772100043
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:34:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:34:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] usbutils: upgrade 014 -> 015
Date: Mon, 5 Dec 2022 10:32:39 +0800
Message-ID: <1670207562-7127-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
References: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174272

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  usb-devices: list the root devices in numerical order
  usb-devices: use 'local' variable type to handle recursion
  lsusb: remove unused wireless check
  lsusb: remove wireless descriptor information
  usb-devices: fix field width on device speed field
  lsusb: fix up Midi Device specification devices
  Fix an runtime error reported by undefind sanitizer
  lsusb: Improve status display for SuperSpeedPlus hubs
  lsusb-t: Fix recursive sorting on child devices.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/usbutils/{usbutils_014.bb => usbutils_015.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_014.bb => usbutils_015.bb} (92%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_014.bb b/meta/recipes-bsp/usbutils/usbutils_015.bb
similarity index 92%
rename from meta/recipes-bsp/usbutils/usbutils_014.bb
rename to meta/recipes-bsp/usbutils/usbutils_015.bb
index e728f1a190..a30037b693 100644
--- a/meta/recipes-bsp/usbutils/usbutils_014.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_015.bb
@@ -13,7 +13,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "59398ab012888dfe0fd12e447b45f36801e9d7b71d9a865fc38e2f549afdb9d0"
+SRC_URI[sha256sum] = "2b8140664578f39c3f6f0166a1b950f8655304e63e3d7f89899acb99bc5cb8e7"
 
 inherit autotools pkgconfig update-alternatives
 
-- 
2.25.1


