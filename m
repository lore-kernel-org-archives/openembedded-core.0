Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1A973204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:01 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 203so20815791ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+j0B95qYg112lae8bSlK75zzvjlligG6+DkVhw3JVrs=;
	b=PUKcL8a4OxIrrxk6mvD2FIrC9qgR0rK5pSAwGdwbFuwBrmtwsbcPhmS2QsQh5nu+ak
	j+ZhoWjhzVqMMEaDQ7X61SYCsGSsfsn8q26CxNHLDwBa+Wf1W/ReIJWHWkSmK9oGILgi
	1j+k1YuSb7N6w8FrHA+QSzAco01rWNiGviok2FjsDhePol0rcvyHLBMkJbUY8KDwlooj
	E9r6+Nq0LVb2QPT4qWmsEPSWzchADnLTGpA/aPoMLEkipMFAV2gMHBHHzsQnFWO/CbU7
	LDXAUwuF9OC5ZUijMK12sqb8bll7klXVwnyNY7BYVd/zK/D5VIJtF+/zyG1S/V+tVpBX
	Q8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+j0B95qYg112lae8bSlK75zzvjlligG6+DkVhw3JVrs=;
	b=gRmDWWpfhinajyd3GT/tGoL8PmOL7KhbS4zqr7ORDpOQB8Nx6nZYtDTAV1Exs/0MjB
	pqdCve7WkaCY9vQGVHrQGJbLCv4GVUEFPnle07/L4n6iVZyrB7IOMTq8nrYzUgAtMhS/
	ouDRpmzxVGf+6blP5Q+iRqO+z6uoyZx36lISJc+ad/fdsQuGpDkCGjdr0TtZmACiJtRy
	E3oRiP3L4DRcLT6AFND6uBrsA9EEQqnQ0rE51fhZgcaBMW75QLcaPU/SAJYbl55dfJ/O
	daMPVN8OTOoif9VS+6Bm75SDfHv2Pwjn+D/njz0RVr76RJKFRrMgrWM+nA3n6C0aT1wh
	73fQ==
X-Gm-Message-State: AIkVDXIC6e+d75IEQtSGdmWa7dBq+L6agQ1MyXH9ek4wiKSx50hF4b2a7rG2T9puJOhrDJDC
X-Received: by 10.36.65.161 with SMTP id b33mr3681860itd.114.1484921581802;
	Fri, 20 Jan 2017 06:13:01 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:00 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:32 +0100
Message-Id: <fe94df71a407adfc7082faff5bbe6441984a85d6.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 01/12] acpica: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:02 -0000

From: Fathi Boudra <fathi.boudra@linaro.org>

qemu support for UEFI in OE-core depends on OVMF, which needs the iasl
tools provided by this recipe. There's also an iasl recipe in
meta-luv, but than can and will be replaced by this one, thus reducing
overall maintenance work.

Copied from meta-openembedded rev fa65be9ba (current master).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/acpica/acpica_20150515.bb              |  46 +-
 meta/recipes-extended/acpica/acpitests/aapits-linux.patch    | 336 +++++++-
 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch |  34 +-
 meta/recipes-extended/acpica/acpitests_20140828.bb           |  35 +-
 meta/recipes-extended/acpica/files/no-werror.patch           |  32 +-
 5 files changed, 483 insertions(+)
 create mode 100644 meta/recipes-extended/acpica/acpica_20150515.bb
 create mode 100644 meta/recipes-extended/acpica/acpitests/aapits-linux.patch
 create mode 100644 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
 create mode 100644 meta/recipes-extended/acpica/acpitests_20140828.bb
 create mode 100644 meta/recipes-extended/acpica/files/no-werror.patch

