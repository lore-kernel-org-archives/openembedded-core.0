Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA597D264
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:49:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c5so16979086wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JlLOvLXqFrmoP3/C1G/Bs7DVhFYJxCTn2WEHeQjJlmo=;
	b=bS7nY8ndfd2paF2sP4xWU2A8kS/Gg51yQLS3+8i5eUC+KuL32jx4J4RrbYoQQrOmgI
	O6Tdtegol6/nxWbnBSEx9JhojHI/nVT9+J+QkmAwtqMDR5e8JIt9se4imL1Yx0/D5n18
	ZRBq1k0ViAWUsbjCPbouNPLcWz8I/LTXUQhHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JlLOvLXqFrmoP3/C1G/Bs7DVhFYJxCTn2WEHeQjJlmo=;
	b=URaSeb/gsdp9JJxErzXdWu8KjxYy47/o4WA18iK6qbMD6kCP9js5SOsesyHsMrpjxX
	CrSN5LzlQHJhHjHElCjzTcbZYQScdNu2gZc4fXSQQQWIT6ay7Vo2zJUPGl0oCmbBml5N
	xf6qPirvv0YbkWaUPBLfVoHXol82jAnNH6I0ohTdkMamA4IZVFTKHGm0xG6dQ5rsk1SP
	bxWYLpnyLYrzooVYFZQWnchwc0kbo5ClPLRWPC+YdDSD2ESRkMPj+/z5E7q205xx0541
	G3OnVLobnuHqRLcg2OdWrRhOR8gDz/IcAcb3SacL9+zuihrWjGH8VBO86EVcVFGuPWSo
	SUdw==
X-Gm-Message-State: APjAAAWNVdFklkfL6XVU9L7MXjL+ex+myLU1rVdsjp5HNpcVkfdyfjx9
	dkNwNKOgPdRz+mbLogVXjj2oIA==
X-Google-Smtp-Source: APXvYqx3/0hsa4fnvu8LNhwAsNRhj9t0Hwu+8EaAseIuBIqTUXbuOS0ADWNtVEs2A2UqEwZthOFNMA==
X-Received: by 2002:adf:ee42:: with SMTP id w2mr21348639wro.161.1556120972272; 
	Wed, 24 Apr 2019 08:49:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n17sm16248698wrw.77.2019.04.24.08.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 08:49:31 -0700 (PDT)
Message-ID: <47f9247c144f591b4527e1af2c6b7bb80cd1bfbd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 16:49:30 +0100
In-Reply-To: <20190423161916.25572-9-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 9/9] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Wed, 24 Apr 2019 15:49:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-23 at 18:19 +0200, Alexander Kanavin wrote:
> Switch over to meson build, as it does not attempt to install
> headers into /usr/share and pkg-config files into /usr/share/$libdir.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...3-pycairo_1.15.6.bb => python3-pycairo_1.18.1.bb} | 12 ++++----
> ----
>  1 file changed, 4 insertions(+), 8 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb =>
> python3-pycairo_1.18.1.bb} (65%)

Fails on no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/531
qemuarm-oecore:
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/543

Still trying to figure out the cause of the other results
collection/buildhistory errors in this build...

Cheers,

Richard


