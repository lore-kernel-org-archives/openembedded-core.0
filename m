Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFB9260C76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:41:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s10so2318748wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8I7fcxvDFj4ffC/dPRM1y9dU7+1fqmdsE13V+uRXVRY=;
	b=Q1a9+0QEEZt+iGtf49ZvdX0td1FkR/8k80J1zFScVxgD93cr2QqGVXxGwGn6eJ/c8u
	PD3heAOdWrv5d5ayXMN9d0chgAArC8iVQiGbrt4CT1Ryz+sRocbWFX3/dtAaT4VjkuH8
	ka/G9BBh/9fx1VPkD8Va9p+DbR8f4wmJmQnd5O/yQx80u4GeIFIQRFp8qLMExYFjXPLx
	EeNvSvOQIcN0iQJte8gCukQ3OHsGevAvMg/sOy3+5FfpAIF1QfmHwPSQCyWHUOdYYzzF
	OEwuhey75hJOhyGQX2dwh2mbZfKhJq9lVQN2a+WoiZMLSNOSU4LNy6NdUd155ans5X1d
	Q7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8I7fcxvDFj4ffC/dPRM1y9dU7+1fqmdsE13V+uRXVRY=;
	b=EAJW7+olV0QU1IMwZBxw/qexHda9MA9LT3gu1ZAWvpZy51CZkaF8DQEB9wRwvBkBfu
	rMpXcjnBx2cnaMqNwwNseZLRa2IZnRrbSyYCq7D4w/h/O25Oh7IR8lzsj6Kp8O65z4Nw
	utg0kueoaCu90TWk+6+yJWSqLB4EynNvIbtb8o8qIiVS2wJEBnfpuQhasysg3yYbFYyA
	Zq8IiulEPCcTTr9MfYScj7kGxGryIGEoXGSJ78U0ebH+S73Fo1jBEW/2oqln/Q9SB/ck
	93EJXD/YQ9Vn3OCLtjc71eB0/oXZw8g6B8/l9QVIe6vMZKYlySeESX8SQYKha2JmrvOG
	82vw==
X-Gm-Message-State: APjAAAV3X/RWHpyuRRnY3ybu8zzc9ZGXCnqO5Q5mc+Z0n6K/VgeVqRWi
	Mj8j9nN1AVGWd3ltQkFJr0PJg1FZxrfTj3/ZaNzBpnY6
X-Google-Smtp-Source: APXvYqzUgMduSZ2JTmVVs8pelalyiG3X4rFtFNA/yAhZTXfcMXUDSAwXCJenxiZIKPrdL6w8EIJbStPWfHRV+AZ27vU=
X-Received: by 2002:a1c:5448:: with SMTP id p8mr5900744wmi.159.1580906505482; 
	Wed, 05 Feb 2020 04:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 5 Feb 2020 22:41:34 +1000
Message-ID: <CA+aJhH2WTqiXEDBj7nSHiPQ9CeY2eF=aG_Vd+xJ=XpJx-o0Peg@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 0/5] Microblaze tune updates
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
X-List-Received-Date: Wed, 05 Feb 2020 12:41:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2020 at 07:06, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
> Version 4 of the patch set.
>
> I've collected all of the patches resently sent, and reworked them per
> the comments on the mailing list.
>
> The patches are directly available at:
>
> git://git.openembedded.org/openembedded-core-contrib mgh/xilinx-microblaze
>
> The work was broken up into a few more individual pieces.  This will allow
> backports to Zeus for fixes vs new features.
>
> Mark Hatle (5):
>   microblaze tune: change microblazeeb to microblaze
>   microblaze tune: Allow no version to be set
>   microblaze tune: Enable 64-bit
>   microblaze tune: cleanup +=
>   Microblaze: Adjust Linux items from microblazeeb to microblaze

Looks good. I gave it a quick test, qemu big endian builds and boots
core-image-minimal now.

Thanks,
Nathan

