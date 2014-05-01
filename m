Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id A833C65E3B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 21:15:59 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 142so3113959ykq.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 May 2014 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=7ZsJqryoU8Lz1Ix6RubFh2POJeqID13qqScjRb1qwvg=;
	b=aCiExWU2scZCBqrnxPKcEOIUrUDbf/da8pz/XSuUEf9xIoJNWxclCxmVbgeIiC/yuD
	hMwgqxY82Ysk71RUK0nv5+VEl5MgwC4+cjocTKBarhwuqgcpRE4zeDeHLgScRvvEzgSa
	csRVQj+bHMnpjB7MOwI9jTW1wqfqlr3LUqKRy1w4Yce9RlQI0gKuhheNTKrB8Ptj0mIu
	oVyk4KcGqQWgsUMXsN0Pn4/sFsPx7i0+ubCQYugH9vy3E7R/uXbaJ0eN7R6Jko1XNPyL
	dz7MYhwY0OnZrFaMLbFaauEBAcG7yjopEcvhSI+fc33hrH6ILb9O7kfNKOED9SQxGBVq
	vyGw==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr18324142yhq.14.1398978960153;
	Thu, 01 May 2014 14:16:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 1 May 2014 14:16:00 -0700 (PDT)
In-Reply-To: <1398978886.12731.5.camel@ted>
References: <1398973084-16849-1-git-send-email-otavio@ossystems.com.br>
	<1398978886.12731.5.camel@ted>
Date: Thu, 1 May 2014 18:16:00 -0300
X-Google-Sender-Auth: nJgjRbNqbb0_5ATka_TcGe0ND7o
Message-ID: <CAP9ODKqvupLb_GR1NnkXmQt_FmJbOuQYgkLWFdiUhuBYYhw0zg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Bump BitBake minimal version to 1.23.0
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
X-List-Received-Date: Thu, 01 May 2014 21:15:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 1, 2014 at 6:14 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-05-01 at 16:38 -0300, Otavio Salvador wrote:
>> The metadata started using the bb.utils.contains_any which has been
>> add in the BitBake 1.23.0 release, set this as the minimal version to
>> ensure parsing compatibility.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/conf/sanity.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Technically its not quite this simple since versions of bitbake exist
> where the contains_any() function is missing yet the version is 1.23.0.
> We therefore should bump bitbake, then bump the version here to do this
> correctly.
>

Should I send the 1.23.1 bump to BB or you do it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

