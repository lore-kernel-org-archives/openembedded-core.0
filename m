Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPr8-0004aL-AU for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:00:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFv87r005495
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:57:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05275-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:57:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFv34O005489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:57:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308721296.git.xiaofeng.yan@windriver.com>
References: <cover.1308721296.git.xiaofeng.yan@windriver.com>
Date: Wed, 22 Jun 2011 16:56:46 +0100
Message-ID: <1308758206.20015.78.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] task-core-lsb: Add absent libraries and commands to task-core-lsb.bb
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
X-List-Received-Date: Wed, 22 Jun 2011 16:00:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 14:43 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> "tools-profile" and tools-testapps" which include three packages
> "owl-video" , "sysprof" and "alsa-utils-amixer" beside other packages
> were removed from variable "EXTRA_IMAGE_FEATURES" in
> meta-yocto/conf/local.conf.sample. The absent libraries in an lsb
> image depended by the above three packages will be installed into lsb
> image by dependence relationship.
> Absent command:
> |--strip
> Absent Libraries:
> |--libatk-1.0.so.0
> |--libgdk-x11-2.0.so
> |--libcairo.so.2
> |--libpango-1.0.so
> |--libpangoft2-1.0.so.0
> |--libpangoxft-1.0.so.0
> |--libpangocairo-1.0.so 
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: xiaofeng/task-core-lsb
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/task-core-lsb
> 
> Thanks,
>     Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> 
> 
> Xiaofeng Yan (1):
>   task-core-lsb: Add absent libraries and commands to task-core-lsb.bb

Merged to master, thanks.

Richard



