Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 726A572BAF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 11:55:46 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 79so1038222ykr.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pYGnvYDjEpTeJL9RUE0hUiM7e6vVarzT3yw6S56qrl8=;
	b=WIpz3VQx5hWrfAzRvwn38JLYLMUvY0AaBg8jxuloD9qMQzlxn6prSZ+GbRBvgm4x/p
	pLu+SZAvlaI31ko8z4I/l2uaZBLgSujiy+D1Wq60b9H49dQSNibn3mtpj3BWB3KgGpIA
	ntPJbNt3crHCep9e/2wAqV21Af+orfYcu7rJSYNwFN/ZcKhRbWm4SMYDu186Co+88ye/
	s9Srjv9ixWZkidHfxXCddTDP8KqaFEOIfVCWBmpRugDbOJZwCmaQWUeTQEsgRx5TPt5c
	HfrEY6X7wZv2L7iAHr8r0uAdz6EH4/PnGa/l1nqUWD3MYjK399zDxXkJlf64XrDqqp+M
	7Vsg==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr6851305ykm.50.1420718147240;
	Thu, 08 Jan 2015 03:55:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 8 Jan 2015 03:55:47 -0800 (PST)
In-Reply-To: <54ADEB14.9060004@windriver.com>
References: <cover.1420613743.git.hongxu.jia@windriver.com>
	<1420674899.25779.79.camel@linuxfoundation.org>
	<54ADEB14.9060004@windriver.com>
Date: Thu, 8 Jan 2015 09:55:47 -0200
X-Google-Sender-Auth: ntUxALXo6zTAuycoFQcWNivQn_4
Message-ID: <CAP9ODKrzqotT1FPxpK4x3KUmXGKXOtQtnJPCyru+ZZeQb6TJww@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Jan 2015 11:55:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 8, 2015 at 12:27 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 01/08/2015 07:54 AM, Richard Purdie wrote:
>>
>> This tells me what the change does. What it doesn't say is why we need
>> this?
>>
>> Its a fairly invasive set of changes but I don't see the usecase...
>
>
> Hi Richard,
>
> I am sorry not to say it clearly,
>
> 1) We have been asked many times on how to install all the PACKAGES
>    of a recipe, we can only list them one by one in the RDPENDS (or
>    IMAGE_INSTALL and so on) currently, especially like dynamic generated
>    packages (perl-modules, kernel-modules) which depends on many other
>    packages, it is not easy to remember these package names for customer.
>    It is helpful for user who does not take care the details that how many
>    packages generated in a recipe, just want to directly install all of
> them.
>
> 2) Providing a mechanism to install all the PACKAGES of a recipe is helpful
>    to test all generated packages of a recipe could work, such as the defect
>    of '[PATCH 3/4]' was found by installing all packages of python3.
>
> 3) The fix is based on the usage of IMAGE_INSTALL, so it doesn't affect the
>    users who do not want to use this feature (We disable it by default).

For me, it seems those should have a meta package, not a new install
variable fo this.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

