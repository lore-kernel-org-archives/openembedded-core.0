Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=495152f3c=rich.pixley@palm.com>)
	id 1Sbe7n-0000g3-LU for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 22:43:39 +0200
X-IronPort-AV: E=Sophos;i="4.75,714,1330934400"; d="scan'208";a="13935640"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 04 Jun 2012 13:32:08 -0700
Received: from fuji-land.noir.com ([10.100.2.3])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q54KW8In022444;
	Mon, 4 Jun 2012 13:32:08 -0700
Message-ID: <4FCD1B48.8040708@palm.com>
Date: Mon, 04 Jun 2012 13:32:08 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Minor documentation.conf patch...
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
X-List-Received-Date: Mon, 04 Jun 2012 20:43:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 004a16c..1d57044 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -64,7 +64,7 @@ PV[doc] = "PV holds the version of the package 
(Package Version). The default va
  retrieved from the bitbake-file filename but can be changed."
  PR[doc] = "PR is the revision of the package (Package Revision). By 
default it is set to r0."
  PF[doc] = "Package name - Package version - Package revision (PN-PV-PR)"
-P[doc]  = "Package name - Package version (PN-PF)"
+P[doc]  = "Package name - Package version (PN-PV)"
  S[doc] = "Directory that holds the sources to build, WORKDIR/PN-PV by 
default. The 'make' or equivalent command is run from this directory."
  SECTION[doc]  = "Section of the packages e.g. console/networking"
  PRIORITY[doc] = "Importance of package, default values are 'optional' 
or 'needed'."



