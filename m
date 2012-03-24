Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SBUFC-000464-Tj
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 17:55:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 437E1315A5E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:46:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GpJMCGfd8ZBo
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:46:07 +0100 (CET)
Received: from [172.22.22.61] (drms-590eca93.pool.mediaWays.net
	[89.14.202.147])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3954F315A5E6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:46:07 +0100 (CET)
Message-ID: <4F6DFA4E.5020002@opendreambox.org>
Date: Sat, 24 Mar 2012 17:46:06 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120323175301.787D61032F@opal>
	<20120324014107.GE4604@jama.jama.net>
In-Reply-To: <20120324014107.GE4604@jama.jama.net>
Subject: Re: [oe-commits] Andreas Oberritter : procps: use update-alternatives for pwdx, pgrep and watch
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
X-List-Received-Date: Sat, 24 Mar 2012 16:55:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.03.2012 02:41, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 05:53:01PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 68dc2a3fa30c03a196d650de34d0c657a7b85454
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=68dc2a3fa30c03a196d650de34d0c657a7b85454
>>
>> Author: Andreas Oberritter <obi@opendreambox.org>
>> Date:   Fri Mar 23 17:37:36 2012 +0100
>>
>> procps: use update-alternatives for pwdx, pgrep and watch
> 
> Good intention but results in this error in opkg upgrade:
> 
> update-alternatives: Error: cannot register alternative watch to
> /usr/bin/watch since it is already registered to /bin/watch
> 
> can you move one of them or move alternative?
> 
> fwiw: gentoo also has procps's watch in bindir and busybox's in
> base_bindir

Sorry, I didn't notice, because I disabled watch in my busybox config.
I'm going to send a patch to move busybox' watch to /usr/bin.

Regards,
Andreas


