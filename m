Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SNZ2p-0001jw-Jo
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 02:28:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 117CC315B8C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 02:18:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Mzax5wI5J31m
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 02:18:34 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2CD8F315B8C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 02:18:34 +0200 (CEST)
Message-ID: <4F99E5D8.7050002@opendreambox.org>
Date: Fri, 27 Apr 2012 02:18:32 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
	<FCF33DC9-ABF3-42B2-BC2B-CE01C66083D3@dominion.thruhere.net>
In-Reply-To: <FCF33DC9-ABF3-42B2-BC2B-CE01C66083D3@dominion.thruhere.net>
Subject: Re: [PATCH] opkg-collateral: import fixes from OE-Classic
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
X-List-Received-Date: Fri, 27 Apr 2012 00:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 27.04.2012 00:39, Koen Kooi wrote:
> 
> Op 27 apr. 2012, om 00:19 heeft Andreas Oberritter het volgende geschreven:
> 
>> * Set lists_dir to /var/lib/opkg
>>
>>  commit 16808bc4817492beba512f4e73bce8c232d1eafa
>>  Author: Marcin Juszkiewicz <hrw@openembedded.org>
>>  Date:   Mon Mar 17 23:40:48 2008 +0000
>>
>> * Update new options sample and move the opkg.conf to correct place
>>
>>  commit cc9825d97962287df75e164aec456901292e1b7f
>>  Author: Tick Chen <ticktock35@gmail.com>
>>  Date:   Mon Dec 29 19:41:47 2008 +0800
> 
> is this still needed? Angstrom hasn't used it in 4 years or so.

Yes. That's why I submitted the patch in the first place. Of course, you
can create opkg's config manually instead, if you prefer to, or just use
the defaults.

Regards,
Andreas


