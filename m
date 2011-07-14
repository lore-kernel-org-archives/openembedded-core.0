Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhNO4-0006eH-E1 for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:59:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEtb8r008406
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:55:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08183-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:55:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEtVdo008400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:55:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310556139.2378.3.camel@phil-desktop>
References: <201107131215.26777.paul.eggleton@linux.intel.com>
	<1310556139.2378.3.camel@phil-desktop>
Date: Thu, 14 Jul 2011 15:55:26 +0100
Message-ID: <1310655326.20015.1176.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: classes cleanup
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
X-List-Received-Date: Thu, 14 Jul 2011 14:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 12:22 +0100, Phil Blundell wrote:
> On Wed, 2011-07-13 at 12:15 +0100, Paul Eggleton wrote:
> > * flow-lossage.bbclass - unused, looks obsolete (refers to gcc 3.4)
> 
> Agreed, this should be deleted.  It used to be inherited by some of the
> gnome recipes (and, in oe.dev, still is by a few) to work around a
> compiler bug.  But none of the recipes in oe-core do this, and we don't
> ship the affected compiler versions either.
> 
> There is one recipe in meta-oe which inherits this class so I guess that
> should be fixed before it's deleted.

Can someone do that please as I think we should get rid of that class :)

Looking through the list there is nothing I feel we really need to keep
at this point although some like patcher and singlemachine should still
work...

Cheers,

Richard



