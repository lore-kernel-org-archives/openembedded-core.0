Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF6670637
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:24:47 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id x3so3214954qcv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4R0Vxz4wY/apqEzHffoR6dHUXxStKWEMbsJO+mzBspg=;
	b=inWdIlsPSzkS7P6tXeygV5awKZPkyg5KvjvD/rEYrv6D8+rO9zUJnigUJO2L+/x2uK
	GXF7NppAA/CUfF5yCV/60tUfk9D2vKUleiu1RwpdV3yrGwVA+quTRF9I4544bQcfoihc
	Gb6KrlvVWstV1go66rNTNSANDJeKnrkblL2UL2crUB04C2etk1r0/+NAxMo+tghjko3S
	fjDwhnM0nm/ZmXjwyNIDXou8m2vfcjhABSwL99JGK/RoljBcOSYgND8/329uEzm4rGLJ
	opPlps/VFQbLiat4i6Fs6dbSCMGlT6NdxOWlpIB+jTCh4zLK1UfdKDP+FcBBhrQ/hY+w
	bidw==
X-Gm-Message-State: ALoCoQklHJmgj8xL972Z+dTh266FBkSyVk7CPqGCZ4VuXwqzJDuXaNE98kPd6wSyjquAV5fOGA9W
X-Received: by 10.140.89.197 with SMTP id v63mr34719271qgd.71.1405437888962;
	Tue, 15 Jul 2014 08:24:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 08:24:27 -0700 (PDT)
In-Reply-To: <1405437238-28782-1-git-send-email-akuster@mvista.com>
References: <1405437238-28782-1-git-send-email-akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 16:24:27 +0100
Message-ID: <CAJTo0La7owsx7Bpz9NDm2AdUtU08n_bWVkVYh-T2MTGRcOxzgw@mail.gmail.com>
To: Armin Kuster <akuster@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:24:52 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 16:13, Armin Kuster <akuster@mvista.com> wrote:
> +LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"

The manual says:

"Nettle is dual licenced under the GNU General Public License version
2 or later, and the GNU Lesser General Public License version 3 or
later. When using Nettle, you must comply fully with all conditions of
at least one of these licenses."

So I think you mean LICENSE="GPLv2+ | LGPLv3+"

I'm undecided whether this means we can drop the old Nettle or not...

Ross

