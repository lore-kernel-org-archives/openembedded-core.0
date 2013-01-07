Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsCCo-0002h1-38
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:53:30 +0100
Received: by mail-vb0-f54.google.com with SMTP id l1so19327046vba.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CAedKEhVO2S8aUV9rmL5Z1eHqjgI54I7Vfg9no4woe0=;
	b=MPBRAtJcobEbZ+dHfBu9OdcDAb6viC553/k45bVX4RiqU1K8Envywmb1gOE1U+2HiC
	+hKC8O0OcEEJUoKTiaokODEFY9j4ITHLPMVfR5c4kJRi2WntljnW77uor6Dwczlc2gdl
	pyl+VIFcfEGuFZjqFkMcaSLFHz3Pn5lTSZ0CV2jWXvyYnwMCzxxG3FFG/saVOCYZJIf3
	y4CoKABONCNDtgYrV2Bg/aual0IhWNRWASf3w3pjWdg57cCVPs3pv0plH+25zkYmmZYp
	kEhNBuVq3mFY7BEsvs8jpTP0qB0NYKX2uAW6VmexalmnVCYy76CSlnWpcXlCvCaB4yZ4
	SRUA==
MIME-Version: 1.0
Received: by 10.58.221.228 with SMTP id qh4mr83712011vec.49.1357562300658;
	Mon, 07 Jan 2013 04:38:20 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 7 Jan 2013 04:38:20 -0800 (PST)
In-Reply-To: <50EAC025.6080402@intel.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<1357557021.28649.228.camel@ted> <50EAC025.6080402@intel.com>
Date: Mon, 7 Jan 2013 14:38:20 +0200
Message-ID: <CAF6bG8eF43-U5eqGZ8d5hBFdBCWf4gjVXFuWY5c1NzJ_dvfVZw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 12:53:30 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 14:31, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>
>
> On 01/07/2013 01:10 PM, Richard Purdie wrote:
>> On Fri, 2013-01-04 at 22:22 -0800, Saul Wold wrote:
>>>
>>> Laurentiu Palcu (1):
>>>   pango: have postinstalls run at do_rootfs time
>>
>> Merged, apart from harfbuzz, pango, glib and glib-networking changes as
>> per the feedback on list.
> I think pango can be merged. The comments on the list are about other
> packages that ship pango modules, in which case the qemu approach should
> be used.

 This was about pango update (to 1.32) to depend on harfbuzz so when
harfbuzz was dropped, pango update had to be dropped too (it wouldn't
build)


 - ML


