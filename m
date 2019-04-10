Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5C67D912
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r4so2871467wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dOlIuCzerK0rCSxOL1z1I9XOwVxGgP7SQlXvLwnAepE=;
	b=ArAycVmG+9dH1EQZ7bwWlHK+UftS/p6CH0eFmva6T/IaC4FTVZ+5xkMa7ev+dp9RPJ
	/bRYTzDIm9NYc6kOsG/60doRdM1hsauYD7epOiP10oalfqNAVprbIQ+6QN8gLXOKDwza
	u3dZaXS9XrEMiV+fhB7qDS/JOCD2thmUIPt+A5SYUdEK/o6xe8yaSQpLZZBvIjq7S7TV
	vl/oveg+8Hi0rjMsBqLMh4dmjy9fFUXdE6teGLetfEP7oVCUxL6SyOeism06acLTuhbM
	bX5ZXFP+OjEuTAfRU0RyZXUsfcKZhh83eAqCFmhCStGoWEbp3P65LL1CbpwQbC3dGIl6
	QQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dOlIuCzerK0rCSxOL1z1I9XOwVxGgP7SQlXvLwnAepE=;
	b=OkeyW7KJiW5bMYCqkTxhAEqkx5lMSa5VraA7DGHh1DPLfzdh+xTClD0mwCfGrIdsAk
	7AJyyTSj/Z35RJVvoNYGlvMvkog67zCpvOSvAhSyKk4ezarTMSXZmO1ouZNZbn6HxSdU
	H3C7p3n3Z3Vz5myFNmZXZm2thT+j6rbI9axQ/YUwSD6Xjz/sTmHK23t1IXGelP0r7SZ+
	0O5K/Zr5rfyFufic2tWOiXc8i1ZagfepuKmKrUREDalQItRxDCr6bUPxsuZ3AEemjygA
	dVkQs9e5YIdrZowrSYmpFLD5T2ABCQ5tmcg115hHdwqXg8GQUhUcv7ioCjDlJI9q0wr8
	3iyA==
X-Gm-Message-State: APjAAAVCO5vAhBJn7b+2y93B+dPnXwVfgo6V0rrFmeBOi1hjxv3Kfyk7
	3WNSEKRAAFjBBUs5op5LQ09DQD/W2NU=
X-Google-Smtp-Source: APXvYqy8fOjnRAAeX9v64T1tbWZvXq8NkdWi32KheZVUDe8j17TRXvDlJVnDaDZtvateIP47xBt4MQ==
X-Received: by 2002:adf:9427:: with SMTP id 36mr28165020wrq.128.1554901929603; 
	Wed, 10 Apr 2019 06:12:09 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:26 +0530
Message-Id: <05f785937be3d06f38cff4de238d7bd85d4a452a.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 07/33] oeqa/manual/bsp-hw.json: add non-IA tests
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:09 -0000

From: Mazliana <mazliana.mohamad@intel.com>

QA team found that 10 manual bsp test cases from Testopia for
Beaglebone, EdgeRouter, and MPC need to be up streamed

[YOCTO #12650]

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 260 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 260 insertions(+)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index a2b1d3e..2bbf4b2 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -1196,5 +1196,265 @@
             },
             "summary": "Test_Seek_bar_and_volume_control"
         }
