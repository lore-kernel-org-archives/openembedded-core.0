Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXCsx-0005Dn-9h
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 15:45:28 +0200
Received: by pzk36 with SMTP id 36so1206066pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ejRsSDpAWOQLRvfiWl/2csrvVujdN66QNz2EXNM9STA=;
	b=UT7Fuxw/rn7WO3ftwmltcItFL5o2OoxbP0LLf/O/LeJRH3eVcyWBRLkx1byiB0nN4u
	M8QjXmVu5Sgv6SgoAasREK950afGOenFp/57L+go836y9iUmxSePhg3/GpJRwJW3IpCy
	etdB+U4GN3kJv9hLhE2C240duz2NhPUj2B9kg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=CRdN82Ui04/zsQp0HZ94wgr/xdarCx56AZfVBtIo7pFmaEqZ7rU/ZVpMEUyIVlcGjY
	BLTkUZfb9aKflsWx2GlDSOJ69oRA7ns7+fKJkMsrnJ9u0/5PXKpMWNzbtA3iZQnmC33e
	JbFLtVf4gwnvPqbwv4tAJxD0GuAzPMwAqYiOI=
Received: by 10.142.127.8 with SMTP id z8mr145233wfc.225.1308231718561;
	Thu, 16 Jun 2011 06:41:58 -0700 (PDT)
Received: from [192.168.1.82] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z39sm934736wfd.23.2011.06.16.06.41.57
	(version=SSLv3 cipher=OTHER); Thu, 16 Jun 2011 06:41:57 -0700 (PDT)
Message-ID: <4DFA0824.5030809@gmail.com>
Date: Thu, 16 Jun 2011 06:41:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308219330.25285.4194.camel@phil-desktop>
In-Reply-To: <1308219330.25285.4194.camel@phil-desktop>
Subject: Re: eglibc testing?
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
X-List-Received-Date: Thu, 16 Jun 2011 13:45:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/2011 3:15 AM, Phil Blundell wrote:
> I just ran "make check" under qemu on my eglibc-2.13 build (from oe-core
> master) and got rather a lot of failures.  It wasn't immediately obvious
> to me whether these were libc bugs, qemu infelicities, oe-related
> harness problems, or some kind of local finger trouble.
>
> Before I spend too much time investigating this, are other people seeing
> the same effect?  What approach do the Yocto folks use for glibc
> testing: are they running the testsuite directly on target hardware, or
> via qemu, or something else?

I nfsmount eglibc builddir on target and run the testsuite. I see aroung 
10-15 fails. Havent run the testsuite in a while

>
> The gcc testsuite is next on my list to look at and, again, I'd be
> interested to hear what approach other folks are using there and what
> sort of results they are currently getting.
>

I have a script that I use to launch cross testing needs a bit of setup
like passwordless ssh access to target. Results are pretty sane I have 
posted results to oe-ml occasionally.

I can start some testsuite once my build finishes today and post.

> thanks
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



