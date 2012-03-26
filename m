Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SC7Jb-0008L0-1E
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 12:38:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 962A3315A7D2;
	Mon, 26 Mar 2012 12:29:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CdMq6IJjKzv0; Mon, 26 Mar 2012 12:29:10 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5e52.pool.mediaWays.net [89.12.94.82])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 59172315A7D0;
	Mon, 26 Mar 2012 12:29:10 +0200 (CEST)
Message-ID: <4F7044F5.30500@opendreambox.org>
Date: Mon, 26 Mar 2012 12:29:09 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
	<4F6CDB0C.6080809@opendreambox.org> <1593126.6uP6AmPbWl@helios>
In-Reply-To: <1593126.6uP6AmPbWl@helios>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/bitbake: Allow to override path to pseudodone, make BUILDDIR optional
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
X-List-Received-Date: Mon, 26 Mar 2012 10:38:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26.03.2012 12:07, Paul Eggleton wrote:
> On Friday 23 March 2012 21:20:28 Andreas Oberritter wrote:
>> how do you propose to go on solving this problem?
> 
> My original patch solved a problem for many newer users who forget to cd back 
> to their build directories before running bitbake. At least now they get a 
> reasonable error message they can understand. I'm not going to support 
> reverting it unless we have a practical alternative and so far I don't see 
> one.
> 
> Your original reason for using the configuration you use was that pseudo was 
> being rebuilt for every new configuration. I have a fix here locally which will 
> skip doing this - it just needs to call bitbake -e in order to find out 
> STAGING_BINDIR_NATIVE if pseudodone hasn't been created.

Yes, this was my original reason (or better: the first one I mentioned).

However, I still don't want to export BUILDDIR just to run bitbake. It's
much more convenient to just have to call bitbake directly from every
machine's build directory than having to set up the environment every
single time the machine changes. How are me and my distro's users
supposed to do this in the future?

Can't bitbake just print a useful error message on its own if it doesn't
find a usable configuration?

Regards,
Andreas