+    },
+    {
+        "test": {
+            "@alias": "bsps-runtime.bsps-runtime.Check_if_watchdog_can_reset_the_target_system",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "1.Check if watchdog device exist in /dev/ directory. Run command echo 1 > /dev/watchdog and wait for 60s. Then, the target will reboot.",
+                    "expected_results": "The watchdog device exist in /dev/ directory and can reboot the target.\n"
+                }
+            },
+            "summary": "Check_if_watchdog_can_reset_the_target_system"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-runtime.bsps-runtime.Check_if_RTC_(Real_Time_Clock)_can_work_correctly",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Read time from RTC registers.  root@localhost:/root> hwclock -r  Sun Mar 22 04:05:47 1970 -0.001948 seconds ",
+                    "expected_results": "Can read and set the time from RTC.\n"
+                },
+                "2": {
+                    "action": "Set system current time  root@localhost:/root> date 062309452008 ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Synchronize the system current time to RTC registers  root@localhost:/root> hwclock -w ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Read time from RTC registers  root@localhost:/root> hwclock -r ",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Reboot target and read time from RTC again\n",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Check_if_RTC_(Real_Time_Clock)_can_work_correctly"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-runtime.bsps-runtime.Check_if_target_can_support_EEPROM",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Check eeprom device exist in /sys/bus/i2c/devices/ ",
+                    "expected_results": "Hexdump can read data from eeprom.\n"
+                },
+                "2": {
+                    "action": "Run \"hexdump eeprom\" commandroot@mpc8315e-rdb:/sys/bus/i2c/devices/1-0051> hexdump eeprom0000000 9210 0b02 0211 0009 0b52 0108 0c00 3c000000010 6978 6930 6911 208c 7003 3c3c 00f0 8381\u2026\n",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Check_if_target_can_support_EEPROM"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-tools.bsps-tools.smart_add_rpm-dir_channel_(auto)",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Build out packages with poky tree and copy the deploy/rpm directory to target directory. ",
+                    "expected_results": "The command should add a rpm-dir channel with smart. "
+                },
+                "2": {
+                    "action": "On target, run \"smart channel --add myrpmdir type=rpm-dir path=/path/to/tmp/deploy/rpm/i586\". ",
+                    "expected_results": "Run \"smart channel --show myrpmdir\" can show the information about the channel:\n[myrpmdir] \ntype = rpm-dir \npath = /path/to/tmp/deploy/rpm/i586"
+                },
+                "3": {
+                    "action": "Run \"smart channel --show myrpmdir\" and check the output. ",
+                    "expected_results": "After disable the channel, run \"smart channel --show myrpmdir\" would show:\n[myrpmdir] \ntype = rpm-dir \ndisabled = yes \npath = /path/to/tmp/deploy/rpm/i586"
+                },
+                "4": {
+                    "action": "Run \"smart channel --disable myrpmdir\" to diable the channel. ",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Run \"smart channel --show myrpmdir\" and check the output.",
+                    "expected_results": ""
+                }
+            },
+            "summary": "smart_add_rpm-dir_channel"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-tools.bsps-tools.smart_install_package_from_a_local_directory_(auto)",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Copy packages directory to target and add a rpm-dir channel with \nsmart. Make sure this channel and the default rpm-sys channel are \nenabled.",
+                    "expected_results": "The package \"groff\" should be installed."
+                },
+                "2": {
+                    "action": "Run \"smart install package_name\" to install a package from the deploy/rpm/i586 directory. For example, \"smart install groff\".",
+                    "expected_results": ""
+                }
+            },
+            "summary": "smart_install_package_from_a_local_directory"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-tools.bsps-tools.smart_install_package_from_a_remote_repomd_repository_(auto)",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Follow procedure in \"https://wiki.yoctoproject.org/wiki/Rpm%27s_Repository_Setup_for_QA\" to create a rpm-md-channel and updatechannelinformation with smart. ",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Make sure this channel and the default rpm-sys channel are enabled with \"smart channel --show\". ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Run \"smart install \" to install a package from the remote repository. For example, \"smart install groff\" ",
+                    "expected_results": "The package should be installed. At the example \"groff\" should be installed correctly."
+                }
+            },
+            "summary": "smart_install_package_from_a_remote_repomd_repository"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-tools.bsps-tools.smart_remove_package_(auto)",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Run \"smart remove \" and check the output, for example \"smart remove groff\"",
+                    "expected_results": "The package should be removed . At the example \"groff\" should be removed.\n"
+                }
+            },
+            "summary": "smart_remove_package"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-meta-yocto.bsps-meta-yocto.System_can_boot_up_via_NFS",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Connect the board's first serial port to your workstation and then start up your favourite serial terminal so that you will be able to interact with the serial console. If you don't have a favourite, picocom is suggested:   $ picocom /dev/ttyS0 -b 115200 ",
+                    "expected_results": "The system can boot up without problem\n"
+                },
+                "2": {
+                    "action": "Power up or reset the board and press a key on the terminal when prompted to get to the U-Boot command line ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Set up the environment in U-Boot:  => setenv ipaddr   => setenv serverip   ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Download the kernel and boot:  => tftp tftp $loadaddr vmlinux => bootoctlinux $loadaddr coremask=0x3 root=/dev/nfs rw nfsroot=: ip=::::edgerouter:eth0:off mtdparts=phys_mapped_flash:512k(boot0),512k(boot1),64k@3072k(eeprom)\n",
+                    "expected_results": ""
+                }
+            },
+            "summary": "System_can_boot_up_via_NFS"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-meta-yocto.bsps-meta-yocto.System_can_boot_up_via_USB",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Copy the kernel and rootfs to the USB stick.  # mount /dev/sda2 /media/sda2  # tar -xvjpf core-image-minimal-XXX.tar.bz2 -C /media/sda2  # cp vmlinux /media/sda2/boot/vmlinux  # umount /media/sda2 ",
+                    "expected_results": "The system should boot up via USB\n"
+                },
+                "2": {
+                    "action": "Reboot the board and press a key on the terminal when prompted to get to the U-Boot command line  # reboot ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Load the kernel and boot: => ext2load usb 0:2 $loadaddr boot/vmlinux => bootoctlinux $loadaddr coremask=0x3 root=/dev/sda2 rw rootwait mtdparts=phys_mapped_flash:512k(boot0),512k(boot1),64k@3072k(eeprom)",
+                    "expected_results": ""
+                }
+            },
+            "summary": "System_can_boot_up_via_USB"
+        }
+    },
+    {
+        "test": {
+            "@alias": "bsps-meta-yocto.bsps-meta-yocto.Boot_from_JFFS2_image",
+            "author": [
+                {
+                    "email": "yi.zhao@windriver.com",
+                    "name": "yi.zhao@windriver.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "First boot the board with NFS root. ",
+                    "expected_results": "The system can boot up without problem\n"
+                },
+                "2": {
+                    "action": "Install mtd-utils package. Erase the MTD partition which will be used as root: $ flash_eraseall /dev/mtd3 ",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Copy the JFFS2 image to the MTD partition: $ flashcp core-image-minimal-mpc8315e-rdb.jffs2 /dev/mtd3 ",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Then reboot the board and set up the environment in U-Boot: => setenv bootargs root=/dev/mtdblock3 rootfstype=jffs2 console=ttyS0,115200 ",
+                    "expected_results": ""
+                }
+            },
+            "summary": "Boot_from_JFFS2_image"
+        }
     }
 ]
\ No newline at end of file
-- 
2.7.4


