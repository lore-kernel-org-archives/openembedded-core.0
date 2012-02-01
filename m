Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsiTG-0000lX-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:16:06 +0100
Received: by lbol12 with SMTP id l12so259853lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 14:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2zR3qd6JGmToejzkONsESOiE1PC4V7UYtKuMudOU8ko=;
	b=w5SiCWKO9H4QwUnWOeoeihxr8nEzypb/P7A5HerIw1S/it7jMlQrCr0tncLQlppSee
	qvjr4w4SRwWP4MHR4Tyd3bnNCvhANm6ZhCDsWCgI113NV+8gq2Ioo7IIi2peKHlwLvJx
	TCGu0D6/QBzhgf0LwhbEU8hodcVDOzT+liT7U=
Received: by 10.112.28.169 with SMTP id c9mr93417lbh.42.1328134091395; Wed, 01
	Feb 2012 14:08:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 14:07:41 -0800 (PST)
In-Reply-To: <e50f34e22b4a6fd1b7352affb529082c86f946c1.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<e50f34e22b4a6fd1b7352affb529082c86f946c1.1328133261.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 14:07:41 -0800
Message-ID: <CAMKF1sq2w3JZvYTUjA0ZxdgSz5e-W7gsq30d0eb6UeG2ZFH+gA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] bdwgc: change the PV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 22:16:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 1, 2012 at 1:55 PM,  <nitin.a.kamble@intel.com> wrote:
>
> rename from meta/recipes-support/bdwgc/bdwgc_20110107.bb
> rename to meta/recipes-support/bdwgc/bdwgc_7_2alpha5.bb

I think having '_' in pv is not good.


