Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 95D5F6AA18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 14:56:52 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 36D37F8121A; Thu,  7 Nov 2013 07:56:54 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9F117F8121E;
	Thu,  7 Nov 2013 07:56:52 -0700 (MST)
Message-ID: <527BAA40.9020305@mlbassoc.com>
Date: Thu, 07 Nov 2013 07:57:04 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Missing dependency?
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
X-List-Received-Date: Thu, 07 Nov 2013 14:56:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm following recent master changes in a build tree that just
gets updated, not necessarily rebuilt.  With this, I just got
this error:

   libpng warning: Application was compiled with png.h from libpng-1.6.6
   libpng warning: Application  is  running with png.c from libpng-1.2.50
   libpng error: Incompatible libpng version in application and library
   Matchbox: error parsing /usr/share/themes/Sato/matchbox/theme.xml
   Error loading resource from <pixmap id='titlebar-left-edge' filename='titlebar-left-edge.png'/>
   The program 'matchbox-panel' received an X Window System error.

Which packages are missing the rebuild (DEPENDS)?  I only see mostly
RDEPENDS via depexp (or should that be sufficient)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

