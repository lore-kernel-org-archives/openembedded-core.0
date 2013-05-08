Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UZzBj-0006Gw-8k
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 09:53:24 +0200
Received: by mail-ob0-f180.google.com with SMTP id uk5so1403786obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 00:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=ckwu4/gy5ggCw5TiKwsDboP8KbQyxI8Xz+2fRSfNN+o=;
	b=HB4QD61ZEo/q92TSIazRjdNXszOk0yj7C51IRe6uyLmGQBVe8lXnDEST42rAdSIKs4
	7Dirc58MG+8aC5Ia2OeB0DozvO7Rz5UCcQ+aazntzYKanjKIYthaZRxYrLV+e4RNYXPo
	r0znk4n2kH6XtIoUvOK+Q7NMRgiaaDtmrsSWtimuhROKkquwUcdJExXnT2M0uAtW5Pf5
	UpTs02jRu8fgREwlYvb9JTTOYVcifPqHqt1MrgTAlycbu0GvhWvwFuGwpUEgrTZh2D6N
	lxEhERuSdqSFm5c6Z/Kf/44LaPnr1kxYpQ0WoQSCtCzj6h9DRFgoOH93ZPEaL3/dtP6D
	n7Sg==
MIME-Version: 1.0
X-Received: by 10.182.129.230 with SMTP id nz6mr1659946obb.49.1367998520504;
	Wed, 08 May 2013 00:35:20 -0700 (PDT)
Received: by 10.76.141.6 with HTTP; Wed, 8 May 2013 00:35:20 -0700 (PDT)
In-Reply-To: <5189FAE5.3070600@windriver.com>
References: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
	<5189EC92.1020909@windriver.com>
	<CA+AhUGyN_LX66XE61rtdxS81eCsAy7Ku-F1UwRWuBFrc4=GXAQ@mail.gmail.com>
	<5189FAE5.3070600@windriver.com>
Date: Wed, 8 May 2013 09:35:20 +0200
Message-ID: <CA+AhUGzcNBNu9-+KdW5D8eL6Bg-hbfKSODoKx73nOnRBNU7XPw@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQkM58f7jeAkSj8enpgy3ktRYDN2eQQ9pA2dkmI/Er9pG+o/vgyvdDMbbR23dDgynPB+i80U
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] bbclass for automatic generation of binary recipes
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
X-List-Received-Date: Wed, 08 May 2013 07:53:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2013 at 9:12 AM, Robert Yang <liezhi.yang@windriver.com> wro=
te:
>
>
> On 05/08/2013 02:36 PM, Erik Bot=F6 wrote:
>>
>> Hi,
>>
>> On Wed, May 8, 2013 at 8:11 AM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>>
>>> Is it similar to meta/classes/package.bbclass ?
>>>
>>> // Robert
>>
>>
>> I would say it's in addition to package.bbclass.
>>
>
> Hi Erik,
>
> Sorry, I meant this one meta/classes/bin_package.bbclass :-)
>
> // Robert

Oh, hadn't seen that one. That could definitely be useful, the only
thing left to do is to try to automate the generation of the recipe
that uses the binary package.

Thanks,
Erik

>
>
>> The idea is that the developers of the closed source software uses OE
>> to build their software from source, and in this build process the
>> files needed for a binary distribution in OE is automatically
>> generated. These generated files can be distributed to others that
>> wish to use that closed source software in OE. So it would use some of
>> the output from package.bbclass, like the package split, but then
>> generate some extra files.
>>
>> Cheers,
>> Erik
>>
>>
>>>
>>>
>>> On 05/08/2013 01:53 PM, Erik Bot=F6 wrote:
>>>>
>>>>
>>>> Hi,
>>>>
>>>> Background:
>>>> If you use OE to build software which includes e.g. a closed source
>>>> library, but still want to others to be able to build software based
>>>> on that library in a OE environment you would have to create recipes
>>>> that contains a binary version of your library + headers manually.
>>>> This would have to be done manually for each package, and as the
>>>> development of the library continues the binary recipes will have to
>>>> be manually updated to keep in sync.
>>>>
>>>> Idea:
>>>> Create a new bbclass that handles this automatically as much as
>>>> possible. The basic idea is to:
>>>> - Create a tarball of ${WORKDIR}/image/ alternatively
>>>>     ${WORKDIR}/packages-split/
>>>> - By parsing the "source recipe", create a "binary recipe" that uses
>>>> that tarball
>>>>
>>>> The binary recipe should work as a drop in replacement of the source
>>>> recipe. This means that the other recipes depending on the closed
>>>> source software shouldn't need to be adapted to work with one or the
>>>> other.
>>>>
>>>> I'd like feedback on whether you think the idea is feasible, and if
>>>> you think it could be useful for others. And anything else you think
>>>> of.
>>>>
>>>> Cheers,
>>>> Erik Bot=F6
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>
>>
>>
>


