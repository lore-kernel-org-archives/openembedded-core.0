Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U9wg8-0007Bd-PC
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 12:57:15 +0100
Received: by mail-vc0-f171.google.com with SMTP id p1so1673051vcq.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=2Sr6jJHfaeAYDf7lJ7rdd8ryZbuLCEUfCpPuXefNgrA=;
	b=lrFHEUWud8eFWwFG98RI3e+Cl4v5ivxXoxlMtyiIHLhDt+7yDy2o5gKWunBGQJVPcW
	Ir1y9+y1SrPzk/YLPxh5wUzs4gHlkl1ZJnnJrS25qjwM6HEVTrSYZ1209qrQb/tNKRu5
	GLVs7pA8RfiYxKSAln7Brr8HRKDALfebOqXmTKp7JCS+KoLwcMsRqZ5gjImFa7bgOWdS
	dhP/oxX49NcmrDAO1horFBsnoPzrg6gK2c6jGnZ7UWI/DRvWgwfgskaPbRtPYavZhDnW
	F15VUJRnqNa7tDw87spsatUdiVkxkWtcyOWii//AKGco9/GXDUQuF4iWsDy6v5PEl2wg
	JctQ==
MIME-Version: 1.0
X-Received: by 10.52.89.242 with SMTP id br18mr8495908vdb.22.1361792450836;
	Mon, 25 Feb 2013 03:40:50 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 25 Feb 2013 03:40:50 -0800 (PST)
In-Reply-To: <CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
	<CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
Date: Mon, 25 Feb 2013 13:40:50 +0200
Message-ID: <CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Mon, 25 Feb 2013 11:57:16 -0000
Content-Type: text/plain; charset=UTF-8

On 20 February 2013 16:32, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 19 February 2013 19:12, Saul Wold <sgw@linux.intel.com> wrote:
>> On 02/17/2013 01:00 AM, Marko Lindqvist wrote:
>>>    libffi: update to upstream version 3.0.12
>>
>> Not sure what's going on but I saw a batch of failures with glib-2.0, take a
>> look at the autobuilder failure:
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/808/steps/shell_29/logs/stdio
>>
>>  or
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/931/steps/shell_29/logs/stdio
>>
>> Not sure why, but glib-2.0 is not finding the libffi library, but it seems
>> to exist in the sysroot.
>
>  I should be able to take a brief look next weekend, but tonight and
> tomorrow I'm busy with other things.

 I've found no way to reproduce this on my own computer no matter how
I've tried to invalidate parts of the cache etc. but I wonder if it
could be that for some reason libffi didn't exist in sysroot already
at the time it was needed, only later when you checked for it. I see
no problem with glib-2.0-native dependencies, though.

 Note that in the log there's:
NOTE: Running noexec task 5283 of 7886 (ID: 3244,
virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/meta/recipes-gnome/libffi/libffi_3.0.12.bb,
do_build)
 AFTER glib2.0-native build has failed.

 One thing that may play a role here is that libffi does not depend on
anything, not even libffi-native. Libffi seems to be built already
before libffi-native.


 - ML


