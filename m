Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TpkEn-0006hW-8L
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 19:37:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Dec 2012 10:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,386,1355126400"; d="scan'208";a="240680053"
Received: from unknown (HELO [10.255.14.82]) ([10.255.14.82])
	by orsmga001.jf.intel.com with ESMTP; 31 Dec 2012 10:22:18 -0800
Message-ID: <50E1D7DA.4060605@linux.intel.com>
Date: Mon, 31 Dec 2012 10:22:18 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1356626500.git.sgw@linux.intel.com>
	<1356947154.28649.21.camel@ted>
In-Reply-To: <1356947154.28649.21.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/26] Next batch, mostly updates
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
X-List-Received-Date: Mon, 31 Dec 2012 18:37:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/2012 01:45 AM, Richard Purdie wrote:
> On Thu, 2012-12-27 at 08:46 -0800, Saul Wold wrote:
>> Here is another batch of patches, mostly straightforward updates.
>>
>> I would like a little more review of Constantin's multilib allarch
>> patch, it seems OK to me, but want your eyes on it also. It built OK
>> on the AB.  I will be trying a world build with his next patch set.
>
> Its not perfect, we have some issues with packagegroup, allarch and
> multilib combining badly however it does massively improve the situation
> for things like kernel modules and other allarch packages so I merged
> that.
>
>> The following changes since commit 69bbce0176183b0dc14eda21e4f6b601443060f0:
>>
>>    libpng: fix packaging (2012-12-25 14:00:22 -0800)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>>
>> Constantin Musca (17):
>>    ethtool: upgrade to 3.7
>>    freetype: upgrade to 2.4.11
>>    gnome-doc-utils: upgrade to 0.20.10
>>    gsettings-desktop-schemas: add recipe
>>    gthumb: remove recipe
>>    json-glib: upgrade to 0.15.2
>>    libcroco: upgrade to 0.6.8
>>    libsoup-2.4: upgrade to 2.40.2
>>    libuser: upgrade to 0.58
>>    matchbox-panel-2: fix PV
>>    menu-cache: upgrade to 0.4.1
>>    metacity: upgrade to 2.34.13
>>    shared-mime-info: upgrade to 1.0
>>    libcroco: fix license
>>    multilib: fix allarch/kernel/module-base multilib issues
>>    xserver-xorg: enable multilib
>>    xorg-driver: enable multilib
>>
>> Marko Kati? (1):
>>    udev: Remove deprecated binaries from packaging
>
> This commit message is still odd looking.
>
>> Marko Lindqvist (2):
>>    curl: update to upstream version 7.28.1
>>    sqlite: update to upstream version 3.7.15.1
>>
>> Martin Jansa (2):
>>    xf86-video-omap: skip package if opengl isn't in DISTRO_FEATURES
>>    webkit-gtk: fix build with bison-2.6+
>>
>> Noor Ahsan (1):
>>    cairo: Adds libxext in X11DEPENDS.
>
> No, we shouldn't be depending on libxext. Ross will not be happy about
> this. See Ross. Ideally we shouldn't have libxext in the images at all.
>
> Otherwise merged to master, thanks.
>

Thanks and Happy New Year to you!

Seems to be merged to OE-Core, but not Master yet!!

Talk with you in the new year!

Sau!


> Cheers,
>
> Richard
>
>


