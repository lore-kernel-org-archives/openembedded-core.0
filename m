Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0AF7ED3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 09:00:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 5so9594718wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 02:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0gINHfbStB7qKrQIhum13bNViXnKu0390/rk58+ELcA=;
	b=GrGcERrS2Wcz9VNGJAWjmdrFURO3y6ZGYdY2uKhV5a8z1ZN+8gszsLlOVCZMnSInu5
	Hw88Z7HV5Dt6kOfTeaHomxzm+PHMzPj/xdgQSCXTLZsj/LvsnGNpcBXPBhd0gglaK7Qn
	s8XD+Gfi84KTiJy+Bd2aT8BfDxcrtVRUwygDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0gINHfbStB7qKrQIhum13bNViXnKu0390/rk58+ELcA=;
	b=NTsvXR8NUdOirPc8S1lhwySfKoV9geB6aeRp70ylhWugKjmmK8EXtnkJ3O/GAgUZVQ
	PWiIllqqCeId8mVBz6+EghK6y9xHJ7BYxX2j0Dy+JB4PZYuHN/n9ekzwuueuDZSQU7MP
	jlawnOcghWnPhOLVRxCqhJlK2qQqN/A4rCJGJla+Jpu0nRzyZT6KfR+1DMTQ4FOIMDh7
	UofuHDw20Lq+tQEA3PkgrD/q8W/FUpX46mSHP6AOcx0nwXYZG2+oag5hO0K/83iD3Kzw
	co8vYFhepFHh1XgEN9YawNHJBCotKYJIkpsWIgf6C+S16oj53AtYZtJySOVg4IRWZcaT
	aLpg==
X-Gm-Message-State: APjAAAVv5fbR+1GkWxW6RDguU08zy/3WoV6eWrnNiBsg8OLFnhGSAHHv
	T5EEmS1ZmviiKlLbP4+V7THGWQ==
X-Google-Smtp-Source: APXvYqzK/NtX6fTSwT6WmkaTclgC+Iba8JCx2c2Ei/yIcIckDRzsQoNXnByk3YMpXfplSutAVMwn6Q==
X-Received: by 2002:a05:600c:20ca:: with SMTP id
	y10mr2481371wmm.168.1570784441107; 
	Fri, 11 Oct 2019 02:00:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b186sm11497120wmd.16.2019.10.11.02.00.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 02:00:40 -0700 (PDT)
Message-ID: <0d5268fcee17db44397f8de81284e400efeb4180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Agner <stefan@agner.ch>, Michael Halstead
	<mhalstead@linuxfoundation.org>
Date: Fri, 11 Oct 2019 10:00:36 +0100
In-Reply-To: <1cc830a84a8b5e58672806f515f0fd0c@agner.ch>
References: <20191007164757.29687-1-mhalstead@linuxfoundation.org>
	<1cc830a84a8b5e58672806f515f0fd0c@agner.ch>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: ming.liu@toradex.com, rpurdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] uninative: Update to 2.7 release
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
X-List-Received-Date: Fri, 11 Oct 2019 09:00:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-10-11 at 10:26 +0200, Stefan Agner wrote:
> We run several build in parallel using the same downloads folder, it
> seems to me that
> there is a race condition. The history shows the warning several
> times already with
> exit code 127, but in those instances the bulid succeeded 
> 
> What I don't understand is how the update to 2.7 release could affect
> the behavior
> such that it suddenly leads to issues. Any idea?

We use the bitbake fetcher for uninative so there should be locking,
the same as any other download.

Are these builds in parallel on different machines with a shared
network filesystem for downloads or the same physical machine?

Are you using any special MIRRORS/PREMIRRORS?

FWIW we run many builds on the autobuilder and don't see this. I also
haven't seen any other reports of it.

I'm therefore at a loss as to why the locking would seem to be breaking
for you :(

Cheers,

Richard


