Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Rb70G-0004qP-9b
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 09:49:24 +0100
Received: from [62.99.145.3] (port=19654 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Rb6ng-0005iv-G1
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 09:36:24 +0100
Received: from [83.64.51.210] (port=7014 helo=gateway1.hale)
	by smartmx-03.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1Rb6ne-0004M5-If for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 09:36:22 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pBF8aPPs031807
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 09:36:25 +0100
Received: from entw48 ([192.168.100.138]) by hale.at with MailEnable ESMTP;
	Thu, 15 Dec 2011 09:36:15 +0100
Date: Thu, 15 Dec 2011 09:36:07 +0100 (CET)
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
X-X-Sender: guib@entw48
To: openembedded-core@lists.openembedded.org
Message-ID: <alpine.DEB.2.00.1112150931060.350@entw48>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pBF8aPPs031807
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1324542986.46736@VNpxSZT8RJyR6uFOXDRJRg
X-Spam-Status: No
Subject: SPDX vs LICENSE field valid licenses
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
X-List-Received-Date: Thu, 15 Dec 2011 08:49:24 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hi all,
I want to ask which license style is currently the preferred one? At 
license.bbclass this comment appears:

# Standards are great! Everyone has their own. In an effort to standardize 
licensing
# names, common-licenses will use the SPDX standard license names. In 
order to not
# break the non-standardized license names that we find in LICENSE, we'll 
set
# up a bunch of VarFlags to accomodate non-SPDX license names.
#
# We should really discuss standardizing this field, but that's a longer 
term goal.
# For now, we can do this and it should grab the most common LICENSE 
naming variations.

So the valide license names for recipes are e.g. MPLv1 while the SPDX 
license is MPL-1. Why are we not using MPL-1 at the LICENSE field from 
recipes?

Best regrads,
Bernhard Guillon


--
Scanned by MailScanner.



