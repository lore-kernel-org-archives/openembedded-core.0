Return-Path: <grandpaul@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id BCBDF7E15F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 19:47:00 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id t16so5878149pfe.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:references:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eWTF9GhLzQqx/1rNpGKo49IXMyeR82/CeUt09tx0uY8=;
	b=jr1nDqSJotudnk3C+Znpv3vlmyFJSyv8q3BHneJVnRS2FBzwSy4iY5iu6OML2sT3g/
	7jg/N4C5L48UUnkQhz6HOPfsDcWv7XdP5db+A6dop8mHdVoxVSE1+wqOPBptzJIf0aXO
	lEyM7jPve5WlOx9wiyMGz5MEZs+nt9CvtfFH4AoDn0l0CdK3xNE46e4HvHl9wm6XUe0a
	BSOTTTXSDWbtnU9Iv9dWvnPc+w86bUKSKCrrq5zlTGQ4RJlwnwpenZoGR/8jZ/09uc3/
	jW0NjDDMOqRbyRt8oLehyrKwc9v93z/HydIm0IVCS3crsVK1H/BraNkieiv/eISanwo3
	Wi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:references:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=eWTF9GhLzQqx/1rNpGKo49IXMyeR82/CeUt09tx0uY8=;
	b=Wdwri6tiVl1isFpB/zvuFpJM6kP0yDnihR4QCGqWhoPGufTH0fXUzdmKDI5Wq+oxII
	JOSaxjs0Dini3UAGabR92CsyL41Io3cx7YZgUjPIELZ3EAVcorPhQU9UN/jHI+k/kscL
	zhWLqRoZbwroeCE200LIn8zaG/P9WRJRy/5lcURxGAHOSe4O3bUMyt0rJAVYM8U0BE8u
	dtNX6x3XdbAZgoRRc9oHdBKdgzwerd0WTebqTedQHvl55S474jJoTUL6/BMqKt7815bF
	pnTAf3AyoOh8RNszn7O9QfA5/oSgpPuXvp81zQ+tgkNRjE8qWLqU9fE+p/Y8I6JO79jn
	M87Q==
X-Gm-Message-State: APjAAAUvq3K1p2rTswnIjNQt8loQCJQQLW+i2Mp6BSSojxhoDe/xLuas
	W8NHcDN+FAt5XDwviVtQJLPJq72CsgU=
X-Google-Smtp-Source: APXvYqz0eKP++ZB004HJpXaJ3G+Win84uPLHUqfsQbaWcWdFFWU2+0fLKRszpI4uUUOQbLQQc4+jGA==
X-Received: by 2002:a62:6143:: with SMTP id v64mr39356223pfb.42.1560196021252; 
	Mon, 10 Jun 2019 12:47:01 -0700 (PDT)
Received: from [192.168.37.136] (123-192-177-76.dynamic.kbronet.com.tw.
	[123.192.177.76]) by smtp.gmail.com with ESMTPSA id
	d4sm14757050pfc.149.2019.06.10.12.47.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 12:47:00 -0700 (PDT)
Sender: PaulLiu <grandpaul@gmail.com>
From: "Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>
To: openembedded-core@lists.openembedded.org
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<20190607121954.116898-3-alex.kanavin@gmail.com>
	<2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
	<2c3427c3986a8fe363e6a99f3d78a136c79efd61.camel@linuxfoundation.org>
	<4cf0eb7936f1e27033202312d5e4f27e27266641.camel@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=paulliu@debian.org; keydata=
	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
Message-ID: <4b8b7f96-a4df-f43d-603a-b3656f882563@debian.org>
Date: Tue, 11 Jun 2019 03:46:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4cf0eb7936f1e27033202312d5e4f27e27266641.camel@linuxfoundation.org>
Subject: Questions: Using OE toolchain of different arch.
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
X-List-Received-Date: Mon, 10 Jun 2019 19:47:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Dear openembedded-core developers,


I need some help about using OE toolchain from different arch.


For example, on RPi3, we build the rootfs using armhf architecture.

(require=C2=A0 conf/machine/include/arm/arch-armv6.inc)

That means the whole rootfs is built by arm-linux-gnueabihf-*


But when adding TF-A and OPTEE. On RPi3, TF-A and OPTEE runs in 64-bit
mode. And TF-A will then load u-boot (BL33) and runs it in 32-bit mode.
So the rest of the systems still run on 32-bit mode.


The problem is now we want to build TF-A and OPTEE. So we need to
compile it by aarch64 toolchains. That is we should use
CROSS_COMPILE=3Daarch64-oe-linux-* from aarch64. But however it seems to
me that I cannot do that. I tried to make a recipe for TF-A by chainging
architecture of that recipe but I still don't have aarch64-oe-linux-*
available. Is there a proper way of doing this?

BTW, this is not about ilp32 because we still want the whole system runs
in armhf for compatibility.

Yours,
Paul



