Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9047665C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:32:04 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id b6so4658821yha.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KFvtY1IOI4DjnLXOWwwCysfX3uuKCzHmD0m1HjrYZsQ=;
	b=s9syVaUwFYaIgsVqipXlLvF3cYuBphcA3QJi2BcP3SN4VsR8yiWXMUmR2fHFh5MVUp
	WJbj/dGZ0OLdGqJXIMkNI/y3V2+XaFredmZ7eioQslLmMaRCrozrW6wIqy5PqcUVfElP
	KiZW7ZmRKXmC3yAWmAaj6hf6JDVcfuEppP66D+jZiFHt+R4umcTnynxOq2eLIn/c2xSc
	WAvIjp4qyotDcTsKpgi8SqpI+mwmHbwggfanSr3Ccffi8r+0RkeD8UtNVoeDoo0euJq6
	QL/BislnJX8KMdTcFfNSc/I3SDLJ1HuPi1hl2/se9lxKfCrxKz16s+pt9YBvq99e0tve
	jqtg==
MIME-Version: 1.0
X-Received: by 10.236.29.171 with SMTP id i31mr42463057yha.37.1407180725186;
	Mon, 04 Aug 2014 12:32:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:32:05 -0700 (PDT)
In-Reply-To: <70af713a0ac99c9e5fa6a1e01cf2e1cd54e5a14e.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<70af713a0ac99c9e5fa6a1e01cf2e1cd54e5a14e.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:32:05 -0300
X-Google-Sender-Auth: YlzzPl8mj12B2R0B1iMmu3vVnlY
Message-ID: <CAP9ODKquP8JwWx9AB8HjKVcdn0siR-U8Y7tg73T+26HA_qGYjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/20] udev-cache: Don't ignore errors from cache extract
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
X-List-Received-Date: Mon, 04 Aug 2014 19:32:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> Currently, error messages generated during tarball extract are
> suppressed. This seems ham-handed, particularly since under normal
> operation, the only expected error ought to be the attempted extraction
> of pipes, which typically only means /dev/log.
>
> So stop the redirections and add an --exclude=log to suppress the error
> message when attempting to extract /dev/log.
>
> This requires CONFIG_FEATURE_TAR_LONG_OPTIONS if using busybox tar.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I didn't test this at runtime so my only question is did you check if
we provide this option by default in busybox?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

