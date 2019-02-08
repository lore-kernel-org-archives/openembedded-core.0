Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 428F179DCC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 23:32:24 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e24so8674613otp.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 15:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TYcxizaSwB6wlAOxXzcDLe6TOxEzpaybODEGLeabWuc=;
	b=rZiML6UKLciHOAifQjdeMVCadZvCrotcBqLLyKwqMre2y+xyABzEFPRhIZ7B9wMhst
	t91EJa9sabLLQ8GWYRYiWEVScwOcF7GgwnAtO38lOGbQ4AGuBnFZGb0BIvL6Ty7CFC2X
	M1Nib5wwYSL9u7p2WaPS+XkJZ63lcgp9YjLKUuvEi9YpiX8fCQPRLewMX63a9sZ0AJuV
	XSf9dW4cCySR4Sj5PB8g/9yv9NjygmNMQFkCZIFVLB/le6b6XKFhr49v4KOvonCxfgFD
	80iWFAKEplca5yNX2Q/D0nrRhRtZiwfB4UqBbrYKfNbxmcayUTgO7ddtkhcXFWZpNFHU
	8Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TYcxizaSwB6wlAOxXzcDLe6TOxEzpaybODEGLeabWuc=;
	b=dcFSvKFzeHbrTibh7kxEL1/94h16XNfmgHfhy/IpS2+CjInE/kueY6AUJqz0Xb0aJV
	uXf2L8MXR2CcaqQZ9H8oEB7YPezKgX/Yk+vJtKmUkUA39K+1b0yUPBrw8H/FGV3RItiv
	HuQsp4wLZacAI2+PXE94ltnJ4TBJbvG54YH3a0MKZjP0L+cYAwymW3UdJMOXrQwHg5KR
	v0NbB7eAXMmmfKY/oat/+5HzDFGQ4gTmaJgUPsQzehhcQZLUdeLzvN8PwxuHPuZ+KSrh
	vGYcc0jfts1jbqiQ/GROEHeyZFRtCKKQOpRN+tRstIAGJHccrk47jL1dC7tEVD9l2rvN
	a14w==
X-Gm-Message-State: AHQUAuY4ZnK464s3eJyfVXYtgJcOUgd7yVktiT5T5VFOrCKzqrpRjEH+
	I2HrNBJnqcKGUeT9T1STX0YqVLV40VvwLEz+MzE=
X-Google-Smtp-Source: AHgI3IaSbqC3KBDgQKQaoSw3D4qmKlCK20KJlc9WIXIcuRYqGGbgamR/UBWa8KajcaeGJJwzUkGIX5wzG52/y+5thf0=
X-Received: by 2002:a9d:5f18:: with SMTP id f24mr687651oti.96.1549668745301;
	Fri, 08 Feb 2019 15:32:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<bb8c993db03526b5f7ef16b2c076055b1ce6de40.1549637121.git.alex.kanavin@gmail.com>
	<20190208231255.GA2258@jama>
In-Reply-To: <20190208231255.GA2258@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Feb 2019 00:32:13 +0100
Message-ID: <CANNYZj-LeigbBS592R5qwvfG5yCApqgQhU_Fjhiz79U=y-ZddA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Fri, 08 Feb 2019 23:32:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Feb 2019 at 00:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> >  "
> > -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> > -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> > +PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> > +PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
>
> Didn't you want to enable gtk+ here as well?

Nope; it's enabled in a separate patch in meta-poky/local.conf
template, in the same way as sdl is enabled there currently.

On the other hand... maybe we can just simplify it all, and enable gtk
directly in the recipe.

Alex

