Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id B42C572A93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 12:10:25 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 131so1061628ykp.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 04:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=joq8Qoxjg4dO3QHjqWQImmv0W/FsemJ9TsvVq3VJmTM=;
	b=m2nmmnhTjw0JXk0L/D/iFTJ7t2MZWONkZ3DI6vY9HPbTZqQ5cA792t6DhPqaR3u9Dw
	XDDVmzREfceq37pDGoluhxPFYXQON7Oy6eeY2jrrio4Ddb29cnaOBUBb2Mwl1WY7ARvH
	Y/OvHDpjXAaW/ep2eIAS1ADCgLlliwVleqnoGIZG9Hh7TjPSoPVgKt60MrB9bEq5Egzn
	0ene8OtMlnNMeui/vs/oEbAx/a4V1EFvD9li/N7ta6V7wr3AhsdiVsUdAUtJ0IiIQ3/v
	BNAIwS7rg0iLAQSsDzYNVGXz7/n1XNzzKHoFxhPvJ4ZZkIzH4gNERqx9eFkw9zRn0E/b
	c0IQ==
MIME-Version: 1.0
X-Received: by 10.236.39.134 with SMTP id d6mr6221395yhb.90.1420719025901;
	Thu, 08 Jan 2015 04:10:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 8 Jan 2015 04:10:25 -0800 (PST)
In-Reply-To: <54AE72B7.1020803@windriver.com>
References: <cover.1420613743.git.hongxu.jia@windriver.com>
	<1420674899.25779.79.camel@linuxfoundation.org>
	<54ADEB14.9060004@windriver.com>
	<CAP9ODKrzqotT1FPxpK4x3KUmXGKXOtQtnJPCyru+ZZeQb6TJww@mail.gmail.com>
	<54AE72B7.1020803@windriver.com>
Date: Thu, 8 Jan 2015 10:10:25 -0200
X-Google-Sender-Auth: q-skjDILeGanS0lMTILGjRSnpY8
Message-ID: <CAP9ODKrXzsVnNtUjUyii0CVxyqDP49566Fij7SC+WUSTuuaAWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] add variable INSTALL_ALL to install all packages in recipes
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
X-List-Received-Date: Thu, 08 Jan 2015 12:10:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 8, 2015 at 10:06 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 01/08/2015 07:55 PM, Otavio Salvador wrote:
>>
>> On Thu, Jan 8, 2015 at 12:27 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> On 01/08/2015 07:54 AM, Richard Purdie wrote:
>>>>
>>>> This tells me what the change does. What it doesn't say is why we need
>>>> this?
>>>>
>>>> Its a fairly invasive set of changes but I don't see the usecase...
>>>
>>>
>>> Hi Richard,
>>>
>>> I am sorry not to say it clearly,
>>>
>>> 1) We have been asked many times on how to install all the PACKAGES
>>>     of a recipe, we can only list them one by one in the RDPENDS (or
>>>     IMAGE_INSTALL and so on) currently, especially like dynamic generated
>>>     packages (perl-modules, kernel-modules) which depends on many other
>>>     packages, it is not easy to remember these package names for
>>> customer.
>>>     It is helpful for user who does not take care the details that how
>>> many
>>>     packages generated in a recipe, just want to directly install all of
>>> them.
>>>
>>> 2) Providing a mechanism to install all the PACKAGES of a recipe is
>>> helpful
>>>     to test all generated packages of a recipe could work, such as the
>>> defect
>>>     of '[PATCH 3/4]' was found by installing all packages of python3.
>>>
>>> 3) The fix is based on the usage of IMAGE_INSTALL, so it doesn't affect
>>> the
>>>     users who do not want to use this feature (We disable it by default).
>>
>> For me, it seems those should have a meta package, not a new install
>> variable fo this.
>
>
> What meta package means? I am sorry I don't quite follow it.

Like we do for gstreamer; gstreamer1.0-plugins-good-meta, for example.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

