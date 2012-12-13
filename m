Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TixdT-0003ga-HK
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 02:31:15 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:53128 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TixPO-0008Hd-Q8 for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 20:16:18 -0500
Date: Wed, 12 Dec 2012 20:16:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212122013560.917@oneiric>
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
Subject: [PATCH] meta-openembedded: Replace vestiges of "pnum=" with "striplevel=".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 01:31:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  given that these were the last usages of "pnum=" that i'm aware of,
i'll submit a patch to remove the processing from patch.bbclass --
someone else can decide whether or not to apply it.

diff --git a/meta-oe/recipes-support/vim/vim_7.2.446.bb b/meta-oe/recipes-support/vim/vim_7.2.446.bb
index 62d76d7..ea922f5 100644
--- a/meta-oe/recipes-support/vim/vim_7.2.446.bb
+++ b/meta-oe/recipes-support/vim/vim_7.2.446.bb
@@ -12,11 +12,11 @@ require vim.inc
 PR = "${INC_PR}.3"

 # 001-446; 401-446 are not yet available online
-SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=p001-100;apply=yes;patchdir=..;pnum=0"
-SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=p101-200;apply=yes;patchdir=..;pnum=0"
-SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=p201-300;apply=yes;patchdir=..;pnum=0"
-SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=p301-400;apply=yes;patchdir=..;pnum=0"
-SRC_URI += "file://401-446.diff;patchdir=..;pnum=0"
+SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=p001-100;apply=yes;patchdir=..;striplevel=0"
+SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=p101-200;apply=yes;patchdir=..;striplevel=0"
+SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=p201-300;apply=yes;patchdir=..;striplevel=0"
+SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=p301-400;apply=yes;patchdir=..;striplevel=0"
+SRC_URI += "file://401-446.diff;patchdir=..;striplevel=0"

 SRC_URI[p001-100.md5sum] = "ba91b19374cee90f71b8f4ab1d92dc0f"
 SRC_URI[p001-100.sha256sum] = "519f4fea460e4f7a737ea8006c0dc1684982f8372d1581fb963a5d58f8007f67"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


