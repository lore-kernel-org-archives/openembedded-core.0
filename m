Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 89AF779AEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 18:50:46 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y8-v6so17163448qka.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B2Fd1U47vlePb3wg8sZRsjnQzhuQn57tEJ1DQ0YhPcY=;
	b=MqsXEifjhVXrDFpu9dRbwlk9PAsXiEcEJfIVpqWcHOk+iiAWZ/1tccEMjB5gBipTi6
	ysucNtnT6NiQPaNbxKN6VRNPo32DdJvDGh4BFx/xI39cxeRztl92oVau/hdre36ZZM5+
	/IN3qN1ulp8ei8ve5wYixhEXUQuyzSyoClI11gjMCTeh1zc6r4tPp1NfkL0MiCRvYgbY
	kGo1pxf+Lk+31hIjIdW3xutyhIR827EHsr+ax/MknQRCCBpy1w/gO5bR2w7tki45Pa1V
	bVycvnZGuXfP1Ozk/+PxXFUZuI+3HkMGCCz1axlPjQKaEWDqHevN22H3aYfoh3lToWJg
	5SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B2Fd1U47vlePb3wg8sZRsjnQzhuQn57tEJ1DQ0YhPcY=;
	b=K6PzlNx4686/yX2Lf9r1OImlZQ5GnJ+GeVAQhIy5AnDbtePDlJrGuuN3/8v9iCnzwP
	04cZW7PFM81z1wZ4tkG2Ey+Xj2P7L4libkwLZYWrHvJoubkWtQL8KMzxNSoDJsemWZsA
	nTlX0N/FPO7GRe2s43p4keAUoG5/7VP5BO7N7DlhdHz+EZ+vGOyuOMgsb9Hr2Srsab5v
	O1/akdK0uAXnOp6rYYtiY8ePdTG1K+FycQW81HUR2mYp+NlWvlGD6KvlZRGi8UNyTHTY
	NLYLJiLwy6FigynV0b+zcG8PgXAABHV6LPh55a6tjL5Ao16rvkrGFsdCVrkT781vgAIe
	9fbQ==
X-Gm-Message-State: ABuFfog9iuTaws/SDRilAMWce8v5/11f+uXqbS4CNYs8fsPMcZVk6+XX
	tW4xZfZ1KURmfRz3Rcgb6Dkrj8EncD4YRUUaTYE=
X-Google-Smtp-Source: ACcGV626X+2tAiH9oXBYhKtH/yilvY2rUIoCBj8eFDv8oqgQu8NNj+yQjfaTQaDR75/j6f0L7IcmmwmY+0jyhSsfwu0=
X-Received: by 2002:a37:9d55:: with SMTP id
	g82-v6mr25709875qke.315.1539802247090; 
	Wed, 17 Oct 2018 11:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181017104243.801-1-pascal.bach@siemens.com>
In-Reply-To: <20181017104243.801-1-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 11:50:21 -0700
Message-ID: <CAMKF1spO151yKD1O9Dx_sKEu1shSN976+kykQ9FoXKd6fstQVw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/4] cmake.bbclass improvements
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
X-List-Received-Date: Wed, 17 Oct 2018 18:50:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 17, 2018 at 3:43 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> This patchset is unmodified from v3. It is just rebased on top of master which
> already includes a fixed version of libproxy and piglit.
>
> I built all cmake based recipes in oe-core (qemuarm64) and did not find any more issues.
>

Can you run world builds on meta-openembedded repositories with
this series applied and also compile some other large projects which
use cmake like meta-browser

> Pascal Bach (4):
>   cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of
>     CMAKE_LIBRARY_PATH
>   cmake.bbclass: search both sysroot-native and host for native packages
>   cmake.bbclass: move CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake
>   cmake.bbclass: allow cmake to find hosttools
>
>  meta/classes/cmake.bbclass | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

