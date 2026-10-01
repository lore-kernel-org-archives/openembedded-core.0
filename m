Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA861CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5328.1790836303780812968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K3cZiD64;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZgeRGNTy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0f62964fd-ad681288-3a44-4c31-adbe-366e07f225a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aGiXfFB1WlxhLs1NI2wA9a4Di2xQrZpQzReu73brYCM=;
	b=K3cZiD64cEHPbzBkPGJcQZVuuy9TW5AP175WjufPFCvJ22yO0uwjiiBet1e7GcIW
	w9BjNqaHU4CjnkLRwrkn6UoGS4pCUoP3Zj1KwS68PhxR+unaktB9tOXt00z5qHuBFkY
	2KWkZvzWZltfcmApphh3RxCNfP4e6tSUtkgwibZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aGiXfFB1WlxhLs1NI2wA9a4Di2xQrZpQzReu73brYCM=;
	b=ZgeRGNTytPD5QW3hVpAX03Rt51FIOGwDxMx7BUo0NIT05kwUtd1kqGo6DvMxFILo
	0a0Gg4sxozPsTJmc+GQjpRgQ/ehaxo7ncuRFeooUGZryFwVSsxJ1hqf4SaNbPlrUNrR
	1BcDY5SLvI0jkIXxOgVe+t2kf/lD0ElY2vdFHPCw=
Content-Type: multipart/mixed; boundary="===============2975607938791840044=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20260930 SUCCEEDED
Message-ID: <010101a0f62964fd-ad681288-3a44-4c31-adbe-366e07f225a6-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247005

--===============2975607938791840044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acpica* to *20260930* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20260408-20260930.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 99aab9f7d9daac85159315b1cdddf37f8df43dfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 05:46:58 +0000
Subject: [PATCH] acpica: upgrade 20260408 -> 20260930

release: Update version to 20260930
dispatcher: Allocate the PCC internal buffer only once per region
iASL: Fix the truncated count of external control methods
iASL: Complete KEYP support
iasl: Make the vendor data of a GUIDed entry optional
ACPI 6.5 Add support for the MISC table
iASL: Validate the entire Switch pattern before rewriting the parse tree
ACPICA: Add ACPI_MSG_DEBUG to set KERN_DEBUG for debug output
docs: Remove old new_table.txt file
docs: Describe in detail adding a new table
Create SECURITY.md
Linuxize: add port_commit.sh
acpica: add UBRT disassembler, compiler, and integration support
acpica: add UBRT (UnifiedBus Root Table) definitions
namespace: Fix possible underflow and NULL pointer dereference
compiler: Fix possible NULL pointer
Fix PCC OperationRegion command offsets
compiler: Add _Ixx GPE object
iASL: DTPR: Fix dead code in DTPR buffer NULL check
Namespace: Initialize ParserState.AmlEnd in AcpiInstallMethod
Add a CONTRIBUTING file
Change license text in ACPICA source files
Adjust the ACPICA license
Update ACPICA repository URL in all files
Change ACPICA project license
Revert "Merge documentation guides"
executer: Fix NULL pointer dereference in AcpiExStoreObjectToIndex()
Merge documentation guides
EFI: add support for RISCV64
EFI: support HW Reduced ACPI w/o FACS
generate/efi: commonize GCC flags
Update build.txt with new link to the Adobe platform to file IDZ website tickets
gitignore: Update gitignore with generate/efi build files
generate/efi: Add missing steps to the readme build process
generate/efi: Fix EFI building and page fault
generate/efi: adapt to EDK2 202605
generate/efi: add missing utcksum.c source file
parser: Set AML length for bytelist
iASL: Fix Printf/Fprintf broken by AslKeywordMapping bounds check
actbl2: Add bit constants of the Flags field in the IOVT IOMMU structure
fix: build error with gcc 16: unused-but-set-variable
Merge pull request #1184 from void0red/fix-1183
Merge pull request #1182 from void0red/fix-1181
Merge pull request #1180 from void0red/fix-1179
Merge pull request #1176 from void0red/fix-1175
Merge pull request #1174 from void0red/fix-1173
Merge pull request #1172 from void0red/fix-1171
Merge pull request #1166 from void0red/fix-1165
Merge pull request #1163 from void0red/fix-1162
Events: Track in-flight notify handlers to prevent use-after-free on table
unload
Merge pull request #1161 from void0red/fix-1160
AcpiExec: Clean up GPE dispatch and GED handlers on table unload
Events: Clear GPE dispatch by owner during table unload
docs: add getting-started guide
docs: add project philosophy guide
docs: add minimal contributor, testing, review, and agent guides
Merge pull request #1201 from davejiang/rdpas-fixes
CEDT: Add full compiler, disassembler, and template support for RDPAS and fix
CXIMS hang
Merge pull request #1200 from mstrozek/verify-checksum
CEDT: RDPAS: Fix incorrect field positions for RDPAS
CEDT: RDPAS: Add missing reserved field in RDPAS structure
Utilities: Fix for AcpiUtVerifyChecksum warning display
Merge pull request #1170 from hschauhan/riscv-sse-notify
Merge pull request #1189 from ColinIanKing/fix-typos
components: Fix typo: "numer" -> "number"
components: Fix typo "Supress" -> "Suppress"
ASLTS: provoke: Fix typo "exersice" -> "exercise"
ASLTS: exc: Fix typo "restictions" -> "restrictions"
ASLTS: DECL: Fix typo "reporeted" -> "reported"
ASLTS: abbu: Fix typo in comment "Aplicable" -> "Applicable"
ASLTS: crbuffield: Fix typo in comment "unerlying" -> "underlying"
ASLTS: ssdt2: Fix typo "decleared" -> "declared"
ASLTS: while: Fix typos "complited" and "poin"
ASLTS: SPEC: Fix typos "obects" and "perpose"
ASLTS: mutex_proc: Fix typo in comment "derect" -> "direct"
ASL test suite (ASLTS): common.asl: Fix typo "cammand" -> "command"
ASLTS: Mutex SPEC: Fix typos "occuppied" -> "occupied"
ASL test suite (ASLTS): Fix typo "oprators" -> "operators"
Grammar test: Fix typos "Battey" -> "Battery"
namespace: Recognize alias node types in detach
Fix object reference update to skip non-local notify types
tables: Fix heap-buffer-overflow in AcpiTbFindTable
executer: Add bounds checking for PCC field write access
executer: Add bounds checking for PCC field read access
Improve error handling in table loading process to ensure proper cleanup on
failure
Validate 4-char name in AcpiDsGetFieldNames and AcpiDsInitFieldObjects to
prevent OOB read in AcpiNsLookup
Introduce a new HEST notification type for RISC-V SSE events. The GHES entry's
notification structure contains the notification to be used for a given error
source. For error sources delivering events over SSE, it should contain the new
SSE notification type.
Merge pull request #1152 from aegl/einjv2defines
Recover the ASLTS test count (pass + fail + skipped/blocked) that had dropped
due to this previous error mandating either _HID or _ADR presence to generate
AML
Provide #defines for EINJV2 error types
Merge pull request #1143 from void0red/fix-issue1
Merge pull request #1150 from void0red/f

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...{acpica_20260408.bb => acpica_20260930.bb} | 302 +++++++++++++++++-
 1 file changed, 300 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20260408.bb => acpica_20260930.bb} (10%)

