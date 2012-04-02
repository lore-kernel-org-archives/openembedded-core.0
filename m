Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SEpDg-0003zh-EL
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:55:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 79693315ACCB;
	Mon,  2 Apr 2012 23:46:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id KATbu2Nlx3PA; Mon,  2 Apr 2012 23:46:10 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014fab.pool.mediaWays.net [77.1.79.171])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 80A55315ABF9;
	Mon,  2 Apr 2012 23:46:10 +0200 (CEST)
Message-ID: <4F7A1E21.1070600@opendreambox.org>
Date: Mon, 02 Apr 2012 23:46:09 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
	<20120402210859.GA26880@sakrah.homelinux.org>
In-Reply-To: <20120402210859.GA26880@sakrah.homelinux.org>
Subject: Re: [PATCH] parted: don't pass --disable-Werror to configure
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
X-List-Received-Date: Mon, 02 Apr 2012 21:55:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02.04.2012 23:08, Khem Raj wrote:
> On (15/03/12 02:08), Andreas Oberritter wrote:
>> * Fixes the following warning:
>>
>> | configure: WARNING: unrecognized options: --disable-Werror
> 
> 
> should 'W' be 'w' in --disable-Werror

Maybe (didn't verify), but it doesn't seem to be required anyway, so
it's better to not use the option.

Regards,
Andreas


