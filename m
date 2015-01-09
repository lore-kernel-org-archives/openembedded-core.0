Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id AF49665CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 16:08:50 +0000 (UTC)
Received: from [70.30.87.145] (port=58222 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y9c7D-0007Bj-Nk for openembedded-core@lists.openembedded.org;
	Fri, 09 Jan 2015 11:08:47 -0500
Date: Fri, 9 Jan 2015 11:08:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501091107110.24628@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: [PATCH] BAD_RECOMMENDATIONS also works for RPM packaging.
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
X-List-Received-Date: Fri, 09 Jan 2015 16:08:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  unless i misread, BAD_RECOMMENDATIONS works for both IPK and RPM,
but not for DEB.

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 2ab86e1..3a918e8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -77,7 +77,7 @@ AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies t
 #B

 B[doc] = "The Build Directory. The OpenEmbedded build system places generated objects into the Build Directory during a recipe's build process."
-BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK packaging backend."
+BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK or RPM packaging backends."
 BB_DANGLINGAPPENDS_WARNONLY[doc] = "Defines how BitBake handles situations where an append file (.bbappend) has no corresponding recipe file (.bb)."
 BB_DISKMON_DIRS[doc] = "Monitors disk space and available inodes during the build and allows you to control the build based on these parameters."
 BB_DISKMON_WARNINTERVAL[doc] = "Defines the disk space and free inode warning intervals. To set these intervals, define the variable in the conf/local.conf file in the Build Directory."

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

