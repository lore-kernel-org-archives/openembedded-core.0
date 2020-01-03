Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D62BE7F9F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 11:28:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so8294282wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2020 03:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=mt3uMN/46kIQcrAam1jCuV4BCbDAZK1NeSet2/y6jFc=;
	b=UyXUM3Vcf9OwCEvNQ9N0M4tal4soCOFOq8tgKX5nsXpwiJbrfVSxgU7hbtmryouLu1
	z1A+EfX+hhBjAAB2Zf6BtqToP5NLldAECVy5NsIoT/WKOk/euWpTDhFQBXIHRUgEIjoo
	4Z+Q0z2iY9WWuBRwxUUrLc+zqUOK0KFEuIdcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mt3uMN/46kIQcrAam1jCuV4BCbDAZK1NeSet2/y6jFc=;
	b=UGdE2/2lJGEyk7/CwMC57EhqyV2h3idHB8PJO0RT/UexBAIOLkfb6JVgQLE5pd5BsG
	IhSJcifaNZvqJJZ8fuNcb3NH/JEOd+HXCC7OWjuZrRMtAJBjk2SAdVi83UISSWy3N6Sg
	9JWYh0YipkqKygLRrqjluh+QmGwVjC08qdPSVsm0JVlt3dqNCJrFtsKXz1lEqQAIgiBm
	akTcQ0OonHkGOXzfgusSGEmGI6wR1/X/WL2TlzSSXrcw4ZI5uHwSCMe2XrWmyV+VHVMc
	pEOR8vE7ZGsRreVBMTVcn+l8yCEyC8c8yGxm+4WnicEFvIntkfmtJdjv7Sgl7ZKB4osl
	cexw==
X-Gm-Message-State: APjAAAUpvvkaTW3RNnlm8Ic1t8OsMLYO9Vru4nIZ10eEHBHuTmN9t/Ol
	NWi17dtcbLpx2/FTShX5pUWjlw==
X-Google-Smtp-Source: APXvYqyZX0JVk3V7t3YjWnAgeFUP3CdXBwipIA8ObveoAm72bYdPV5F1bfdFzfrsdUXGPf1D9eaEpg==
X-Received: by 2002:a05:600c:210b:: with SMTP id
	u11mr19296205wml.43.1578050910544; 
	Fri, 03 Jan 2020 03:28:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l7sm59285308wrq.61.2020.01.03.03.28.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jan 2020 03:28:29 -0800 (PST)
Message-ID: <5c9a820299fe4d0e2c25925b541ae2bdbbe828bc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nikolai Merinov <n.merinov@inango-systems.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Fri, 03 Jan 2020 11:28:28 +0000
In-Reply-To: <1808064219.517731.1578050134784.JavaMail.zimbra@inango-systems.com>
References: <20191231083315.19828-1-n.merinov@inango-systems.com>
	<CANNYZj81SBio8vA1eeP5-17kAZ0OHnd0TCB2RC_pNO7uPyA66g@mail.gmail.com>
	<1808064219.517731.1578050134784.JavaMail.zimbra@inango-systems.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: allow to compile from root in user namespaces
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
X-List-Received-Date: Fri, 03 Jan 2020 11:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-03 at 13:15 +0200, Nikolai Merinov via Openembedded-
core wrote:
> Hi Alexander.
> 
> I understand all of the concerns. Yes, it's possible to create a
> regular user inside of containers (at least in case of the rootless
> LXC and Docker containers), but this is a question of usability.
> All existed Docker containers for a Yocto compilation (including tge
> CROPS described at the yoctoproject wiki) tried to use same UID/GID
> for files inside and outside of the container in order to allow to
> work with files both inside and outside of container. 
> 
> In the case of the main container subsystems (Docker, OCI) same level
> of a usability for rootless containers can be supported only if we
> allow compilation from UID == 0 because users own UID mapped to 0 in
> this containers. In order to support such configuration we, in any
> case, should modify somehow contamination check, check for a root
> user in the sanity.bbclass and disable root check from "mknod" module
> in gnulib (used by coreutils).
> 
> Will it be appropriate if we allow such regime of the compilation
> with the following limitation:
> 1. Allow compilation only from root user inside of the linux user
> namespace (not a real root)
> 2. Allow such compilation only if there is "native_root_user" feature
> in DISTRO_FEATURES
> 3. Each modified place will check this two conditions
> 
> Will be such design appropriate compromise between safety and
> usability?

The problem is this introduces a difference in how two different groups
of people would use the system. A recipe built and tested in one system
may fail in the other environment. This adds significant support
overhead and a determinism problem. That worries me a lot more than any
of the other issues...

Cheers,

Richard