diff --git a/meta/recipes-extended/acpica/acpica_20260408.bb b/meta/recipes-extended/acpica/acpica_20260930.bb
similarity index 10%
rename from meta/recipes-extended/acpica/acpica_20260408.bb
rename to meta/recipes-extended/acpica/acpica_20260930.bb
index 1e6326720f..7eac4c7444 100644
--- a/meta/recipes-extended/acpica/acpica_20260408.bb
+++ b/meta/recipes-extended/acpica/acpica_20260930.bb
@@ -1,3 +1,301 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- source/compiler/aslcompile.c
+# +++ source/compiler/aslcompile.c
+# @@ -1,144 +1,144 @@
+#  /******************************************************************************
+#   *
+# - * 1. Copyright Notice
+# - *
+# - * Some or all of this work - Copyright (c) 1999 - 2026, Intel Corp.
+# - * All rights reserved.
+# - *
+# - * 2. License
+# - *
+# - * 2.1. This is your license from Intel Corp. under its intellectual property
+# - * rights. You may have additional license terms from the party that provided
+# - * you this software, covering your right to use that party's intellectual
+# - * property rights.
+# - *
+# - * 2.2. Intel grants, free of charge, to any person ("Licensee") obtaining a
+# - * copy of the source code appearing in this file ("Covered Code") an
+# - * irrevocable, perpetual, worldwide license under Intel's copyrights in the
+# - * base code distributed originally by Intel ("Original Intel Code") to copy,
+# - * make derivatives, distribute, use and display any portion of the Covered
+# - * Code in any form, with the right to sublicense such rights; and
+# - *
+# - * 2.3. Intel grants Licensee a non-exclusive and non-transferable patent
+# - * license (with the right to sublicense), under only those claims of Intel
+# - * patents that are infringed by the Original Intel Code, to make, use, sell,
+# - * offer to sell, and import the Covered Code and derivative works thereof
+# - * solely to the minimum extent necessary to exercise the above copyright
+# - * license, and in no event shall the patent license extend to any additions
+# - * to or modifications of the Original Intel Code. No other license or right
+# - * is granted directly or by implication, estoppel or otherwise;
+# - *
+# - * The above copyright and patent license is granted only if the following
+# - * conditions are met:
+# - *
+# - * 3. Conditions
+# - *
+# - * 3.1. Redistribution of Source with Rights to Further Distribute Source.
+# - * Redistribution of source code of any substantial portion of the Covered
+# - * Code or modification with rights to further distribute source must include
+# - * the above Copyright Notice, the above License, this list of Conditions,
+# - * and the following Disclaimer and Export Compliance provision. In addition,
+# - * Licensee must cause all Covered Code to which Licensee contributes to
+# - * contain a file documenting the changes Licensee made to create that Covered
+# - * Code and the date of any change. Licensee must include in that file the
+# - * documentation of any changes made by any predecessor Licensee. Licensee
+# - * must include a prominent statement that the modification is derived,
+# - * directly or indirectly, from Original Intel Code.
+# - *
+# - * 3.2. Redistribution of Source with no Rights to Further Distribute Source.
+# - * Redistribution of source code of any substantial portion of the Covered
+# - * Code or modification without rights to further distribute source must
+# - * include the following Disclaimer and Export Compliance provision in the
+# - * documentation and/or other materials provided with distribution. In
+# - * addition, Licensee may not authorize further sublicense of source of any
+# - * portion of the Covered Code, and must include terms to the effect that the
+# - * license from Licensee to its licensee is limited to the intellectual
+# - * property embodied in the software Licensee provides to its licensee, and
+# - * not to intellectual property embodied in modifications its licensee may
+# - * make.
+# - *
+# - * 3.3. Redistribution of Executable. Redistribution in executable form of any
+# - * substantial portion of the Covered Code or modification must reproduce the
+# - * above Copyright Notice, and the following Disclaimer and Export Compliance
+# - * provision in the documentation and/or other materials provided with the
+# - * distribution.
+# - *
+# - * 3.4. Intel retains all right, title, and interest in and to the Original
+# - * Intel Code.
+# - *
+# - * 3.5. Neither the name Intel nor any other trademark owned or controlled by
+# - * Intel shall be used in advertising or otherwise to promote the sale, use or
+# - * other dealings in products derived from or relating to the Covered Code
+# - * without prior written authorization from Intel.
+# - *
+# - * 4. Disclaimer and Export Compliance
+# - *
+# - * 4.1. INTEL MAKES NO WARRANTY OF ANY KIND REGARDING ANY SOFTWARE PROVIDED
+# - * HERE. ANY SOFTWARE ORIGINATING FROM INTEL OR DERIVED FROM INTEL SOFTWARE
+# - * IS PROVIDED "AS IS," AND INTEL WILL NOT PROVIDE ANY SUPPORT, ASSISTANCE,
+# - * INSTALLATION, TRAINING OR OTHER SERVICES. INTEL WILL NOT PROVIDE ANY
+# - * UPDATES, ENHANCEMENTS OR EXTENSIONS. INTEL SPECIFICALLY DISCLAIMS ANY
+# - * IMPLIED WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT AND FITNESS FOR A
+# - * PARTICULAR PURPOSE.
+# - *
+# - * 4.2. IN NO EVENT SHALL INTEL HAVE ANY LIABILITY TO LICENSEE, ITS LICENSEES
+# - * OR ANY OTHER THIRD PARTY, FOR ANY LOST PROFITS, LOST DATA, LOSS OF USE OR
+# - * COSTS OF PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, OR FOR ANY INDIRECT,
+# - * SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THIS AGREEMENT, UNDER ANY
+# - * CAUSE OF ACTION OR THEORY OF LIABILITY, AND IRRESPECTIVE OF WHETHER INTEL
+# - * HAS ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES. THESE LIMITATIONS
+# - * SHALL APPLY NOTWITHSTANDING THE FAILURE OF THE ESSENTIAL PURPOSE OF ANY
+# - * LIMITED REMEDY.
+# - *
+# - * 4.3. Licensee shall not export, either directly or indirectly, any of this
+# - * software or system incorporating such software without first obtaining any
+# - * required license or other approval from the U. S. Department of Commerce or
+# - * any other agency or department of the United States Government. In the
+# - * event Licensee exports any such software from the United States or
+# - * re-exports any such software from a foreign destination, Licensee shall
+# - * ensure that the distribution and export/re-export of the software is in
+# - * compliance with all laws, regulations, orders, or other restrictions of the
+# - * U.S. Export Administration Regulations. Licensee agrees that neither it nor
+# - * any of its subsidiaries will export/re-export any technical data, process,
+# - * software, or service, directly or indirectly, to any country for which the
+# - * United States government or any agency thereof requires an export license,
+# - * other governmental approval, or letter of assurance, without first obtaining
+# - * such license, approval or letter.
+# - *
+# - *****************************************************************************
+# - *
+# - * Alternatively, you may choose to be licensed under the terms of the
+# - * following license:
+# - *
+# - * Redistribution and use in source and binary forms, with or without
+# - * modification, are permitted provided that the following conditions
+# - * are met:
+# - * 1. Redistributions of source code must retain the above copyright
+# - *    notice, this list of conditions, and the following disclaimer,
+# - *    without modification.
+# - * 2. Redistributions in binary form must reproduce at minimum a disclaimer
+# - *    substantially similar to the "NO WARRANTY" disclaimer below
+# - *    ("Disclaimer") and any redistribution must be conditioned upon
+# - *    including a substantially similar Disclaimer requirement for further
+# - *    binary redistribution.
+# - * 3. Neither the names of the above-listed copyright holders nor the names
+# - *    of any contributors may be used to endorse or promote products derived
+# - *    from this software without specific prior written permission.
+# - *
+# - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# - *
+# - * Alternatively, you may choose to be licensed under the terms of the
+# - * GNU General Public License ("GPL") version 2 as published by the Free
+# - * Software Foundation.
+# + * Copyright (c) 1999 - 2026, Intel Corp.
+# + * SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only
+#   *
+#   *****************************************************************************/
+# +
+# +#include "aslcompiler.h"
+# +#include "acnamesp.h"
+# +
+# +#include <stdio.h>
+# +#include <time.h>
+# +#include <acapps.h>
+# +
+# +#define _COMPONENT          ACPI_COMPILER
+# +        ACPI_MODULE_NAME    ("aslcompile")
+# +
+# +/*
+# + * Main parser entry
+# + * External is here in case the parser emits the same external in the
+# + * generated header. (Newer versions of Bison)
+# + */
+# +int
+# +AslCompilerparse(
+# +    void);
+# +
+# +/* Local prototypes */
+# +
+# +static void
+# +CmFlushSourceCode (
+# +    void);
+# +
+# +static void
+# +CmDumpAllEvents (
+# +    void);
+# +
+# +static void
+# +CmFinishFiles(
+# +    BOOLEAN                 DeleteAmlFile);
+# +
+# +
+# +/*******************************************************************************
+# + *
+# + * FUNCTION:    CmDoCompile
+# + *
+# + * PARAMETERS:  None
+# + *
+# + * RETURN:      Status (0 = OK)
+# + *
+# + * DESCRIPTION: This procedure performs the entire compile
+# + *
+# + ******************************************************************************/
+# +
+# +ACPI_STATUS
+# +CmDoCompile (
+# +    void)
+# +{
+# +    UINT8                   FullCompile;
+# +    UINT8                   Event;
+# +    ASL_GLOBAL_FILE_NODE    *FileNode;
+# +
+# +
+# +    FullCompile = UtBeginEvent ("*** Total Compile time ***");
+# +    Event = UtBeginEvent ("Open input and output files");
+# +    UtEndEvent (Event);
+# +
+# +    Event = UtBeginEvent ("Preprocess input file");
+# +    if (AslGbl_PreprocessFlag)
+# +    {
+# +        /* Enter compiler name as a #define */
+# +
+# +        PrAddDefine (ASL_DEFINE, "", FALSE);
+# +
+# +        /* Preprocessor */
+# +
+# +        PrDoPreprocess ();
+# +        AslGbl_CurrentLineNumber = 1;
+# +        AslGbl_LogicalLineNumber = 1;
+# +        AslGbl_CurrentLineOffset = 0;
+# +
+# +        if (AslGbl_PreprocessOnly)
+# +        {
+# +            UtEndEvent (Event);
+# +            return (AE_OK);
+# +        }
+# +    }
+# +    UtEndEvent (Event);
+# +
+# +
+# +    /* Build the parse tree */
+# +
+# +    Event = UtBeginEvent ("Parse source code and build parse tree");
+# +    AslCompilerparse();
+# +    UtEndEvent (Event);
+# +
+# +    /* Check for parser-detected syntax errors */
+# +
+# +    if (AslGbl_SyntaxError)
+# +    {
+# +        AslError (ASL_ERROR, ASL_MSG_SYNTAX, NULL,
+# +            "Compiler aborting due to parser-detected syntax error(s)\n");
+# +
+# +        /* Flag this error in the FileNode for compilation summary */
+# +
+# +        FileNode = FlGetCurrentFileNode ();
+# +        FileNode->ParserErrorDetected = TRUE;
+# +        AslGbl_ParserErrorDetected = TRUE;
+# +        LsDumpParseTree ();
+# +        AePrintErrorLog(ASL_FILE_STDERR);
+# +
+# +        goto ErrorExit;
+# +    }
+# +
+# +    /* Did the parse tree get successfully constructed? */
+# +
+# +    if (!AslGbl_ParseTreeRoot)
+# +    {
+# +        /*
+# +         * If there are no errors, then we have some sort of
+# +         * internal problem.
+# +         */
+# +        AslError (ASL_ERROR, ASL_MSG_COMPILER_INTERNAL,
+# +            NULL, "- Could not resolve parse tree root node");
+# +
+# +        goto ErrorExit;
+# +    }
+# +
+# +    AePrintErrorLog(ASL_FILE_STDERR);
+# +
+# +    /* Flush out any remaining source after parse tree is complete */
+# +
+# +    Event = UtBeginEvent ("Flush source input");
+# +    CmFlushSourceCode ();
+# +
+# +    /* Prune the parse tree if requested (debug purposes only) */
+# +
+# +    if (AslGbl_PruneParseTree)
+# +    {
+# +        AslPruneParseTree (AslGbl_PruneDepth, AslGbl_PruneType);
+# +    }
+# +
+# +    /* Optional parse tree dump, compiler debug output only */
+# +
+# +    LsDumpParseTree ();
+# 
+#
+
 SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
 OS-independent reference implementation of the Advanced Configuration and \
@@ -10,14 +308,14 @@ HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/o
 SECTION = "console/tools"
 
 LICENSE = "BSD-3-Clause OR GPL-2.0-only OR Intel"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=4877caee45a613e9706946c3205a6fb9"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=f5cd06b6555eb8022bf99d49f902b071"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
-SRCREV = "232ff3f8ae1a4da11c709f61d9154482cfe8e6df"
+SRCREV = "e85aa3bebaae81ed1e6d163511ac7e1eafe732cf"
 
 inherit update-alternatives
 
-- 
2.47.1


--===============2975607938791840044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGSIZE changed from 10631366 to 7796700 (-27%)

--===============2975607938791840044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="acpica-changelog.txt"

