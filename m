Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U2Isq-0006p7-Vi
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 11:02:42 +0100
Received: from atl4mhob12.myregisteredsite.com
	(atl4mhob12.myregisteredsite.com [209.17.115.50])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r149krDk032743 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 04:46:54 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r149knOO012179 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 04:46:49 -0500
Received: (qmail 4093 invoked by uid 0); 4 Feb 2013 09:46:49 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 4 Feb 2013 09:46:49 -0000
Message-ID: <510F8388.2030809@topic.nl>
Date: Mon, 04 Feb 2013 10:46:48 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 10:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2013 10:26 AM, Laurentiu Palcu wrote:
> Hi,
>
> Re-generating applications' cache every time the system is rebooted is not a
> very efficient process for an embedded device. Usually, the cache directory is
> used by applications to store data resulting from time consmuming I/O or
> calculation. So, this patchset will take out /var/cache from tmpfs.

What if you have a READONLY rootfs? This patch will "break" those 
devices I think.


>
> Thanks,
> Laurentiu
>
> The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:
>
>    qt4: Add space for _appends (2013-02-01 22:49:47 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/remove_cache_from_volatiles
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/remove_cache_from_volatiles
>
> Laurentiu Palcu (5):
>    base-files: remove /var/cache from volatiles
>    fs-perms: remove /var/cache from volatiles
>    initscripts: remove /var/cache from volatiles
>    systemd: remove /var/cache from volatiles
>    rpm: remove /var/volatiles/cache/rpm from the FILEs list
>
>   meta/files/fs-perms.txt                            |    1 -
>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 ++--
>   .../initscripts/initscripts-1.0/volatiles          |    2 --
>   .../systemd/systemd/00-create-volatile.conf        |    1 -
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 -
>   5 files changed, 2 insertions(+), 7 deletions(-)
>



