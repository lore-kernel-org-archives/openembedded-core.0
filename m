Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC0FC6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 11:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E84201829F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BfAUgeaWiiua
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 728B4182EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57E3E1A0AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C45E1A0AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by seth.se.axis.com (Postfix) with ESMTP id 3F6BD22C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 3B4D3409BD; Thu, 19 Apr 2018 13:17:30 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 13:17:29 +0200
Message-Id: <20180419111730.10269-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1522849430.11431.367.camel@linuxfoundation.org>
References: <1522849430.11431.367.camel@linuxfoundation.org>
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] package.bbclass: Include dbgsrc for static libs
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
X-List-Received-Date: Thu, 19 Apr 2018 11:17:31 -0000

You were right, I needed to check if it was a proper file.

I stumbled into another issue, that golang .a files can not be read by
dwarfsrcfiles.  I'm not familiar with go, so I don't really know what
to do about it.  This patch is still an improvement in my book, even
if it cannot handle go archives.

New in v2:
 * do not process symbolic links
 * do not process golang .a files


