Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 773E07E815
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 07:51:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v19so1195512wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1ucXCrIQ3UWzMz0ZmW7NhREpeRe4ydjnoUhpD+Wtr9I=;
	b=GbLS79Lp3sPSNcUsw3XDzsJu7IPysI4Gn6i8cqYg3fjQLve3XZyaaJESo5IerEOJ49
	L7xPH60q+cSP6OEbzksmyhDBYrALsUT5ggkCbFsJ4/NeaAVU7aVAw8UtyHfaop82JMdB
	AmO1aNDgBcROsXy1pnLlXvtvti7YK9suVoIwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1ucXCrIQ3UWzMz0ZmW7NhREpeRe4ydjnoUhpD+Wtr9I=;
	b=CxSD32Iu/6gYcQmFqNJxoQ5glLJvRorsDDeRIz+5hJn16lwn9ZTHGjsI6BVL6Cxz+i
	oEYmMbsBRN3mmVXge/TyNS/wQeq8X3ratcxPVAtoHzRLHujsfT/Z78/goKcB7iOu10pZ
	Gq8PjzK45zakU7C2APwVZr5pogNvzBRZ0Eo8pqAIa12wGMAeCKNU+Qjc3xduMFc7IQUC
	cCmjeFDEqy6bI4MB1+RNqM65Wo93yefrM3KVfQOQUmdXp9xoxbh7IShoqHdGSL7N7YnR
	vcvNA310nqpNE+Bw5mWKtwZoElyJPpdMTr9JL8l9T4TBzNi/MfnEqVLup3QVO8YiY0Ss
	IC0Q==
X-Gm-Message-State: APjAAAWx5QVV4AX1GX6/ODst7LRyC9NtzXGXozsv2HHWDKlmXfvZuTf5
	382EvEyOAK4+sVoXJz/QE6qg3A==
X-Google-Smtp-Source: APXvYqwONTz8sNKoHhTadzwmQ/2ts5atkL1zn2yNMcKsp6YZrEQ6huhdKa7IYhOD0SQF5Lhf5hDtZQ==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr7118199wmj.44.1562140317863; 
	Wed, 03 Jul 2019 00:51:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h8sm1253768wmf.12.2019.07.03.00.51.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 00:51:56 -0700 (PDT)
Message-ID: <ab85111307d8ed9b93c0fb8026a91ae5f24c4ed3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: William Bourque <wbourque@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jul 2019 08:51:55 +0100
In-Reply-To: <CANBSh+N4AL=o5bsuVEWJRUX+VzpsLv=dPBSo=OWCZBZnx_vrpw@mail.gmail.com>
References: <20190702182403.24099-1-wbourque@gmail.com>
	<20190702183053.2330.89816@do>
	<CANBSh+N4AL=o5bsuVEWJRUX+VzpsLv=dPBSo=OWCZBZnx_vrpw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdpYy9wbHVnaW5zOiBTb3VyY2UgdGhhdCBzdXBwb3J0IGJvdGggRUZJIGFuZCBCSU9T?=
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
X-List-Received-Date: Wed, 03 Jul 2019 07:51:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-07-02 at 15:22 -0400, William Bourque wrote:
> Hi,
> 
> The error "scripts/lib/wic/plugins/source/bootimg-biosplusefi.py does
> not exist" is a bit puzzling : this is the new file my patch is
> adding.
> Is this test failure expected for new files?
> 
> I sent this using git-sendmail; should I submit using a different way
> (pull request, ...)?

I think the test is broken so we can ignore that. I've cc'd Sandy so
she might be able to look into this issue if possible as we've seen it
a few times.

What I did wonder is whether we should be adding some tests to wic for
this new plugin though?

The existing tests are in meta/lib/oeqa/selftest/cases/wic.py and can
be run with "oe-selftest -r wic", would it make sense to add something
to this as part of this change?

Cheers,

Richard


