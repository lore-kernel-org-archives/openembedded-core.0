Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UBOgk-0008PK-7z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 13:03:54 +0100
Message-ID: <51309549.8010502@communistcode.co.uk>
Date: Fri, 01 Mar 2013 11:47:21 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] U-Boot Recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 12:03:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Today I was building an image for the beaglebone with oe-core + 
meta-beagleboard. meta-beagleboard pretty much provides the machine 
definition and the kernel. In order to build the correct u-boot 
(2013.01+) I had to add u-boot 2013.01 to oe-core. Whilst during this I 
noticed the mess that the u-boot directory had become, I think we need 
to have a show of hands who uses what u-boot recipes and can they 
migrate to newer (common) versions.

When I submit a patch to get 2013.01 supported, that would make 4 
different releases of u-boot; which seems a bit excessive.

Thoughts?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



