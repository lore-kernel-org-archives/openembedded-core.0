Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 160DD786E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 11:12:34 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id CE1765C0988;
	Tue, 12 Dec 2017 12:06:35 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 12 Dec 2017 12:07:41 +0100
From: Stefan Agner <stefan@agner.ch>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZ0S0HkiyyoDQpFqhEdN-wbTRpqSDCwXuS1DA7zopJAmQ@mail.gmail.com>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
	<CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
	<1513006338.9676.5.camel@gmail.com> <1513006625.9676.9.camel@gmail.com>
	<CAJTo0LbVUE-Z84U59edVmmHu34kvNTZv+urwJAHpgBrXA96p=w@mail.gmail.com>
	<CAP9ODKoD9daGh83bwhLLzEW_7r+i65pH7hm4NwymD_+2LU6bMA@mail.gmail.com>
	<cde7f929023e7d027409f771c6376765@agner.ch>
	<CAJTo0LZ0S0HkiyyoDQpFqhEdN-wbTRpqSDCwXuS1DA7zopJAmQ@mail.gmail.com>
Message-ID: <f6144d159bdac4a4a7e722c59ddb8135@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513076795; bh=LtNMY0+ND7Q2pydODTZ3dG4Xb5p7Tg53YkfLOwfZghY=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=QYo4U4/XAXw4R8ZP9bxOKdYvJas5bNaQnMIYU3x9ePxTcwP72lisCGilS7McsaWx2dGm6ZcLhoC5x42Ke1RA7B3cGlV9ZGCtoQKuoOX27j5OZMe3tRvwtzD+Db83RzdAzrpWgCH/DNZA3RcZaXv3D4EHw0hl4uDnBdwPLV7BOMY=
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 11:12:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-12 11:58, Burton, Ross wrote:

> On 12 December 2017 at 07:48, Stefan Agner <stefan@agner.ch> wrote:
> 
>> On 2017-12-11 18:15, Otavio Salvador wrote:
>>> On Mon, Dec 11, 2017 at 3:09 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> On 11 December 2017 at 15:37, Joshua Watt <jpewhacker@gmail.com> wrote:
>>>>> 
>>>>> Vanilla waf only supports --prefix, --libdir, and --bindir. Anything else
>>>>> is a result of loading the gnu_dirs tool, which not all projects are
>>>>> required to do.
>>>>> 
>>>>> 
>>>>> Sorry, hit send too soo: waf (at least version 2.0) also errors out on
>>>>> unknown options. I think the three I listed are the only ones we can do
>>>>> generically. There might be some way to easily adding the rest if you know
>>>>> waf is loading gnu_dirs
>>>> 
>>>> 
>>>> One option would be for waf.bbclass to check if WAF_USES_GNU_DIRS is set
>>>> (defaulting to 0) and pass the full set of path options automatically.
>>> 
>>> Possible. But passing the standard ones solve 99% of the issues.
>>> 
>> 
>> I am with Otavio here. Also, adding the standard ones and adding the
>> additional GNU_DIRS would best be done in two independent patches
>> anyway. For now I'd rather prefer to only add the standard ones.
> 
> Fine by me.  Will there be a v2 adding --bindir? 
> 

Yes, will send soon. 

-- 
Stefan

