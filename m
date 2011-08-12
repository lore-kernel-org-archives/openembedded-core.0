Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QrpdY-0001hd-A4
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 13:10:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7CB6FjI005866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 04:06:15 -0700 (PDT)
Received: from [128.224.162.219] (128.224.162.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 12 Aug 2011 04:06:14 -0700
Message-ID: <4E450925.7060101@windriver.com>
Date: Fri, 12 Aug 2011 19:06:13 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Performance Issue: Build time increases
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
X-List-Received-Date: Fri, 12 Aug 2011 11:10:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi folks,

The build time of core-image-sato increases about 5 ~ 10 minutes than
the following commit:

commit 5af197b55a4b779f1ec93186f0723026949ba2b5
Author: Liping Ke <liping.ke@intel.com>
Date:   Fri Jun 3 08:22:40 2011 +0800

     cache: Implement multiple extra cache fields request support

On my host,
1) the build time of 5af197b55a4b779f1ec93186f0723026949ba2b5 is:

real    208m26.133s
user    241m29.280s
sys     47m0.630s

2) and: 068839698fe192d8846c0ed4db65861448e8e524 is:

real    217m39.687s
user    255m34.150s
sys     48m21.510s


I use the bisect build method to find out which patch causes the time
increases, but the build time is not stable on my host(Ubuntu 11.04 64bit),
e.g., the build time of 1) is 208m at the first build, then "git co 
other_commit" and build it, after about 10 builds, then go back to build
5af197b55a4b779f1ec, the build time will increases about 8 minutes, I have
stopped the X and cron, at. This may have relationship with the linux
distribution and disk.

So I have to restart the build, reboot the machine by two days, and go on the
build. It would be better if anyone has other good method.

I think that for the next release(e.g., yocto 1.2), we can find a clean and
stable machine(for the distribution, maybe RHEL is more stable than Ubuntu)
to check the build time weekly, so that we can notice the performance issue
early.

-- 
Thanks

Robert


