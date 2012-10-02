Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ5YZ-0006co-0R for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 18:42:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92GTmGt018770;
	Tue, 2 Oct 2012 17:29:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17759-07; Tue,  2 Oct 2012 17:29:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92GTdcQ018764
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 17:29:41 +0100
Message-ID: <1349195382.18301.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Tue, 02 Oct 2012 17:29:42 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6CA2B9@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1349183622.15753.149.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6CA2B9@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] chrpath: We should provide chrpath-replacement-native and install into a native specific directory
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
X-List-Received-Date: Tue, 02 Oct 2012 16:42:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 16:22 +0000, McClintock Matthew-B29882 wrote:
> Docs need to be updated, there was also a build warning if it was not
> installed - did that get removed too?

You still need chrpath installed, this just avoids a different set of
problems in nativesdk and corrected ASSUME_PROVIDED.

Cheers,

Richard



