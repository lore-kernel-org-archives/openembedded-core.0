Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdjaF-000403-PE for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 15:53:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64DnHLA018465;
	Mon, 4 Jul 2011 14:49:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17993-08; Mon,  4 Jul 2011 14:49:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64Dn7Ho018459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 4 Jul 2011 14:49:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A20949386F@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A200B1C93F@shsmsx502.ccr.corp.intel.com>
	<1309779592.20015.661.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6A20949386F@shsmsx502.ccr.corp.intel.com>
Date: Mon, 04 Jul 2011 14:48:39 +0100
Message-ID: <1309787319.20015.670.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Wold, Saul" <saul.wold@intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: The swap partition's size is too big for BSP?
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
X-List-Received-Date: Mon, 04 Jul 2011 13:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-04 at 20:02 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote:
> > For reference if you want to do suspend to disk (swap) you need a lot
> > of swap space btw. Still no where near that much though!
>
> Does (or should )Yocto Linux support suspend-to-disk? I'm not sure about this.
> BTW: Linux can alse use a regular file as swap area.
> So in case the swap size is not enough (e.g., for suspend-to-disk), I
> think a user could create a big enough file  to meet the need (I
> didn't test this with Linux yet).

I don't think we've supported it in the past, its just a datapoint to
keep in mind.

For reference, you can't use a file easily since the VM data needs to be
available as the kernel boots to be able to resume from it.

Cheers,

Richard




