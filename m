Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RzxwB-0002Yj-8U for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:11:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LM3ZMq020286;
	Tue, 21 Feb 2012 22:03:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19096-10; Tue, 21 Feb 2012 22:03:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LM3Tj6020278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Feb 2012 22:03:30 GMT
Message-ID: <1329861809.20261.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: poky <poky@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 22:03:29 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Heads up: basichash being enabled for poky by default
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
X-List-Received-Date: Tue, 21 Feb 2012 22:11:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is just to warn people that I'm going to push a change making
basichash the default for DISTRO=poky as of tomorrow. This change has
been brewing for a while and has seen plenty of discussion. Its time to
throw the switch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?id=f65bbb41d6fe9763acbd80df5885b3526259ce80

I haven't yet decided what should happen when in OE-Core and am open to
opinions on that.

If you're not ready for the change, you can still set:

BB_SIGNATURE_HANDLER = 'OEbasic'

to get the existing behaviour either at a local or distro level. The
difference is one will include the sstate hash in the files in
tmp/stamps/*. This means if the hash changes, it gets rebuilt.

As a result of this commit your tree will rebuild. I'll bump the TMPDIR
ABI version number at the same time so people more easily spot the
change and can either revert or continue at their choice.

Cheers,

Richard







