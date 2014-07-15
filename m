Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8A270589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:48:03 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so3340370qgd.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LiB/Nawj8/bO6MrYEFJ70RMmOIj9TRzsgRGtmYQhoSc=;
	b=S+EAbLH/oJp540A1ViHnQUQbVSLCZQUMk35NzGwlIxJLd67MekMdOtsc/ujG390iVR
	eRTub3ZMfy1bFrzFyJ5wgaLiIJ9eT1fdmyHlcphaS4oCSJDnxkWqaGbYITHw/sdWSpwC
	Fi5v2vJLUBvmUYVK6tS7gSG4G1Kb+t92HVzl1Jpq440y7C+1TtZSEp1Cm4KuFv9soX1w
	T+tJ/p4SJmbL/aSQihWZqVYXHVw0wlNwIhKaXlL4M/QM13xf/UXtgZttvmgue1GvbNmV
	8owbJx8lEENFBJ3Vhvr+aHhF+QPARBlbq2ACmxDgi/MNPoOAd4ZoaqwkjrqWqMSEEu78
	7HLQ==
X-Gm-Message-State: ALoCoQnzNbHpPCRC/QB9aFgHGhbnvOPmjCpZVUxQrN3uiO1cmHnhxVDr8DepYugkkc/uCxjyfDvP
X-Received: by 10.224.167.136 with SMTP id q8mr33397177qay.35.1405432084467;
	Tue, 15 Jul 2014 06:48:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 06:47:44 -0700 (PDT)
In-Reply-To: <1405431059-47938-1-git-send-email-daniel.bornaz@enea.com>
References: <1405431059-47938-1-git-send-email-daniel.bornaz@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 14:47:44 +0100
Message-ID: <CAJTo0LZUau7rrNkpuO2CxaGH979CnBr=ONcmyPHRJ5gWs6Pz8A@mail.gmail.com>
To: Daniel BORNAZ <daniel.bornaz@enea.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Qemu security patch: CVE-2014-3471
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
X-List-Received-Date: Tue, 15 Jul 2014 13:48:09 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 14:30, Daniel BORNAZ <daniel.bornaz@enea.com> wrote:
> +++ b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
> @@ -0,0 +1,74 @@
> +The current code is broken: it does surprise removal which crashes guests.
> +
> +Reimplemented the steps:
> + - Hotplug triggers both 'present detect change' and
> +   'attention button pressed'.
> +
> + - Hotunplug starts by triggering 'attention button pressed',
> +   then waits for the OS to power off the device and only
> +   then detaches it.
> +
> +Fixes CVE-2014-3471.
> +
> +Originated-by: Marcel Apfelbaum <address@hidden>
> +Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com>

Missing upstream-status (and a proper signed-off-by).

Ross

