Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1601D6011A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 13:30:21 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e185so11911968vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=r71i+7J+y0GpTTZlcZa2Woqm5sZWyxMU/EccFmCnDvc=;
	b=anY5M6FkJQCL09SkmuxxWOdikCHHiqJcETi9JTa5h+gKq4b8l5BxZ86dFEJflaQxyb
	h419mcCr4GZ9Z1ZYLlJs1eP1KEaqB/0bcIgpaNL9Y7/AeI+2bi1gNoFpXItileGTY8hE
	J9g+Jo9pMEKVrqBKNvOIMAhzz0Ms8U9eO+C3Pf6X82O1p7gJ286+bPgy+R3BV7RTin5n
	fAA/3w0LN7dWyhahhQZSVuHCdQaSNooJrY5TtYErTzxm0rLLfPRupHVHQkDLN8T2pse7
	cyeRS4BpHcYwNfHWl6GTxII9binmxnknvBzkwlZ+60aeNZtWa71WcZfGtLkTQfbY/rcJ
	PNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=r71i+7J+y0GpTTZlcZa2Woqm5sZWyxMU/EccFmCnDvc=;
	b=A8p3wi2IyuE8QLplyuByKynq8CfP6jzEwHGUm5Ej8fBSFBNZwuCvC8x5+kY1IwLgEo
	EI/4ua6OHsOKO4/UCp7uQmct83O538VQtOfLWzuWqsZq5g/+64gTs4swTNKQlExV1IAR
	GvXW4ftDrwLt3FdIA5yLpfaDNGuqCzq4G9XbYzl0rI6FTraXdI7iz5LTc5XcIrzlqwRF
	lwBqggSA0KQ7PJW/s1uWqyY3fSICKZzKrZauLj9op9yLr4dExKiDIWGKg5VDtRFBL2pN
	rUBFVc0t9cehfzKMSi+NcQ+BhCAFQGe0WYVMk0g4OU+dppCocb544AOpyr7tPC65wiM4
	7T/w==
X-Gm-Message-State: AD7BkJJnx8N1ADY6g/j/xBy7RLGsvU9fI1g39z2xYrYJfGywKbCDZijK/8zztOggFxsUjsUxlBdhOUIlmMJTAw==
MIME-Version: 1.0
X-Received: by 10.31.58.213 with SMTP id h204mr1423896vka.101.1460035821775;
	Thu, 07 Apr 2016 06:30:21 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Thu, 7 Apr 2016 06:30:21 -0700 (PDT)
In-Reply-To: <0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
References: <cover.1460015043.git.liezhi.yang@windriver.com>
	<0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
Date: Thu, 7 Apr 2016 07:30:21 -0600
Message-ID: <CACS+7ZQ55g1EQkWD5OQOH0zU=S1p9BRx_Nn8u5FKQmL3_-QEcw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fs-perms.txt: fix ROOT_HOME's permission
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
X-List-Received-Date: Thu, 07 Apr 2016 13:30:22 -0000
Content-Type: text/plain; charset=UTF-8

On 7 April 2016 at 01:50, Robert Yang <liezhi.yang@windriver.com> wrote:
> It should be 0700 rather than 0755.
>
> Reported-by: Charles Chan <charles.wh.chan@gmail.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/files/fs-perms.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index 109cbe5..1d74da7 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -51,6 +51,7 @@ ${localstatedir}/lock link    /run/lock
>  ${localstatedir}/tmp   link    volatile/tmp
>
>  /home                          0755    root    root    false - - -
> +${ROOT_HOME}                   0700    root    root    false - - -

I'd like to see this in the section labelled "Special permissions from
base-files" around line 58. I think that makes it more clear that this
is a special permission setting.


>  /srv                           0755    root    root    false - - -
>  ${prefix}/src                  0755    root    root    false - - -
>  ${localstatedir}/local         0755    root    root    false - - -
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

