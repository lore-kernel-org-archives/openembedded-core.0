Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAfK1-0000Oj-0D
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:32:45 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAfBP-00082k-NI for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 06:23:51 -0400
Date: Thu, 22 Mar 2012 06:23:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203220621400.12509@oneiric>
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
Subject: [PATCH] Remove superfluous usage of BBEXTRA in oe-buildenv-internal
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
X-List-Received-Date: Thu, 22 Mar 2012 10:32:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


According to Richard Purdie, this single reference to BBEXTRA is a
historical holdover and has little value these days.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  wasn't sure if richard was saying that BBEXTRA didn't have any value
anymore, so he's welcome to NAK this patch.  there is no other
reference to that variable anywhere within oe-core.

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 21b92b0..21f0d5f 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -54,7 +54,7 @@ else
 fi
 unset BDIR

-BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
+BITBAKEDIR="$OEROOT/bitbake/"

 BITBAKEDIR=`readlink -f "$BITBAKEDIR"`
 BUILDDIR=`readlink -f "$BUILDDIR"`

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


