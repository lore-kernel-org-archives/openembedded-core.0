Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EAEA6B3F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:37:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6UFbxVP013487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jul 2013 08:38:00 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 08:37:58 -0700
Message-ID: <51F7DDD7.2010507@windriver.com>
Date: Tue, 30 Jul 2013 10:37:59 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com> <25949827.IjnmVXh6xo@helios>
In-Reply-To: <25949827.IjnmVXh6xo@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2013 15:37:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/13 10:09 AM, Paul Eggleton wrote:
> On Tuesday 30 July 2013 09:46:19 Mark Hatle wrote:
>> I agree with the previous folks that the design of the distribution setting
>> the one and true value is the right technical answer for this.  HOWEVER, in
>> my experience, this is NOT what end users want.
>>
>> They want a method similar to the one posted by Otavio in order to tailor
>> the system.  End users never want to create a new distribution, they simply
>> want to start with one and tweak it.
>
> Then surely an easier solution would be to advocate copy-and-modify of an
> existing distro config, and if we're not setting the value of DISTRO_FEATURES
> explicitly there (which we aren't currently in poky.conf) then we should just
> do that in order to make that easier?
>
> I honestly think building on an existing configuration value that is not
> immediately visible and might change when the user upgrades to a new version
> of the underlying distro is not a good thing to be encouraging people to do.

I don't disagree with you either, but my experience so far is end users don't 
care.  They also don't know what the right setting(s) should be.  So they are 
more comfortable with adding or removing individual options.

>> So with that said, my opinion is to enable this code, allowing end users to
>> tweak their distribution settings.  But make it a stated policy that
>> distribution layers should only "set" the value of DISTRO_FEATURES, and
>> should never modify/update this new EXTRA_DISTRO_FEATURES value.  (Of
>> course, I doubt there is a way to police that, other then state it's
>> policy.)
>
> Yes but people will just ignore that. DISTRO_FEATURES_BACKFILL has already
> been abused for similar purposes :/
>
>> This is the same type of reason that end users was a "don't install this
>> package" feature as well. While anyone can write a new image recipe, nobody
>> wants to, especially when they only want one or two less packages in their
>> image.
>
> Surely the primary motivation for having the "remove" functionality [1] is the
> case when you don't know how a particular package has got in via dependencies
> and you want it removed, and not the percieved difficulty of creating an image
> recipe?

That is part of it.. but it's the same concept.  The end user doesn't have any 
desire to learn recipe's, image generation, etc.  So they want a path of least 
resistance.  I don't want 'foo', so remove it.  (When I say remove BTW, I'm 
really mean don't install..  vs install -then- remove.)

> Really if people write nothing else they should be writing their own image
> recipes, because it's trivially easy to do so (or at the very least, copy an
> existing one and modify it).

I don't disagree with you, but the two commercial (oe-core based) releases I've 
been involved with over the last couple years, the yelling keeps getting louder 
for a removal capability, because they don't want to write image recipes.

--Mark

> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=4079
>
> Cheers,
> Paul
>


