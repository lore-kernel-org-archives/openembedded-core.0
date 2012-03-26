Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCBVH-0000kT-GO
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 17:06:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id F02C6315A801;
	Mon, 26 Mar 2012 16:57:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ARPj6bjPRfoC; Mon, 26 Mar 2012 16:57:34 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5e52.pool.mediaWays.net [89.12.94.82])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 39898315A7FF;
	Mon, 26 Mar 2012 16:57:34 +0200 (CEST)
Message-ID: <4F7083DD.8020003@opendreambox.org>
Date: Mon, 26 Mar 2012 16:57:33 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
	<4F7044F5.30500@opendreambox.org>
	<4F707F4E.1060908@opendreambox.org> <5951957.sAPiJHEkf3@helios>
In-Reply-To: <5951957.sAPiJHEkf3@helios>
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
X-List-Received-Date: Mon, 26 Mar 2012 15:06:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26.03.2012 16:48, Paul Eggleton wrote:
> On Monday 26 March 2012 16:38:06 Andreas Oberritter wrote:
>> OK, I managed to find a way that's ok for me. I added a wrapper script that
>> wraps the bitbake wrapper script and sets BUILDDIR automatically.
> 
> I'm actually working on a couple of fixes that should work for your setup right 
> now. If you can wait a little the patches will get posted soon. No additional 
> wrapper scripts necessary.
> 
>> This way I can als get rid of oe-core/scripts from PATH.
> 
> I don't think this is a good idea. If it doesn't cause breakage now I'd be 
> surprised if it didn't in the future.
> 
>> Can you please ack this patch below, though? This keeps your change intact
>> and surely causes no trouble for you.
> 
> This won't be necessary with the fixes I have. The directory where the 
> "pseudodone" file is located is supposed to be your build directory, there's no 
> need to configure it.

I'm not convinced. If I delete tmp, pseudo gets deleted, but pseudodone
stays. In my opinion, pseudodone's intuitive location is tmp, if the
location of tmp is known - which it is in my case.

Can you please at least put $BUILDDIR/pseudodone into a variable, so I
can keep my patch small and maintainable?

Regards,
Andreas


