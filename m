Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RrTuG-0007dT-6W
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 13:30:52 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 11071C2CE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 13:23:00 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuQcAJY5JU9T4znVPGdsb2JhbAAMN65wAQEBATeCJAEBAQECAQEBATU2ChELGAkWDwkDAgECARUBGxQGDQYCAQEFh3MJt2SIPQEDAgIECgIBDAQDBEqCchkEAgoCDQcBdAEBAQEBAQGDSwSSc4IniwiHSg
X-IronPort-AV: E=Sophos;i="4.71,587,1320620400"; d="scan'208";a="258364808"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.57.213])
	by ipb2.telenor.se with ESMTP; 29 Jan 2012 13:23:00 +0100
Message-ID: <4F253A25.7010601@emagii.com>
Date: Sun, 29 Jan 2012 13:23:01 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F24F822.1010102@emagii.com>
	<CAMKF1spQSH0kS6LKTOBP2wqtsL_NBLRhPNqejqwhQCy=K0cjMg@mail.gmail.com>
In-Reply-To: <CAMKF1spQSH0kS6LKTOBP2wqtsL_NBLRhPNqejqwhQCy=K0cjMg@mail.gmail.com>
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
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
X-List-Received-Date: Sun, 29 Jan 2012 12:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2012-01-29 11:21, Khem Raj skrev:
> On Sat, Jan 28, 2012 at 11:41 PM, Ulf Samuelsson
> <openembedded-core@emagii.com>  wrote:
>> Don't know why, but it is no longer available (used to be).
>>
>> "openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb"
>> is thus broken.
>>
>> Found it on a mirror.
>>
>> "http://ftp.tlk-l.net/pub/mirrors/kernel.org/linux/utils/kernel/module-init-tools/"
>>
>> but it would be nice if it was cached somewhere.
> autobuilder.yoctoproject.org should have it
>
But not in a form that can be used to "unbreak" the build


openembedded-core/meta/classes/mirros.bbclass contains:

${KERNELORG_MIRROR}    http://www.kernel.org/pub \n \
${KERNELORG_MIRROR}    ftp://ftp.us.kernel.org/pub \n \
${KERNELORG_MIRROR}    ftp://ftp.uk.kernel.org/pub \n \
${KERNELORG_MIRROR}    ftp://ftp.hk.kernel.org/pub \n \
${KERNELORG_MIRROR}    ftp://ftp.au.kernel.org/pub \n \
${KERNELORG_MIRROR}    ftp://ftp.jp.kernel.org/pub \n \

I assume that bitbake will try this list of servers, when the recipe
is referring to ${KERNELORG_MIRROR}

Only the first mirror is online. (At least today) so there is really
no backup, if the main server is down.

Any objections to adding
${KERNELORG_MIRROR}    ftp://ftp.sunet.se/pub/Linux/kernel.org \n \
to mirrors.bbclass as the second entry ?


>> openembedded-core@lists.openembedded.org
>>
>> --
>> Best Regards
>> Ulf Samuelsson
>> eMagii
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



