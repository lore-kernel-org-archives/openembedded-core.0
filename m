Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9B96028A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:21:54 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id S9Mt1o0061mTNtu019Mtvv; Mon, 14 Jul 2014 02:21:53 -0700
Message-ID: <53C3A130.4000900@pabigot.com>
Date: Mon, 14 Jul 2014 04:21:52 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: patchwork client problems
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
X-List-Received-Date: Mon, 14 Jul 2014 09:21:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm finding attempts to use pwclient on 
http://patches.openembedded.org/xmlrpc/ produce an ExpatError because 
the returned document is always empty (per a wireshark trace of the 
transaction).  Can somebody confirm that the server for the command-line 
client is working properly?  Thanks.

Peter


