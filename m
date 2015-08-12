Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2430A739BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:52:02 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so17872955igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/8e7838+/HcsfFxOebapTH6pnKXRzFQN6f4qN6vXpaI=;
	b=O9bJIfD524RO6XtK77fUiDbEfT07NLhb6SpQg8C9VIJ+NH7tRYsqNgzaZLQ3hh1PJT
	0/Eq+VxUTiHUQT3r9q3B+2bBdJ0T4w11rWCaoOXmFfo5fAnrT00WfhN1p9VGs7nUGw3I
	Mluzc5TdvxkE47sMToXr5y/Tbs83Vl04gxT2jilbTjWNamsvlj1nF7WridB3b4Y+zb61
	d6DMC1kh3hZ9uQzqOuvagKGM7AMmWm5S73XtMt4N5yYy6TBCNsaktxBvi/T1X9h/jqfN
	M2z8lVerx8pdyG1+lHVKplY+hW6kGctup/cnrrXC1WIWf6WmGkOKrILZ2lTlBjYGI4IJ
	wPkA==
X-Received: by 10.50.59.148 with SMTP id z20mr26116753igq.77.1439398322326;
	Wed, 12 Aug 2015 09:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 12 Aug 2015 09:51:32 -0700 (PDT)
In-Reply-To: <CAJTo0LbsE_BpLV6MqVH5UuOsMjfRTTFL9EhGvxXGp2G0isrpTA@mail.gmail.com>
References: <1437500350-549-1-git-send-email-jslater@windriver.com>
	<AB5F0F40-684B-4A79-B48B-B06D4F32B598@gmail.com>
	<CAJTo0LbsE_BpLV6MqVH5UuOsMjfRTTFL9EhGvxXGp2G0isrpTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Aug 2015 09:51:32 -0700
Message-ID: <CAMKF1spT-b1XrmCAxB9a6vkQRaCB6FX2szToqaBk0ZvEi=Bm2w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] common-glibc: define bash_cv_getcwd_malloc
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
X-List-Received-Date: Wed, 12 Aug 2015 16:52:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 9:46 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Don't we then have to trust that all libcs are not broken, or is the bash
> getcwd implementation *that bad*?

we already know it fails in some cases but nothing of such sort is
reported with libc implementations. That doesnt mean they cant be
buggy

