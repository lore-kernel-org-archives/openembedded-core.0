Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qelbr-0003x8-09 for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:15:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67AB8xX026757;
	Thu, 7 Jul 2011 11:11:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26283-09; Thu,  7 Jul 2011 11:11:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67AAvmD026743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Jul 2011 11:10:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309933834.git.anders@chargestorm.se>
References: <cover.1309933834.git.anders@chargestorm.se>
Date: Thu, 07 Jul 2011 11:10:21 +0100
Message-ID: <1310033421.20015.810.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v6 0/2] Linux 3.0 build support
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
X-List-Received-Date: Thu, 07 Jul 2011 10:15:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 08:31 +0200, Anders Darander wrote:
> v6: All patches from v5 has been applied, apart from one. (patch 0001 in this
>     series)
>     - Updated the patch in question with the comments from v5. (HOTPLUG and
>     PCMCIA_MANAGER related changes).
>     - Added a patch to remove kernel-module-rtc-sa1100 from task-base. No
>     patch supplied to add kernel-module-rtc-sa1100 to the affected
>     machines. Thus, this patch can be dropped, if it risks too much.
> 
> 
> ===============
> 
> This patch series is the continuation of the series adding kernel 3.0 support
> to oe-core. One patch from the original series were not applied to master by
> mistake (patch 0001 in this continuation).
> 
> The second patch is to remove machine specific features from task-base, as
> suggested in a comment to v5 of patch 0001. However, the rtc-module in
> question, has not been added to the affected machines. 
> 
> Even if patch 0002 is not applied (as the affected machines are not fixed), I
> think that patch 0001 should be applied.
> 
> Regards,
> Anders
> 
> 
> The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:
> 
>   x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)
> 
> are available in the git repository at:
>   git://github.com/darander/oe-core kernel-3.0
>   https://github.com/darander/oe-core/tree/kernel-3.0
> 
> Anders Darander (2):
>   task-base: remove modutils reference.
>   task-base: remove unconditional inclusion of kernel-module-rtc-sa1100

Merged to master, thanks.

The affected PXA/SA1100 machines will just have to catch up with the rtc
change...

Cheers,

Richard



