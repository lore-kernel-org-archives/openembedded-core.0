Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id C47D670703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 12:31:16 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 19so1581786ykq.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eQT5beyUktd9vKdKI0rQo4EwvpWnrNUQcrdlvmi8Ml4=;
	b=g38RC8KgNiuj+OZ60jiNQBv9+4DSZg25YTSfUAUDjyZSgBSHMz54sSW2jmF/hxqWiI
	BbhQ7/I4EVghINIutJje963XwZVjJ4ZhXJwqHwrixZ6swZcJuDFoiI3AFS0ov64JgLok
	hJ7sZ8lfHzCljXKz5Mc5FAeD9IH9IRkhbWGO0KKV3AueqxVYLUim5bhJ/8a999rqN97O
	WaF1HF3F8H6b0t1lbfOm6ZoDIwJr9EdNBkrjy44kZ+7/F9kLI+eBFBN8cvTmETxPIH5m
	QAyPK+tBfYM4r7UbnrMOxGnQVT09Z0Z9jJ5VqBHrgZMbX4USB9VMQ48Bz4f7JHTeIDy+
	8YEg==
MIME-Version: 1.0
X-Received: by 10.236.75.99 with SMTP id y63mr6958228yhd.105.1412944278003;
	Fri, 10 Oct 2014 05:31:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Fri, 10 Oct 2014 05:31:17 -0700 (PDT)
In-Reply-To: <1412937419.10719.4.camel@ted>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
	<543719D4.9080308@windriver.com>
	<CAP9ODKqHaOc6W0+WpyrdhQjXWaD++MdfMiUFWh0aKZVC0uJq8Q@mail.gmail.com>
	<54372DEF.7080101@windriver.com> <1412937419.10719.4.camel@ted>
Date: Fri, 10 Oct 2014 09:31:17 -0300
X-Google-Sender-Auth: 59ICWUZVuxgaDaiNhB2hsZ-8BpQ
Message-ID: <CAP9ODKquVUeXgJwOfi_Crm2KJ4_ZYf-b0W7LX02P-zfyGVyb5g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchains-scripts: Add support for target environment scripts
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
X-List-Received-Date: Fri, 10 Oct 2014 12:31:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 10, 2014 at 7:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> In a similar way to the previous script which adds support for native
> environment scripts, this adds support for target environment scripts
> too.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

