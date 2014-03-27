Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 85C306F8E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:08:55 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ur14so1765674igb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3EmltYX+A7JCecgoZocoNuujHo4Im0ppgqA1MXRoKLg=;
	b=Nol89KU6ZIHDzOoCjMa8QEtb1//bKdwago7r4evGptbsAGe7VOSVvWdtqV74afflXe
	5PFKdfz3nrj1bB/RwvQNiamsB8Sn+gmvMmT1uDrYQZCIh5F7L9YryaReAA5ir8LBI1fp
	lKKbZfKDS5wp9FdKZJg8XPfGW7J06ehs/Hpq60aQlzjbc9KKpb/HTzPzyX85RkbHQi/T
	x+DqQLwzUx3f0Hsqop8KeNKRtsUMZONvNtlLfKpLW3iCxUd2iF52t0bespyn0G9PwOse
	u2dpzcNWZ9+RRrdi/wqoKSXCHiDU5JbI3X2E3KIGVlk2aDT4tW9xhFD6wyziX2nbRbWy
	geyQ==
X-Received: by 10.42.20.193 with SMTP id h1mr2719409icb.70.1395936537136; Thu,
	27 Mar 2014 09:08:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Thu, 27 Mar 2014 09:08:26 -0700 (PDT)
In-Reply-To: <9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
	<9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2014 09:08:26 -0700
Message-ID: <CAMKF1sougoA=ioTvWBiC+b1pOs+sf=dRu3OYTc92CMVwvnpUhA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gummiboot: add COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 27, 2014 at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> The gummiboot depends on gnu-efi which had set:
>
> COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>
> We also need set this for gummiboot, otherwise there would be build
> failures for other non-x86 archs.

isn't gnu-efi supported on arm too now ?

