Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UZzz5-0003zl-Fa
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:44:24 +0200
Received: by mail-oa0-f46.google.com with SMTP id h2so1735527oag.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 01:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=1z1tWN8RW31v+TW7HUultKlXth+7HJlsMVS6MDKYUHs=;
	b=ep6LhbeQqLZcQ31GjpzMzBDBylzZ2NmM7xe3SuXCw5FET+XMEXXNxZBBBey0zAyyGI
	5SCMLpbSb+psHWXRbx8HafzLUWy2F0EhFcd7vOA7S4Q4F68ngjv7uz55hB+4qcBbY/8V
	XxePh2slZqaN0Xd4pL3KI9b2xCE04PCzEg4OybwoYZdIlMBKVomGAYh0aDvZKPB3dNJV
	b3qIhHtMVrYFArUY5vFcMUlgeixaX6Thm+x22LU02nQeDy+IvaYYpoosi3AyfRLtuROX
	59/oz3h86r2fKaJV/AL80OzGMX36ePYqo0oBIc55dOo+WR9Zyx15zgLwpNduOYxd0T+p
	ZxAg==
MIME-Version: 1.0
X-Received: by 10.182.230.198 with SMTP id ta6mr1687513obc.98.1368001580842;
	Wed, 08 May 2013 01:26:20 -0700 (PDT)
Received: by 10.76.141.6 with HTTP; Wed, 8 May 2013 01:26:20 -0700 (PDT)
In-Reply-To: <518A0651.4050407@windriver.com>
References: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
	<5189EC92.1020909@windriver.com>
	<CA+AhUGyN_LX66XE61rtdxS81eCsAy7Ku-F1UwRWuBFrc4=GXAQ@mail.gmail.com>
	<5189FAE5.3070600@windriver.com>
	<CA+AhUGzcNBNu9-+KdW5D8eL6Bg-hbfKSODoKx73nOnRBNU7XPw@mail.gmail.com>
	<518A0651.4050407@windriver.com>
Date: Wed, 8 May 2013 10:26:20 +0200
Message-ID: <CA+AhUGwCcQY_J3JNmDG7ZfWqEca-dErUdr9OZSgU7PrS=Z1_pw@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQmKhcVHKKVfJVTU5bq3N1n/6waxxedQ8PBzKlohVBQ6JJy74G3g2VzTaED5NkCOckn0x/Oz
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
X-List-Received-Date: Wed, 08 May 2013 08:44:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2013 at 10:01 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> On 05/08/2013 03:35 PM, Erik Bot=F6 wrote:
>>
>> On Wed, May 8, 2013 at 9:12 AM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>> On 05/08/2013 02:36 PM, Erik Bot=F6 wrote:
>>>>
>>>>
>>>> Hi,
>>>>
>>>> On Wed, May 8, 2013 at 8:11 AM, Robert Yang <liezhi.yang@windriver.com=
>
>>>> wrote:
>>>>>
>>>>>
>>>>>
>>>>> Is it similar to meta/classes/package.bbclass ?
>>>>>
>>>>> // Robert
>>>>
>>>>
>>>>
>>>> I would say it's in addition to package.bbclass.
>>>>
>>>
>>> Hi Erik,
>>>
>>> Sorry, I meant this one meta/classes/bin_package.bbclass :-)
>>>
>>> // Robert
>>
>>
>> Oh, hadn't seen that one. That could definitely be useful, the only
>> thing left to do is to try to automate the generation of the recipe
>> that uses the binary package.
>>
>
> How about the scripts/create-recipe ? It works fine with the tarball, but
> not very well with .rpm/.deb/ipk.
>
> // Robert

What I have in mind is that the recipes will be created automatically
when building a source recipe that inherits a certain class. The
recipe and tarball would then be placed in a layer structure together
with other recipes that includes that class. Fields like RDEPENDS,
LICENSE; PR etc should be carried over from the source recipe.

Maybe it should be done in a way similar to populate_sdk, so if I
bitbake an image with e.g. -c populate_binary_layer it would create a
meta-layer with binary recipes for all packages inheriting that class.

-- Erik

>
>
>> Thanks,
>> Erik
>>
>>>
>>>
>>>> The idea is that the developers of the closed source software uses OE
>>>> to build their software from source, and in this build process the
>>>> files needed for a binary distribution in OE is automatically
>>>> generated. These generated files can be distributed to others that
>>>> wish to use that closed source software in OE. So it would use some of
>>>> the output from package.bbclass, like the package split, but then
>>>> generate some extra files.
>>>>
>>>> Cheers,
>>>> Erik
>>>>
>>>>
>>>>>
>>>>>
>>>>> On 05/08/2013 01:53 PM, Erik Bot=F6 wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Background:
>>>>>> If you use OE to build software which includes e.g. a closed source
>>>>>> library, but still want to others to be able to build software based
>>>>>> on that library in a OE environment you would have to create recipes
>>>>>> that contains a binary version of your library + headers manually.
>>>>>> This would have to be done manually for each package, and as the
>>>>>> development of the library continues the binary recipes will have to
>>>>>> be manually updated to keep in sync.
>>>>>>
>>>>>> Idea:
>>>>>> Create a new bbclass that handles this automatically as much as
>>>>>> possible. The basic idea is to:
>>>>>> - Create a tarball of ${WORKDIR}/image/ alternatively
>>>>>>      ${WORKDIR}/packages-split/
>>>>>> - By parsing the "source recipe", create a "binary recipe" that uses
>>>>>> that tarball
>>>>>>
>>>>>> The binary recipe should work as a drop in replacement of the source
>>>>>> recipe. This means that the other recipes depending on the closed
>>>>>> source software shouldn't need to be adapted to work with one or the
>>>>>> other.
>>>>>>
>>>>>> I'd like feedback on whether you think the idea is feasible, and if
>>>>>> you think it could be useful for others. And anything else you think
>>>>>> of.
>>>>>>
>>>>>> Cheers,
>>>>>> Erik Bot=F6
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
>>>>>>
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>
>>
>



--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Erik Bot=F6
Senior Software Engineer
Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)76 881 72 03
E-Mail: erik.boto@pelagicore.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


