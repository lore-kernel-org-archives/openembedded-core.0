Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9DFF27C61F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 16:45:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id o17so14733706wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=QsmGLcwiEQvP2IWFlMefqXgMFJEIZzTVLp8Vrzk2Bd4=;
	b=SVE0oLTzZ16v/szqFRxt+8arVE1ElkII1LMhUBoK/aUVeu2ZogLZn3cJC1gtmbO8d8
	tKzq5ebrKR2P2RuCqZIeuXv1zj6xK2DN3yzRRMOk8613pioZUG6lVjD9ujdTpx0xH/0M
	I04702LZts2yKOwp1+m1wav6JfQvUhuthEElU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QsmGLcwiEQvP2IWFlMefqXgMFJEIZzTVLp8Vrzk2Bd4=;
	b=hjRZvGD5JuGjhFRilT3c3b7Jo4Gp8O9gdQwYi3CigCZxw/Jx5jdIoUarRC8gocaebe
	rXadsF+yJIuWwVReAg3JOzPB7QGNTIh1vL07UWuZIKhOcrlYL7KU69v6UfS6AVUD9Yzl
	/ysYo4XIlvk+j25sKN68cKNxoXeK7jViTVgNqjwRIKNb+83IstOicm+gcp7DIMNm7aT6
	skyc+IiLPC9ZXOCIHIoA0GRo6oiejSTFdJ+Ndsvs+QA0XPk6NyFQOc2LQr6exK7Bkpzv
	ggZGI5bgi32f4yOhu4hP0nXrrOJD7/+zx39QWHHIGlGFXM638tUcZkIlTjb754dvBBAo
	5l6Q==
X-Gm-Message-State: AHQUAuYlH+6InVwgNUDBcGHeq8cCsflQvYHg++lPhp+tmz+Eow1Muz4x
	E/mQCVbM5KAm0CXiybSd7//Wuw==
X-Google-Smtp-Source: AHgI3IZ/5zPyNuJ8T2b3n7aeih724iSTdWayIs54W7MIEQEng+TR13HYPgJHmFXGnzfFk4ST8JX1Zw==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr18073933wrq.141.1551199522329;
	Tue, 26 Feb 2019 08:45:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f4sm13718754wrx.68.2019.02.26.08.45.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Feb 2019 08:45:21 -0800 (PST)
Message-ID: <91bf30884c3d4212d8b7054a08d4f6421fd42933.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Rifenbark <srifenbark@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 16:45:20 +0000
In-Reply-To: <CAFNP8OuB-dL0xRv975XEhx6zgU6xmjhZeFj7P0xj1jVsjB8+4A@mail.gmail.com>
References: <20190225185954.15628-1-raj.khem@gmail.com>
	<CAFNP8OuB-dL0xRv975XEhx6zgU6xmjhZeFj7P0xj1jVsjB8+4A@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Tue, 26 Feb 2019 16:45:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-02-26 at 08:40 -0800, Scott Rifenbark wrote:
> Hi, 
> 
> The DISTRO_FEATURES_LIBC variable appears in the YP reference
> manual.  Will it be safe to remove this for the 2.7 release?

Yes, I'm going to take some variant of this cleanup for 2.7.

Cheers,

Richard


