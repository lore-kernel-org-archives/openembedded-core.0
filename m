Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 840596B3D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:15:17 +0000 (UTC)
Received: from [69.196.158.250] (port=34137 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VjqZo-0000vK-6Q for openembedded-core@lists.openembedded.org;
	Fri, 22 Nov 2013 08:15:16 -0500
Date: Fri, 22 Nov 2013 08:15:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1311220812240.14584@oneiric>
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
Subject: is there an easy way to see the actual files that went into a package?
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
X-List-Received-Date: Fri, 22 Nov 2013 13:15:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  if i use "bb show" to examine the files that go into each package
(eg, for "zlib" here), what i get is the collection of wildcards that
will, of course, still be processed when sequentially creating each
package:

$ bb show -r zlib FILES_zlib-dev
Parsing recipes..done.
# FILES_zlib-dev=${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la
${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig
${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
${base_libdir}/*.la
FILES_zlib-dev="/usr/include /lib/lib*.so /usr/lib/lib*.so
/usr/lib/*.la /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig
/usr/share/aclocal /lib/*.o /usr/lib/zlib/*.la /lib/*.la"
$

  is there an equivalently simple way to display the end result of the
contents of each package?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

