Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QrmGu-0004HH-6F
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:35:12 +0200
Received: by qyk9 with SMTP id 9so2034852qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kegAg9Qh3s5E+QFDaC8g/MYhliFafN2U22KXIJ7y2Ik=;
	b=OtT3AvlteW26lI6iG4Vhmwc7JEa/VrLwmD2OaBNLZCT7HFaswqajvkqFGJUXE76niC
	kaiKwuidcp/jBnHqUYcb/cz6ejG8oFfU1oivu/Xt9+2Og9kKq114dpP7Dn2hDbCs/Bov
	QDdZ/8YsgHhhtk0WrFW8Bcx/G7CSrWDDqMtx4=
MIME-Version: 1.0
Received: by 10.229.7.141 with SMTP id d13mr412090qcd.21.1313134239420; Fri,
	12 Aug 2011 00:30:39 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Fri, 12 Aug 2011 00:30:39 -0700 (PDT)
In-Reply-To: <20110812062739.GC13857@denix.org>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<20110812062739.GC13857@denix.org>
Date: Fri, 12 Aug 2011 09:30:39 +0200
Message-ID: <CAGiJk9c39t_yvDXbT-ODOXv88hSNkKZyGbXhVouLpHU5j6TgKQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 07:35:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/12 Denys Dmytriyenko <denis@denix.org>:
> On Fri, Aug 12, 2011 at 08:17:52AM +0200, Samuel Stirtzel wrote:
>> Hi,
>> lately I looked a bit into the structure of OE-Core and found pages
>> like: http://www.yoctoproject.org/projects/openembedded-core, and
>> http://openembedded.org/index.php/LayerIndex
>>
>> 1. question: Are these informations reliable (the layer index page
>> seems outdated). From the information I found, this graphic was
>> created as conclusion:
>> http://imageshack.us/photo/my-images/155/openembeddedlayers.png/
>>
>> 2.: Currently the "UI layer" seems to be contained in
>> meta-openembedded, so is this _the_ layer for UI and windowmanager
>> recipes or is this a subject to change?
>>
>> 3.: The commercial layer is nowhere found, what are the plans for this
>> layer, or was this just an idea?
>
> Commercial layers are what envisioned to be provided by OSVs, such as Mentor,
> MontaVista, TimeSys etc...
>
Missed out that OSV means Open Source Vendor.
Would recipes for software like the Qt framework or Java fit in this
layer, or is it more for additional recipes to these packages like
mysql or postgresql plugins for Qt?
>> 4.: In which layer would distributions fit in the graphic?
>
> In one of the earlier discussions it was said that distribution layer is
> rather vertical and can span across multiple other layers by modifying and
> adjusting different aspects through config files and .bbappends
>
Thanks for pointing this out.
I thought that it would be something similar like this, now I got the
graphic adjusted properly:
http://imageshack.us/photo/my-images/99/openembeddedlayers.png/

>> 5.: Is something important missing / wrong in my graphic (other than
>> the distro stuff)?
>
> --
> Denys


Regards
Samuel