diff --git a/meta/recipes-extended/acpica/acpica_20150515.bb b/meta/recipes-extended/acpica/acpica_20150515.bb
new file mode 100644
index 0000000..de897e1
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpica_20150515.bb
@@ -0,0 +1,46 @@
+SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
+DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
+OS-independent reference implementation of the Advanced Configuration and \
+Power Interface Specification (ACPI). ACPICA code contains those portions of \
+ACPI meant to be directly integrated into the host OS as a kernel-resident \
+subsystem, and a small set of tools to assist in developing and debugging \
+ACPI tables."
+
+HOMEPAGE = "http://www.acpica.org/"
+SECTION = "console/tools"
+
+LICENSE = "BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+DEPENDS = "bison flex"
+
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
+    file://no-werror.patch \
+    "
+SRC_URI[md5sum] = "2bc4a7ccc82de9df9fa964f784ecb29c"
+SRC_URI[sha256sum] = "61204ec56d71bc9bfa2ee2ade4c66f7e8541772ac72ef8ccc20b3f339cc96374"
+
+S = "${WORKDIR}/acpica-unix2-${PV}"
+
+EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
+
+do_install() {
+    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
+    install -D -p -m0755 generate/unix/bin*/acpibin ${D}${bindir}/acpibin
+    install -D -p -m0755 generate/unix/bin*/acpiexec ${D}${bindir}/acpiexec
+    install -D -p -m0755 generate/unix/bin*/acpihelp ${D}${bindir}/acpihelp
+    install -D -p -m0755 generate/unix/bin*/acpinames ${D}${bindir}/acpinames
+    install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
+    install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
+}
+
+# iasl*.bb is a subset of this recipe, so RREPLACE it
+PROVIDES = "iasl"
+RPROVIDES_${PN} += "iasl"
+RREPLACES_${PN} += "iasl"
+RCONFLIGHTS_${PN} += "iasl"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/acpica/acpitests/aapits-linux.patch b/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
new file mode 100644
index 0000000..7c5d6b0
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
@@ -0,0 +1,336 @@
+From: Al Stone <ahs3@ahs3.net>
+Date: Mon, 7 Apr 2014 19:09:37 +0000
+Subject: [PATCH 1/2] Fixup aapits build
+
+From http://git.linaro.org/people/al.stone/acpica-tools.git
+Upstream-status: Unknown
+
+diff -urN acpica-unix2-20130626/tests/aapits/atexec.c acpica-unix2-20130626-aapits/tests/aapits/atexec.c
+--- acpica-unix2-20130626/tests/aapits/atexec.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atexec.c	2013-07-25 13:44:23.023894441 -0600
+@@ -639,6 +639,7 @@
+ }
+ 
+ 
++#if ACPI_MACHINE_WIDTH == 32
+ /*******************************************************************************
+  *
+  * FUNCTION:    AtBuildLocalRSDT
+@@ -757,8 +758,9 @@
+         LocalRSDT->Header.Checksum = (UINT8)~LocalRSDT->Header.Checksum;
+     }
+ }
++#endif
+ 
+ 
+ /*******************************************************************************
+  *
+  * FUNCTION:    AtBuildLocalXSDT
+@@ -1424,7 +1426,7 @@
+         ACPI_WARNING ((AE_INFO,
+             "Request on [%4.4s] is beyond region limit Req-%X+%X, Base=%X, Len-%X\n",
+             (RegionObject->Region.Node)->Name.Ascii, (UINT32) Address,
+-            ByteWidth, (UINT32) BufferAddress, Length));
++            ByteWidth, (UINT32) BufferAddress, (UINT32) Length));
+ 
+         return (AE_AML_REGION_LIMIT);
+     }
+@@ -1792,7 +1796,9 @@
+             Path, Obj.Integer.Value, Value);
+ #else
+         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
+-            Path, Obj.Integer.Value, Value);
++            Path,
++	    (long long unsigned int) Obj.Integer.Value,
++	    (long long unsigned int) Value);
+ #endif
+         Status = AE_ERROR;
+     }
+@@ -1871,7 +1877,7 @@
+     {
+         TestErrors++;
+         printf ("Test Error: cannot allocate buffer of %d bytes\n",
+-            Results.Length);
++                (int) Results.Length);
+         return (AE_NO_MEMORY);
+     }
+     Results.Pointer = Object;
+@@ -1952,7 +1956,8 @@
+     {
+         printf ("AtCheckBuffer: unexpected length %d of Buffer vs"
+             " calculated %d bytes\n",
+-            Results.Length, ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length));
++            (int)Results.Length,
++	    (int)(ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length)));
+     }
+ 
+     /* Initialize the return buffer structure */
+@@ -1961,7 +1968,7 @@
+     {
+         TestErrors++;
+         printf ("Test Error: cannot allocate buffer of %d bytes\n",
+-            Results.Length);
++            (int) Results.Length);
+         return (AE_NO_MEMORY);
+     }
+     Results.Pointer = Object;
+diff -urN acpica-unix2-20130626/tests/aapits/atinit.c acpica-unix2-20130626-aapits/tests/aapits/atinit.c
+--- acpica-unix2-20130626/tests/aapits/atinit.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atinit.c	2013-07-25 13:20:19.706705960 -0600
+@@ -3024,7 +3024,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+ 
+@@ -3046,7 +3046,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+ 
+@@ -3066,7 +3066,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+         else if (OutBuffer.Pointer != &Info)
+@@ -3149,7 +3149,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+         else if (OutBuffer.Pointer != &Info)
+@@ -3214,7 +3214,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (ACPI_SYSTEM_INFO));
++                (int) OutBuffer.Length, (int) sizeof (ACPI_SYSTEM_INFO));
+             return (AE_ERROR);
+         }
+         else
+diff -urN acpica-unix2-20130626/tests/aapits/atmain.c acpica-unix2-20130626-aapits/tests/aapits/atmain.c
+--- acpica-unix2-20130626/tests/aapits/atmain.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atmain.c	2013-07-25 13:18:22.083323948 -0600
+@@ -315,7 +315,7 @@
+     {
+         printf ("ACPICA API TS err: test num %ld of test case %ld"
+             " is not implemented\n",
+-            test_num, test_case);
++            (long int) test_num, (long int) test_case);
+         return (AtRetNotImpl);
+     }
+ 
+@@ -430,7 +432,7 @@
+     if (test_case < 1 || test_case > AT_TEST_CASE_NUM)
+     {
+         printf ("ACPICA API TS err: test case %ld is out of range 1 - %d\n",
+-            test_case, AT_TEST_CASE_NUM);
++            (long int) test_case, (int) AT_TEST_CASE_NUM);
+         return (AtRetBadParam);
+     }
+ 
+@@ -438,7 +440,7 @@
+     if (test_num < 0 || test_num > AtTestCase[test_case].TestsNum)
+     {
+         printf ("ACPICA API TS err: test num %ld is out of range 0 - %d\n",
+-            test_num, AtTestCase[test_case].TestsNum);
++            (long int) test_num, AtTestCase[test_case].TestsNum);
+         return (AtRetBadParam);
+     }
+
+diff -urN acpica-unix2-20130626/tests/aapits/atnamespace.c acpica-unix2-20130626-aapits/tests/aapits/atnamespace.c
+--- acpica-unix2-20130626/tests/aapits/atnamespace.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atnamespace.c	2013-07-25 13:24:15.366466707 -0600
+@@ -2535,7 +2535,8 @@
+ #else
+                 printf ("API Error: Address of %s (0x%llX) != (0x%llX)\n",
+                     PathNames[2 * i + 1],
+-                    Info->Address, ExpectedInfo[i].Address);
++                    (long long unsigned int) Info->Address,
++		    (long long unsigned int) ExpectedInfo[i].Address);
+ #endif
+ #else
+                 printf ("API Error: Address of %s (0x%X) != (0x%X)\n",
+@@ -2908,7 +2909,8 @@
+         TestErrors++;
+         printf ("AtGetNextObjectTypeCommon: different numbers of entities"
+             "in TypesNames (%d) and LevelTypes0000 (%d)\n",
+-            TypesCount, sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE));
++            TypesCount,
++	    (int) (sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE)));
+         return (AE_ERROR);
+     }
+ 
+@@ -4192,7 +4194,9 @@
+             Pathname, Obj.Integer.Value, Value);
+ #else
+         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
+-            Pathname, Obj.Integer.Value, Value);
++            Pathname,
++	    (long long unsigned int) Obj.Integer.Value,
++	    (long long unsigned int) Value);
+ #endif
+         Status = AE_ERROR;
+     }
+@@ -5199,7 +5203,7 @@
+             {
+                 AapiErrors++;
+                 printf ("API Error: AcpiOsAllocate(%d) returned NULL\n",
+-                    OutName.Length);
++                    (int) OutName.Length);
+                 return (AE_ERROR);
+             }
+         }
+diff -urN acpica-unix2-20130626/tests/aapits/atosxfctrl.c acpica-unix2-20130626-aapits/tests/aapits/atosxfctrl.c
+--- acpica-unix2-20130626/tests/aapits/atosxfctrl.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atosxfctrl.c	2013-07-25 13:30:00.375492751 -0600
+@@ -737,13 +737,15 @@
+ #if ACPI_MACHINE_WIDTH == 64
+ #ifdef    _MSC_VER
+         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%I64x\n",
++            Width, Address);
+ #else
+         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%llx\n",
++            Width, (long long unsigned int) Address);
+ #endif
+ #else
+         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%x\n",
+-#endif
+             Width, Address);
++#endif
+         return (NULL);
+     }
+ 
+@@ -764,15 +766,19 @@
+ #ifdef    _MSC_VER
+                 printf("OsxfCtrlFingReg: intersection Regs (0x%I64x: 0x%x)"
+                     " and (0x%I64x: 0x%x)\n",
++                    Reg->Address, Reg->Width, Address, Width);
+ #else
+                 printf("OsxfCtrlFingReg: intersection Regs (0x%llx: 0x%x)"
+                     " and (0x%llx: 0x%x)\n",
++                    (long long unsigned int) Reg->Address,
++		    Reg->Width,
++		    (long long unsigned int) Address, Width);
+ #endif
+ #else
+                 printf("OsxfCtrlFingReg: intersection Regs (0x%x: 0x%x)"
+                     " and (0x%x: 0x%x)\n",
+-#endif
+                     Reg->Address, Reg->Width, Address, Width);
++#endif
+                 return (NULL);
+             }
+         }
+@@ -786,13 +792,15 @@
+ #if ACPI_MACHINE_WIDTH == 64
+ #ifdef    _MSC_VER
+             printf("OsxfCtrlFingReg: no memory for Reg (0x%I64x: 0x%x)\n",
++                Reg->Address, Reg->Width);
+ #else
+             printf("OsxfCtrlFingReg: no memory for Reg (0x%llx: 0x%x)\n",
++                (long long unsigned int) Reg->Address, Reg->Width);
+ #endif
+ #else
+             printf("OsxfCtrlFingReg: no memory for Reg (0x%x: 0x%x)\n",
+-#endif
+                 Reg->Address, Reg->Width);
++#endif
+             return (NULL);
+         }
+         Reg->Type = Type;
+@@ -932,14 +940,19 @@
+ #if ACPI_MACHINE_WIDTH == 64
+ #ifdef    _MSC_VER
+             printf("%.2u (%s Address 0x%I64x: Width %.2u) r/w counts: %u/%u\n",
++                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
++                Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
+ #else
+             printf("%.2u (%s Address 0x%llx: Width %.2u) r/w counts: %u/%u\n",
++                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
++                (long long unsigned int) Reg->Address,
++		Reg->Width, Reg->ReadCount, Reg->WriteCount);
+ #endif
+ #else
+             printf("%.2u (%s Address 0x%.4x: Width %.2u) r/w counts: %u/%u\n",
+-#endif
+                 i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
+                 Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
++#endif
+             Reg = Reg->Next;
+             i++;
+         }
+diff -urN acpica-unix2-20130626/tests/aapits/atresource.c acpica-unix2-20130626-aapits/tests/aapits/atresource.c
+--- acpica-unix2-20130626/tests/aapits/atresource.c	2013-01-17 12:48:29.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atresource.c	2013-07-25 13:25:49.423565947 -0600
+@@ -174,7 +174,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
++            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
+         return (AE_ERROR);
+     }
+ 
+@@ -490,7 +490,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
++            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
+         return (AE_ERROR);
+     }
+ 
+@@ -689,7 +689,7 @@
+         AapiErrors++;
+         printf ("Api Error: Resource->Length (%d) != %d\n",
+             CurrentResource->Length,
+-            ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ)));
++            (int) (ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ))));
+     }
+ 
+     if (CurrentResource->Data.Irq.Triggering != 0) /* Level-Triggered */
+@@ -981,7 +981,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetPossibleResources(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
++            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
+         return (AE_ERROR);
+     }
+ 
+@@ -1923,7 +1923,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetIrqRoutingTable(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, 0xA48);
++            Pathname, (int) OutBuffer.Length, 0xA48);
+         return (AE_ERROR);
+     }
+
+diff -urN acpica-unix2-20130626/tests/aapits/Makefile acpica-unix2-20130626-aapits/tests/aapits/Makefile
+--- acpica-unix2-20130626/tests/aapits/Makefile	2013-01-17 12:48:29.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/Makefile	2013-07-25 15:17:09.309236422 -0600
+@@ -194,7 +194,7 @@
+ CFLAGS+= -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include
+
+ 
+-acpiexec : $(patsubst %.c,%.o, $(SRCS))
++$(PROG) : $(patsubst %.c,%.o, $(SRCS))
+ 	$(CC) $(LDFLAGS) $(patsubst %.c,%.o, $(SRCS)) -o $(PROG)
+ 
+ CLEANFILES= $(PROG)
diff --git a/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch b/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
new file mode 100644
index 0000000..4d9e997
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
@@ -0,0 +1,34 @@
+From: Al Stone <ahs3@ahs3.net>
+Date: Mon, 7 Apr 2014 19:09:37 +0000
+Subject: [PATCH 1/2] Fixup aapits build
+
+From http://git.linaro.org/people/al.stone/acpica-tools.git
+Upstream-status: Unknown
+
+diff -urN acpica-unix2-20140325/tests/aapits/Makefile acpica-unix2-20140325/tests/aapits/Makefile
+--- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 14:23:14.683636794 -0600
++++ acpica-unix2-20140325-aapits/tests/aapits/Makefile	2014-04-05 15:10:57.879184598 -0600
+@@ -16,6 +16,7 @@
+ 	atosxfwrap.c \
+ 	osunixxf.c \
+ 	../../source/common/ahids.c \
++	../../source/common/ahuuids.c \
+ 	../../source/common/cmfsize.c \
+ 	../../source/common/getopt.c \
+ 	../../source/components/hardware/hwtimer.c \
+@@ -174,6 +175,7 @@
+ 	../../source/components/utilities/utexcep.c \
+ 	../../source/components/utilities/utfileio.c \
+ 	../../source/components/utilities/utglobal.c \
++	../../source/components/utilities/uthex.c \
+ 	../../source/components/utilities/utids.c \
+ 	../../source/components/utilities/utinit.c \
+ 	../../source/components/utilities/utlock.c \
+@@ -189,6 +191,7 @@
+ 	../../source/components/utilities/utstate.c \
+ 	../../source/components/utilities/utstring.c \
+ 	../../source/components/utilities/uttrack.c \
++	../../source/components/utilities/utuuid.c \
+ 	../../source/components/utilities/utxface.c \
+ 	../../source/components/utilities/utxferror.c \
+ 	../../source/components/utilities/utxfinit.c \
diff --git a/meta/recipes-extended/acpica/acpitests_20140828.bb b/meta/recipes-extended/acpica/acpitests_20140828.bb
new file mode 100644
index 0000000..1f6f190
--- /dev/null
+++ b/meta/recipes-extended/acpica/acpitests_20140828.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Test suite used to validate ACPICA"
+HOMEPAGE = "http://www.acpica.org/"
+
+LICENSE = "Intel"
+LIC_FILES_CHKSUM = "file://tests/aapits/atexec.c;beginline=1;endline=115;md5=e92bcdfcd01d117d1bda3e814bb2030a"
+
+DEPENDS = "bison flex"
+
+SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
+           https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
+           file://aapits-linux.patch \
+           file://aapits-makefile.patch \
+"
+SRC_URI[acpitests.md5sum] = "db9d6fdaa8e3eb101d700ee5ba4938ed"
+SRC_URI[acpitests.sha256sum] = "e576c74bf1bf1c9f7348bf9419e05c8acfece7105abcdc052e66670c7af2cf00"
+SRC_URI[acpica.md5sum] = "6f05f0d10166a1b1ff6107f3d1cdf1e5"
+SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
+
+S = "${WORKDIR}/acpitests-unix-${PV}"
+
+EXTRA_OEMAKE = "'CC=${TARGET_PREFIX}gcc ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}' 'OPT_CFLAGS=-Wall'"
+
+# The Makefiles expect a specific layout
+do_compile() {
+    cp -af ${WORKDIR}/acpica-unix2-${PV}/source ${S}
+    cd tests/aapits
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m0755 tests/aapits/bin/aapits ${D}${bindir}
+}
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta/recipes-extended/acpica/files/no-werror.patch b/meta/recipes-extended/acpica/files/no-werror.patch
new file mode 100644
index 0000000..5d28f47
--- /dev/null
+++ b/meta/recipes-extended/acpica/files/no-werror.patch
@@ -0,0 +1,32 @@
+Description: remove -Werror flag
+Forwarded: not-needed
+Author: Fathi Boudra <fathi.boudra@linaro.org>
+
+---
+ generate/unix/iasl/Makefile |   12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+--- a/generate/unix/iasl/Makefile
++++ b/generate/unix/iasl/Makefile
+@@ -266,19 +266,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
+ # by the utilities above and they are not necessarily ANSI C, etc.
+ #
+ $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
-- 
git-series 0.9.1

