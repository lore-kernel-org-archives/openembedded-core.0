Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0eqB-00026j-Qk for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:28:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JNJjn000952
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:23:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29957-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 20:23:15 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JNBcq000946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:23:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315109909.31478.149.camel@elmorro>
References: <1315109909.31478.149.camel@elmorro>
Date: Mon, 05 Sep 2011 20:23:11 +0100
Message-ID: <1315250591.1243.7.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2][v2] systemtap: upgrade to 1.6
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
X-List-Received-Date: Mon, 05 Sep 2011 19:28:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-03 at 23:18 -0500, Tom Zanussi wrote:
> This patchset upgrades systemtap to 1.6.  The 1.6 version of
> systemtap also has inproved support for arm, so this enables
> it for arm and adds it to qemuarm.
> 
> This upgrade was successfully tested on qemux86, qemux86-64,
> qemuppc, and qemuarm.  The results and the tests can be found
> at the end of the systemtap section on the yocto wiki:
> 
> [v2] changes: address feedback from Saul:
>    PV changed, so update PR for systemtap recipe
> 
> Tom Zanussi (2):
>   systemtap: upgrade to 1.6
>   task-core-tools: add systemtap to qemuarm

Merged to master, thanks.

Richard



