Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SUjHI-0002uT-4V
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:48:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C4988315C371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 20:38:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Tuzj2DKsGuuv
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 20:38:46 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d015b29.pool.mediaWays.net [77.1.91.41])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0C463315C370
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 20:38:46 +0200 (CEST)
Message-ID: <4FB3F434.2040703@opendreambox.org>
Date: Wed, 16 May 2012 20:38:44 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
In-Reply-To: <89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 16 May 2012 18:48:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16.05.2012 19:17, Koen Kooi wrote:
> 
> Op 16 mei 2012, om 18:55 heeft Andreas Oberritter het volgende geschreven:
> 
>> * Calling "systemctl disable" from postrm is too late and
>>  causes the following error:
>>
>> | Failed to issue method call: No such file or directory
>>
>> * Fix indentation of prerm for resulting shell snippet.
>> * Messing with $D is not needed in *rm scripts.
> 
> It very much is, you can offline remove scripts just like you can install them.

What's the use case for removing packages offline and where in OE is
this used? Is the majority of prerm- and postrm-scripts prepared for that?

Regards,
Andreas


