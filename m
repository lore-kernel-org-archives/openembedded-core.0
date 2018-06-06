Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7D92B771A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 13:23:42 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id o13-v6so11449239wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IJPuHatT/9zYWkDmGt4B4SAAeYZYLKMbGMZoOcx5VkI=;
	b=YI3hUWk2yPairaEe8zGfj6Qmdj6H3AQTNt+lAE7ER7Je6+9Su+m6abjXqWCm0Vfuh/
	c7NOoDtx2pQa1d/9QjX12IbpKNdvqDtB3kCyYy0PTcNiiZ+gRX26B+jDv/nIlUsQBCE0
	pPJiwyRy+clCZ51RjyzMRD5Ie1fyzfZIGxtIHnK4ctsHdMbUs4wySM/oPf7jYdZ0jmbG
	ZFuBBoDEttmN6GJwv/yjTaL6dCFILo84wZk1Zbq8Dm6dEUbZPX4/c6LiskG5A60FJr1y
	MDMT4hnPdZ25uqUmXaLIc2PJIs0OH1vnrvuxcnY9N7Cn4wLRZWdHRA+wc9dvF0lBR5gM
	SQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IJPuHatT/9zYWkDmGt4B4SAAeYZYLKMbGMZoOcx5VkI=;
	b=WLcnST9a3YIub5uO+tVaFv1T+t+vUJvoEL15/wHbhGEnnIq8dQXvNrVT7X5SnyNbvj
	RH6IeCYeZ8kJQs6upnqaNNoylqaFNGQzMngCX5jpRnhe9J1xhwMx1KKa696LyMhHiICw
	+rSTcyUIAzU5VZRQskSuRhCagqs2I3+tET3GWX8+ONZ3auigEgCRUUFDgdcpLo0qF1S5
	gC9hCKZCxVtbeD4cjplsQCCaMxyKVy9gHdqri+M7I35xKIb46uolfAvlMjTLsj5U16Ko
	yGFwJFJcEabKY0/zNIRpJaPsEshcPPclc158CQ/1Un8kqnaA1zchZbdGZLv4N21kON0I
	9iFQ==
X-Gm-Message-State: APt69E07cHcKzV0YRFmDuWDW5zPCRscwfC4lTkbSnD/diTSEuidBtx3w
	LHtJgI10l/yjNtvkPA1EdaNZYQ==
X-Google-Smtp-Source: ADUXVKJXQXf7RwnbTje6HHK3gVUCTvgnE+y3wf0g4QufeDdsHhHCsjL7oL9QsyhNWFrbzW6/0juckg==
X-Received: by 2002:a50:ad07:: with SMTP id y7-v6mr3939494edc.78.1528291422829;
	Wed, 06 Jun 2018 06:23:42 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b22-v6sm30146418edn.44.2018.06.06.06.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 06:23:42 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:23:39 +0100
Message-Id: <20180606132339.5964-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [PATCH] Add license file EPL-2.0
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
X-List-Received-Date: Wed, 06 Jun 2018 13:23:42 -0000

From: Nicola Lunghi <nicola.lunghi@jci.com>

it is from:

https://www.eclipse.org/org/documents/epl-2.0/EPL-2.0.txt

And add 'EPL-2.0' to SRC_DISTRIBUTE_LICENSES.
---
 meta/conf/licenses.conf            |   2 +-
 meta/files/common-licenses/EPL-2.0 | 277 +++++++++++++++++++++++++++++
 2 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/EPL-2.0

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 3e2d2589ab..90c486ebed 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0"
 SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C"
 SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
 SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0 EFL-2.0"
-SRC_DISTRIBUTE_LICENSES += "Elfutils-Exception Entessa EPL-1.0 ErlPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "Elfutils-Exception Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Frameworx-1.0"
 SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
 SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
