Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Smw7Y-000197-EL
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 02:10:04 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:35924 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Smvwq-0004Ft-QQ for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:59:00 -0400
Date: Thu, 5 Jul 2012 19:58:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207051957500.8240@oneiric>
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
Subject: someone broke the bitbake user manual
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
X-List-Received-Date: Fri, 06 Jul 2012 00:10:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  it needs this:

diff --git a/doc/manual/usermanual.xml b/doc/manual/usermanual.xml
index 81b301a..e776b43 100644
--- a/doc/manual/usermanual.xml
+++ b/doc/manual/usermanual.xml
@@ -336,7 +336,7 @@ SRC_URI_append_1.0.7+ = "file://some_patch_which_the_new_versions_need.patch;pat
                 <para>The 'depends' flag for tasks is a more generic form of which allows an interdependency on specific tasks rather than specifying the data in DEPENDS.</para>
                 <para><screen>do_patch[depends] = "quilt-native:do_populate_staging"</screen></para>
                 <para>means the do_populate_staging task of the target quilt-native must have completed before the do_patch can execute.</para>
-                <para>The 'rdepends' flag works in a similar way but takes targets in the runtime namespace instead of the build time dependency namespace.
+                <para>The 'rdepends' flag works in a similar way but takes targets in the runtime namespace instead of the build time dependency namespace.</para>
             </section>
         </section>


whoever wants to fix it, go wild.

rday


