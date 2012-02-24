Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0vfN-0001v0-7v
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 14:58:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 24F6531594E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:50:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id arFNzn2Ib7cY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:50:00 +0100 (CET)
Received: from [172.22.22.61] (drms-590c477b.pool.mediaWays.net [89.12.71.123])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 987B131594E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:50:00 +0100 (CET)
Message-ID: <4F479587.2080402@opendreambox.org>
Date: Fri, 24 Feb 2012 14:49:59 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330088135.32006.14.camel@ted>
In-Reply-To: <1330088135.32006.14.camel@ted>
Subject: Re: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 13:58:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.02.2012 13:55, Richard Purdie wrote:
> Someone recently asked me about using external source trees with
> OE-Core. I was aware of srctree.bbclass in OE-Classic and did start
> looking at it but it has various elements I wasn't so keen on. I
> therefore wondered if I could improve upon it. I did start from that
> code base but came up with:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/a0&id=ac8a54c18c33aaab6758c34a3d6093d3d3384cee
> [patch inline below]
> 
> which I've called externalsrc.bbclass since it behaves a bit
> differently. In particular, all the usual task targets are available.
> 
> As an example usage with the above patch applied:
> 
> cd ~
> tar -xvzf $DL_DIR/libfm-0.1.17.tar.gz
> (creates libfm-0.1.17 in my homedir)
> 
> edit libfm_0.1.17.bb and add:
> 
> inherit externalsrc
> S = "/home/richard/libfm-0.1.17"

Do I need to edit libfm_0.1.17.bb in-place, or can it be stored outside
my layers to be built with bitbake -b, for example?

Does S need to contain an absolute path, or could it be set to a path
relative to the location of the recipe?

It would be nice if it was possible to include bitbake recipes in the
source trees of my projects, which "just work".

I think this was possible with srctree.bbclass, though I never had it
working reliably. I think bitbake -cclean always raised errors.

Regards,
Andreas


