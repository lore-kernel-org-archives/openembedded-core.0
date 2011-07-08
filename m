Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDGd-00024w-PG for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:46:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fh85H021410
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:43:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21380-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:43:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fh2v6021404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:43:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9519878B-1008-4E50-BC78-F7AF3E14B24D@dominion.thruhere.net>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<5058763548021532f1b569c63fefd996c4748c1d.1310081443.git.sgw@linux.intel.com>
	<9519878B-1008-4E50-BC78-F7AF3E14B24D@dominion.thruhere.net>
Date: Fri, 08 Jul 2011 16:42:23 +0100
Message-ID: <1310139743.20015.898.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/8] usbutils: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 15:47:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 08:28 +0100, Koen Kooi wrote:
> iirc only the ids package depends on bash, and only to check for wget. Fixing the update script would be better

Agreed and I'll take a follow up patch on this one.

The fix in itself is correct as the script is wanting bash currently.

Cheers,

Richard




