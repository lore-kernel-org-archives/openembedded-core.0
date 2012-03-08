Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5lBI-00008c-Kj
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 22:47:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D34623158F04;
	Thu,  8 Mar 2012 22:38:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8gcpv8quTI2a; Thu,  8 Mar 2012 22:38:38 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed42d.pool.mediaWays.net [89.14.212.45])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CC4C23159184;
	Thu,  8 Mar 2012 22:38:37 +0100 (CET)
Message-ID: <4F5926DC.2030705@opendreambox.org>
Date: Thu, 08 Mar 2012 22:38:36 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1331175070-12257-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331175070-12257-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH][RFC] bitbake.conf: use empty SRC_URI by default
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
X-List-Received-Date: Thu, 08 Mar 2012 21:47:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08.03.2012 03:51, Andreas Oberritter wrote:
> * Otherwise, recipes that only append to SRC_URI instead of
>   overwriting it will get the full path of the recipe written
>   into the Source: field of the package.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * I haven't tested this yet, I don't know whether there
>   are any caveeats. What's the purpose of having ${FILE}
>   in there, anyway?

Richard, did you commit this by accident? In the meantime I've started a
clean build with this patch applied and noticed eglibc-locale failing,
because opkg-build complains about a missing "Source" field.

Regards,
Andreas



