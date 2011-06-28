Received: from ocean.emcraft.com ([213.221.7.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1QbV5T-00059A-W1
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 12:00:08 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ocean.emcraft.com with esmtp (Exim 4.71)
	(envelope-from <yanok@emcraft.com>)
	id 1QbV1v-0007EW-Dk; Tue, 28 Jun 2011 13:56:27 +0400
Message-ID: <4E09A570.9070206@emcraft.com>
Date: Tue, 28 Jun 2011 13:57:04 +0400
From: Ilya Yanok <yanok@emcraft.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; ru;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1308182971-23082-1-git-send-email-yanok@emcraft.com>
	<4E0953FB.508@linux.intel.com>
In-Reply-To: <4E0953FB.508@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: bump version to 2011.03
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
X-List-Received-Date: Tue, 28 Jun 2011 10:00:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Darren,

28.06.2011 8:09, Darren Hart wrote:
> These look like good changes to me, with a couple of minor things needed:
>
> 1) Please submit the version change independently from the added
>     patches to keep things functionally distinct.

Hm.. Actually the new version won't build without the patches, so I 
think this should be addressed by a single commit. Maybe I should add a 
note on this in the commit message though...

> 2) The patch from you marked as Submitted: has this received any
>     discussion on the u-boot list?

Yes, it's already applied (with some cosmetic changes). I will repost my 
oe-core with the new versions of U-Boot patches. Please let me know if 
you still think these should be two separate commits.

Regards, Ilya.



