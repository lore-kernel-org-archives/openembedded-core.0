Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A32170557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:10:49 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id el20so2615815lab.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EUquCZ6iXXeLOvhs4MB8fliNy4LX7K+8ss81sGF+Qv0=;
	b=UtUKzYuV0lcwixNtwAP4nkkWD5d0AVs3gxRpYWiDVtvtQEEzeIHMo0UZPjtrVoJfT8
	DaY6BTShf2iTO29QtdKB7RBIWbGHJr38cqlotn6Ob1R11HMoB1qXhsHQBHMSmxbOZKCS
	jV8QF0LdZa0Y3UEe931Ex817Tyar2wUk/aSBWv8R99GjvN42RBWxqlRXjJFgsEb3zomU
	2dib8KNJeP5yUc32iR+PSUd9iqZ9m73lovo3aJGCBj9GcXkBFQA8/1bOy+4Kb8TIe1c1
	g9nN+deiosjun1AjAeHTukIMU/kVi4LGOBfGe7Hgq8huNq3jlQVKAMvZjMhfyuN+3ox8
	5OMw==
MIME-Version: 1.0
X-Received: by 10.153.5.44 with SMTP id cj12mr13944374lad.36.1406257850428;
	Thu, 24 Jul 2014 20:10:50 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Thu, 24 Jul 2014 20:10:50 -0700 (PDT)
In-Reply-To: <20140724220210.GO2492@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<67ae6f8074e50a768143cac6a40fd8d16e2f5965.1406234258.git.bruce.ashfield@windriver.com>
	<20140724220210.GO2492@jama>
Date: Thu, 24 Jul 2014 23:10:50 -0400
Message-ID: <CADkTA4MwiR8v_MAV=To-o-OPhDKT7kXESryCacathmZqNPhpEg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] lttng-modules: re-enable ARM builds
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
X-List-Received-Date: Fri, 25 Jul 2014 03:10:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 24, 2014 at 6:02 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jul 24, 2014 at 04:41:52PM -0400, Bruce Ashfield wrote:
>> With lttng 2.4.2 and gcc 4.9, we can now enable lttng-modules for ARM.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>> index 5a99a5adae8b..d87374163556 100644
>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>> @@ -12,8 +12,7 @@ inherit module
>>
>>  SRCREV = "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
>>
>> -# lttng currently blacklists arm with gcc-4.8
>> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
>
> Please squash this to 2/8 otherwise there is no arm version between 2/8
> and 6/8.

I'd rather not, since they are separate activities. I updated to 2.5,
and then enable
ARM. One isolated change per commit. Bisectability in a small series is one
thing, but also is the isolation of changes.

Richard can squash on merge is he wants, but I'm going to leave it as is.

Bruce

>
>>  SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
>>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>> --
>> 1.8.1.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

