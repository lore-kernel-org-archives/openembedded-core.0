Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnSpB-0002md-QT
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 13:05:18 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:52761 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnSeS-0007BI-Jr for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 06:54:12 -0400
Date: Sat, 7 Jul 2012 06:54:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207070649530.18262@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: tcf-agent, matchbox-wm-2: Correct "proto=git" to "protocol=git".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2012 11:05:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


"proto=git" is not a valid parameter for the git fetcher.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  normally, i wouldn't pick on stuff like this but as i read git.py,
it seems pretty clear that "proto=git" isn't even a valid parameter.
a cleaner solution would be to remove all of that superfluous
"protocol=git" content but i'm not going down that road.


diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 8ac8022..25fccaf 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
 PV = "0.4.0+git${SRCPV}"
 PR = "r0"

-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;proto=git \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
            http://www.eclipse.org/legal/epl-v10.html;name=epl \
            file://fix_ranlib.patch \
            file://fix_tcf-agent.init.patch \
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
index 4aad3a9..8b162be 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
@@ -9,7 +9,7 @@ SRCREV = "01fa5465743c9ee43d040350f4405d35293e4869"
 PV = "0.1+git${SRCPV}"
 PR = "r1"

-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;proto=git \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;protocol=git \
 	file://fix_makefile.patch \
 	  "


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


