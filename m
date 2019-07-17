Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Jul 2019 16:41:13 UTC
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 7857C7EC54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 16:41:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 16962A113B;
	Wed, 17 Jul 2019 18:34:51 +0200 (CEST)
Authentication-Results: spamfilter05.heinlein-hosting.de (amavisd-new);
	dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
	header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1563381290; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=9kYLojyr/uay0yUcl88VpyccIJkuQDTZfayGTRrx2Co=;
	b=o/9lYle+buEyOf+ohW7Mg0EYFHMZWYM44hoOm8/oSKyfzWreDXhDxVCvrZ9eiiOYV+0CN1
	crOB2HamNY2nXp5yYIR0vxcfjsShQJ4z+/WbPWUFOYm/aCoAhGmnRktkMtx2TXFd28W5xO
	FaoSPhjuxuCa28alcdsdvyjb3snr25aoueCc1FEaiILKui4/Itb6fH3k7zE71ZVMNwNzAO
	tKjIuczZKj+sX7qraheI/xj/g+vKWTDUp1xcW2YRWGyUHxVIyA3FYdCHLNTaDkQ0zk3y/C
	9NC0Hyr4mRpwb+V7iITWAu6/MYYr21qYujuYjkRONg0cc/0ZvTWw382KG4yw3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1563381278; bh=qyhxfykj+dMb7cCmDrhKmBNSixtFhXTsb5vRlP1Kuyc=; b=r
	yZfBUvDcgCcXk5ATr42nBD9YLJlQGZeKtR2DqoSrtlwiXfRyScuUuvgPdM0xoqRG
	3WDC/jg/P/jZcn6o3/Id8qcrPdD+BpW2SDDtuemvnqK1yJ3go1St1YQ6Y0cf4SOv
	dDj6DXjuGNG2SNJgXhJ0MQGd0+FA71fG2SxvE4twZ8vbq4ubV6CuBshH08N/aCf5
	AKORQ3MpMrvVSDs6QELtcVP73vY9TcGcxJxxFVFyfIFU3opXTrGLynt61RossXlI
	wfeuuLx8sFlbwGhaWhiAM6pF4LSts2x4n4nUyDomJ0XoZZMUsg1JlY+eQXccNizg
	ARh7CwioiykmZsNgZpQpg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030)
	with ESMTP id n1PQrtiZgmpj; Wed, 17 Jul 2019 18:34:38 +0200 (CEST)
To: auh@auh.yoctoproject.org, Carlos Rafael Giani <dv@pseudoterminal.org>
References: <20190717134750.65BCA440002@auh.yoctoproject.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <014a27db-3a87-c1a8-a8ee-94d9e38f9ef1@mailbox.org>
Date: Wed, 17 Jul 2019 18:34:37 +0200
MIME-Version: 1.0
In-Reply-To: <20190717134750.65BCA440002@auh.yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] kmscube: upgrading to a12e306ce18ff1c2922219a5342fa419ee80a12e FAILED
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
X-List-Received-Date: Wed, 17 Jul 2019 16:41:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I noticed this already, yes. Working on it.

On 17.07.19 15:47, auh@auh.yoctoproject.org wrote:
> Hello,
>
> You are receiving this email because you are the maintainer
> of *kmscube* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *a12e306ce18ff1c2922219a5342fa419ee80a12e* has Failed (devtool error).
>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe kmscube failed.
> NOTE: Starting bitbake server...
> NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)...
> WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to list the core layer names it is compatible with.
> Loading cache...done.
> INFO: Extracting current version source...
> Loaded 1324 entries from dependency cache.
>
> Summary: There was 1 WARNING message shown.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.43.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "i686-poky-linux"
> MACHINE              = "qemux86"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.7+snapshot-20190716"
> TUNE_FEATURES        = "m32 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "tmp-auh-upgrades:d1d025cb80e75952d4a8c5e0e5d44ca6d9716b5a"
> workspace            = "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: No setscene tasks
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> INFO: Extracting upgraded version source...
> WARNING: Command 'git rebase a12e306ce18ff1c2922219a5342fa419ee80a12e' failed:
> First, rewinding head to replay your work on top of it...
> Applying: Detect gst_bo_map/_unmap and use it (or avoid it)
> Using index info to reconstruct a base tree...
> M	Makefile.am
> M	kmscube.c
> Falling back to patching base and 3-way merge...
> Auto-merging kmscube.c
> Auto-merging Makefile.am
> CONFLICT (content): Merge conflict in Makefile.am
> error: Failed to merge in the changes.
> Patch failed at 0001 Detect gst_bo_map/_unmap and use it (or avoid it)
> The copy of the patch that failed is found in: .git/rebase-apply/patch
>
> When you have resolved this problem, run "git rebase --continue".
> If you prefer to skip this patch, run "git rebase --skip" instead.
> To check out the original branch and stop rebasing, run "git rebase --abort".
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Upgraded source extracted to /home/auh/build/workspace/sources/kmscube
> INFO: New recipe is /home/auh/build/workspace/recipes/kmscube/kmscube_git.bb
>
>
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper

