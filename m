Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RzyQ1-0003WO-8k
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:42:45 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 85A56F81221; Tue, 21 Feb 2012 15:34:26 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4EDE0F81220;
	Tue, 21 Feb 2012 15:34:25 -0700 (MST)
Message-ID: <4F441BF1.6090404@mlbassoc.com>
Date: Tue, 21 Feb 2012 15:34:25 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1329861809.20261.68.camel@ted>
In-Reply-To: <1329861809.20261.68.camel@ted>
Subject: Re: Heads up: basichash being enabled for poky by default
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
X-List-Received-Date: Tue, 21 Feb 2012 22:42:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-21 15:03, Richard Purdie wrote:
> This is just to warn people that I'm going to push a change making
> basichash the default for DISTRO=poky as of tomorrow. This change has
> been brewing for a while and has seen plenty of discussion. Its time to
> throw the switch:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?id=f65bbb41d6fe9763acbd80df5885b3526259ce80
>
> I haven't yet decided what should happen when in OE-Core and am open to
> opinions on that.
>
> If you're not ready for the change, you can still set:
>
> BB_SIGNATURE_HANDLER = 'OEbasic'
>
> to get the existing behaviour either at a local or distro level. The
> difference is one will include the sstate hash in the files in
> tmp/stamps/*. This means if the hash changes, it gets rebuilt.
>
> As a result of this commit your tree will rebuild. I'll bump the TMPDIR
> ABI version number at the same time so people more easily spot the
> change and can either revert or continue at their choice.

For those of us not using DISTRO=poky, what are the pros & cons
of the various signature handler settings?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


