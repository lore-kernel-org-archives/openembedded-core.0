Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7CB7F998
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:25 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id f7so534706pjw.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=N83lAnqltDottwSdRe7SXUbTChIfbNX2n9mSAP6f7L8=;
	b=lmzA04zetvOKhC2NG7O8Yc/KjXtYvWDsifyvlBhrcBh7iK1WRd1DCn95HO3xoPKpn+
	/mBeftRGexgIT4RIlKzj1CsQCukcwXnOPEYICYXy6kacB1bUsC+c7soE7MdygvUnHCrB
	8dMtQcnVh+zgf0QnalUFx/LRCeTUy/fGr6/P7VOYXEwB+AmeUDwReTp0fVHVtagGQquQ
	6bskcpE9SsDSSc/Xc4Wq43UffW0RyAxXpc4za78Z8EJBHvxfjBFLT6aiZbqz6jrecoga
	N86xKB6BzQLSgPGUjtlAi36fFO62K+b2HDq15Kpp21V/TLDgCCdyRHp/LCOVTeHV5AJR
	C4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N83lAnqltDottwSdRe7SXUbTChIfbNX2n9mSAP6f7L8=;
	b=SGw+BYZGxgeKf0bqed6M6wP5QMzQ/rw8VIYmL/YSikBScnMdOtt+tdqHEovHljnhfN
	oHyGR+Aa4LdBb0teh7v2WgkRCwtrwx2Si4lnA3radT9LdTP88sGrZqSYm4wkNonCw7Wr
	eQ2uW4Wj1jO1vXG9zu1jVL0fzEpkvBUHOtWSiw3w2Uh+GyTpgYsoaYNM8tFwcbLGHNOB
	PNMlAahiZqNpw2kiVaib+etvMIwEizUDroEzdHCCn5TtgW8FaPMfcDJLS2uFiO9YXHbw
	cKUyZWF16DVYeEOt344SfUk1LGEmlCNOa2hrkBm9a4eRr8IhOV+zQkdO7cAHSgx6z70e
	2rCw==
X-Gm-Message-State: APjAAAUIGP6lXWhSA2p8ngy8zwW9PpbUNVQpwwFUEnhp8CRVZd3Q7VdS
	R1aQf7HCAFqgfE89DJf7RDQqoRmA
X-Google-Smtp-Source: APXvYqx3C93ar5SMXJwfa7VSLqy9+jW5E+bwms54i1US3++sXg0riZAWGSoJfXNL+U6HqLKr0cJYEA==
X-Received: by 2002:a17:90a:2326:: with SMTP id
	f35mr30893324pje.134.1573961726083; 
	Sat, 16 Nov 2019 19:35:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:19 -0800
Message-Id: <1573961720-4099-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
References: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 6/7] oeqa/manual/bsp-hw: remove usb and SDmicro tests
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
X-List-Received-Date: Sun, 17 Nov 2019 03:35:25 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 220 ---------------------------------------
 1 file changed, 220 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 9421c50..dd3504f 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -177,114 +177,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.USB_-_mount",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Boot system \n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Plug USB stick, it should be mount in  /run/media/sd(x) If X-window system does not start and show USB device, then use the terminal to mount it, following the next steps: \na. Locate the usb stick (usually it is on /dev/sdb) \nb. Create a directory with \"mkdir stick\"  (so you will have such a path as: /home/root/stick). \nc. Run the command  \"mount  /dev/sdb  /home/root/stick\" to mount  USB device on it. \n\n",
-                    "expected_results": "USB device should be mounted in  /run/media/sd(x)  \nor in  /home/root/stick  \n\n"
-                },
-                "3": {
-                    "action": "Then you can access USB stick (/home/root/stick) via Terminal or GUI  and try various commands and actions like \"cp\", \"mv\", \"touch\" and \"rm\".  Type \"dmesg\" command and check for recent mounted devices.",
-                    "expected_results": "Basic commands work properly. The system sends a notification in \"dmesg\" command, showing that the USB stick is accessible and the device is mounted ."
-                }
-            },
-            "summary": "USB_-_mount"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.USB_-_read_files",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "view/copy successfully"
-                },
-                "2": {
-                    "action": "plug usb stick",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "view files in usb by file browser",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "copy some files from usb to local hardware",
-                    "expected_results": ""
-                }
-            },
-            "summary": "USB_-_read_files"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.USB_-_umount",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "usb directory in file browser automatically missed"
-                },
-                "2": {
-                    "action": "plug usb stick",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "view files in usb by file browser \n4.unplug usb",
-                    "expected_results": ""
-                }
-            },
-            "summary": "USB_-_umount"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.USB_-_write_files",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "create/copy successfully"
-                },
-                "2": {
-                    "action": "plug usb stick",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "create files in usb \n4.copy some files from local hardware to usb",
-                    "expected_results": ""
-                }
-            },
-            "summary": "USB_-_write_files"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.ethernet_static_ip_set_in_connman",
             "author": [
                 {
@@ -583,118 +475,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.MicroSD_-__mount",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "system notify that MicroSDis accessible"
-                },
-                "2": {
-                    "action": "plug MicroSD card",
-                    "expected_results": ""
-                }
-            },
-            "summary": "MicroSD_-__mount"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.MicroSD_-__read_files",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "view/copy successfully"
-                },
-                "2": {
-                    "action": "plug MicroSD card",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "view files inMicroSD by file browser",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "copy some files fromMicroSD to local hardware",
-                    "expected_results": ""
-                }
-            },
-            "summary": "MicroSD_-__read_files"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.MicroSD_-__umount",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "MicroSD in file browser automatically missed . "
-                },
-                "2": {
-                    "action": "plug MicroSD card",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "view files in MicroSDby file browser",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "unplug MicroSD",
-                    "expected_results": ""
-                }				
-            },
-            "summary": "MicroSD_-__umount"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.MicroSD_-__write_files",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": "create/copy successfully"
-                },
-                "2": {
-                    "action": "plug MicroSD card",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "create files in MicroSD",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "copy some files from local hardware to MicroSD",
-                    "expected_results": ""
-                }
-            },
-            "summary": "MicroSD_-__write_files"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.video_-_libva_check_(ogg_video_play)",
             "author": [
                 {
-- 
2.7.4


