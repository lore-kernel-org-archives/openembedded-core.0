Return-Path: <sledz@dresearch-fe.de>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id A20DB6077D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:23:57 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so4256117ead.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 23:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=TuF+czmU3qoeORlsX/+CU2bT+Bq65pjPUMdE5qjLafk=;
	b=BbPtKRcGXFo6Utmhn5wH49hhKDX4rJub8zm5pDE//YS+HLH9NYYLtbdeOYX0lhrJpw
	i9kmmMyiL5HHdLCWtcPuIYd2xameFlWc1LEoGQ1pckrTk7r8S8wb14SzIKjhRljU4VLm
	IY8C0Oth3l4D9kz0zJA1sdRLAIaBd5WN7fkArRN/FXKEQzE1ztcmZmjAZBw9Zp/p21/x
	X43FKuvg0id/9+17vwBExdw0MKnti4FTMl/Lc6rFXXBkOO7p2bSPXvefu3nl3bzOXBPd
	7NAePQLziQuLF3H0EGNhMSFTRZRmN2A4OUmQQzIx7/5aBV18qK6RvlvN9k78RaoH44Rx
	JXIA==
X-Received: by 10.15.35.129 with SMTP id g1mr31229717eev.2.1374560637519;
	Mon, 22 Jul 2013 23:23:57 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPSA id o5sm56253858eef.5.2013.07.22.23.23.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 23:23:56 -0700 (PDT)
Message-ID: <51EE217A.4040709@dresearch-fe.de>
Date: Tue, 23 Jul 2013 08:23:54 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51ED09DD.7040008@dresearch-fe.de> <3148065.skdr24gULv@helios>
In-Reply-To: <3148065.skdr24gULv@helios>
X-Enigmail-Version: 1.5.1
X-Gm-Message-State: ALoCoQldkBmQhcPWeS0RE3KTLJ0gQd/ddIYTIFOJ31SPPuu+aTEtQ4XuFxAVNC5YZp1cozMh4amj
Subject: Re: SRC_URI and latest HEAD revision with git
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
X-List-Received-Date: Tue, 23 Jul 2013 06:23:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 22.07.2013 13:08, Paul Eggleton wrote:
> On Monday 22 July 2013 12:30:53 Steffen Sledz wrote:
>> On 22.07.2013 11:51, Paul Eggleton wrote:
>>> On Monday 22 July 2013 11:46:23 Steffen Sledz wrote:
>>>> On 22.07.2013 11:01, Nicolas Dechesne wrote:
>>>>> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.de
>>>>>
>>>>> <mailto:sledz@dresearch-fe.de>> wrote:
>>>>>> After being OE abstinent for some months i'd like to ask what is the
>>>>>> current suggested method for recipes building from the HEAD revision of
>>>>>> a git repository (we need this for continuous integration).
>>>>>>
>>>>>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final
>>>>>> decision, documentation and a good example.>
>>>>>
>>>>> you can use ${AUTOREV} for this purpose. You can look at poky-bleeding
>>>>> distro config for such an example.
>>>>>
>>>>> e.g.
>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/dist
>>>>> r
>>>>> o/include/poky-floating-revisions.inc
>>>>
>>>> Hmmmm? This doesn't seem the work.
>>>>
>>>> Here's what i tried in my recipe:
>>>>
>>>> ------------> snip <------------
>>>> PR = "r3"
>>>>
>>>> SRCREV="${AUTOREV}"
>>>> PV = "gitr${SRCPV}"
>>>> ------------> snip <------------
>>>>
>>>> But i get package versions like
>>>>
>>>>   gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3
>>>>
>>>> where SRCPB is always 0. :(
>>>>
>>>> A bit more description and/or a complete example would be very helpful.
>>>
>>> If you want these to increment now AIUI you need to be using the PR
>>> server:
>>>
>>> https://wiki.yoctoproject.org/wiki/PR_Service
>>
>> This seems to be the thing we need.
>>
>> But the description is not very helpful from the view of a recipe
>> maintainer. It describes mostly the server part.
>>
>> * What do i have to write in my recipe?
> 
> Nothing special. If you used SRCPV in PV where you are using an SCM in 
> SRC_URI, that should be enough. The integer at the start of SRCREV will be 
> incremented automatically if the revision changes, and if it doesn't but other 
> values within the recipe change then PR will automatically be incremented 
> above the initial value set in the recipe.
> 
>> * What modifications in bitbake.conf, local.conf, ... are necessary?
> 
> I believe as described in the page I linked above you should only need to set 
> PRSERV_HOST.

You're right. This works. ;-)

I've two points more:
* The Wiki-Page mentions the bitbake-prserv-tool. Where can this be found? It does not seem to be part of the bitbake repo.
* Does anyone have systemd configs or sysvinit scripts for handling the bitbake-prserv?

Cheers,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

