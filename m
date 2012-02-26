Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S1i16-0008SA-Qy
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 18:36:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 222673159686
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 18:27:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ApmQr2iRgUgy
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 18:27:42 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed5c2.pool.mediaWays.net
	[89.14.213.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 594D73159685
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 18:27:42 +0100 (CET)
Message-ID: <4F4A6B8D.5030103@opendreambox.org>
Date: Sun, 26 Feb 2012 18:27:41 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330132760-12519-1-git-send-email-obi@opendreambox.org>
	<D1EF2FB1-9919-42C2-B9D0-E6584B6C7BD8@dominion.thruhere.net>
In-Reply-To: <D1EF2FB1-9919-42C2-B9D0-E6584B6C7BD8@dominion.thruhere.net>
Subject: Re: [PATCH] bzip2: split into binary and library packages
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
X-List-Received-Date: Sun, 26 Feb 2012 17:36:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 25.02.2012 10:02, Koen Kooi wrote:
> 
> Op 25 feb. 2012, om 02:19 heeft Andreas Oberritter het volgende geschreven:
> 
>> * Create libbz2 (and -dev, -staticdev), which can be
>>  installed without the bzip2 executables.
> 
> You need a PR bump for everything that links against libbz2 to ensure clean upgrade paths.

Are you sure? I'm asking because existing packages still depend on
bzip2, which now depends on libbz2.