diff --git a/meta/files/common-licenses/EPL-2.0 b/meta/files/common-licenses/EPL-2.0
new file mode 100644
index 0000000000..e48e096345
--- /dev/null
+++ b/meta/files/common-licenses/EPL-2.0
@@ -0,0 +1,277 @@
+Eclipse Public License - v 2.0
+
+    THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
+    PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
+    OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
+
+1. DEFINITIONS
+
+"Contribution" means:
+
+  a) in the case of the initial Contributor, the initial content
+     Distributed under this Agreement, and
+
+  b) in the case of each subsequent Contributor:
+     i) changes to the Program, and
+     ii) additions to the Program;
+  where such changes and/or additions to the Program originate from
+  and are Distributed by that particular Contributor. A Contribution
+  "originates" from a Contributor if it was added to the Program by
+  such Contributor itself or anyone acting on such Contributor's behalf.
+  Contributions do not include changes or additions to the Program that
+  are not Modified Works.
+
+"Contributor" means any person or entity that Distributes the Program.
+
+"Licensed Patents" mean patent claims licensable by a Contributor which
+are necessarily infringed by the use or sale of its Contribution alone
+or when combined with the Program.
+
+"Program" means the Contributions Distributed in accordance with this
+Agreement.
+
+"Recipient" means anyone who receives the Program under this Agreement
+or any Secondary License (as applicable), including Contributors.
+
+"Derivative Works" shall mean any work, whether in Source Code or other
+form, that is based on (or derived from) the Program and for which the
+editorial revisions, annotations, elaborations, or other modifications
+represent, as a whole, an original work of authorship.
+
+"Modified Works" shall mean any work in Source Code or other form that
+results from an addition to, deletion from, or modification of the
+contents of the Program, including, for purposes of clarity any new file
+in Source Code form that contains any contents of the Program. Modified
+Works shall not include works that contain only declarations,
+interfaces, types, classes, structures, or files of the Program solely
+in each case in order to link to, bind by name, or subclass the Program
+or Modified Works thereof.
+
+"Distribute" means the acts of a) distributing or b) making available
+in any manner that enables the transfer of a copy.
+
+"Source Code" means the form of a Program preferred for making
+modifications, including but not limited to software source code,
+documentation source, and configuration files.
+
+"Secondary License" means either the GNU General Public License,
+Version 2.0, or any later versions of that license, including any
+exceptions or additional permissions as identified by the initial
+Contributor.
+
+2. GRANT OF RIGHTS
+
+  a) Subject to the terms of this Agreement, each Contributor hereby
+  grants Recipient a non-exclusive, worldwide, royalty-free copyright
+  license to reproduce, prepare Derivative Works of, publicly display,
+  publicly perform, Distribute and sublicense the Contribution of such
+  Contributor, if any, and such Derivative Works.
+
+  b) Subject to the terms of this Agreement, each Contributor hereby
+  grants Recipient a non-exclusive, worldwide, royalty-free patent
+  license under Licensed Patents to make, use, sell, offer to sell,
+  import and otherwise transfer the Contribution of such Contributor,
+  if any, in Source Code or other form. This patent license shall
+  apply to the combination of the Contribution and the Program if, at
+  the time the Contribution is added by the Contributor, such addition
+  of the Contribution causes such combination to be covered by the
+  Licensed Patents. The patent license shall not apply to any other
+  combinations which include the Contribution. No hardware per se is
+  licensed hereunder.
+
+  c) Recipient understands that although each Contributor grants the
+  licenses to its Contributions set forth herein, no assurances are
+  provided by any Contributor that the Program does not infringe the
+  patent or other intellectual property rights of any other entity.
+  Each Contributor disclaims any liability to Recipient for claims
+  brought by any other entity based on infringement of intellectual
+  property rights or otherwise. As a condition to exercising the
+  rights and licenses granted hereunder, each Recipient hereby
+  assumes sole responsibility to secure any other intellectual
+  property rights needed, if any. For example, if a third party
+  patent license is required to allow Recipient to Distribute the
+  Program, it is Recipient's responsibility to acquire that license
+  before distributing the Program.
+
+  d) Each Contributor represents that to its knowledge it has
+  sufficient copyright rights in its Contribution, if any, to grant
+  the copyright license set forth in this Agreement.
+
+  e) Notwithstanding the terms of any Secondary License, no
+  Contributor makes additional grants to any Recipient (other than
+  those set forth in this Agreement) as a result of such Recipient's
+  receipt of the Program under the terms of a Secondary License
+  (if permitted under the terms of Section 3).
+
+3. REQUIREMENTS
+
+3.1 If a Contributor Distributes the Program in any form, then:
+
+  a) the Program must also be made available as Source Code, in
+  accordance with section 3.2, and the Contributor must accompany
+  the Program with a statement that the Source Code for the Program
+  is available under this Agreement, and informs Recipients how to
+  obtain it in a reasonable manner on or through a medium customarily
+  used for software exchange; and
+
+  b) the Contributor may Distribute the Program under a license
+  different than this Agreement, provided that such license:
+     i) effectively disclaims on behalf of all other Contributors all
+     warranties and conditions, express and implied, including
+     warranties or conditions of title and non-infringement, and
+     implied warranties or conditions of merchantability and fitness
+     for a particular purpose;
+
+     ii) effectively excludes on behalf of all other Contributors all
+     liability for damages, including direct, indirect, special,
+     incidental and consequential damages, such as lost profits;
+
+     iii) does not attempt to limit or alter the recipients' rights
+     in the Source Code under section 3.2; and
+
+     iv) requires any subsequent distribution of the Program by any
+     party to be under a license that satisfies the requirements
+     of this section 3.
+
+3.2 When the Program is Distributed as Source Code:
+
+  a) it must be made available under this Agreement, or if the
+  Program (i) is combined with other material in a separate file or
+  files made available under a Secondary License, and (ii) the initial
+  Contributor attached to the Source Code the notice described in
+  Exhibit A of this Agreement, then the Program may be made available
+  under the terms of such Secondary Licenses, and
+
+  b) a copy of this Agreement must be included with each copy of
+  the Program.
+
+3.3 Contributors may not remove or alter any copyright, patent,
+trademark, attribution notices, disclaimers of warranty, or limitations
+of liability ("notices") contained within the Program from any copy of
+the Program which they Distribute, provided that Contributors may add
+their own appropriate notices.
+
+4. COMMERCIAL DISTRIBUTION
+
+Commercial distributors of software may accept certain responsibilities
+with respect to end users, business partners and the like. While this
+license is intended to facilitate the commercial use of the Program,
+the Contributor who includes the Program in a commercial product
+offering should do so in a manner which does not create potential
+liability for other Contributors. Therefore, if a Contributor includes
+the Program in a commercial product offering, such Contributor
+("Commercial Contributor") hereby agrees to defend and indemnify every
+other Contributor ("Indemnified Contributor") against any losses,
+damages and costs (collectively "Losses") arising from claims, lawsuits
+and other legal actions brought by a third party against the Indemnified
+Contributor to the extent caused by the acts or omissions of such
+Commercial Contributor in connection with its distribution of the Program
+in a commercial product offering. The obligations in this section do not
+apply to any claims or Losses relating to any actual or alleged
+intellectual property infringement. In order to qualify, an Indemnified
+Contributor must: a) promptly notify the Commercial Contributor in
+writing of such claim, and b) allow the Commercial Contributor to control,
+and cooperate with the Commercial Contributor in, the defense and any
+related settlement negotiations. The Indemnified Contributor may
+participate in any such claim at its own expense.
+
+For example, a Contributor might include the Program in a commercial
+product offering, Product X. That Contributor is then a Commercial
+Contributor. If that Commercial Contributor then makes performance
+claims, or offers warranties related to Product X, those performance
+claims and warranties are such Commercial Contributor's responsibility
+alone. Under this section, the Commercial Contributor would have to
+defend claims against the other Contributors related to those performance
+claims and warranties, and if a court requires any other Contributor to
+pay any damages as a result, the Commercial Contributor must pay
+those damages.
+
+5. NO WARRANTY
+
+EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, AND TO THE EXTENT
+PERMITTED BY APPLICABLE LAW, THE PROGRAM IS PROVIDED ON AN "AS IS"
+BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR
+IMPLIED INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OR CONDITIONS OF
+TITLE, NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR
+PURPOSE. Each Recipient is solely responsible for determining the
+appropriateness of using and distributing the Program and assumes all
+risks associated with its exercise of rights under this Agreement,
+including but not limited to the risks and costs of program errors,
+compliance with applicable laws, damage to or loss of data, programs
+or equipment, and unavailability or interruption of operations.
+
+6. DISCLAIMER OF LIABILITY
+
+EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, AND TO THE EXTENT
+PERMITTED BY APPLICABLE LAW, NEITHER RECIPIENT NOR ANY CONTRIBUTORS
+SHALL HAVE ANY LIABILITY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING WITHOUT LIMITATION LOST
+PROFITS), HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE
+EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+7. GENERAL
+
+If any provision of this Agreement is invalid or unenforceable under
+applicable law, it shall not affect the validity or enforceability of
+the remainder of the terms of this Agreement, and without further
+action by the parties hereto, such provision shall be reformed to the
+minimum extent necessary to make such provision valid and enforceable.
+
+If Recipient institutes patent litigation against any entity
+(including a cross-claim or counterclaim in a lawsuit) alleging that the
+Program itself (excluding combinations of the Program with other software
+or hardware) infringes such Recipient's patent(s), then such Recipient's
+rights granted under Section 2(b) shall terminate as of the date such
+litigation is filed.
+
+All Recipient's rights under this Agreement shall terminate if it
+fails to comply with any of the material terms or conditions of this
+Agreement and does not cure such failure in a reasonable period of
+time after becoming aware of such noncompliance. If all Recipient's
+rights under this Agreement terminate, Recipient agrees to cease use
+and distribution of the Program as soon as reasonably practicable.
+However, Recipient's obligations under this Agreement and any licenses
+granted by Recipient relating to the Program shall continue and survive.
+
+Everyone is permitted to copy and distribute copies of this Agreement,
+but in order to avoid inconsistency the Agreement is copyrighted and
+may only be modified in the following manner. The Agreement Steward
+reserves the right to publish new versions (including revisions) of
+this Agreement from time to time. No one other than the Agreement
+Steward has the right to modify this Agreement. The Eclipse Foundation
+is the initial Agreement Steward. The Eclipse Foundation may assign the
+responsibility to serve as the Agreement Steward to a suitable separate
+entity. Each new version of the Agreement will be given a distinguishing
+version number. The Program (including Contributions) may always be
+Distributed subject to the version of the Agreement under which it was
+received. In addition, after a new version of the Agreement is published,
+Contributor may elect to Distribute the Program (including its
+Contributions) under the new version.
+
+Except as expressly stated in Sections 2(a) and 2(b) above, Recipient
+receives no rights or licenses to the intellectual property of any
+Contributor under this Agreement, whether expressly, by implication,
+estoppel or otherwise. All rights in the Program not expressly granted
+under this Agreement are reserved. Nothing in this Agreement is intended
+to be enforceable by any entity that is not a Contributor or Recipient.
+No third-party beneficiary rights are created under this Agreement.
+
+Exhibit A - Form of Secondary Licenses Notice
+
+"This Source Code may also be made available under the following
+Secondary Licenses when the conditions for such availability set forth
+in the Eclipse Public License, v. 2.0 are satisfied: {name license(s),
+version(s), and exceptions or additional permissions here}."
+
+  Simply including a copy of this Agreement, including this Exhibit A
+  is not sufficient to license the Source Code under Secondary Licenses.
+
+  If it is not possible or desirable to put the notice in a particular
+  file, then You may include the notice in a location (such as a LICENSE
+  file in a relevant directory) where a recipient would be likely to
+  look for such a notice.
+
+  You may add additional accurate notices of copyright ownership.
-- 
2.17.1


