Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2YRr-0003Jk-4N for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 01:30:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2O0St8B015773
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 00:28:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15644-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 00:28:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2O0Sklb015767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 00:28:47 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1300921540-30288-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300921540-30288-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 24 Mar 2011 00:28:44 +0000
Message-ID: <1300926524.3018.70.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] sstate: use only unique set of SSTATETASK
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
X-List-Received-Date: Thu, 24 Mar 2011 00:30:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-24 at 00:05 +0100, Martin Jansa wrote:
> * otherwise strange error like this:
>   ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/armv7a-oe-linux-gnueabi/libtool-cross-2.4-r1/temp/log.do_package_write_ipk.25551
>   Log data follows:
>   | ERROR: Package already staged (/OE/shr-core/tmp/sstate-control/manifest-nokia900-libtool-cross.deploy-ipk)?!
>   | ERROR: Function 'sstate_task_postfunc' failed
>   NOTE: package libtool-cross-2.4-r1: task do_package_write_ipk: Failed
>   ERROR: Task 11 (/OE/shr-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_package_write_ipk) failed with exit code '1'
> 
>   is shown in this case with package_ipk twice in INHERIT
> 
> * Thanks to Richard for fix
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Merged to master, thanks.

Richard



