Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Swxi0-0003xX-2N for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 17:53:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72FfR9R009221;
	Thu, 2 Aug 2012 16:41:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05174-05; Thu,  2 Aug 2012 16:41:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72FfJle009215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Aug 2012 16:41:20 +0100
Message-ID: <1343922080.9756.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Thu, 02 Aug 2012 16:41:20 +0100
In-Reply-To: <501A9CA6.6020704@communistcode.co.uk>
References: <501A43F2.7020209@communistcode.co.uk>
	<1343914820.9756.74.camel@ted> <501A9CA6.6020704@communistcode.co.uk>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qemu refusing to build
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
X-List-Received-Date: Thu, 02 Aug 2012 15:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-02 at 16:28 +0100, Jack Mitchell wrote:
> How would I manually attempt to configure? There are no files what so 
> ever in the 
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1 
> directory.

Well, that is a big help to know. It sounds like something has wiped the
work directory and its then trying to rebuild it. Are you using rm_work
of some kind? It sounds like some kind of malfunction has occurred with
it...

Cheers,

Richard.



