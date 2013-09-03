Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A56936041E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:05:14 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id f4so10867267iea.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VHkhuLwHJgpbkj3cjqsotFtFRY5uW6aPWVd2sOuTVYc=;
	b=juhl7YrT7TBxj7Y8Uiav34p6VovlqmR1eRu3Iie+tUrm//kn7fMnH3+/ZeS1k2muME
	CNzQSv6OZsw4ZvAWVRAw62wkJ2iL1k52Lv9GohorInbpcx6OqG/bHu4/QzFjCQ4hJyiC
	cDkmoHozTvhRSTiR2Qy6sHbvxNomqjIdDYWedL20VxbwFpCzDr3sKi+GjDyuOFDp+3PJ
	w/VtTuxE+GkRmWPGWmJJVWWIRroIP771pLzW4G+4GV+u9h4/TbsJYH31QjNg7rN1my56
	XR0y99gdiJ7HEyxtZ9uGNEjRwyjD3XBcBYHB/U9/kSullWv2cm/4ChH+nH7QK3IR015Q
	SRWw==
X-Received: by 10.50.103.3 with SMTP id fs3mr16784164igb.39.1378227915142;
	Tue, 03 Sep 2013 10:05:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Tue, 3 Sep 2013 10:04:45 -0700 (PDT)
In-Reply-To: <CAJTo0LZKRmPzCGxh_DzTx+AHgGMFWybg0UvMNjZrP4jEW3D0-w@mail.gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
	<CAJTo0LZKRmPzCGxh_DzTx+AHgGMFWybg0UvMNjZrP4jEW3D0-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2013 10:04:45 -0700
Message-ID: <CAMKF1spPKfMJJNkKWdap89_LaDgg+g_G-tok4mixER3GEXVUDA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 00/20] Add python 3 support
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
X-List-Received-Date: Tue, 03 Sep 2013 17:05:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 3, 2013 at 9:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 August 2013 18:15, Khem Raj <raj.khem@gmail.com> wrote:
>> python3: Add recipes
>>   python3: Add native recipe
>>   python3: Upgrade to 3.3.2
>>   python3, python3-native: Consider OE staging installation
>>   python3: Fix host include contamination issue
>>   python3: Fix the compiler invocation and linker flags when cross
>>     compiling
>>   python: Add Patch description and status information

this one has more than python recipes and is cosmetic. I will leave it
alone since it will need breaking apart before squashing it into
individual recipes.

>>   python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
>
> For bisecting and clarity, why can't all of those be squashed into
> "add python 3"?  I don't see the point of merging a broken Python 3
> recipe and then six required fixes.

Depends how you look at it. I will squash rest into one.

>
> Ross

