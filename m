Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TYjsM-0004Vx-Jz
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 21:47:58 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8FE56F81219; Wed, 14 Nov 2012 13:34:03 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 597E6F81203;
	Wed, 14 Nov 2012 13:34:02 -0700 (MST)
Message-ID: <50A4004A.1080601@mlbassoc.com>
Date: Wed, 14 Nov 2012 13:34:18 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50A3DDD7.9080205@mlbassoc.com>
	<20121114200632.GC3622@mi.fu-berlin.de>
In-Reply-To: <20121114200632.GC3622@mi.fu-berlin.de>
Subject: Re: Can't build qt4-x11-free
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
X-List-Received-Date: Wed, 14 Nov 2012 20:47:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-14 13:06, Henning Heinold wrote:
> On Wed, Nov 14, 2012 at 11:07:19AM -0700, Gary Thomas wrote:
>> | /local/qemuarm_test/tmp/sysroots/i686-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: cannot find -lGLU
>>
>
> Hi,
>
> did you check if qt actually needs any glu symbols?

Indeed, it's not and this was already fixed in the tree by:
   commit 7ee2410825cb30b7f073c69d8c32a498835f0eec
   Author: Martin Jansa <martin.jansa@gmail.com>
   Date:   Tue Nov 6 00:36:47 2012 +0100

Somehow I missed this when I pulled into my tree which is based
on Poky/Yocto.  I pulled on Nov 9 and I guess the change had not
yet been propagated.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


