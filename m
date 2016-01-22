Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Jan 2016 15:43:49 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C803E605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D47CE315EE07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:38:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BEeMBWAgzB0a
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:38:17 +0100 (CET)
Received: from [172.22.22.61] (55d46ff4.access.ecotel.net [85.212.111.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 413E1315EE06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:38:17 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <56A22767.7050000@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56A24CE8.8010501@opendreambox.org>
Date: Fri, 22 Jan 2016 16:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56A22767.7050000@linux.intel.com>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 15:43:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 22.01.2016 13:58, Alexander Kanavin wrote:
> Hello,
> 
> DirectFB upstream project has been dead for several months, the website
> has completely disappeared, and no explanation or apology has ever
> surfaced. [1]
> 
> So let's keep DirectFB in the forthcoming release, but drop it early in
> the next release cycle.
> 
> [1] http://www.phoronix.com/scan.php?page=news_item&px=DirectFB-Is-It-Gone

FWIW, https://github.com/deniskropp/DirectFB is the new location of the
upstream repository. I see that you opened an issue there, so you're
already aware. The last commit is from October 2015.

I guess many other projects in OE-Corew have seen much less activity. So
what's the real reason for this proposal? Failing update scripts?

Regards,
Andreas


