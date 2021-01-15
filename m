Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.722.1610713822916136885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 63BCA38C13C1
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 11.1.0 SUCCEEDED
Message-ID: <MADEUP.165A67B0625F2407.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146786
Content-Type: multipart/mixed; boundary="===============1484631672994790308=="

--===============1484631672994790308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *11.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-8.13.3743-11.1.0.patch
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

--===============1484631672994790308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1084471 to 932125 (-14%)
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/include/glslang/build_info.h was added
  /usr/include/glslang/HLSL was added
  /usr/include/glslang/HLSL/hlslAttributes.h was added
  /usr/include/glslang/HLSL/hlslGrammar.h was added
  /usr/include/glslang/HLSL/hlslOpMap.h was added
  /usr/include/glslang/HLSL/hlslParseables.h was added
  /usr/include/glslang/HLSL/hlslParseHelper.h was added
  /usr/include/glslang/HLSL/hlslScanContext.h was added
  /usr/include/glslang/HLSL/hlslTokens.h was added
  /usr/include/glslang/HLSL/hlslTokenStream.h was added
  /usr/lib/cmake/glslangTargets-debug.cmake was added
  /usr/lib/cmake/glslangValidatorTargets-debug.cmake was added
  /usr/lib/cmake/HLSLTargets-debug.cmake was added
  /usr/lib/cmake/OGLCompilerTargets-debug.cmake was added
  /usr/lib/cmake/OSDependentTargets-debug.cmake was added
  /usr/lib/cmake/spirv-remapTargets-debug.cmake was added
  /usr/lib/cmake/SPIRVTargets-debug.cmake was added
  /usr/lib/cmake/SPVRemapperTargets-debug.cmake was added
  /usr/lib/libGenericCodeGen.a was added
  /usr/lib/libMachineIndependent.a was added
  /usr/include/glslang/Include/revision.h was removed
  /usr/include/SPIRV was removed
  /usr/include/SPIRV/bitutils.h was removed
  /usr/include/SPIRV/disassemble.h was removed
  /usr/include/SPIRV/doc.h was removed
  /usr/include/SPIRV/GlslangToSpv.h was removed
  /usr/include/SPIRV/GLSL.ext.AMD.h was removed
  /usr/include/SPIRV/GLSL.ext.EXT.h was removed
  /usr/include/SPIRV/GLSL.ext.KHR.h was removed
  /usr/include/SPIRV/GLSL.ext.NV.h was removed
  /usr/include/SPIRV/GLSL.std.450.h was removed
  /usr/include/SPIRV/hex_float.h was removed
  /usr/include/SPIRV/Logger.h was removed
  /usr/include/SPIRV/NonSemanticDebugPrintf.h was removed
  /usr/include/SPIRV/spirv.hpp was removed
  /usr/include/SPIRV/SpvBuilder.h was removed
  /usr/include/SPIRV/spvIR.h was removed
  /usr/include/SPIRV/SPVRemapper.h was removed
  /usr/include/SPIRV/SpvTools.h was removed
  /usr/lib/cmake/glslangTargets-noconfig.cmake was removed
  /usr/lib/cmake/glslangValidatorTargets-noconfig.cmake was removed
  /usr/lib/cmake/HLSLTargets-noconfig.cmake was removed
  /usr/lib/cmake/OGLCompilerTargets-noconfig.cmake was removed
  /usr/lib/cmake/OSDependentTargets-noconfig.cmake was removed
  /usr/lib/cmake/spirv-remapTargets-noconfig.cmake was removed
  /usr/lib/cmake/SPIRVTargets-noconfig.cmake was removed
  /usr/lib/cmake/SPVRemapperTargets-noconfig.cmake was removed

--===============1484631672994790308==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-8.13.3743-11.1.0.patch"

From d3911d79b256dcfb538097875e7b2ae518ecfd01 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 07:45:48 +0000
Subject: [PATCH] glslang: upgrade 8.13.3743 -> 11.1.0

---
 .../glslang/glslang_8.13.3743.bb              | 324 +++++++++++++++++-
 1 file changed, 321 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb b/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
