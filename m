Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5C236BCA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 22:46:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so1152021wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 14:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z2Yce4Ia+Egin64UdbDm4nhbcfOyGebDhm5YJu3aJis=;
	b=GuO0LOHpTOWM17r1Voj+/xFU/BUiLnwRwaynNiojC3GQgId3PWtuTsppmG6IzqGTSz
	UamH5S6Kdf9ZVfLyuQTiXVezS2QwEG/AuY9JvoaExJYjczHJh6+YBmFWgbYVoXeyJ/x+
	qJd99Xwd6cpoyyQuB/XnkfehWuwJVnq87ulTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z2Yce4Ia+Egin64UdbDm4nhbcfOyGebDhm5YJu3aJis=;
	b=c6bs6LXFQQy7psiElYjG7uUsy6Z1fQAj89IwVCQBlEwge/2onelkYwDCbztqkB8D9a
	i8FENCSCPMGoCrH3sCQ4kGmXzwfr/cSvMKy9SvV/LjNOCPUaVgu+XAqxav032+Yyqb/R
	loHBh9soaHGPOzqcIuUfvZN4coUwhrpEz2oXyy8BQ+lsY6AjqFgoTmOJFMDh2jIYPfYx
	KbKm98yjKdjpXK77kxeK/dzdptGcZ7Iu70hvWYteL2rVkdv/7p6q2jE9oISXvfjT+PpV
	QKrhN+9L7M+FCqFC9WJwkRKT1ksh6kxlFIhV7UfIHXjJKl18IlUtOyQr0XC5xvRZ4dIS
	wsgw==
X-Gm-Message-State: APjAAAUiT1bliWovvCk3X691GezttiK5+H/Bh5MLbC17k43djzXmgYX4
	wqoJ7NqKZ6vYGOZW6W4eIiVaag==
X-Google-Smtp-Source: APXvYqxOg9+5IxLI4w2wPPqeFFDHS59SJSbb0Ul0/1Pgodt0Odxy0Ep3PWyfPicwkr7FKxq8RFKX3g==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr1654905wra.36.1579560378449;
	Mon, 20 Jan 2020 14:46:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n28sm5003398wra.48.2020.01.20.14.46.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 14:46:17 -0800 (PST)
Message-ID: <6d9d51500019d44c2362ea6f9516e002ec1b2b93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 22:46:16 +0000
In-Reply-To: <20200120172510.22648-10-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-10-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 10/24] ptests: exclude lttng-tools
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
X-List-Received-Date: Mon, 20 Jan 2020 22:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-20 at 18:24 +0100, Alexander Kanavin wrote:
> These tests are producing failures that appear and
> disappear randomly. This requires investigation
> by someone with expertise, so let's disable until then.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 49cb9046c6c..f42e90bd187 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -58,6 +58,7 @@ PTESTS_FAST = "\
>  #    rt-tests-ptest \ # Needs to be checked whether it runs at all
>  #    bash-ptest \ # Test outcomes are non-deterministic by design
>  #    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one of the tests
> +#    lttng-tools-ptest \ # Random failures that are difficult to reproduce
>  #"
>  
>  PTESTS_SLOW = "\
> @@ -67,7 +68,6 @@ PTESTS_SLOW = "\
>      glib-2.0-ptest \
>      gstreamer1.0-ptest \
>      libevent-ptest \
> -    lttng-tools-ptest \
>      openssh-ptest \
>      openssl-ptest \
>      perl-ptest \

To put this in context I'd much rather have the bulk of these tests
running than not running so I'm not taking this patch.

I worry one of the previously dropped patches introduced problems here
as this was working quite reliably after help from upstream...

Cheers,

Richard


