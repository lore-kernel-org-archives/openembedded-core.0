Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SBB4L-0004G3-P2
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 21:26:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7A2B5315A45D;
	Fri, 23 Mar 2012 21:17:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dNG3QibSfWPD; Fri, 23 Mar 2012 21:17:40 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec3b4.pool.mediaWays.net
	[89.14.195.180])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 02EBE315A45A;
	Fri, 23 Mar 2012 21:17:39 +0100 (CET)
Message-ID: <4F6CDA62.3070908@opendreambox.org>
Date: Fri, 23 Mar 2012 21:17:38 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331345726-9577-1-git-send-email-obi@opendreambox.org>
	<4F5E1672.7090706@windriver.com> <1331567634.15192.20.camel@ted>
In-Reply-To: <1331567634.15192.20.camel@ted>
Subject: Re: [PATCH] package_ipk: apply umask to control and conffiles
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
X-List-Received-Date: Fri, 23 Mar 2012 20:26:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.03.2012 16:53, Richard Purdie wrote:
> On Mon, 2012-03-12 at 10:29 -0500, Mark Hatle wrote:
>> On 3/9/12 8:15 PM, Andreas Oberritter wrote:
>>> * Explicitly set umask to 022. Otherwise the build system's
>>>    umask leaks into the image.
>>
>> I'm surprised that do_package_ipk[umask] didn't work.  Perhaps its the way it's 
>> being invoked that is the issue.  (If bitbake doesn't run it, but something else 
>> does.. then the umask setting doesn't get used.)
>>
>> As for the change of the umask, the changes appear to be specific to the ipk 
>> case.  Is this the desired behavior, or could deb and rpm suffer from similar 
>> issues?  (I'm not familiar enough with opkg to know how it handles umask 
>> settings during package install/rootfs construction..)
>>
>> I believe that RPM sets a default umask when it goes through it's package 
>> installs/rootfs generation.  But does DEB?
> 
> I'm also a bit worried about this patch. I'd like to understand why a
> task level umask doesn't work. That shouldn't even make any difference
> since the permissions/owners/users from install should be getting
> used...
> 
> Cheers,
> 
> Richard

Richard,

can you please give some advise on how to continue with this issue?

Regards,
Andreas


