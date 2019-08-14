Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5B37EE19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 16:42:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p74so5147782wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=9p8LW3/67WbGYmFDY31Vl7a8formflfpudbGm3mNc+o=;
	b=Z+9B8SHpw1NzEsUPCSwOydVad+Ih5MKGopiyGlRzj9yTzKcaIcyE8SPk4kulXRsWU3
	K/P0wUDwzjn+2AD6Wd7ysG883m93Q1KnFc86j5uQ6XjKuvlLrdwI4+eB0GYOkt/xjNHW
	CqS5GOTHVDiSiWq7SVTqrn0AkQzpHeRYRPUjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9p8LW3/67WbGYmFDY31Vl7a8formflfpudbGm3mNc+o=;
	b=GEvLV4fEX+32NY2JVtpFmnYnO/CjPKlB3p7c2uFb0+4ZqEXC0xuvCYuCzl4BJJ0jrR
	jGt4YhGPto92MLRvKPLGOXV0K/NA+LPuou5cY3/jBdtcp6kT2KeWBwRVF6WkNNYVHSfq
	qlQ/1zBguWGkHFTOs/xc0VR4VMAGZ3QdcJaTyhJ0n2ov1ZJ3A2fWSEQYJ8u2iKX7IPhs
	zBQzsUIYBEzTNylemZ+HDePI5lbQjmVjRRhlxSYGzxW9jvD/FDyFu3i7mlcCrHlybthW
	PmNdBBhcMPpZTgR5UlrZLhdbC14zocy1R29mgVqSWZ3rvBG3RjcT7O0+TwJZCXIwpJ3Q
	F4zg==
X-Gm-Message-State: APjAAAVY7nqVFO7L4c7zWbzzBvWT8BJAHY/2xqQgzS0slQcF4mBH3EXh
	cX2MbMliFOm+YsXoeYW0LACJfw==
X-Google-Smtp-Source: APXvYqxbbOBdDLdW16FLct7ZoCVyBtdem1vv4jU6wpxFmEqWLIo+QaodKVZkTKCOivVha1fb0uR0bw==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr16765wme.145.1565800926033; 
	Wed, 14 Aug 2019 09:42:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k124sm287594wmk.47.2019.08.14.09.42.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 09:42:05 -0700 (PDT)
Message-ID: <23fcfd39e3626c222c41bda1e40099820d82da92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 17:42:04 +0100
In-Reply-To: <20190814152613.46996-2-alex.kanavin@gmail.com>
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
	<20190814152613.46996-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] qemuboot.bbclass: increase the default RAM to 512M
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
X-List-Received-Date: Wed, 14 Aug 2019 16:42:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 17:26 +0200, Alexander Kanavin wrote:
> This was already the case for various specific qemu machines,
> and 256M was found to be no longer sufficient for x86 either when
> switching X from vmware to standard vga+bochs vesa driver as provided
> by qemu (Xorg would then attempt to clone() itself with ENOMEM
> returned).
> 
> Let's just accept this new reality :)

I'm not sure I agree with this.

We are meant to work on embedded systems and 256MB should be enough to
let us bring up X under qemu.

I'm fine with some sdk/ptest images having more memory, that makes
sense but 256MB not allowing X under qemu seems rather poor.

Are we really saying the minimal image size we can emulate is 256MB
ram?

Cheers,

Richard


