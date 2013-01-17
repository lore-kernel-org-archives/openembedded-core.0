Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvwDX-0001Fv-Hf for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 21:37:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0HKMHZk001992;
	Thu, 17 Jan 2013 20:22:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23524-09; Thu, 17 Jan 2013 20:22:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0HKM8QY001985
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 17 Jan 2013 20:22:10 GMT
Message-ID: <1358454128.27799.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jesse Zhang <sen.zhang@windriver.com>
Date: Thu, 17 Jan 2013 20:22:08 +0000
In-Reply-To: <50F796EF.3040900@windriver.com>
References: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
	<1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
	<1358337581.8129.2.camel@ted> <50F75D56.3050005@windriver.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BB37A@ORSMSX106.amr.corp.intel.com>
	<50F796EF.3040900@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: remove dependency on coreutils-native
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
X-List-Received-Date: Thu, 17 Jan 2013 20:37:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-17 at 14:15 +0800, Jesse Zhang wrote:
> On 01/17/2013 01:37 PM, Kamble, Nitin A wrote:
> > This is bit old (out of my cached memory), but looking at my commit (543577c25b5a4e89a3ab15ee28e754b71c2a43d5) the dependency on coreutils-native is needed if the build system does not have coreutils, or it is not compatible with the sources of the coreutils you are trying to build. And the commit log does show the errors it was hitting, which are solved by using the native version of the coreutils.
> 
> Thanks Nitin. But I don't think there can be any system without
> coreutils. And if there is some compatibility issue (which I haven't been
> able to reproduce on our various hosts), we should be able to trace it
> down to a specific command within coreutils.
> 
> Do you still have some notes on how to reproduce the error?

Looks like its related to help2man. The native versions were being
generated so help2man could generate the man pages correctly. We should
just patch out the generation (or regeneration?) of the man pages...

Cheers,

Richard