index 2c4f4be5a2..6048e02bfa 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
+++ b/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
@@ -1,3 +1,321 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,6 +1,6 @@
+#  Here, glslang proper means core GLSL parsing, HLSL parsing, and SPIR-V code
+# -generation. Glslang proper requires use of two licenses, one that covers
+# -non-preprocessing and an additional one that covers preprocessing.
+# +generation. Glslang proper requires use of a number of licenses, one that covers
+# +preprocessing and others that covers non-preprocessing.
+#  
+#  Bison was removed long ago. You can build glslang from the source grammar,
+#  using tools of your choice, without using bison or any bison files.
+# @@ -22,6 +22,10 @@
+#  --------------------------------------------------------------------------------
+#  
+#  The core of glslang-proper, minus the preprocessor is licenced as follows:
+# +
+# +--------------------------------------------------------------------------------
+# +3-Clause BSD License
+# +--------------------------------------------------------------------------------
+#  
+#  //
+#  // Copyright (C) 2015-2018 Google, Inc.
+# @@ -59,9 +63,281 @@
+#  // POSSIBILITY OF SUCH DAMAGE.
+#  //
+#  
+# ---------------------------------------------------------------------------------
+# -
+# -The preprocessor has the core license stated above, plus an additional licence:
+# +
+# +--------------------------------------------------------------------------------
+# +2-Clause BSD License
+# +--------------------------------------------------------------------------------
+# +
+# +Copyright 2020 The Khronos Group Inc
+# +
+# +Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+# +
+# +1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
+# +
+# +2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
+# +
+# +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +
+# +
+# +--------------------------------------------------------------------------------
+# +The MIT License
+# +--------------------------------------------------------------------------------
+# +
+# +Copyright 2020 The Khronos Group Inc
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+# +
+# +
+# +--------------------------------------------------------------------------------
+# +APACHE LICENSE, VERSION 2.0
+# +--------------------------------------------------------------------------------
+# +
+# +                                 Apache License
+# +                           Version 2.0, January 2004
+# +                        http://www.apache.org/licenses/
+# +
+# +   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+# +
+# +   1. Definitions.
+# +
+# +      "License" shall mean the terms and conditions for use, reproduction,
+# +      and distribution as defined by Sections 1 through 9 of this document.
+# +
+# +      "Licensor" shall mean the copyright owner or entity authorized by
+# +      the copyright owner that is granting the License.
+# +
+# +      "Legal Entity" shall mean the union of the acting entity and all
+# +      other entities that control, are controlled by, or are under common
+# +      control with that entity. For the purposes of this definition,
+# +      "control" means (i) the power, direct or indirect, to cause the
+# +      direction or management of such entity, whether by contract or
+# +      otherwise, or (ii) ownership of fifty percent (50%) or more of the
+# +      outstanding shares, or (iii) beneficial ownership of such entity.
+# +
+# +      "You" (or "Your") shall mean an individual or Legal Entity
+# +      exercising permissions granted by this License.
+# +
+# +      "Source" form shall mean the preferred form for making modifications,
+# +      including but not limited to software source code, documentation
+# +      source, and configuration files.
+# +
+# +      "Object" form shall mean any form resulting from mechanical
+# +      transformation or translation of a Source form, including but
+# +      not limited to compiled object code, generated documentation,
+# +      and conversions to other media types.
+# +
+# +      "Work" shall mean the work of authorship, whether in Source or
+# +      Object form, made available under the License, as indicated by a
+# +      copyright notice that is included in or attached to the work
+# +      (an example is provided in the Appendix below).
+# +
+# +      "Derivative Works" shall mean any work, whether in Source or Object
+# +      form, that is based on (or derived from) the Work and for which the
+# +      editorial revisions, annotations, elaborations, or other modifications
+# +      represent, as a whole, an original work of authorship. For the purposes
+# +      of this License, Derivative Works shall not include works that remain
+# +      separable from, or merely link (or bind by name) to the interfaces of,
+# +      the Work and Derivative Works thereof.
+# +
+# +      "Contribution" shall mean any work of authorship, including
+# +      the original version of the Work and any modifications or additions
+# +      to that Work or Derivative Works thereof, that is intentionally
+# +      submitted to Licensor for inclusion in the Work by the copyright owner
+# +      or by an individual or Legal Entity authorized to submit on behalf of
+# +      the copyright owner. For the purposes of this definition, "submitted"
+# +      means any form of electronic, verbal, or written communication sent
+# +      to the Licensor or its representatives, including but not limited to
+# +      communication on electronic mailing lists, source code control systems,
+# +      and issue tracking systems that are managed by, or on behalf of, the
+# +      Licensor for the purpose of discussing and improving the Work, but
+# +      excluding communication that is conspicuously marked or otherwise
+# +      designated in writing by the copyright owner as "Not a Contribution."
+# +
+# +      "Contributor" shall mean Licensor and any individual or Legal Entity
+# +      on behalf of whom a Contribution has been received by Licensor and
+# +      subsequently incorporated within the Work.
+# +
+# +   2. Grant of Copyright License. Subject to the terms and conditions of
+# +      this License, each Contributor hereby grants to You a perpetual,
+# +      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+# +      copyright license to reproduce, prepare Derivative Works of,
+# +      publicly display, publicly perform, sublicense, and distribute the
+# +      Work and such Derivative Works in Source or Object form.
+# +
+# +   3. Grant of Patent License. Subject to the terms and conditions of
+# +      this License, each Contributor hereby grants to You a perpetual,
+# +      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+# +      (except as stated in this section) patent license to make, have made,
+# +      use, offer to sell, sell, import, and otherwise transfer the Work,
+# +      where such license applies only to those patent claims licensable
+# +      by such Contributor that are necessarily infringed by their
+# +      Contribution(s) alone or by combination of their Contribution(s)
+# +      with the Work to which such Contribution(s) was submitted. If You
+# +      institute patent litigation against any entity (including a
+# +      cross-claim or counterclaim in a lawsuit) alleging that the Work
+# +      or a Contribution incorporated within the Work constitutes direct
+# +      or contributory patent infringement, then any patent licenses
+# +      granted to You under this License for that Work shall terminate
+# +      as of the date such litigation is filed.
+# +
+# +   4. Redistribution. You may reproduce and distribute copies of the
+# +      Work or Derivative Works thereof in any medium, with or without
+# +      modifications, and in Source or Object form, provided that You
+# +      meet the following conditions:
+# +
+# +      (a) You must give any other recipients of the Work or
+# +          Derivative Works a copy of this License; and
+# +
+# +      (b) You must cause any modified files to carry prominent notices
+# +          stating that You changed the files; and
+# +
+# +      (c) You must retain, in the Source form of any Derivative Works
+# +          that You distribute, all copyright, patent, trademark, and
+# +          attribution notices from the Source form of the Work,
+# +          excluding those notices that do not pertain to any part of
+# +          the Derivative Works; and
+# +
+# +      (d) If the Work includes a "NOTICE" text file as part of its
+# +          distribution, then any Derivative Works that You distribute must
+# +          include a readable copy of the attribution notices contained
+# +          within such NOTICE file, excluding those notices that do not
+# +          pertain to any part of the Derivative Works, in at least one
+# +          of the following places: within a NOTICE text file distributed
+# +          as part of the Derivative Works; within the Source form or
+# +          documentation, if provided along with the Derivative Works; or,
+# +          within a display generated by the Derivative Works, if and
+# +          wherever such third-party notices normally appear. The contents
+# +          of the NOTICE file are for informational purposes only and
+# +          do not modify the License. You may add Your own attribution
+# +          notices within Derivative Works that You distribute, alongside
+# +          or as an addendum to the NOTICE text from the Work, provided
+# +          that such additional attribution notices cannot be construed
+# +          as modifying the License.
+# +
+# +      You may add Your own copyright statement to Your modifications and
+# +      may provide additional or different license terms and conditions
+# +      for use, reproduction, or distribution of Your modifications, or
+# +      for any such Derivative Works as a whole, provided Your use,
+# +      reproduction, and distribution of the Work otherwise complies with
+# +      the conditions stated in this License.
+# +
+# +   5. Submission of Contributions. Unless You explicitly state otherwise,
+# +      any Contribution intentionally submitted for inclusion in the Work
+# +      by You to the Licensor shall be under the terms and conditions of
+# +      this License, without any additional terms or conditions.
+# +      Notwithstanding the above, nothing herein shall supersede or modify
+# +      the terms of any separate license agreement you may have executed
+# +      with Licensor regarding such Contributions.
+# +
+# +   6. Trademarks. This License does not grant permission to use the trade
+# +      names, trademarks, service marks, or product names of the Licensor,
+# +      except as required for reasonable and customary use in describing the
+# +      origin of the Work and reproducing the content of the NOTICE file.
+# +
+# +   7. Disclaimer of Warranty. Unless required by applicable law or
+# +      agreed to in writing, Licensor provides the Work (and each
+# +      Contributor provides its Contributions) on an "AS IS" BASIS,
+# +      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+# +      implied, including, without limitation, any warranties or conditions
+# +      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
+# +      PARTICULAR PURPOSE. You are solely responsible for determining the
+# +      appropriateness of using or redistributing the Work and assume any
+# +      risks associated with Your exercise of permissions under this License.
+# +
+# +   8. Limitation of Liability. In no event and under no legal theory,
+# +      whether in tort (including negligence), contract, or otherwise,
+# +      unless required by applicable law (such as deliberate and grossly
+# +      negligent acts) or agreed to in writing, shall any Contributor be
+# +      liable to You for damages, including any direct, indirect, special,
+# +      incidental, or consequential damages of any character arising as a
+# +      result of this License or out of the use or inability to use the
+# +      Work (including but not limited to damages for loss of goodwill,
+# +      work stoppage, computer failure or malfunction, or any and all
+# +      other commercial damages or losses), even if such Contributor
+# +      has been advised of the possibility of such damages.
+# +
+# +   9. Accepting Warranty or Additional Liability. While redistributing
+# +      the Work or Derivative Works thereof, You may choose to offer,
+# +      and charge a fee for, acceptance of support, warranty, indemnity,
+# +      or other liability obligations and/or rights consistent with this
+# +      License. However, in accepting such obligations, You may act only
+# +      on Your own behalf and on Your sole responsibility, not on behalf
+# +      of any other Contributor, and only if You agree to indemnify,
+# +      defend, and hold each Contributor harmless for any liability
+# +      incurred by, or claims asserted against, such Contributor by reason
+# +      of your accepting any such warranty or additional liability.
+# +
+# +   END OF TERMS AND CONDITIONS
+# +
+# +   APPENDIX: How to apply the Apache License to your work.
+# +
+# +      To apply the Apache License to your work, attach the following
+# +      boilerplate notice, with the fields enclosed by brackets "[]"
+# +      replaced with your own identifying information. (Don't include
+# +      the brackets!)  The text should be enclosed in the appropriate
+# +      comment syntax for the file format. We also recommend that a
+# +      file or class name and description of purpose be included on the
+# +      same "printed page" as the copyright notice for easier
+# +      identification within third-party archives.
+# +
+# +   Copyright [yyyy] [name of copyright owner]
+# +
+# +   Licensed under the Apache License, Version 2.0 (the "License");
+# +   you may not use this file except in compliance with the License.
+# +   You may obtain a copy of the License at
+# +
+# +       http://www.apache.org/licenses/LICENSE-2.0
+# +
+# +   Unless required by applicable law or agreed to in writing, software
+# +   distributed under the License is distributed on an "AS IS" BASIS,
+# +   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+# +   See the License for the specific language governing permissions and
+# +   limitations under the License.
+# +
+# +
+# +--------------------------------------------------------------------------------
+# +GPL 3 with special bison exception
+# +--------------------------------------------------------------------------------
+# +
+# +   Bison implementation for Yacc-like parsers in C
+# +
+# +   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.
+# +
+# +   This program is free software: you can redistribute it and/or modify
+# +   it under the terms of the GNU General Public License as published by
+# +   the Free Software Foundation, either version 3 of the License, or
+# +   (at your option) any later version.
+# +
+# +   This program is distributed in the hope that it will be useful,
+# +   but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# +   GNU General Public License for more details.
+# +
+# +   You should have received a copy of the GNU General Public License
+# +   along with this program.  If not, see <http://www.gnu.org/licenses/>.
+# +
+# +   As a special exception, you may create a larger work that contains
+# +   part or all of the Bison parser skeleton and distribute that work
+# +   under terms of your choice, so long as that work isn't itself a
+# +   parser generator using the skeleton or a modified version thereof
+# +   as a parser skeleton.  Alternatively, if you modify or redistribute
+# +   the parser skeleton itself, you may (at your option) remove this
+# +   special exception, which will cause the skeleton and the resulting
+# +   Bison output files to be licensed under the GNU General Public
+# +   License without this special exception.
+# +
+# +   This special exception was added by the Free Software Foundation in
+# +   version 2.2 of Bison.
+# +
+# +--------------------------------------------------------------------------------
+# +================================================================================
+# +--------------------------------------------------------------------------------
+# +
+# +The preprocessor has the core licenses stated above, plus an additional licence:
+#  
+#  /****************************************************************************\
+#  Copyright (c) 2002, NVIDIA Corporation.
+# 
+#
+
 SUMMARY = "OpenGL / OpenGL ES Reference Compiler"
 DESCRIPTION = "Glslang is the official reference compiler front end for the \
 OpenGL ES and OpenGL shading languages. It implements a strict interpretation \
@@ -6,14 +324,14 @@ either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "e05cc20ec20a154d94256c744a3837c23719c0f9"
+SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-PV = "8.13.3743+git${SRCPV}"
+PV = "11.1.0"
 
 inherit cmake python3native
 
