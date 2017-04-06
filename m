Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id C635977CB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:20:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id A9616265724
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	liezhi.yang@windriver.com
References: <20170405150521.19160-1-romain.perier@collabora.com>
	<20170405150521.19160-2-romain.perier@collabora.com>
	<1491478720.17200.35.camel@linuxfoundation.org>
From: Romain Perier <romain.perier@collabora.com>
Message-ID: <9ea767b3-abdc-41b6-cd7b-5ffd209867e6@collabora.com>
Date: Thu, 6 Apr 2017 14:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491478720.17200.35.camel@linuxfoundation.org>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] logrotate: Bump to 3.11.0
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
X-List-Received-Date: Thu, 06 Apr 2017 12:20:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello,


Le 06/04/2017 à 13:38, Richard Purdie a écrit :
> On Wed, 2017-04-05 at 17:05 +0200, Romain Perier wrote:
>> This commit updates the recipe to the last upstream tag. Then, as the
>> tarball no longer contains the pre-generated Makefile, inherit from
>> autotools
>>
>> [...]
>> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl
>> selinux', d)}"
>> +PACKAGECONFIG ?= "\
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux',
>> '', d)} \
>> +"

Correct, I probably did something wrong during rebase.

> I'm not sure the above should be there, it reverts someone else's
> change?
>
> I am a little nervous of taking this at this point in the release
> too...

What do you think if we backport the systemd service and the systemd
timer from upstream into 3.9.1 and then add support for systemd in the
recipe ? (In the original patches, I have written systemd services
myself) The code of logrotate would be unchanged.

Regards,
Romain



