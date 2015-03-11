Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2534771637
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 10:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2BAJZYJ019277; Wed, 11 Mar 2015 10:19:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gY0CVPV5XZxj; Wed, 11 Mar 2015 10:19:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2BAJKZj019268
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Mar 2015 10:19:31 GMT
Message-ID: <1426069160.9114.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Mar 2015 10:19:20 +0000
In-Reply-To: <1426062809-1844-1-git-send-email-raj.khem@gmail.com>
References: <1426062809-1844-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 10:19:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-11 at 08:33 +0000, Khem Raj wrote:
> - Do not mount /var/volatile to be tmpfs always only when generating
>   readonly rootfs
> - Generate var-volatile.mount unit when using system in readonly-rootfs
>   to mount /var/volatile as tmpfs
> - for sysvinit, mount /var/volatile to be tmpfs if its not already
>   mounted so
> - Use RequiresMountsFor instead of After=, so systemd figures out the
>   needed dependencies for making /var/volatile accessible for journald
>   and not us.
> 
> Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/image.bbclass                                             | 1 +
>  meta/recipes-core/base-files/base-files/fstab                          | 1 -
>  meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh | 2 +-
>  meta/recipes-core/systemd/systemd/journald-volatile.conf               | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)

Which combinations has this been tested with? Given the time the patch
has existed for, I'm sceptical all the combinations we need have been
tested, I'd love to be wrong. 

This is a pretty major change of behaviour and given the problems
previous changes have caused, I'm very very very nervous about what
issues this is going to cause :(.

Cheers,

Richard