release: Update version to 20260930
dispatcher: Allocate the PCC internal buffer only once per region
iASL: Fix the truncated count of external control methods
iASL: Complete KEYP support
iasl: Make the vendor data of a GUIDed entry optional
ACPI 6.5 Add support for the MISC table
iASL: Validate the entire Switch pattern before rewriting the parse tree
ACPICA: Add ACPI_MSG_DEBUG to set KERN_DEBUG for debug output
docs: Remove old new_table.txt file
docs: Describe in detail adding a new table
Create SECURITY.md
Linuxize: add port_commit.sh
acpica: add UBRT disassembler, compiler, and integration support
acpica: add UBRT (UnifiedBus Root Table) definitions
namespace: Fix possible underflow and NULL pointer dereference
compiler: Fix possible NULL pointer
Fix PCC OperationRegion command offsets
compiler: Add _Ixx GPE object
iASL: DTPR: Fix dead code in DTPR buffer NULL check
Namespace: Initialize ParserState.AmlEnd in AcpiInstallMethod
Add a CONTRIBUTING file
Change license text in ACPICA source files
Adjust the ACPICA license
Update ACPICA repository URL in all files
Change ACPICA project license
Revert "Merge documentation guides"
executer: Fix NULL pointer dereference in AcpiExStoreObjectToIndex()
Merge documentation guides
EFI: add support for RISCV64
EFI: support HW Reduced ACPI w/o FACS
generate/efi: commonize GCC flags
Update build.txt with new link to the Adobe platform to file IDZ website tickets
gitignore: Update gitignore with generate/efi build files
generate/efi: Add missing steps to the readme build process
generate/efi: Fix EFI building and page fault
generate/efi: adapt to EDK2 202605
generate/efi: add missing utcksum.c source file
parser: Set AML length for bytelist
iASL: Fix Printf/Fprintf broken by AslKeywordMapping bounds check
actbl2: Add bit constants of the Flags field in the IOVT IOMMU structure
fix: build error with gcc 16: unused-but-set-variable
Merge pull request #1184 from void0red/fix-1183
Merge pull request #1182 from void0red/fix-1181
Merge pull request #1180 from void0red/fix-1179
Merge pull request #1176 from void0red/fix-1175
Merge pull request #1174 from void0red/fix-1173
Merge pull request #1172 from void0red/fix-1171
Merge pull request #1166 from void0red/fix-1165
Merge pull request #1163 from void0red/fix-1162
Events: Track in-flight notify handlers to prevent use-after-free on table
unload
Merge pull request #1161 from void0red/fix-1160
AcpiExec: Clean up GPE dispatch and GED handlers on table unload
Events: Clear GPE dispatch by owner during table unload
docs: add getting-started guide
docs: add project philosophy guide
docs: add minimal contributor, testing, review, and agent guides
Merge pull request #1201 from davejiang/rdpas-fixes
CEDT: Add full compiler, disassembler, and template support for RDPAS and fix
CXIMS hang
Merge pull request #1200 from mstrozek/verify-checksum
CEDT: RDPAS: Fix incorrect field positions for RDPAS
CEDT: RDPAS: Add missing reserved field in RDPAS structure
Utilities: Fix for AcpiUtVerifyChecksum warning display
Merge pull request #1170 from hschauhan/riscv-sse-notify
Merge pull request #1189 from ColinIanKing/fix-typos
components: Fix typo: "numer" -> "number"
components: Fix typo "Supress" -> "Suppress"
ASLTS: provoke: Fix typo "exersice" -> "exercise"
ASLTS: exc: Fix typo "restictions" -> "restrictions"
ASLTS: DECL: Fix typo "reporeted" -> "reported"
ASLTS: abbu: Fix typo in comment "Aplicable" -> "Applicable"
ASLTS: crbuffield: Fix typo in comment "unerlying" -> "underlying"
ASLTS: ssdt2: Fix typo "decleared" -> "declared"
ASLTS: while: Fix typos "complited" and "poin"
ASLTS: SPEC: Fix typos "obects" and "perpose"
ASLTS: mutex_proc: Fix typo in comment "derect" -> "direct"
ASL test suite (ASLTS): common.asl: Fix typo "cammand" -> "command"
ASLTS: Mutex SPEC: Fix typos "occuppied" -> "occupied"
ASL test suite (ASLTS): Fix typo "oprators" -> "operators"
Grammar test: Fix typos "Battey" -> "Battery"
namespace: Recognize alias node types in detach
Fix object reference update to skip non-local notify types
tables: Fix heap-buffer-overflow in AcpiTbFindTable
executer: Add bounds checking for PCC field write access
executer: Add bounds checking for PCC field read access
Improve error handling in table loading process to ensure proper cleanup on
failure
Validate 4-char name in AcpiDsGetFieldNames and AcpiDsInitFieldObjects to
prevent OOB read in AcpiNsLookup
Introduce a new HEST notification type for RISC-V SSE events. The GHES entry's
notification structure contains the notification to be used for a given error
source. For error sources delivering events over SSE, it should contain the new
SSE notification type.
Merge pull request #1152 from aegl/einjv2defines
Recover the ASLTS test count (pass + fail + skipped/blocked) that had dropped
due to this previous error mandating either _HID or _ADR presence to generate
AML
Provide #defines for EINJV2 error types
Merge pull request #1143 from void0red/fix-issue1
Merge pull request #1150 from void0red/fix-issue5-v2
fix: add boundary checks in AcpiPsGetNextNamestring and AcpiPsPeekOpcode to
prevent out-of-bounds access
Add package limit checks in parser functions to prevent out-of-bounds access.
Merge pull request #1135 from void0red/fix-issue29
fix buffer overflow risk by validating descriptor length in resource template

--===============2975607938791840044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 10906240 to 10892248 (-0%)
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica/acpica-src: FILELIST: directory renamed /usr/src/debug/acpica/20260408/source/components/utilities -> /usr/src/debug/acpica/20260930/source/components/utilities, directory renamed /usr/src/debug/acpica/20260408/source/tools/acpihelp -> /usr/src/debug/acpica/20260930/source/tools/acpihelp, directory renamed /usr/src/debug/acpica/20260408/source/tools/acpidump -> /usr/src/debug/acpica/20260930/source/tools/acpidump, directory renamed /usr/src/debug/acpica/20260408/source/components/disassembler -> /usr/src/debug/acpica/20260930/source/components/disassembler, directory renamed /usr/src/debug/acpica/20260408/source/tools/acpixtract -> /usr/src/debug/acpica/20260930/source/tools/acpixtract, directory renamed /usr/src/debug/acpica/20260408/source/common -> /usr/src/debug/acpica/20260930/source/common, directory renamed /usr/src/debug/acpica/20260408/source/components/hardware -> /usr/src/debug/acpica/20260930/source/components/hardware, directory renam
 ed /usr/src/debug/acpica/20260408/source/include -> /usr/src/debug/acpica/20260930/source/include, directory renamed /usr/src/debug/acpica/20260408/source/components/events -> /usr/src/debug/acpica/20260930/source/components/events, directory renamed /usr/src/debug/acpica/20260408/source/tools/examples -> /usr/src/debug/acpica/20260930/source/tools/examples, directory renamed /usr/src/debug/acpica/20260408/source/tools/acpiexec -> /usr/src/debug/acpica/20260930/source/tools/acpiexec, directory renamed /usr/src/debug/acpica/20260408/source/components/debugger -> /usr/src/debug/acpica/20260930/source/components/debugger, directory renamed /usr/src/debug/acpica/20260408/source/components/executer -> /usr/src/debug/acpica/20260930/source/components/executer, directory renamed /usr/src/debug/acpica/20260408/source/tools/acpibin -> /usr/src/debug/acpica/20260930/source/tools/acpibin, directory renamed /usr/src/debug/acpica/20260408/generate/unix/iasl/obj -> /usr/src/debug/acpica/20260930/
 generate/unix/iasl/obj, directory renamed /usr/src/debug/acpica/20260408/source/os_specific/service_layers -> /usr/src/debug/acpica/20260930/source/os_specific/service_layers, directory renamed /usr/src/debug/acpica/20260408/source/components/dispatcher -> /usr/src/debug/acpica/20260930/source/components/dispatcher, directory renamed /usr/src/debug/acpica/20260408/source/components/tables -> /usr/src/debug/acpica/20260930/source/components/tables, directory renamed /usr/src/debug/acpica/20260408/source/compiler -> /usr/src/debug/acpica/20260930/source/compiler, directory renamed /usr/src/debug/acpica/20260408/source/components/parser -> /usr/src/debug/acpica/20260930/source/components/parser, directory renamed /usr/src/debug/acpica/20260408/source/components/namespace -> /usr/src/debug/acpica/20260930/source/components/namespace, directory renamed /usr/src/debug/acpica/20260408/source/tools/acpisrc -> /usr/src/debug/acpica/20260930/source/tools/acpisrc, directory renamed /usr/src/de
 bug/acpica/20260408/source/components/resources -> /usr/src/debug/acpica/20260930/source/components/resources
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGSIZE changed from 10631366 to 7796700 (-27%)
packages/x86-64-v3-poky-linux/acpica/acpica-src: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica/acpica: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica/acpica: PKGSIZE changed from 2764760 to 2782328 (+1%)
packages/x86-64-v3-poky-linux/acpica/acpica: PV changed from "20260408" to "20260930"
packages/x86-64-v3-poky-linux/acpica: SRC_URI changed from "git://github.com/acpica/acpica;protocol=https;branch=master;tag=20260408" to "git://github.com/acpica/acpica;protocol=https;branch=master;tag=20260930"
packages/x86-64-v3-poky-linux/acpica: PKGV changed from 20260408 [default] to 20260930 [default]
packages/x86-64-v3-poky-linux/acpica: PV changed from "20260408" to "20260930"

--===============2975607938791840044==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20260408-20260930.patch"

