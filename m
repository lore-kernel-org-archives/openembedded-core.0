Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1C360807
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 16:02:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r10so18659702wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BLvQu7vGMFlXwMOJ+cHYoYWfqu9ZX9FFoRlK7IfQyA4=;
	b=TDogexmEx9UjWgC70B38ESXuPFzgO+ulYMvxeN27160HRe4j40kIWAEsrQ+DRg66YO
	pXGqj66QMg0X3jMcPH7iCpxEF3Rlk6xHtWmpHZLhX4hQf7LdLwc7GZnn6LD1ZHTNynBf
	oKMz0olbNdwu1C+Y6RAzUEU0YC2+HYy/hNZ5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BLvQu7vGMFlXwMOJ+cHYoYWfqu9ZX9FFoRlK7IfQyA4=;
	b=XySVNT9Xqw8HgOeFy6BHvuM3tNbz81YBVeF4Qem5vbDkex6RiXVjE+vFsaeKmM0sjX
	Zrp4qTx4curCNc57MQXVQSzchyd9ez4pzAnKnWYU9qg8LIQQO1KVDw/4rVi34Fpcn9/7
	pB/Bv33JonkUCBtnnX7G7wo9QrHFuDHc0Z7piKKH+Yu2I25QohJakc4FL4GCbKxgE0hJ
	hOLUXx+oic1pWEWdMSsDZqYUrxkBF6gtlhWed856f8wc+cYbh1IsZYkniIipitsPA8Aw
	WH7QQVqS2zT6H6mfrHQhf+AUtlKofN2gqnOVqsQFBOv4ufr2vpijce/nPBZboYfWiQHY
	dZxA==
X-Gm-Message-State: AJcUukcfxZlMstjEeig2rsZ5jK7t8JCBjEiIesh6XWDq3xAfMShLPwwQ
	Oe6AYIMlFpb+/vgbUp7HeGp2DQ==
X-Google-Smtp-Source: ALg8bN7/xhLD0B1JjYV21EluKzGCs89gonyhKCLP2W0CSxmYEMpS9OipKBtznyuVWdHlphLVMBvADw==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr21973971wrs.290.1545926532794; 
	Thu, 27 Dec 2018 08:02:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k15sm47613163wru.8.2018.12.27.08.02.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Dec 2018 08:02:11 -0800 (PST)
Message-ID: <0b838a187e20329b17029308181b31a99c73c720.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sungwon kim <sungwon.pino@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2018 16:02:10 +0000
In-Reply-To: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
References: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 16:02:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-28 at 00:25 +0900, sungwon kim wrote:
> Got errors when building SDK. Unable to find bison.
> To fix this issue add bison-native.
> 
> Signed-off-by: pino-kim <sungwon.pino@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What kind of errors? Why don't we see this issue in our autobuilder
testing?

Cheers,

Richard


