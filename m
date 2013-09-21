Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id F3719616EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 00:28:08 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp4so1423313obc.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 17:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qXExSALWanDbC4wJssslhHWY5M1rqhNM1gDecT6Umgk=;
	b=HyOKjnq4mHAdXO2CKK30St+RJxrgdL6rdDBt48nf7RGCqaQqvVObhIBYfqVMfqOf3c
	NoydEjmY/ufx1GOx1Coa7qdGBAEzXOoEzkXSiNcyTJVs0aG3g8dSB55i4YU4iTKLe5LV
	oODaQUaisSF3glw3CI2+5pCW1+L8Aa+hU4+XNE0SAyiE9Yf6xBdIF03AFz9LPvL8d73Y
	+YClTnfKZ2i6k7RI2bvTgEG3SDXvck0POOmhta6tINmqUjEpXwoXl9XRtoG43vvfgX1u
	xEjWBKWhJVVEeIY61SVkZWIgUQLHp+RbNThzr9kLQb8117XP+Vh3pThs+DaYzVvgQcFa
	Ox9Q==
X-Received: by 10.182.129.201 with SMTP id ny9mr8291611obb.0.1379723289879;
	Fri, 20 Sep 2013 17:28:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.77.41 with HTTP; Fri, 20 Sep 2013 17:27:39 -0700 (PDT)
In-Reply-To: <523CD8E6.5030302@windriver.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<086c32308bdd8d212afe0c8fa4e614a2617fc4ba.1377792006.git.Martin.Jansa@gmail.com>
	<523CD8E6.5030302@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Sep 2013 17:27:39 -0700
Message-ID: <CAMKF1sp_TuZDvWruw9UrisUkJmzxsJQNhkre5rgPkjST=6nsUA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 11/20] wget: Add dependency on libpcre
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
X-List-Received-Date: Sat, 21 Sep 2013 00:28:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 20, 2013 at 4:23 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 13-08-29 12:02 PM, Martin Jansa wrote:
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-extended/wget/wget.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/wget/wget.inc
>> b/meta/recipes-extended/wget/wget.inc
>> index de9b620..7af55c4 100644
>> --- a/meta/recipes-extended/wget/wget.inc
>> +++ b/meta/recipes-extended/wget/wget.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring
>> HTTP, FTP, and more."
>>   SECTION = "console/network"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> -DEPENDS = "openssl zlib"
>> +DEPENDS = "openssl zlib libpcre"
>>
>>   INC_PR = "r16"
>>
>>
>
>
> I haven't looked at the other patches yet but this seems
> to be valid since my image construction failed with:
>
> Computing transaction...error: Can't install wget-1.14-r16.0.0@core2: no
> package provides libpcre >= 8.33


this is a typical floating dependency order case. it should be turned
into a PACKAGECONFIG, pcre is not a commonly shipped library and you
dont
want such hard dependency on it.


>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

