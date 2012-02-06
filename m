Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RuOJo-0000Mb-Do for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 14:09:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q16D1FOL017593
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 13:01:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16021-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2012 13:01:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q16D19jE017587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 13:01:10 GMT
Message-ID: <1328533275.24049.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 13:01:15 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Performance numbers
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
X-List-Received-Date: Mon, 06 Feb 2012 13:09:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its been a while since we had some performance numbers and there were
recently some questions about how current build time compared to
previous numbers.

On my 12 core system, build time for qemux86 from scratch is ~42
minutes. This compares favourably with previous numbers from that
system. Interestingly, switching to qemumips resulted in a build time of
43 minutes in the same tmpdir suggesting that the native part of the
bootstrap process isn't the bottleneck.

On the quad core (the system used for many of the previous numbers I'd
provided), build time for qemux86 was 105 minutes which again is roughly
consistent with where things were for 1.1.

So things haven't changed much recently which is as I'd expect. We
haven't seen many performance related patches but its good to know
things aren't regressing either.

Cheers,

Richard





