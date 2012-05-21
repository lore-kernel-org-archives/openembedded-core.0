Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWPhE-0006Rh-SH
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 12:18:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C4FDA315C63D;
	Mon, 21 May 2012 12:08:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BMAcQXbsA2tX; Mon, 21 May 2012 12:08:23 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ed1c8.pool.mediaWays.net
	[89.14.209.200])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9AAF3315C63A;
	Mon, 21 May 2012 12:08:23 +0200 (CEST)
Message-ID: <4FBA1416.3050102@opendreambox.org>
Date: Mon, 21 May 2012 12:08:22 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
	<lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 10:18:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21.05.2012 11:18, Enrico Scholz wrote:
> Andreas Oberritter <obi@opendreambox.org> writes:
> 
>>>> What's the use case for removing packages offline
>>>
>>> I am developing very much with NFS root filesystems (--> the temporary
>>> image directory which is kept by IMAGE_KEEPROOTFS=1).  Packaging operations
>>> like install, remove or upgrade are common actions to test recipes and
>>> applications.
>>
>> Just to make sure we're talking about the same thing: Do you run
>> opkg-cl on the build machine to remove or upgrade packages inside the
>> target's NFS root?
> 
> yes; I am working on the build machine. The NFS filesystem is mounted
> read-only on the target.

How do you handle prerm and postrm scripts that fail because $D is set?
How do you handle the majority of scripts that don't care about $D at
all? I think your use case is unsupported and always will be.

In contrast, packages having failing postinst scripts will re-run their
scripts on the target on first boot.

Regards,
Andreas


