Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5l3i-0008PV-EW
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 22:39:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 75E2F3159E7D;
	Thu,  8 Mar 2012 22:20:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6elJkCyH-657; Thu,  8 Mar 2012 22:19:47 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed42d.pool.mediaWays.net [89.14.212.45])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 23B483159E7A;
	Thu,  8 Mar 2012 22:19:47 +0100 (CET)
Message-ID: <4F592271.1040407@opendreambox.org>
Date: Thu, 08 Mar 2012 22:19:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1331241161-13878-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331241161-13878-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH v2] udev-164: don't hardcode path to pidof
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
X-List-Received-Date: Thu, 08 Mar 2012 21:39:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08.03.2012 22:12, Andreas Oberritter wrote:
> * pidof lives in /bin, search it in $PATH.
> * Assume pidof's presence.
> * Remove -e shell option, because pidof may return nonzero.

I just noticed that v1 was already merged, so I'll send an incremental
patch in a minute.

Regards,
Andreas