RnJvbSA5OWFhYjlmN2Q5ZGFhYzg1MTU5MzE1YjFjZGRkZjM3ZjhkZjQzZGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNTo0Njo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFj
cGljYTogdXBncmFkZSAyMDI2MDQwOCAtPiAyMDI2MDkzMAoKcmVsZWFzZTogVXBkYXRlIHZlcnNp
b24gdG8gMjAyNjA5MzAKZGlzcGF0Y2hlcjogQWxsb2NhdGUgdGhlIFBDQyBpbnRlcm5hbCBidWZm
ZXIgb25seSBvbmNlIHBlciByZWdpb24KaUFTTDogRml4IHRoZSB0cnVuY2F0ZWQgY291bnQgb2Yg
ZXh0ZXJuYWwgY29udHJvbCBtZXRob2RzCmlBU0w6IENvbXBsZXRlIEtFWVAgc3VwcG9ydAppYXNs
OiBNYWtlIHRoZSB2ZW5kb3IgZGF0YSBvZiBhIEdVSURlZCBlbnRyeSBvcHRpb25hbApBQ1BJIDYu
NSBBZGQgc3VwcG9ydCBmb3IgdGhlIE1JU0MgdGFibGUKaUFTTDogVmFsaWRhdGUgdGhlIGVudGly
ZSBTd2l0Y2ggcGF0dGVybiBiZWZvcmUgcmV3cml0aW5nIHRoZSBwYXJzZSB0cmVlCkFDUElDQTog
QWRkIEFDUElfTVNHX0RFQlVHIHRvIHNldCBLRVJOX0RFQlVHIGZvciBkZWJ1ZyBvdXRwdXQKZG9j
czogUmVtb3ZlIG9sZCBuZXdfdGFibGUudHh0IGZpbGUKZG9jczogRGVzY3JpYmUgaW4gZGV0YWls
IGFkZGluZyBhIG5ldyB0YWJsZQpDcmVhdGUgU0VDVVJJVFkubWQKTGludXhpemU6IGFkZCBwb3J0
X2NvbW1pdC5zaAphY3BpY2E6IGFkZCBVQlJUIGRpc2Fzc2VtYmxlciwgY29tcGlsZXIsIGFuZCBp
bnRlZ3JhdGlvbiBzdXBwb3J0CmFjcGljYTogYWRkIFVCUlQgKFVuaWZpZWRCdXMgUm9vdCBUYWJs
ZSkgZGVmaW5pdGlvbnMKbmFtZXNwYWNlOiBGaXggcG9zc2libGUgdW5kZXJmbG93IGFuZCBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UKY29tcGlsZXI6IEZpeCBwb3NzaWJsZSBOVUxMIHBvaW50ZXIK
Rml4IFBDQyBPcGVyYXRpb25SZWdpb24gY29tbWFuZCBvZmZzZXRzCmNvbXBpbGVyOiBBZGQgX0l4
eCBHUEUgb2JqZWN0CmlBU0w6IERUUFI6IEZpeCBkZWFkIGNvZGUgaW4gRFRQUiBidWZmZXIgTlVM
TCBjaGVjawpOYW1lc3BhY2U6IEluaXRpYWxpemUgUGFyc2VyU3RhdGUuQW1sRW5kIGluIEFjcGlJ
bnN0YWxsTWV0aG9kCkFkZCBhIENPTlRSSUJVVElORyBmaWxlCkNoYW5nZSBsaWNlbnNlIHRleHQg
aW4gQUNQSUNBIHNvdXJjZSBmaWxlcwpBZGp1c3QgdGhlIEFDUElDQSBsaWNlbnNlClVwZGF0ZSBB
Q1BJQ0EgcmVwb3NpdG9yeSBVUkwgaW4gYWxsIGZpbGVzCkNoYW5nZSBBQ1BJQ0EgcHJvamVjdCBs
aWNlbnNlClJldmVydCAiTWVyZ2UgZG9jdW1lbnRhdGlvbiBndWlkZXMiCmV4ZWN1dGVyOiBGaXgg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIEFjcGlFeFN0b3JlT2JqZWN0VG9JbmRleCgpCk1l
cmdlIGRvY3VtZW50YXRpb24gZ3VpZGVzCkVGSTogYWRkIHN1cHBvcnQgZm9yIFJJU0NWNjQKRUZJ
OiBzdXBwb3J0IEhXIFJlZHVjZWQgQUNQSSB3L28gRkFDUwpnZW5lcmF0ZS9lZmk6IGNvbW1vbml6
ZSBHQ0MgZmxhZ3MKVXBkYXRlIGJ1aWxkLnR4dCB3aXRoIG5ldyBsaW5rIHRvIHRoZSBBZG9iZSBw
bGF0Zm9ybSB0byBmaWxlIElEWiB3ZWJzaXRlIHRpY2tldHMKZ2l0aWdub3JlOiBVcGRhdGUgZ2l0
aWdub3JlIHdpdGggZ2VuZXJhdGUvZWZpIGJ1aWxkIGZpbGVzCmdlbmVyYXRlL2VmaTogQWRkIG1p
c3Npbmcgc3RlcHMgdG8gdGhlIHJlYWRtZSBidWlsZCBwcm9jZXNzCmdlbmVyYXRlL2VmaTogRml4
IEVGSSBidWlsZGluZyBhbmQgcGFnZSBmYXVsdApnZW5lcmF0ZS9lZmk6IGFkYXB0IHRvIEVESzIg
MjAyNjA1CmdlbmVyYXRlL2VmaTogYWRkIG1pc3NpbmcgdXRja3N1bS5jIHNvdXJjZSBmaWxlCnBh
cnNlcjogU2V0IEFNTCBsZW5ndGggZm9yIGJ5dGVsaXN0CmlBU0w6IEZpeCBQcmludGYvRnByaW50
ZiBicm9rZW4gYnkgQXNsS2V5d29yZE1hcHBpbmcgYm91bmRzIGNoZWNrCmFjdGJsMjogQWRkIGJp
dCBjb25zdGFudHMgb2YgdGhlIEZsYWdzIGZpZWxkIGluIHRoZSBJT1ZUIElPTU1VIHN0cnVjdHVy
ZQpmaXg6IGJ1aWxkIGVycm9yIHdpdGggZ2NjIDE2OiB1bnVzZWQtYnV0LXNldC12YXJpYWJsZQpN
ZXJnZSBwdWxsIHJlcXVlc3QgIzExODQgZnJvbSB2b2lkMHJlZC9maXgtMTE4MwpNZXJnZSBwdWxs
IHJlcXVlc3QgIzExODIgZnJvbSB2b2lkMHJlZC9maXgtMTE4MQpNZXJnZSBwdWxsIHJlcXVlc3Qg
IzExODAgZnJvbSB2b2lkMHJlZC9maXgtMTE3OQpNZXJnZSBwdWxsIHJlcXVlc3QgIzExNzYgZnJv
bSB2b2lkMHJlZC9maXgtMTE3NQpNZXJnZSBwdWxsIHJlcXVlc3QgIzExNzQgZnJvbSB2b2lkMHJl
ZC9maXgtMTE3MwpNZXJnZSBwdWxsIHJlcXVlc3QgIzExNzIgZnJvbSB2b2lkMHJlZC9maXgtMTE3
MQpNZXJnZSBwdWxsIHJlcXVlc3QgIzExNjYgZnJvbSB2b2lkMHJlZC9maXgtMTE2NQpNZXJnZSBw
dWxsIHJlcXVlc3QgIzExNjMgZnJvbSB2b2lkMHJlZC9maXgtMTE2MgpFdmVudHM6IFRyYWNrIGlu
LWZsaWdodCBub3RpZnkgaGFuZGxlcnMgdG8gcHJldmVudCB1c2UtYWZ0ZXItZnJlZSBvbiB0YWJs
ZQp1bmxvYWQKTWVyZ2UgcHVsbCByZXF1ZXN0ICMxMTYxIGZyb20gdm9pZDByZWQvZml4LTExNjAK
QWNwaUV4ZWM6IENsZWFuIHVwIEdQRSBkaXNwYXRjaCBhbmQgR0VEIGhhbmRsZXJzIG9uIHRhYmxl
IHVubG9hZApFdmVudHM6IENsZWFyIEdQRSBkaXNwYXRjaCBieSBvd25lciBkdXJpbmcgdGFibGUg
dW5sb2FkCmRvY3M6IGFkZCBnZXR0aW5nLXN0YXJ0ZWQgZ3VpZGUKZG9jczogYWRkIHByb2plY3Qg
cGhpbG9zb3BoeSBndWlkZQpkb2NzOiBhZGQgbWluaW1hbCBjb250cmlidXRvciwgdGVzdGluZywg
cmV2aWV3LCBhbmQgYWdlbnQgZ3VpZGVzCk1lcmdlIHB1bGwgcmVxdWVzdCAjMTIwMSBmcm9tIGRh
dmVqaWFuZy9yZHBhcy1maXhlcwpDRURUOiBBZGQgZnVsbCBjb21waWxlciwgZGlzYXNzZW1ibGVy
LCBhbmQgdGVtcGxhdGUgc3VwcG9ydCBmb3IgUkRQQVMgYW5kIGZpeApDWElNUyBoYW5nCk1lcmdl
IHB1bGwgcmVxdWVzdCAjMTIwMCBmcm9tIG1zdHJvemVrL3ZlcmlmeS1jaGVja3N1bQpDRURUOiBS
RFBBUzogRml4IGluY29ycmVjdCBmaWVsZCBwb3NpdGlvbnMgZm9yIFJEUEFTCkNFRFQ6IFJEUEFT
OiBBZGQgbWlzc2luZyByZXNlcnZlZCBmaWVsZCBpbiBSRFBBUyBzdHJ1Y3R1cmUKVXRpbGl0aWVz
OiBGaXggZm9yIEFjcGlVdFZlcmlmeUNoZWNrc3VtIHdhcm5pbmcgZGlzcGxheQpNZXJnZSBwdWxs
IHJlcXVlc3QgIzExNzAgZnJvbSBoc2NoYXVoYW4vcmlzY3Ytc3NlLW5vdGlmeQpNZXJnZSBwdWxs
IHJlcXVlc3QgIzExODkgZnJvbSBDb2xpbklhbktpbmcvZml4LXR5cG9zCmNvbXBvbmVudHM6IEZp
eCB0eXBvOiAibnVtZXIiIC0+ICJudW1iZXIiCmNvbXBvbmVudHM6IEZpeCB0eXBvICJTdXByZXNz
IiAtPiAiU3VwcHJlc3MiCkFTTFRTOiBwcm92b2tlOiBGaXggdHlwbyAiZXhlcnNpY2UiIC0+ICJl
eGVyY2lzZSIKQVNMVFM6IGV4YzogRml4IHR5cG8gInJlc3RpY3Rpb25zIiAtPiAicmVzdHJpY3Rp
b25zIgpBU0xUUzogREVDTDogRml4IHR5cG8gInJlcG9yZXRlZCIgLT4gInJlcG9ydGVkIgpBU0xU
UzogYWJidTogRml4IHR5cG8gaW4gY29tbWVudCAiQXBsaWNhYmxlIiAtPiAiQXBwbGljYWJsZSIK
QVNMVFM6IGNyYnVmZmllbGQ6IEZpeCB0eXBvIGluIGNvbW1lbnQgInVuZXJseWluZyIgLT4gInVu
ZGVybHlpbmciCkFTTFRTOiBzc2R0MjogRml4IHR5cG8gImRlY2xlYXJlZCIgLT4gImRlY2xhcmVk
IgpBU0xUUzogd2hpbGU6IEZpeCB0eXBvcyAiY29tcGxpdGVkIiBhbmQgInBvaW4iCkFTTFRTOiBT
UEVDOiBGaXggdHlwb3MgIm9iZWN0cyIgYW5kICJwZXJwb3NlIgpBU0xUUzogbXV0ZXhfcHJvYzog
Rml4IHR5cG8gaW4gY29tbWVudCAiZGVyZWN0IiAtPiAiZGlyZWN0IgpBU0wgdGVzdCBzdWl0ZSAo
QVNMVFMpOiBjb21tb24uYXNsOiBGaXggdHlwbyAiY2FtbWFuZCIgLT4gImNvbW1hbmQiCkFTTFRT
OiBNdXRleCBTUEVDOiBGaXggdHlwb3MgIm9jY3VwcGllZCIgLT4gIm9jY3VwaWVkIgpBU0wgdGVz
dCBzdWl0ZSAoQVNMVFMpOiBGaXggdHlwbyAib3ByYXRvcnMiIC0+ICJvcGVyYXRvcnMiCkdyYW1t
YXIgdGVzdDogRml4IHR5cG9zICJCYXR0ZXkiIC0+ICJCYXR0ZXJ5IgpuYW1lc3BhY2U6IFJlY29n
bml6ZSBhbGlhcyBub2RlIHR5cGVzIGluIGRldGFjaApGaXggb2JqZWN0IHJlZmVyZW5jZSB1cGRh
dGUgdG8gc2tpcCBub24tbG9jYWwgbm90aWZ5IHR5cGVzCnRhYmxlczogRml4IGhlYXAtYnVmZmVy
LW92ZXJmbG93IGluIEFjcGlUYkZpbmRUYWJsZQpleGVjdXRlcjogQWRkIGJvdW5kcyBjaGVja2lu
ZyBmb3IgUENDIGZpZWxkIHdyaXRlIGFjY2VzcwpleGVjdXRlcjogQWRkIGJvdW5kcyBjaGVja2lu
ZyBmb3IgUENDIGZpZWxkIHJlYWQgYWNjZXNzCkltcHJvdmUgZXJyb3IgaGFuZGxpbmcgaW4gdGFi
bGUgbG9hZGluZyBwcm9jZXNzIHRvIGVuc3VyZSBwcm9wZXIgY2xlYW51cCBvbgpmYWlsdXJlClZh
bGlkYXRlIDQtY2hhciBuYW1lIGluIEFjcGlEc0dldEZpZWxkTmFtZXMgYW5kIEFjcGlEc0luaXRG
aWVsZE9iamVjdHMgdG8KcHJldmVudCBPT0IgcmVhZCBpbiBBY3BpTnNMb29rdXAKSW50cm9kdWNl
IGEgbmV3IEhFU1Qgbm90aWZpY2F0aW9uIHR5cGUgZm9yIFJJU0MtViBTU0UgZXZlbnRzLiBUaGUg
R0hFUyBlbnRyeSdzCm5vdGlmaWNhdGlvbiBzdHJ1Y3R1cmUgY29udGFpbnMgdGhlIG5vdGlmaWNh
dGlvbiB0byBiZSB1c2VkIGZvciBhIGdpdmVuIGVycm9yCnNvdXJjZS4gRm9yIGVycm9yIHNvdXJj
ZXMgZGVsaXZlcmluZyBldmVudHMgb3ZlciBTU0UsIGl0IHNob3VsZCBjb250YWluIHRoZSBuZXcK
U1NFIG5vdGlmaWNhdGlvbiB0eXBlLgpNZXJnZSBwdWxsIHJlcXVlc3QgIzExNTIgZnJvbSBhZWds
L2Vpbmp2MmRlZmluZXMKUmVjb3ZlciB0aGUgQVNMVFMgdGVzdCBjb3VudCAocGFzcyArIGZhaWwg
KyBza2lwcGVkL2Jsb2NrZWQpIHRoYXQgaGFkIGRyb3BwZWQKZHVlIHRvIHRoaXMgcHJldmlvdXMg
ZXJyb3IgbWFuZGF0aW5nIGVpdGhlciBfSElEIG9yIF9BRFIgcHJlc2VuY2UgdG8gZ2VuZXJhdGUK
QU1MClByb3ZpZGUgI2RlZmluZXMgZm9yIEVJTkpWMiBlcnJvciB0eXBlcwpNZXJnZSBwdWxsIHJl
cXVlc3QgIzExNDMgZnJvbSB2b2lkMHJlZC9maXgtaXNzdWUxCk1lcmdlIHB1bGwgcmVxdWVzdCAj
MTE1MCBmcm9tIHZvaWQwcmVkL2YKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMg
NTAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0
dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi57YWNwaWNhXzIwMjYwNDA4LmJiID0+
IGFjcGljYV8yMDI2MDkzMC5iYn0gfCAzMDIgKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMzAwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2FjcGljYS97YWNwaWNhXzIwMjYwNDA4LmJiID0+IGFjcGljYV8yMDI2MDkz
MC5iYn0gKDEwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2Fj
cGljYV8yMDI2MDQwOC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIw
MjYwOTMwLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjYwNDA4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvYWNwaWNhL2FjcGljYV8yMDI2MDkzMC5iYgppbmRleCAxZTYzMjY3MjBmLi43ZWFj
NGM3NDQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2FjcGljYV8y
MDI2MDQwOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2FjcGljYV8yMDI2
MDkzMC5iYgpAQCAtMSwzICsxLDMwMSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0g
dmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9s
bG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNl
bnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBh
bmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xp
Y2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmln
aHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHNvdXJjZS9j
b21waWxlci9hc2xjb21waWxlLmMKKyMgKysrIHNvdXJjZS9jb21waWxlci9hc2xjb21waWxlLmMK
KyMgQEAgLTEsMTQ0ICsxLDE0NCBAQAorIyAgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorIyAgICoK
KyMgLSAqIDEuIENvcHlyaWdodCBOb3RpY2UKKyMgLSAqCisjIC0gKiBTb21lIG9yIGFsbCBvZiB0
aGlzIHdvcmsgLSBDb3B5cmlnaHQgKGMpIDE5OTkgLSAyMDI2LCBJbnRlbCBDb3JwLgorIyAtICog
QWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgLSAqCisjIC0gKiAyLiBMaWNlbnNlCisjIC0gKgorIyAt
ICogMi4xLiBUaGlzIGlzIHlvdXIgbGljZW5zZSBmcm9tIEludGVsIENvcnAuIHVuZGVyIGl0cyBp
bnRlbGxlY3R1YWwgcHJvcGVydHkKKyMgLSAqIHJpZ2h0cy4gWW91IG1heSBoYXZlIGFkZGl0aW9u
YWwgbGljZW5zZSB0ZXJtcyBmcm9tIHRoZSBwYXJ0eSB0aGF0IHByb3ZpZGVkCisjIC0gKiB5b3Ug
dGhpcyBzb2Z0d2FyZSwgY292ZXJpbmcgeW91ciByaWdodCB0byB1c2UgdGhhdCBwYXJ0eSdzIGlu
dGVsbGVjdHVhbAorIyAtICogcHJvcGVydHkgcmlnaHRzLgorIyAtICoKKyMgLSAqIDIuMi4gSW50
ZWwgZ3JhbnRzLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiAoIkxpY2Vuc2VlIikgb2J0
YWluaW5nIGEKKyMgLSAqIGNvcHkgb2YgdGhlIHNvdXJjZSBjb2RlIGFwcGVhcmluZyBpbiB0aGlz
IGZpbGUgKCJDb3ZlcmVkIENvZGUiKSBhbgorIyAtICogaXJyZXZvY2FibGUsIHBlcnBldHVhbCwg
d29ybGR3aWRlIGxpY2Vuc2UgdW5kZXIgSW50ZWwncyBjb3B5cmlnaHRzIGluIHRoZQorIyAtICog
YmFzZSBjb2RlIGRpc3RyaWJ1dGVkIG9yaWdpbmFsbHkgYnkgSW50ZWwgKCJPcmlnaW5hbCBJbnRl
bCBDb2RlIikgdG8gY29weSwKKyMgLSAqIG1ha2UgZGVyaXZhdGl2ZXMsIGRpc3RyaWJ1dGUsIHVz
ZSBhbmQgZGlzcGxheSBhbnkgcG9ydGlvbiBvZiB0aGUgQ292ZXJlZAorIyAtICogQ29kZSBpbiBh
bnkgZm9ybSwgd2l0aCB0aGUgcmlnaHQgdG8gc3VibGljZW5zZSBzdWNoIHJpZ2h0czsgYW5kCisj
IC0gKgorIyAtICogMi4zLiBJbnRlbCBncmFudHMgTGljZW5zZWUgYSBub24tZXhjbHVzaXZlIGFu
ZCBub24tdHJhbnNmZXJhYmxlIHBhdGVudAorIyAtICogbGljZW5zZSAod2l0aCB0aGUgcmlnaHQg
dG8gc3VibGljZW5zZSksIHVuZGVyIG9ubHkgdGhvc2UgY2xhaW1zIG9mIEludGVsCisjIC0gKiBw
YXRlbnRzIHRoYXQgYXJlIGluZnJpbmdlZCBieSB0aGUgT3JpZ2luYWwgSW50ZWwgQ29kZSwgdG8g
bWFrZSwgdXNlLCBzZWxsLAorIyAtICogb2ZmZXIgdG8gc2VsbCwgYW5kIGltcG9ydCB0aGUgQ292
ZXJlZCBDb2RlIGFuZCBkZXJpdmF0aXZlIHdvcmtzIHRoZXJlb2YKKyMgLSAqIHNvbGVseSB0byB0
aGUgbWluaW11bSBleHRlbnQgbmVjZXNzYXJ5IHRvIGV4ZXJjaXNlIHRoZSBhYm92ZSBjb3B5cmln
aHQKKyMgLSAqIGxpY2Vuc2UsIGFuZCBpbiBubyBldmVudCBzaGFsbCB0aGUgcGF0ZW50IGxpY2Vu
c2UgZXh0ZW5kIHRvIGFueSBhZGRpdGlvbnMKKyMgLSAqIHRvIG9yIG1vZGlmaWNhdGlvbnMgb2Yg
dGhlIE9yaWdpbmFsIEludGVsIENvZGUuIE5vIG90aGVyIGxpY2Vuc2Ugb3IgcmlnaHQKKyMgLSAq
IGlzIGdyYW50ZWQgZGlyZWN0bHkgb3IgYnkgaW1wbGljYXRpb24sIGVzdG9wcGVsIG9yIG90aGVy
d2lzZTsKKyMgLSAqCisjIC0gKiBUaGUgYWJvdmUgY29weXJpZ2h0IGFuZCBwYXRlbnQgbGljZW5z
ZSBpcyBncmFudGVkIG9ubHkgaWYgdGhlIGZvbGxvd2luZworIyAtICogY29uZGl0aW9ucyBhcmUg
bWV0OgorIyAtICoKKyMgLSAqIDMuIENvbmRpdGlvbnMKKyMgLSAqCisjIC0gKiAzLjEuIFJlZGlz
dHJpYnV0aW9uIG9mIFNvdXJjZSB3aXRoIFJpZ2h0cyB0byBGdXJ0aGVyIERpc3RyaWJ1dGUgU291
cmNlLgorIyAtICogUmVkaXN0cmlidXRpb24gb2Ygc291cmNlIGNvZGUgb2YgYW55IHN1YnN0YW50
aWFsIHBvcnRpb24gb2YgdGhlIENvdmVyZWQKKyMgLSAqIENvZGUgb3IgbW9kaWZpY2F0aW9uIHdp
dGggcmlnaHRzIHRvIGZ1cnRoZXIgZGlzdHJpYnV0ZSBzb3VyY2UgbXVzdCBpbmNsdWRlCisjIC0g
KiB0aGUgYWJvdmUgQ29weXJpZ2h0IE5vdGljZSwgdGhlIGFib3ZlIExpY2Vuc2UsIHRoaXMgbGlz
dCBvZiBDb25kaXRpb25zLAorIyAtICogYW5kIHRoZSBmb2xsb3dpbmcgRGlzY2xhaW1lciBhbmQg
RXhwb3J0IENvbXBsaWFuY2UgcHJvdmlzaW9uLiBJbiBhZGRpdGlvbiwKKyMgLSAqIExpY2Vuc2Vl
IG11c3QgY2F1c2UgYWxsIENvdmVyZWQgQ29kZSB0byB3aGljaCBMaWNlbnNlZSBjb250cmlidXRl
cyB0bworIyAtICogY29udGFpbiBhIGZpbGUgZG9jdW1lbnRpbmcgdGhlIGNoYW5nZXMgTGljZW5z
ZWUgbWFkZSB0byBjcmVhdGUgdGhhdCBDb3ZlcmVkCisjIC0gKiBDb2RlIGFuZCB0aGUgZGF0ZSBv
ZiBhbnkgY2hhbmdlLiBMaWNlbnNlZSBtdXN0IGluY2x1ZGUgaW4gdGhhdCBmaWxlIHRoZQorIyAt
ICogZG9jdW1lbnRhdGlvbiBvZiBhbnkgY2hhbmdlcyBtYWRlIGJ5IGFueSBwcmVkZWNlc3NvciBM
aWNlbnNlZS4gTGljZW5zZWUKKyMgLSAqIG11c3QgaW5jbHVkZSBhIHByb21pbmVudCBzdGF0ZW1l
bnQgdGhhdCB0aGUgbW9kaWZpY2F0aW9uIGlzIGRlcml2ZWQsCisjIC0gKiBkaXJlY3RseSBvciBp
bmRpcmVjdGx5LCBmcm9tIE9yaWdpbmFsIEludGVsIENvZGUuCisjIC0gKgorIyAtICogMy4yLiBS
ZWRpc3RyaWJ1dGlvbiBvZiBTb3VyY2Ugd2l0aCBubyBSaWdodHMgdG8gRnVydGhlciBEaXN0cmli
dXRlIFNvdXJjZS4KKyMgLSAqIFJlZGlzdHJpYnV0aW9uIG9mIHNvdXJjZSBjb2RlIG9mIGFueSBz
dWJzdGFudGlhbCBwb3J0aW9uIG9mIHRoZSBDb3ZlcmVkCisjIC0gKiBDb2RlIG9yIG1vZGlmaWNh
dGlvbiB3aXRob3V0IHJpZ2h0cyB0byBmdXJ0aGVyIGRpc3RyaWJ1dGUgc291cmNlIG11c3QKKyMg
LSAqIGluY2x1ZGUgdGhlIGZvbGxvd2luZyBEaXNjbGFpbWVyIGFuZCBFeHBvcnQgQ29tcGxpYW5j
ZSBwcm92aXNpb24gaW4gdGhlCisjIC0gKiBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRl
cmlhbHMgcHJvdmlkZWQgd2l0aCBkaXN0cmlidXRpb24uIEluCisjIC0gKiBhZGRpdGlvbiwgTGlj
ZW5zZWUgbWF5IG5vdCBhdXRob3JpemUgZnVydGhlciBzdWJsaWNlbnNlIG9mIHNvdXJjZSBvZiBh
bnkKKyMgLSAqIHBvcnRpb24gb2YgdGhlIENvdmVyZWQgQ29kZSwgYW5kIG11c3QgaW5jbHVkZSB0
ZXJtcyB0byB0aGUgZWZmZWN0IHRoYXQgdGhlCisjIC0gKiBsaWNlbnNlIGZyb20gTGljZW5zZWUg
dG8gaXRzIGxpY2Vuc2VlIGlzIGxpbWl0ZWQgdG8gdGhlIGludGVsbGVjdHVhbAorIyAtICogcHJv
cGVydHkgZW1ib2RpZWQgaW4gdGhlIHNvZnR3YXJlIExpY2Vuc2VlIHByb3ZpZGVzIHRvIGl0cyBs
aWNlbnNlZSwgYW5kCisjIC0gKiBub3QgdG8gaW50ZWxsZWN0dWFsIHByb3BlcnR5IGVtYm9kaWVk
IGluIG1vZGlmaWNhdGlvbnMgaXRzIGxpY2Vuc2VlIG1heQorIyAtICogbWFrZS4KKyMgLSAqCisj
IC0gKiAzLjMuIFJlZGlzdHJpYnV0aW9uIG9mIEV4ZWN1dGFibGUuIFJlZGlzdHJpYnV0aW9uIGlu
IGV4ZWN1dGFibGUgZm9ybSBvZiBhbnkKKyMgLSAqIHN1YnN0YW50aWFsIHBvcnRpb24gb2YgdGhl
IENvdmVyZWQgQ29kZSBvciBtb2RpZmljYXRpb24gbXVzdCByZXByb2R1Y2UgdGhlCisjIC0gKiBh
Ym92ZSBDb3B5cmlnaHQgTm90aWNlLCBhbmQgdGhlIGZvbGxvd2luZyBEaXNjbGFpbWVyIGFuZCBF
eHBvcnQgQ29tcGxpYW5jZQorIyAtICogcHJvdmlzaW9uIGluIHRoZSBkb2N1bWVudGF0aW9uIGFu
ZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUKKyMgLSAqIGRpc3RyaWJ1dGlv
bi4KKyMgLSAqCisjIC0gKiAzLjQuIEludGVsIHJldGFpbnMgYWxsIHJpZ2h0LCB0aXRsZSwgYW5k
IGludGVyZXN0IGluIGFuZCB0byB0aGUgT3JpZ2luYWwKKyMgLSAqIEludGVsIENvZGUuCisjIC0g
KgorIyAtICogMy41LiBOZWl0aGVyIHRoZSBuYW1lIEludGVsIG5vciBhbnkgb3RoZXIgdHJhZGVt
YXJrIG93bmVkIG9yIGNvbnRyb2xsZWQgYnkKKyMgLSAqIEludGVsIHNoYWxsIGJlIHVzZWQgaW4g
YWR2ZXJ0aXNpbmcgb3Igb3RoZXJ3aXNlIHRvIHByb21vdGUgdGhlIHNhbGUsIHVzZSBvcgorIyAt
ICogb3RoZXIgZGVhbGluZ3MgaW4gcHJvZHVjdHMgZGVyaXZlZCBmcm9tIG9yIHJlbGF0aW5nIHRv
IHRoZSBDb3ZlcmVkIENvZGUKKyMgLSAqIHdpdGhvdXQgcHJpb3Igd3JpdHRlbiBhdXRob3JpemF0
aW9uIGZyb20gSW50ZWwuCisjIC0gKgorIyAtICogNC4gRGlzY2xhaW1lciBhbmQgRXhwb3J0IENv
bXBsaWFuY2UKKyMgLSAqCisjIC0gKiA0LjEuIElOVEVMIE1BS0VTIE5PIFdBUlJBTlRZIE9GIEFO
WSBLSU5EIFJFR0FSRElORyBBTlkgU09GVFdBUkUgUFJPVklERUQKKyMgLSAqIEhFUkUuIEFOWSBT
T0ZUV0FSRSBPUklHSU5BVElORyBGUk9NIElOVEVMIE9SIERFUklWRUQgRlJPTSBJTlRFTCBTT0ZU
V0FSRQorIyAtICogSVMgUFJPVklERUQgIkFTIElTLCIgQU5EIElOVEVMIFdJTEwgTk9UIFBST1ZJ
REUgQU5ZIFNVUFBPUlQsIEFTU0lTVEFOQ0UsCisjIC0gKiBJTlNUQUxMQVRJT04sIFRSQUlOSU5H
IE9SIE9USEVSIFNFUlZJQ0VTLiBJTlRFTCBXSUxMIE5PVCBQUk9WSURFIEFOWQorIyAtICogVVBE
QVRFUywgRU5IQU5DRU1FTlRTIE9SIEVYVEVOU0lPTlMuIElOVEVMIFNQRUNJRklDQUxMWSBESVND
TEFJTVMgQU5ZCisjIC0gKiBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLCBO
T05JTkZSSU5HRU1FTlQgQU5EIEZJVE5FU1MgRk9SIEEKKyMgLSAqIFBBUlRJQ1VMQVIgUFVSUE9T
RS4KKyMgLSAqCisjIC0gKiA0LjIuIElOIE5PIEVWRU5UIFNIQUxMIElOVEVMIEhBVkUgQU5ZIExJ
QUJJTElUWSBUTyBMSUNFTlNFRSwgSVRTIExJQ0VOU0VFUworIyAtICogT1IgQU5ZIE9USEVSIFRI
SVJEIFBBUlRZLCBGT1IgQU5ZIExPU1QgUFJPRklUUywgTE9TVCBEQVRBLCBMT1NTIE9GIFVTRSBP
UgorIyAtICogQ09TVFMgT0YgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUiBTRVJW
SUNFUywgT1IgRk9SIEFOWSBJTkRJUkVDVCwKKyMgLSAqIFNQRUNJQUwgT1IgQ09OU0VRVUVOVElB
TCBEQU1BR0VTIEFSSVNJTkcgT1VUIE9GIFRISVMgQUdSRUVNRU5ULCBVTkRFUiBBTlkKKyMgLSAq
IENBVVNFIE9GIEFDVElPTiBPUiBUSEVPUlkgT0YgTElBQklMSVRZLCBBTkQgSVJSRVNQRUNUSVZF
IE9GIFdIRVRIRVIgSU5URUwKKyMgLSAqIEhBUyBBRFZBTkNFIE5PVElDRSBPRiBUSEUgUE9TU0lC
SUxJVFkgT0YgU1VDSCBEQU1BR0VTLiBUSEVTRSBMSU1JVEFUSU9OUworIyAtICogU0hBTEwgQVBQ
TFkgTk9UV0lUSFNUQU5ESU5HIFRIRSBGQUlMVVJFIE9GIFRIRSBFU1NFTlRJQUwgUFVSUE9TRSBP
RiBBTlkKKyMgLSAqIExJTUlURUQgUkVNRURZLgorIyAtICoKKyMgLSAqIDQuMy4gTGljZW5zZWUg
c2hhbGwgbm90IGV4cG9ydCwgZWl0aGVyIGRpcmVjdGx5IG9yIGluZGlyZWN0bHksIGFueSBvZiB0
aGlzCisjIC0gKiBzb2Z0d2FyZSBvciBzeXN0ZW0gaW5jb3Jwb3JhdGluZyBzdWNoIHNvZnR3YXJl
IHdpdGhvdXQgZmlyc3Qgb2J0YWluaW5nIGFueQorIyAtICogcmVxdWlyZWQgbGljZW5zZSBvciBv
dGhlciBhcHByb3ZhbCBmcm9tIHRoZSBVLiBTLiBEZXBhcnRtZW50IG9mIENvbW1lcmNlIG9yCisj
IC0gKiBhbnkgb3RoZXIgYWdlbmN5IG9yIGRlcGFydG1lbnQgb2YgdGhlIFVuaXRlZCBTdGF0ZXMg
R292ZXJubWVudC4gSW4gdGhlCisjIC0gKiBldmVudCBMaWNlbnNlZSBleHBvcnRzIGFueSBzdWNo
IHNvZnR3YXJlIGZyb20gdGhlIFVuaXRlZCBTdGF0ZXMgb3IKKyMgLSAqIHJlLWV4cG9ydHMgYW55
IHN1Y2ggc29mdHdhcmUgZnJvbSBhIGZvcmVpZ24gZGVzdGluYXRpb24sIExpY2Vuc2VlIHNoYWxs
CisjIC0gKiBlbnN1cmUgdGhhdCB0aGUgZGlzdHJpYnV0aW9uIGFuZCBleHBvcnQvcmUtZXhwb3J0
IG9mIHRoZSBzb2Z0d2FyZSBpcyBpbgorIyAtICogY29tcGxpYW5jZSB3aXRoIGFsbCBsYXdzLCBy
ZWd1bGF0aW9ucywgb3JkZXJzLCBvciBvdGhlciByZXN0cmljdGlvbnMgb2YgdGhlCisjIC0gKiBV
LlMuIEV4cG9ydCBBZG1pbmlzdHJhdGlvbiBSZWd1bGF0aW9ucy4gTGljZW5zZWUgYWdyZWVzIHRo
YXQgbmVpdGhlciBpdCBub3IKKyMgLSAqIGFueSBvZiBpdHMgc3Vic2lkaWFyaWVzIHdpbGwgZXhw
b3J0L3JlLWV4cG9ydCBhbnkgdGVjaG5pY2FsIGRhdGEsIHByb2Nlc3MsCisjIC0gKiBzb2Z0d2Fy
ZSwgb3Igc2VydmljZSwgZGlyZWN0bHkgb3IgaW5kaXJlY3RseSwgdG8gYW55IGNvdW50cnkgZm9y
IHdoaWNoIHRoZQorIyAtICogVW5pdGVkIFN0YXRlcyBnb3Zlcm5tZW50IG9yIGFueSBhZ2VuY3kg
dGhlcmVvZiByZXF1aXJlcyBhbiBleHBvcnQgbGljZW5zZSwKKyMgLSAqIG90aGVyIGdvdmVybm1l
bnRhbCBhcHByb3ZhbCwgb3IgbGV0dGVyIG9mIGFzc3VyYW5jZSwgd2l0aG91dCBmaXJzdCBvYnRh
aW5pbmcKKyMgLSAqIHN1Y2ggbGljZW5zZSwgYXBwcm92YWwgb3IgbGV0dGVyLgorIyAtICoKKyMg
LSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgorIyAtICoKKyMgLSAqIEFsdGVybmF0aXZlbHksIHlvdSBt
YXkgY2hvb3NlIHRvIGJlIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUKKyMgLSAqIGZv
bGxvd2luZyBsaWNlbnNlOgorIyAtICoKKyMgLSAqIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4g
c291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAtICogbW9kaWZpY2F0
aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
CisjIC0gKiBhcmUgbWV0OgorIyAtICogMS4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2Rl
IG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKKyMgLSAqICAgIG5vdGljZSwgdGhpcyBs
aXN0IG9mIGNvbmRpdGlvbnMsIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIsCisjIC0gKiAg
ICB3aXRob3V0IG1vZGlmaWNhdGlvbi4KKyMgLSAqIDIuIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5h
cnkgZm9ybSBtdXN0IHJlcHJvZHVjZSBhdCBtaW5pbXVtIGEgZGlzY2xhaW1lcgorIyAtICogICAg
c3Vic3RhbnRpYWxseSBzaW1pbGFyIHRvIHRoZSAiTk8gV0FSUkFOVFkiIGRpc2NsYWltZXIgYmVs
b3cKKyMgLSAqICAgICgiRGlzY2xhaW1lciIpIGFuZCBhbnkgcmVkaXN0cmlidXRpb24gbXVzdCBi
ZSBjb25kaXRpb25lZCB1cG9uCisjIC0gKiAgICBpbmNsdWRpbmcgYSBzdWJzdGFudGlhbGx5IHNp
bWlsYXIgRGlzY2xhaW1lciByZXF1aXJlbWVudCBmb3IgZnVydGhlcgorIyAtICogICAgYmluYXJ5
IHJlZGlzdHJpYnV0aW9uLgorIyAtICogMy4gTmVpdGhlciB0aGUgbmFtZXMgb2YgdGhlIGFib3Zl
LWxpc3RlZCBjb3B5cmlnaHQgaG9sZGVycyBub3IgdGhlIG5hbWVzCisjIC0gKiAgICBvZiBhbnkg
Y29udHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cyBk
ZXJpdmVkCisjIC0gKiAgICBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlv
ciB3cml0dGVuIHBlcm1pc3Npb24uCisjIC0gKgorIyAtICogVEhJUyBTT0ZUV0FSRSBJUyBQUk9W
SURFRCBCWSBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENPTlRSSUJVVE9SUworIyAtICogIkFT
IElTIiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJV
VCBOT1QKKyMgLSAqIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hB
TlRBQklMSVRZIEFORCBGSVRORVNTIEZPUgorIyAtICogQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJF
IERJU0NMQUlNRUQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBDT1BZUklHSFQKKyMgLSAqIE9XTkVS
IE9SIENPTlRSSUJVVE9SUyBCRSBMSUFCTEUgRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJ
REVOVEFMLAorIyAtICogU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFH
RVMgKElOQ0xVRElORywgQlVUIE5PVAorIyAtICogTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0Yg
U1VCU1RJVFVURSBHT09EUyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0UsCisjIC0gKiBEQVRBLCBP
UiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRFUlJVUFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFORCBP
TiBBTlkKKyMgLSAqIFRIRU9SWSBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNU
UklDVCBMSUFCSUxJVFksIE9SIFRPUlQKKyMgLSAqIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBP
VEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRQorIyAtICogT0YgVEhJ
UyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRiBTVUNIIERB
TUFHRS4KKyMgLSAqCisjIC0gKiBBbHRlcm5hdGl2ZWx5LCB5b3UgbWF5IGNob29zZSB0byBiZSBs
aWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlCisjIC0gKiBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSAoIkdQTCIpIHZlcnNpb24gMiBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUKKyMgLSAq
IFNvZnR3YXJlIEZvdW5kYXRpb24uCisjICsgKiBDb3B5cmlnaHQgKGMpIDE5OTkgLSAyMDI2LCBJ
bnRlbCBDb3JwLgorIyArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0zLUNsYXVzZSBP
UiBHUEwtMi4wLW9ubHkKKyMgICAqCisjICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCisjICsKKyMg
KyNpbmNsdWRlICJhc2xjb21waWxlci5oIgorIyArI2luY2x1ZGUgImFjbmFtZXNwLmgiCisjICsK
KyMgKyNpbmNsdWRlIDxzdGRpby5oPgorIyArI2luY2x1ZGUgPHRpbWUuaD4KKyMgKyNpbmNsdWRl
IDxhY2FwcHMuaD4KKyMgKworIyArI2RlZmluZSBfQ09NUE9ORU5UICAgICAgICAgIEFDUElfQ09N
UElMRVIKKyMgKyAgICAgICAgQUNQSV9NT0RVTEVfTkFNRSAgICAoImFzbGNvbXBpbGUiKQorIyAr
CisjICsvKgorIyArICogTWFpbiBwYXJzZXIgZW50cnkKKyMgKyAqIEV4dGVybmFsIGlzIGhlcmUg
aW4gY2FzZSB0aGUgcGFyc2VyIGVtaXRzIHRoZSBzYW1lIGV4dGVybmFsIGluIHRoZQorIyArICog
Z2VuZXJhdGVkIGhlYWRlci4gKE5ld2VyIHZlcnNpb25zIG9mIEJpc29uKQorIyArICovCisjICtp
bnQKKyMgK0FzbENvbXBpbGVycGFyc2UoCisjICsgICAgdm9pZCk7CisjICsKKyMgKy8qIExvY2Fs
IHByb3RvdHlwZXMgKi8KKyMgKworIyArc3RhdGljIHZvaWQKKyMgK0NtRmx1c2hTb3VyY2VDb2Rl
ICgKKyMgKyAgICB2b2lkKTsKKyMgKworIyArc3RhdGljIHZvaWQKKyMgK0NtRHVtcEFsbEV2ZW50
cyAoCisjICsgICAgdm9pZCk7CisjICsKKyMgK3N0YXRpYyB2b2lkCisjICtDbUZpbmlzaEZpbGVz
KAorIyArICAgIEJPT0xFQU4gICAgICAgICAgICAgICAgIERlbGV0ZUFtbEZpbGUpOworIyArCisj
ICsKKyMgKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCisjICsgKgorIyArICogRlVOQ1RJT046ICAg
IENtRG9Db21waWxlCisjICsgKgorIyArICogUEFSQU1FVEVSUzogIE5vbmUKKyMgKyAqCisjICsg
KiBSRVRVUk46ICAgICAgU3RhdHVzICgwID0gT0spCisjICsgKgorIyArICogREVTQ1JJUFRJT046
IFRoaXMgcHJvY2VkdXJlIHBlcmZvcm1zIHRoZSBlbnRpcmUgY29tcGlsZQorIyArICoKKyMgKyAq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKiovCisjICsKKyMgK0FDUElfU1RBVFVTCisjICtDbURvQ29tcGls
ZSAoCisjICsgICAgdm9pZCkKKyMgK3sKKyMgKyAgICBVSU5UOCAgICAgICAgICAgICAgICAgICBG
dWxsQ29tcGlsZTsKKyMgKyAgICBVSU5UOCAgICAgICAgICAgICAgICAgICBFdmVudDsKKyMgKyAg
ICBBU0xfR0xPQkFMX0ZJTEVfTk9ERSAgICAqRmlsZU5vZGU7CisjICsKKyMgKworIyArICAgIEZ1
bGxDb21waWxlID0gVXRCZWdpbkV2ZW50ICgiKioqIFRvdGFsIENvbXBpbGUgdGltZSAqKioiKTsK
KyMgKyAgICBFdmVudCA9IFV0QmVnaW5FdmVudCAoIk9wZW4gaW5wdXQgYW5kIG91dHB1dCBmaWxl
cyIpOworIyArICAgIFV0RW5kRXZlbnQgKEV2ZW50KTsKKyMgKworIyArICAgIEV2ZW50ID0gVXRC
ZWdpbkV2ZW50ICgiUHJlcHJvY2VzcyBpbnB1dCBmaWxlIik7CisjICsgICAgaWYgKEFzbEdibF9Q
cmVwcm9jZXNzRmxhZykKKyMgKyAgICB7CisjICsgICAgICAgIC8qIEVudGVyIGNvbXBpbGVyIG5h
bWUgYXMgYSAjZGVmaW5lICovCisjICsKKyMgKyAgICAgICAgUHJBZGREZWZpbmUgKEFTTF9ERUZJ
TkUsICIiLCBGQUxTRSk7CisjICsKKyMgKyAgICAgICAgLyogUHJlcHJvY2Vzc29yICovCisjICsK
KyMgKyAgICAgICAgUHJEb1ByZXByb2Nlc3MgKCk7CisjICsgICAgICAgIEFzbEdibF9DdXJyZW50
TGluZU51bWJlciA9IDE7CisjICsgICAgICAgIEFzbEdibF9Mb2dpY2FsTGluZU51bWJlciA9IDE7
CisjICsgICAgICAgIEFzbEdibF9DdXJyZW50TGluZU9mZnNldCA9IDA7CisjICsKKyMgKyAgICAg
ICAgaWYgKEFzbEdibF9QcmVwcm9jZXNzT25seSkKKyMgKyAgICAgICAgeworIyArICAgICAgICAg
ICAgVXRFbmRFdmVudCAoRXZlbnQpOworIyArICAgICAgICAgICAgcmV0dXJuIChBRV9PSyk7Cisj
ICsgICAgICAgIH0KKyMgKyAgICB9CisjICsgICAgVXRFbmRFdmVudCAoRXZlbnQpOworIyArCisj
ICsKKyMgKyAgICAvKiBCdWlsZCB0aGUgcGFyc2UgdHJlZSAqLworIyArCisjICsgICAgRXZlbnQg
PSBVdEJlZ2luRXZlbnQgKCJQYXJzZSBzb3VyY2UgY29kZSBhbmQgYnVpbGQgcGFyc2UgdHJlZSIp
OworIyArICAgIEFzbENvbXBpbGVycGFyc2UoKTsKKyMgKyAgICBVdEVuZEV2ZW50IChFdmVudCk7
CisjICsKKyMgKyAgICAvKiBDaGVjayBmb3IgcGFyc2VyLWRldGVjdGVkIHN5bnRheCBlcnJvcnMg
Ki8KKyMgKworIyArICAgIGlmIChBc2xHYmxfU3ludGF4RXJyb3IpCisjICsgICAgeworIyArICAg
ICAgICBBc2xFcnJvciAoQVNMX0VSUk9SLCBBU0xfTVNHX1NZTlRBWCwgTlVMTCwKKyMgKyAgICAg
ICAgICAgICJDb21waWxlciBhYm9ydGluZyBkdWUgdG8gcGFyc2VyLWRldGVjdGVkIHN5bnRheCBl
cnJvcihzKVxuIik7CisjICsKKyMgKyAgICAgICAgLyogRmxhZyB0aGlzIGVycm9yIGluIHRoZSBG
aWxlTm9kZSBmb3IgY29tcGlsYXRpb24gc3VtbWFyeSAqLworIyArCisjICsgICAgICAgIEZpbGVO
b2RlID0gRmxHZXRDdXJyZW50RmlsZU5vZGUgKCk7CisjICsgICAgICAgIEZpbGVOb2RlLT5QYXJz
ZXJFcnJvckRldGVjdGVkID0gVFJVRTsKKyMgKyAgICAgICAgQXNsR2JsX1BhcnNlckVycm9yRGV0
ZWN0ZWQgPSBUUlVFOworIyArICAgICAgICBMc0R1bXBQYXJzZVRyZWUgKCk7CisjICsgICAgICAg
IEFlUHJpbnRFcnJvckxvZyhBU0xfRklMRV9TVERFUlIpOworIyArCisjICsgICAgICAgIGdvdG8g
RXJyb3JFeGl0OworIyArICAgIH0KKyMgKworIyArICAgIC8qIERpZCB0aGUgcGFyc2UgdHJlZSBn
ZXQgc3VjY2Vzc2Z1bGx5IGNvbnN0cnVjdGVkPyAqLworIyArCisjICsgICAgaWYgKCFBc2xHYmxf
UGFyc2VUcmVlUm9vdCkKKyMgKyAgICB7CisjICsgICAgICAgIC8qCisjICsgICAgICAgICAqIElm
IHRoZXJlIGFyZSBubyBlcnJvcnMsIHRoZW4gd2UgaGF2ZSBzb21lIHNvcnQgb2YKKyMgKyAgICAg
ICAgICogaW50ZXJuYWwgcHJvYmxlbS4KKyMgKyAgICAgICAgICovCisjICsgICAgICAgIEFzbEVy
cm9yIChBU0xfRVJST1IsIEFTTF9NU0dfQ09NUElMRVJfSU5URVJOQUwsCisjICsgICAgICAgICAg
ICBOVUxMLCAiLSBDb3VsZCBub3QgcmVzb2x2ZSBwYXJzZSB0cmVlIHJvb3Qgbm9kZSIpOworIyAr
CisjICsgICAgICAgIGdvdG8gRXJyb3JFeGl0OworIyArICAgIH0KKyMgKworIyArICAgIEFlUHJp
bnRFcnJvckxvZyhBU0xfRklMRV9TVERFUlIpOworIyArCisjICsgICAgLyogRmx1c2ggb3V0IGFu
eSByZW1haW5pbmcgc291cmNlIGFmdGVyIHBhcnNlIHRyZWUgaXMgY29tcGxldGUgKi8KKyMgKwor
IyArICAgIEV2ZW50ID0gVXRCZWdpbkV2ZW50ICgiRmx1c2ggc291cmNlIGlucHV0Iik7CisjICsg
ICAgQ21GbHVzaFNvdXJjZUNvZGUgKCk7CisjICsKKyMgKyAgICAvKiBQcnVuZSB0aGUgcGFyc2Ug
dHJlZSBpZiByZXF1ZXN0ZWQgKGRlYnVnIHB1cnBvc2VzIG9ubHkpICovCisjICsKKyMgKyAgICBp
ZiAoQXNsR2JsX1BydW5lUGFyc2VUcmVlKQorIyArICAgIHsKKyMgKyAgICAgICAgQXNsUHJ1bmVQ
YXJzZVRyZWUgKEFzbEdibF9QcnVuZURlcHRoLCBBc2xHYmxfUHJ1bmVUeXBlKTsKKyMgKyAgICB9
CisjICsKKyMgKyAgICAvKiBPcHRpb25hbCBwYXJzZSB0cmVlIGR1bXAsIGNvbXBpbGVyIGRlYnVn
IG91dHB1dCBvbmx5ICovCisjICsKKyMgKyAgICBMc0R1bXBQYXJzZVRyZWUgKCk7CisjIAorIwor
CiBTVU1NQVJZID0gIkFDUElDQSB0b29scyBmb3IgdGhlIGRldmVsb3BtZW50IGFuZCBkZWJ1ZyBv
ZiBBQ1BJIHRhYmxlcyIKIERFU0NSSVBUSU9OID0gIlRoZSBBQ1BJIENvbXBvbmVudCBBcmNoaXRl
Y3R1cmUgKEFDUElDQSkgcHJvamVjdCBwcm92aWRlcyBhbiBcCiBPUy1pbmRlcGVuZGVudCByZWZl
cmVuY2UgaW1wbGVtZW50YXRpb24gb2YgdGhlIEFkdmFuY2VkIENvbmZpZ3VyYXRpb24gYW5kIFwK
QEAgLTEwLDE0ICszMDgsMTQgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuaW50ZWwuY29tL2Nv
bnRlbnQvd3d3L3VzL2VuL2RldmVsb3Blci90b3BpYy10ZWNobm9sb2d5L28KIFNFQ1RJT04gPSAi
Y29uc29sZS90b29scyIKIAogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgT1IgR1BMLTIuMC1vbmx5
IE9SIEludGVsIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vc291cmNlL2NvbXBpbGVyL2Fz
bGNvbXBpbGUuYztiZWdpbmxpbmU9NztlbmRsaW5lPTE1MDttZDU9NDg3N2NhZWU0NWE2MTNlOTcw
Njk0NmMzMjA1YTZmYjkiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9zb3VyY2UvY29tcGls
ZXIvYXNsY29tcGlsZS5jO2JlZ2lubGluZT03O2VuZGxpbmU9MTUwO21kNT1mNWNkMDZiNjU1NWVi
ODAyMmJmOTlkNDlmOTAyYjA3MSIKIAogQ09NUEFUSUJMRV9IT1NUID0gIihpLjg2fHg4Nl82NHxh
cm18YWFyY2g2NCkuKi1saW51eCIKIAogREVQRU5EUyA9ICJtNC1uYXRpdmUgZmxleC1uYXRpdmUg
Ymlzb24tbmF0aXZlIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYWNwaWNhL2FjcGlj
YTtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz0ke1BWfSIKLVNSQ1JFViA9ICIyMzJm
ZjNmOGFlMWE0ZGExMWM3MDlmNjFkOTE1NDQ4MmNmZThlNmRmIgorU1JDUkVWID0gImU4NWFhM2Jl
YmFhZTgxZWQxZTZkMTYzNTExYWM3ZTFlYWZlNzMyY2YiCiAKIGluaGVyaXQgdXBkYXRlLWFsdGVy
bmF0aXZlcwogCi0tIAoyLjQ3LjEKCg==

--===============2975607938791840044==--

