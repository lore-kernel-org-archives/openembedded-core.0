Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB70877181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 05:54:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1T5sIWK000875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 21:54:18 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 28 Feb 2016 21:54:18 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56D3DD08.5080206@windriver.com>
Date: Mon, 29 Feb 2016 13:54:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1456304688.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/4] make vm + live images can build together
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
X-List-Received-Date: Mon, 29 Feb 2016 05:54:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

On 02/24/2016 05:23 PM, Robert Yang wrote:
> Hello,
>
> These patches can make vm and live images build together, and also make
> the images easier to use.
>
> I'd like to combine the following classes if you are fine with it:
> * boot-directdisk.bbclass and image-vm.bbclass into image-vm.bbclass.
>    They are used for making vm images.
> * bootimg.bbclass and image-live.bbclass into image-live.bbclass.
>    They are used for making live images.
> Combine them can make them easier to understand and also make the
> structure clearer.
>
> // Robert
>
> The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca:
>
>    uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/syslinux
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/syslinux
>
> Robert Yang (4):
>    image-live/boot-directdisk.bbclass: remove AUTO_SYSLINUXCFG
>    boot-directdisk.bbclass: drop IS_VM chechking

The two are merged.

>    syslinux.bbclass: make vm and live can be built together
>    sanity.bbclass: remove conflict checking for image vm and live

How about these 2 please ? These are convenient for testing images,
otherwise we have to build two times to get virtual machine and live
images.

// Robert

>
>   meta/classes/boot-directdisk.bbclass |   21 ++++++++-------------
>   meta/classes/bootimg.bbclass         |    1 +
>   meta/classes/image-live.bbclass      |   17 ++++++++---------
>   meta/classes/image-vm.bbclass        |   15 +++++++--------
>   meta/classes/sanity.bbclass          |   12 ------------
>   meta/classes/syslinux.bbclass        |   23 ++++++++++++++++++-----
>   6 files changed, 42 insertions(+), 47 deletions(-)
>

