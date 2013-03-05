Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCvmP-0006W6-U1 for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 18:36:02 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25HQpUr016677 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 17:27:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GMKgY+LNVUCK
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2013 17:27:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25HRCZP016703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 17:27:15 GMT
Message-ID: <1362503953.11727.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Mar 2013 17:19:13 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: Commit messages becoming too short
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
X-List-Received-Date: Tue, 05 Mar 2013 17:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There appears to be a general trend towards short commit messages. I
don't impose a "must have a long log and short log" policy but I'll have
to if things don't improve.

To be clear, the commit message needs to say not just what changed but
*why* the change is necessary, e.g. what error it causes without it.

Commit messages need to stand alone without reference to any linked
bugzilla entry either, that is just there as a way to further look at
the issue.

I'm going to be getting stricter about this.

Cheers,

Richard



