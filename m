Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U2Yej-000140-TR
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 03:53:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r152bKdH028843
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 18:37:20 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 4 Feb 2013 18:37:18 -0800
Message-ID: <51107072.9070609@windriver.com>
Date: Tue, 5 Feb 2013 10:37:38 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
X-Originating-IP: [128.224.163.154]
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
X-List-Received-Date: Tue, 05 Feb 2013 02:53:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2013 05:26 PM, Laurentiu Palcu wrote:
> Hi,
>
> Re-generating applications' cache every time the system is rebooted is not a
> very efficient process for an embedded device. Usually, the cache directory is
> used by applications to store data resulting from time consmuming I/O or
> calculation. So, this patchset will take out /var/cache from tmpfs.
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
what about /var/log?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3397


