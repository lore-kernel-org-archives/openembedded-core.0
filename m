Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5864F605A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 08:02:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8C8GOmm031454; Thu, 12 Sep 2013 09:16:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Nxm_ea93OZUM; Thu, 12 Sep 2013 09:16:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8C8GITP031448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 12 Sep 2013 09:16:19 +0100
Message-ID: <1378972945.3484.217.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hans =?ISO-8859-1?Q?Beck=E9rus?= <hans.beckerus@gmail.com>
Date: Thu, 12 Sep 2013 09:02:25 +0100
In-Reply-To: <CAFyqS9rx5ycOOzfxkCxr5N+wCKBTgqQYjzzmc3CA5u-MZNHA1g@mail.gmail.com>
References: <1378892564.3484.172.camel@ted>
	<CAFyqS9rx5ycOOzfxkCxr5N+wCKBTgqQYjzzmc3CA5u-MZNHA1g@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image/populate_sdk: Ensure symlinks in target sysroot are relative
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2013 08:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2013-09-12 at 09:48 +0200, Hans Beckérus wrote:
> I have a slight problem with this patch. The new
> sysroot-relativelinks.py does not obtain the proper access protection
> bits!?
> Which results in the following error when packaging the SDK
> 
> /home/poky/build/tmp/work/zynq_zc706-poky-linux-gnueabi/rootfs-default/1.0-r0/temp/run.populate_sdk_image.20803:
> line 496: /home/poky/scripts/sysroot-relativelinks.py: Permission
> denied
> 
> [home/poky]: ls -l scripts/sysroot-relativelinks.py
> -rw-rw-r-- 1  poky poky 959 Sep 12 09:38 scripts/sysroot-relativelinks.py
> 
> The execution bit is missing!?
> 
> I can of course apply the execution bit manually, but what may cause
> the patch to not set the bits properly in my scripts folder for new
> files? Please advise.

I checked the poky and oe-core trees and they have a+x:

http://git.yoctoproject.org/cgit.cgi/poky/tree/scripts
http://git.openembedded.org/openembedded-core/tree/scripts

so I'm a bit puzzled. How did you update your tree?

Cheers,

Richard


