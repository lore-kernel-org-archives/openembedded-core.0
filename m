Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 77B107F21A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 09:22:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so30177360wro.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tvxTPSuFIk7rtY7QP0bykO6/bhkKQrVu95U3jl+oYxA=;
	b=Ov64iqy3DjbVERgvyN38X+BxIVA7hYtx7KEbqEFveTOXDxqUfUPjTmgnsAs8G9v9pl
	YT6OCEXX7/0IztI4O9A/WXFxbyIRFLJa4398jiXEA9Bh9usr590TjSrz3qn+5y3YiQME
	4ri/ItBqZ05XYMX7f4dxrcym95cztD2cmE8/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tvxTPSuFIk7rtY7QP0bykO6/bhkKQrVu95U3jl+oYxA=;
	b=T2/D39XIqB0q3JlchHcowaOfd7Ke5bO0KMqhup9R+1kgOJdW0q5VYt1xiPRtuHIQA0
	PC9EB00oMa5E3AW4O7G3hFWN7XUg7uKqak7kySlyMzPCH1aHlpQjJnTseqkNrO5SQAcw
	AJlglJq7zja1Sucu6JTBw8DaCoFLLl2jmxSLNd4Y1VHmwgziJLAugQT6na99kFjXfHOE
	b2nqeOyweyKyect7pFjqcL03vlxFX8FkFV61PLpHuaAxSfpHq/eWJQSMLhF97xu0bVs4
	ZBCnGhS6WmncOxSlFA8N8ir2l+PeB0I68kvhT3mIqy3O+P7FidXFhsDkw9oaO5yc+iAi
	6rJg==
X-Gm-Message-State: APjAAAVThZtxwiO73GEBMArBdIg0o3KqeTKJObUUYMMJozV8p4Th7UMb
	kN7PCsp0Bc/0iU6rortyNHCeSA==
X-Google-Smtp-Source: APXvYqxSCu9lK95nbByL1m7I7UBnyjzpmiHM264g+xYUUm/dqbdGTVaU/rMUHTB68a5/qJR+8NOg7g==
X-Received: by 2002:a5d:6901:: with SMTP id t1mr56053703wru.94.1577611353161; 
	Sun, 29 Dec 2019 01:22:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm41385437wrw.12.2019.12.29.01.22.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 01:22:32 -0800 (PST)
Message-ID: <15093869246c9bda00d947f9e2de0e776b147b7b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 09:22:31 +0000
In-Reply-To: <20191220162351.94498-10-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
	<20191220162351.94498-10-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 10/11] libcap: update to 2.28
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
X-List-Received-Date: Sun, 29 Dec 2019 09:22:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-12-20 at 17:23 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-tests-do-not-run-target-executables.patch | 32
> +++++++++++++++++++
>  .../libcap/{libcap_2.27.bb => libcap_2.28.bb} |  5 +--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-
> not-run-target-executables.patch
>  rename meta/recipes-support/libcap/{libcap_2.27.bb => libcap_2.28.bb
> 

Looks like there may be a native gcc version issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/575

(our friend Centos)

Cheers,

Richard