-- 
2.27.0


--===============1484631672994790308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 37528760 to 38689816 (+3%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1084471 to 932125 (-14%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4234094 to 4363765 (+3%)
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 41606658 to 42898034 (+3%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 3228744 to 3322952 (+3%)
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 8.13.3743+git0+e05cc20ec2 to 11.1.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 8.13.3743+gitAUTOINC+e05cc20ec2 [default] to 11.1.0 [default]
packages/core2-32-poky-linux/glslang: PV changed from "8.13.3743+gitAUTOINC+e05cc20ec2" to "11.1.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/include/glslang/build_info.h was added
  /usr/include/glslang/HLSL was added
  /usr/include/glslang/HLSL/hlslAttributes.h was added
  /usr/include/glslang/HLSL/hlslGrammar.h was added
  /usr/include/glslang/HLSL/hlslOpMap.h was added
  /usr/include/glslang/HLSL/hlslParseables.h was added
  /usr/include/glslang/HLSL/hlslParseHelper.h was added
  /usr/include/glslang/HLSL/hlslScanContext.h was added
  /usr/include/glslang/HLSL/hlslTokens.h was added
  /usr/include/glslang/HLSL/hlslTokenStream.h was added
  /usr/lib/cmake/glslangTargets-debug.cmake was added
  /usr/lib/cmake/glslangValidatorTargets-debug.cmake was added
  /usr/lib/cmake/HLSLTargets-debug.cmake was added
  /usr/lib/cmake/OGLCompilerTargets-debug.cmake was added
  /usr/lib/cmake/OSDependentTargets-debug.cmake was added
  /usr/lib/cmake/spirv-remapTargets-debug.cmake was added
  /usr/lib/cmake/SPIRVTargets-debug.cmake was added
  /usr/lib/cmake/SPVRemapperTargets-debug.cmake was added
  /usr/lib/libGenericCodeGen.a was added
  /usr/lib/libMachineIndependent.a was added
  /usr/include/glslang/Include/revision.h was removed
  /usr/include/SPIRV was removed
  /usr/include/SPIRV/bitutils.h was removed
  /usr/include/SPIRV/disassemble.h was removed
  /usr/include/SPIRV/doc.h was removed
  /usr/include/SPIRV/GlslangToSpv.h was removed
  /usr/include/SPIRV/GLSL.ext.AMD.h was removed
  /usr/include/SPIRV/GLSL.ext.EXT.h was removed
  /usr/include/SPIRV/GLSL.ext.KHR.h was removed
  /usr/include/SPIRV/GLSL.ext.NV.h was removed
  /usr/include/SPIRV/GLSL.std.450.h was removed
  /usr/include/SPIRV/hex_float.h was removed
  /usr/include/SPIRV/Logger.h was removed
  /usr/include/SPIRV/NonSemanticDebugPrintf.h was removed
  /usr/include/SPIRV/spirv.hpp was removed
  /usr/include/SPIRV/SpvBuilder.h was removed
  /usr/include/SPIRV/spvIR.h was removed
  /usr/include/SPIRV/SPVRemapper.h was removed
  /usr/include/SPIRV/SpvTools.h was removed
  /usr/lib/cmake/glslangTargets-noconfig.cmake was removed
  /usr/lib/cmake/glslangValidatorTargets-noconfig.cmake was removed
  /usr/lib/cmake/HLSLTargets-noconfig.cmake was removed
  /usr/lib/cmake/OGLCompilerTargets-noconfig.cmake was removed
  /usr/lib/cmake/OSDependentTargets-noconfig.cmake was removed
  /usr/lib/cmake/spirv-remapTargets-noconfig.cmake was removed
  /usr/lib/cmake/SPIRVTargets-noconfig.cmake was removed
  /usr/lib/cmake/SPVRemapperTargets-noconfig.cmake was removed

--===============1484631672994790308==--
