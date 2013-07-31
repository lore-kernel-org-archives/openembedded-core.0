Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 356726B21D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 10:02:46 +0000 (UTC)
Received: by mail-bk0-f46.google.com with SMTP id 6so166497bkj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 03:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=zbuA1wQWI6L6/zStuBjIQVeIcqm9MCG0jRNAoFX20Vs=;
	b=juU7XodxnnFMCsLjglbAJFr5P8n2crTRcIWBnY4ayJjoPqTW7V5x6VcM84CG4HFeAt
	u3YVQv18I1eMW5dQvHHud8N/vpD8nnRUyLUlx3N/+hfvwyeuPrJF693xUjcv+zASMQ+0
	KVh0qcon3T/sKW5eA9gGChXd0oJvDTHDQivhmlHK5pSiiox2tIyzwh3kEm0Tfh2x+Y0a
	RvGh4Ma5tagZhzffNizDVKiRGJ0bRu9LMUB0Ex/j9P6p1hHei/f2eBrsUrkxJ8H//coW
	Ak+vaYf98r1g5C1ED+iCmXSW+b+37vQgg8VxN459eHb0t+I9MGatEK+NFcyajNk5KlzZ
	4p7g==
X-Received: by 10.204.57.4 with SMTP id a4mr9803146bkh.55.1375264966260;
	Wed, 31 Jul 2013 03:02:46 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPSA id hn4sm251308bkc.2.2013.07.31.03.02.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 03:02:44 -0700 (PDT)
Message-ID: <51F8E0C2.3070102@dresearch-fe.de>
Date: Wed, 31 Jul 2013 12:02:42 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <51ECCF5C.2020505@dresearch-fe.de>
	<CAP71Wjz6vU5iiSoc9LqDczGo_SJ02ppRJizQui_MLYKPK_61Wg@mail.gmail.com>
	<51ECFF6F.60601@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
In-Reply-To: <6366141.Q5aULPr4OG@helios>
X-Enigmail-Version: 1.5.2
X-Gm-Message-State: ALoCoQkD8evH7p32Fe2nCDGSZxH50v/fWK8BMqSSVGkw3Zr+LIRwtIl0iCRyFFkg/v+AFwywyKeP
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: SRC_URI and latest HEAD revision with git (in oe-classic)
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
X-List-Received-Date: Wed, 31 Jul 2013 10:02:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 22.07.2013 11:51, Paul Eggleton wrote:
> On Monday 22 July 2013 11:46:23 Steffen Sledz wrote:
>> On 22.07.2013 11:01, Nicolas Dechesne wrote:
>>> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.de
>>> <mailto:sledz@dresearch-fe.de>> wrote:
>>>> After being OE abstinent for some months i'd like to ask what is the
>>>> current suggested method for recipes building from the HEAD revision of
>>>> a git repository (we need this for continuous integration).
>>>>
>>>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final
>>>> decision, documentation and a good example.> 
>>> you can use ${AUTOREV} for this purpose. You can look at poky-bleeding
>>> distro config for such an example.
>>>
>>> e.g.
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distr
>>> o/include/poky-floating-revisions.inc
>> Hmmmm? This doesn't seem the work.
>>
>> Here's what i tried in my recipe:
>>
>> ------------> snip <------------
>> PR = "r3"
>>
>> SRCREV="${AUTOREV}"
>> PV = "gitr${SRCPV}"
>> ------------> snip <------------
>>
>> But i get package versions like
>>
>>   gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3
>>
>> where SRCPB is always 0. :(
>>
>> A bit more description and/or a complete example would be very helpful.
> 
> If you want these to increment now AIUI you need to be using the PR server:
> 
> https://wiki.yoctoproject.org/wiki/PR_Service

And here comes my next really big problem. :(

We're sitting on an big, old but active project based on oe-classic and bitbake 1.12.0. Irksomely we're forced to switch from SVN to GIT for this project. So we need the AUTOREV/PRSERV stuff for this old environment too.

Has anyone tried to backport the feature to an older bitbake/oe-classic environment? Or can someone give some hints what's to do?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

