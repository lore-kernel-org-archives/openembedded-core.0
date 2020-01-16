Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id D75737F79C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 22:00:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m24so5379743wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 14:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZadDUGzGWBZ0g1wnYvOo9BUD9I2ivqnE4fNwjR1vVNs=;
	b=FXEs3P9aJSjGEebyDA7TymrVq6Sa/aadOJ5/Irh8GITy8V2NZB6Qm0EzRgbXbO1I7A
	Kt8QK2c1l/HoUbCdLJWVbyDLQPTBiZ0xHlPrG1Pm9ddzNN6GbUl9DvDUkEbkyfGCPqT2
	ew8filVnGXI/lheLMz0inAm4SZytGldeOd7us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZadDUGzGWBZ0g1wnYvOo9BUD9I2ivqnE4fNwjR1vVNs=;
	b=NlXMAYZIMJaaSQVo/97gKkxUBQ6d8lWk0DAb2oU9Tu08QG9s5/s4Ygpngw3ntJIwRx
	Hstr8s7qbJl23JU1YV9KZ1Hokqueb85V/sMuuMefvrd9MPEJO4e7t+qyOezvNoiW9/ec
	kh1aj/o/FEtSpWUeCTykeijc/p3cB+1OrFSUnQd+yX+Ko7F7whXq/t81AY0Pz1eLh5P1
	8CxtHoNdShHv3n6egBnxYqd8YrIHihZrQP2XTJ1ujyDK13UwJzJxXWowCsRWOeIHUQsR
	CIZF0mp+Db/74Tr1m6lCyJFQXkYiPKlQ1xsmD8HRmlXhlvWfWcVIUo9fzc6xSFJu9jBZ
	AV1Q==
X-Gm-Message-State: APjAAAU1FT5XfO1Ku51tWiq8RcE+lhs1q1UPq/hDaqtTQNBkrDgTNPHs
	kZ45wQT7cCizUqUwECD+i5fjpw==
X-Google-Smtp-Source: APXvYqwUkK+1VS9Qh1T1/FzKzRirjKappvaZYQ7+E1ynO/XzRtbbAIM1FRC2bXAoQbewWUUUldlaDw==
X-Received: by 2002:a05:600c:2215:: with SMTP id
	z21mr1136202wml.55.1579212015426; 
	Thu, 16 Jan 2020 14:00:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm32827456wrg.27.2020.01.16.14.00.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 14:00:14 -0800 (PST)
Message-ID: <722e1fd016354b3ad453bc04ee8e5d2cd7a24ec6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, Yocto discussion list
	<yocto@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jan 2020 22:00:13 +0000
In-Reply-To: <CAM9ZRVv1O-vdWAtN=2GXjSz=sJ+LDGZYMKv0qiFzEa5Q3J9+Wg@mail.gmail.com>
References: <CAM9ZRVv1O-vdWAtN=2GXjSz=sJ+LDGZYMKv0qiFzEa5Q3J9+Wg@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: patchtest licensing
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
X-List-Received-Date: Thu, 16 Jan 2020 22:00:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:07 +0000, Paul Barker wrote:
> Hey folks,
> 
> I've started looking through patchtest & patchtest-oe in detail and
> spotted that all the scripts, support code and test cases are
> licensed
> under GPLv2. Is that ok given that we plan to copy this into
> openembedded-core (probably under meta/lib/oeqa)? Is there any
> practical effect of this not being MIT licensed?

We have a mix of MIT and GPL licensing already. As long as the scripts
have a clear SPDX license identifier, I think we're fine. If not, we
should add that in the existing repo before the move.

Cheers,

Richard




