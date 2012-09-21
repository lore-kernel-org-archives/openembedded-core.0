Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TF3Y1-0001n3-GC
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 15:45:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8LDWq8k022082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 06:32:52 -0700 (PDT)
Received: from [128.224.170.151] (128.224.170.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 21 Sep 2012 06:32:51 -0700
Message-ID: <505C6C8A.9000800@windriver.com>
Date: Fri, 21 Sep 2012 16:32:58 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: binutils fails to set ld.gold as default
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
X-List-Received-Date: Fri, 21 Sep 2012 13:45:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I am facing an issue trying to use ld.gold as the default ld on a poky 
build. I've added to my build's conf/local.conf DISTRO_FEATURES_append = 
"ld-is-gold" so I get in 
tmp-eglibc-eglibc/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-oe-linux-gnueabi 
the following (amongst others):

arm-oe-linux-gnueabi-ld
arm-oe-linux-gnueabi-ld.bfd
arm-oe-linux-gnueabi-ld.gold

All good so far. But looking into 
tmp-eglibc-eglibc/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.7.2 
I see:

ld -> 
../../../../../bin/armv7a-vfp-neon-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld

 From the binutils.inc recipe, in EXTRA_OECONF: 
${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default 
--enable-threads', '', d)}
Shouldn't that have made ld point to ld.gold?

Any thoughts/ideas on why this is happening?

Thank you,
Florin


