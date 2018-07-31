Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F07578CA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 13:34:50 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id y9-v6so7492204vky.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qRcxNvffIx82MO+YBMqT85dmz5lKePDkRot1/XbkPds=;
	b=Vjr+627OVczDUrf63AzrpK5m/sAbS0rUoSAdZIxEFvlBuvUdrm6XpXbX0NI4dxybSR
	JF8R7x3pyTy6m9Xi9NQPpylI1YuQvA2BR5Xq/pEcgTk+i4bsOv6jcxZrZmiwZ6lwo5hq
	ZgObANkkzilZ42ZBx6ifn71pdYxR5Ry4IYwFfGrQEt7COSNMyfMtM9rYg+OSWOK1mOnp
	N2BUk2fJU5OTuR/HlkFDmucZ490vQo0pvL8zQHe/zPLhvlnCunD8aK0CrYfxQ/FFAXEw
	qy6JyjD0K/h7UgADTT7p8s2sTZmLJDJ39gW+alkicbZ2dxwln0Em5FbnmqewKzGDIs05
	juzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qRcxNvffIx82MO+YBMqT85dmz5lKePDkRot1/XbkPds=;
	b=j0n0DBV4eUUrKDMpp8IwHFEIFdwROS4MHUZwPKYb+Pp0veV0FUV+6yitWZ68DILeW/
	vnT++VdBER6MPRGRXX2QhFYnhRGoPxj7NPr9L9lSCW+i9ICxypwGJXrCE6JTI02GAk65
	5RJkzaplwsKIBhdKu4Spz1xNvrOdwy6+ycfxdtJm6w+OIJNK9P9M/1xUp2BbRslBgZUR
	Gq1CNsAqMoauu6KFdruKvaRIy/Ggs7c36qRDBJujpMP2L8jFlmie4ItfY0Kgh26TXK6y
	mFV5l4cbJKnzcdv9Vpfk07PFNmp2UF4eQs1nBvwFswpY7pd9cSZiNumGIEoycm5QYkZ3
	UIoQ==
X-Gm-Message-State: AOUpUlEfKXpJkbcrCFslSEAOsgKQldmMlHynuXQuTB0hcDbK18pS5WER
	V6ydWooDOBR3xfFWG1w3DiqXGw6hc8eQ+tnfXpU=
X-Google-Smtp-Source: AAOMgpdK3FOLO4D2OzuzAaWBVB4zvXg/4J1jlCsA4lmi/S1rXfg79mD//9ehuukx3K9xPb982+WeBNG1p08TsJdhdcs=
X-Received: by 2002:a1f:b3d5:: with SMTP id
	c204-v6mr13232072vkf.37.1533044091823; 
	Tue, 31 Jul 2018 06:34:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 31 Jul 2018 06:34:51 -0700 (PDT)
In-Reply-To: <b5b31110-b182-fc03-e648-bd5d90f025ef@siemens.com>
References: <1533000487-12738-1-git-send-email-armccurdy@gmail.com>
	<b9a00beb06723da9bdd5f32923057d31ccbc0941.camel@linuxfoundation.org>
	<b5b31110-b182-fc03-e648-bd5d90f025ef@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 31 Jul 2018 06:34:51 -0700
Message-ID: <CAJ86T=UZqd5JBBaG4hQ+PAwLs-8bDaKbrQS0XHuXUquF6Qg94w@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl_1.0: drop unnecessary dependency on makedepend-native
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
X-List-Received-Date: Tue, 31 Jul 2018 13:34:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 3:24 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
> This program is required for "oe_runmake depend" command. It runs
> command in MAKEDEPPROG variable, which is set to makedepend. Makedepend
> consists from makedepend-native package.

That's what you might guess from casually reading the Makefile. It's
not what actually happens.

> Cheers,
> Andrej
>
> On 07/31/18 12:08, Richard Purdie wrote:
>> On Mon, 2018-07-30 at 18:28 -0700, Andre McCurdy wrote:
>>> The openssl Configure script will only select standalone makedepend
>>> (vs running "$CC -M") when building with gcc < 3.x or with an Apple
>>> Xcode version which predates the switch to clang (in approx 2010?).
>>> Neither of these cases are possible when building under OE, therefore
>>> the dependency on makedepend-native can be dropped (ie align the
>>> openssl 1.0 recipe with the 1.1 recipe, which has dropped the
>>> makedepend-native dependency already).
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>> b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>> index f5d3274..78c8552 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>>> @@ -8,7 +8,7 @@ SECTION = "libs/network"
>>>  LICENSE = "openssl"
>>>  LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
>>>
>>> -DEPENDS = "makedepend-native hostperl-runtime-native"
>>> +DEPENDS = "hostperl-runtime-native"
>>>  DEPENDS_append_class-target = " openssl-native"
>>>
>>>  PROVIDES += "openssl10"
>>
>> This was added quite 'recently' in:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=50c23e6c26a64b0c04e99abacb61ec00d1abace9
>>
>> I've cc'd Andrej in case he can tell us why that was needed?
>>
>> Cheers,
>>
>> Richard
>>

