Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4667F895
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:09:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id t26so4092601wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=Grqka47wKVoVZqHuG0fe3JJ+TSQDIK5CAD+yRXjq7sk=;
	b=ca2BrXWNG8YuUATmy+IbaRLlumTwPiY1wPnif9Mx7QVRRMyxKxEH53ovBTAS2wqYQw
	VMy64ULb7cJCCbw/7fBacdtN7NKDJcOMmbmEIC/8k8M+oADlMn8YYgIqDmVMWn/WvB32
	CncL3ZlCdre5/CtdPTqurADHNDuq6ldmMhO+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=Grqka47wKVoVZqHuG0fe3JJ+TSQDIK5CAD+yRXjq7sk=;
	b=aCoNoIxpdAExtaB7BBKEvcsoWPjQuupCoLjbGc28fbGn1XJcYFQ1e40Lj4EgImP4gi
	RvGtzE/qrWM7qTpwX7zlAp58zeUUAepLg6kHg2hCX0Fmr2n+60eAezAIvYukXZACNEFK
	pluU2HgsqMOY+2lx6azXsjW3NDjPLI06hbfU6QfZFj9r+4C20udlVoUdM+xjaS/6xk+u
	BjOJrOubvv+FNoKwlULmPSYhN3jyk46yGmmxBKHtQOJihL957/9LjxmZhXn4/LLvlGpB
	uu3I4shZGkWN+/A/FFzRmOks6rGHuNqRUJSbKTY9PHgGn0mrZfB54/ZYDTiQpdChjTvx
	45NA==
X-Gm-Message-State: APjAAAVzUj3R9MBw8KdnhYPzeBbexpmHzBfYE/cCwmbDTnCL3uw6PkKu
	+r8Px9PJ4P2rLrgVHg56ZzyvQ7zEaRg=
X-Google-Smtp-Source: APXvYqz2VAyyZG78wZItlwNw8hJUvARYC3IBD8ZYqZDz923UqBQDNDlp9iWegdSASPHe6SY5XI0tdA==
X-Received: by 2002:a1c:3b82:: with SMTP id i124mr9939999wma.122.1574348943664;
	Thu, 21 Nov 2019 07:09:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a17sm3696009wrs.33.2019.11.21.07.09.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 07:09:03 -0800 (PST)
Message-ID: <311a7b14047d26626a1669028386eb90c2a1d38f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Thu, 21 Nov 2019 15:09:02 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Disbanding SWAT team/process
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
X-List-Received-Date: Thu, 21 Nov 2019 15:09:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It is with reluctance, after discussion with the TSC, that we've
decided to disband the build failure SWAT process.

The reason is simple, there were no longer enough people willing to
participate in the process to make it viable.

This process was there to try and offload some of the build failure
handling (from me in particular) and try and engage a wider group of
developers with the patch review/testing process. This worked with a
rotating team of people ensuring failures were entered into the
bugzilla with the appropriate information. It worked on the assumption
that with a large team (12+), occasionally doing it wasn't a burden.
The assumption no longer holds with 5 people left.

The process did have issues with consistency and there are valid
concerns about whether the people helping with the process had enough
context to be effective too.

From now on, people triggering builds are responsible for their own
failures. Automated builds will fall to me (Richard).

I'm taking that work on since it underpins the project quality and its
of key importance that the build failures do get handled.

I'd like to thank everyone who worked on the team over the years, it
has been a big help and was much appreciated.

Regards,

Richard



