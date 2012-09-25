Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGQUP-0003uK-C8 for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 10:27:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P8EhXn004686;
	Tue, 25 Sep 2012 09:14:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04326-02; Tue, 25 Sep 2012 09:14:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P8EbTZ004680
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 25 Sep 2012 09:14:38 +0100
Message-ID: <1348560878.8662.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2012 09:14:38 +0100
In-Reply-To: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
References: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg-native: Do not use libtool-cross for native recipe
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
X-List-Received-Date: Tue, 25 Sep 2012 08:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 16:55 -0700, Khem Raj wrote:
> This fixes errors when building native recipes like below
> Additionally fix some space issues.
> 
>  /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool:
> line 981: /work/yocto/poky/build/tmp/sysroots/x86_64-linux//bin/sed: No
> such file or directory
> | x86_64-linux-libtool: compile: Failed to create `.libs'
> | make[1]: *** [jaricom.lo] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> |
> /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool:
> line 981: /work/yocto/poky/build/tmp/sysroots/x86_64-linux//bin/sed: No
> such file or directory
> |
> /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool:
> line 981: /work/yocto/poky/build/tmp/sysroots/x86_64-linux//bin/sed: No
> such file or directory
> | x86_64-linux-libtool: compile: Failed to create `.libs'
> | x86_64-linux-libtool: compile: Failed to create `.libs'

This wallpapers over cracks. Why is libtool-native/libtool-cross broken?
Shouldn't we fix whatever is breaking libtool?

Cheers,

Richard



