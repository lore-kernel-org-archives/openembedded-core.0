Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5023D62132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 21:01:15 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id xr8so80428884lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 13:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LcrN3cxQk89BPT8H4Gnngjyll0MapOJtSA0s6jYGiL8=;
	b=qojjcmYAjuKFrziQfcebPhFkNFmjUC+vZRuxjzOGxJr+bXUm7zbd6ckuViG4HBhDlf
	rY87emOpuf5kN8d2LQsaVdDRECLEqUuNKwp50JKUBaNz8PJmy6gmCfwTbti58yAoxn6w
	Cj0hB7frsKsVY8U8MYarM0OWiMV1bGUqYJXp/Prf3mg8nr7GlKpNeom6WtcSOxDfM5Ud
	FF3zy/h9HAlldeNVJM4//FeCuUSoq7YbTzto6PFnRlHjxajq61BcnD4USNsn79CnYZdz
	L8KZ+wC+JxozS/5oG4XNGjxqbZDhZV31VfSO494svMBAc25l9C6Z6gfW8kyP9BPKy+jw
	SJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LcrN3cxQk89BPT8H4Gnngjyll0MapOJtSA0s6jYGiL8=;
	b=PeL3egLeEGNlGxG4OymgVrWZ96mwJCHyv3MBn2kQyXAKYev6v1AteOwvQ9fOLGe4dq
	WsD+RlJwa0ENk/Nf9lWYpdQr5rec18DnIuGvhqwOdrEiUbOR8Se6s6FlMzcojF4BNuhh
	IZMCNniw070m8Sxa2OZcV6OZ7+7Y6nxbGYSDPz1mrOqWTG4dgnjWixFkCiCWzWM38dw3
	nvlFgDufyiE8UDd51T26wfPXjXNZ8l3Krr91pCOSq660v0hxBQQHkTsqA6XEQ91cWX5f
	rul1ufSlnoOnGnm6+Q8J5MHDQG2RhRDs6iOiY8CspaH6Rb9UZG0urvqs1MpsmmCSSUY+
	jA7g==
X-Gm-Message-State: AD7BkJIYqLl7v4OBpsZ/6IjFDfBC1fvmHBCWk/avaS2g2RVzrF3z2/yLXXE6zcZkyJEIn7RmTP0BFsrx5SrYlA==
X-Received: by 10.25.40.81 with SMTP id o78mr98150lfo.22.1457557274828; Wed,
	09 Mar 2016 13:01:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.109.68 with HTTP; Wed, 9 Mar 2016 13:00:55 -0800 (PST)
In-Reply-To: <56E08D90.1090802@linux.intel.com>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
	<56E08BEB.1000501@linux.intel.com> <56E08D90.1090802@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 9 Mar 2016 22:00:55 +0100
Message-ID: <CAPybu_3Kijopoqtngw8-vb0=nCmHhOBaOk4KzgP=z9b+NbRrAw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 21:01:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

What about ack this patch until we have something more generic.

The fact that the perl-module package is wrong and we havent find it
out until today makes me think that it is only apt-get who has this
issue with circular depencies.

Regards!

On Wed, Mar 9, 2016 at 9:54 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
>
>
> On 03/09/2016 02:47 PM, An=C3=ADbal Lim=C3=B3n wrote:
>>
>>
>> On 03/09/2016 02:33 PM, Burton, Ross wrote:
>>> On 9 March 2016 at 18:19, Ricardo Ribalda Delgado <ricardo.ribalda@gmai=
l.com
>>>> wrote:
>>>
>>>> +                        bb.warn("Package %s rdepends on itself. Ignor=
ing
>>>> this dependency" % pkg)
>>>>
>>>
>>> Depending on yourself seems wrong no matter what packaging backend you'=
re
>>> using, even if it isn't fatal.  Maybe this should be added to the gener=
al
>>> sanity checks in insane.bbclass?
>>
>> I agree that this situation could happen in other package management
>> backends, i don't now if at insane class level we could access the
>> dependency tree of the recipes/packages, i like the idea for more
>> general mechanism.
>
> I forget to mention will be good if also handle circular dependencies
> between recipe/packages. A time ago i added this support on postinst
> scripts in package_{deb,ipk} [1].
>
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/lib/oe?id=3Db2=
c9e7347acdfd0efe1c3dabb853d609233b61b6
>
>
>
>>
>>     alimon
>>
>>
>>>
>>> Ross
>>>
>>
>>
>>
>



--=20
Ricardo Ribalda

