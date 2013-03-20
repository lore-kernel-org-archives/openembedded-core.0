Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UISyG-0004Gq-Ml for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 01:03:05 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2KNtU9c017894 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 23:55:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rWOBWgK55Km2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 23:55:30 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2KNtO8F017867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 23:55:28 GMT
Message-ID: <1363823158.16482.131.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 23:45:58 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Thu, 21 Mar 2013 00:03:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As people know, feature freeze was at the start of the week. I've been
trying to ensure the remaining patches get rounded up and into the
build.

At the same time, the Yocto Project Autobuilder infrastructure has been
undergoing an upgrade to new software. I really wanted this to happen
now as if it doesn't it has to be postponed until after release and we
need features and efficiency in the new codebase.

Unfortunately its highlighted a number of issues, particularly races
and my bandwidth has been sucked into helping trying to fix the sanity
test failures. I have fast tracked some patches into master in the
qemu-testlib code with that in mind since the autobuilder is pretty
critical to how we maintain stability of OE-Core.

This combined with an abnormally high meeting load has meant there are
some things I haven't been able to do. I am unfortunately totally max'd
out atm, people's patience is appreciated.

Cheers,

Richard



