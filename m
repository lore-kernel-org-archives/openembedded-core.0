Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TDIE9-0006Zc-BI
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Sep 2012 19:01:49 +0200
Received: (qmail 32383 invoked by uid 1003); 16 Sep 2012 16:49:10 -0000
Received: from unknown (HELO ?130.164.30.11?)
	(philip@opensdr.com@130.164.62.212)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	16 Sep 2012 16:49:10 -0000
Message-ID: <50560305.6060502@balister.org>
Date: Sun, 16 Sep 2012 09:49:09 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: gtk+ build failure fixed vy reverting libffi update
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
X-List-Received-Date: Sun, 16 Sep 2012 17:01:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

With 3e40136e8bd13b17b6d88b6acfb5ed162bb8d96aBBB, gtk+ fails to build 
for me. Reverting it solved the problem.

I supposed this is related to the libffi thread I was ignoring :)

Philip


