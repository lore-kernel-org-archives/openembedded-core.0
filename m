Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYK2O-00024a-ON
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 17:08:04 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 11750C129
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 16:36:28 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AngbANWH305T4zgTPGdsb2JhbAAMN6prAQEBATeCJAEBAQECAThABgsLGAkWDwkDAgECATEUEwgBAYgDCLZGiByDGASUa4kViQ8
X-IronPort-AV: E=Sophos;i="4.71,314,1320620400"; d="scan'208";a="230306849"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 07 Dec 2011 16:36:17 +0100
Message-ID: <4EDF87F2.4000908@emagii.com>
Date: Wed, 07 Dec 2011 16:36:18 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EDF7A02.1070000@emagii.com>
In-Reply-To: <4EDF7A02.1070000@emagii.com>
Subject: Re: connman-gnome_0.5.bb fails: connman-gnome.git is empty
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 07 Dec 2011 16:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-07 15:36, Ulf Samuelsson wrote:
> git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git 
>
>     is empty.    The repo exists, but no content.
>
> Building "connman-gnome_0.5.bb" thus fails.
> Needed by "core-image-sato"
>
> There is a "connman-gnome-m" project on gitorious.
> This seems to be based on the above source package.
>
> Will try it out, but if anyone already tried this?
>
> Any other recommended sources for connman-gnome?
>
Found:
http://autobuilder.yoctoproject.org/pub/sources/git2_git.kernel.org.pub.scm.network.connman.connman-gnome.git.tar.gz 

in an old email to the list from Richard Purdie (before I started 
subscribing).

so I think I am going to download this and set up a git on github so the 
build does
not require a manual download.

> Since I am just trying out OE-core, I could build another image.
> What would be close to x11[-gpe]-image.bb from openembedded classic?
>


-- 
Best Regards
Ulf Samuelsson
eMagii



