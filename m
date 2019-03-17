Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id B165E7C51E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 16:26:13 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v12so9719916pgq.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:references:to:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=o1zHGqEIYC7bU3cjT1zL3vhjBR3hZdYBNjw/WGZVK3w=;
	b=qqpGM0s+uYeMO127Wjw/x/QVL/ECKo63JTM37qUjxyHfWhahOSbojdd7N8ysmLJ3G6
	ehzzTHgU/0BfoRnDnfpPq1S2l26BsbwFHDKF+uiNBrrC84A3FJntz+ovSTmhs6ifANAR
	fY1rAaVP1IFAqjwUoHS7JkaIU+4mSVE13jdfvt2C13bGWVVZjSfdPXfqzkvgEq4YTWiC
	TQXAEK+IfbRciHLyTrwG25rylt7cTJiiIyw02nXmts1EzI9xswJxg3s4QJZ9+Rs8SHSP
	Gyk+ALJwBvrQvemeyuT4V3LUzKwCndWUZp6oobtZEwJ3f5EPPvzZFvuKKgWI5+nkEtZX
	qNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=o1zHGqEIYC7bU3cjT1zL3vhjBR3hZdYBNjw/WGZVK3w=;
	b=fJw+Lqr34kwziM9yCxXylxRPoBfkpcUgiC4pzUnnCwsxWIvl1r01ZHh9zVDtPpWTFo
	7xwKSXf2oOctCTQ1qu1rv5XVi/Tmf3bARP/ZKEgLF/LxQG5jXrxQ4kdvhcOY9/7POOHI
	OQ1rcoPopJbfvI071ottW6FeSzd4kRdrOKrvflAvcgUYF2cSJT4dN2FMx7oV5Ksu45df
	Ef9flTcF0KeSZDYS1/B3rim4DyrKxXfuGHTP06Iy89fzTT430uUxHdAwo3ZVYw74+3nV
	rSUd2DoV1Y7pcBX7GPs0s/Z/mzVgVxMjuuhNPfuCjJPJVrbLZSFD9MEix66mPFAGMb0A
	eCBA==
X-Gm-Message-State: APjAAAVvOn2Vi3zmMaHQ8wWQQhi1O3wmYw/suH19qchPCs7FYqNZ4RGd
	Fp0NgyVHuTSpRN1cXgoJTFv0mxhV
X-Google-Smtp-Source: APXvYqy29+rKak7H9rHpv8UxaaooQ/eSW+Wa4CfhmUpYc8lJwaBKBO1E81lOT7uB5YZOdjD8sIY/iQ==
X-Received: by 2002:a65:5c01:: with SMTP id u1mr13563121pgr.197.1552839974550; 
	Sun, 17 Mar 2019 09:26:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:55ff:5980:c3cd:d28e?
	([2601:202:4180:c33:55ff:5980:c3cd:d28e])
	by smtp.gmail.com with ESMTPSA id
	a13sm9152691pgw.91.2019.03.17.09.26.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 09:26:13 -0700 (PDT)
References: <20190317113300.403CC440003@auh.yoctoproject.org>
To: openembedded-core@lists.openembedded.org
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <a2801b3d-73a7-2870-1c44-17c139b8cf85@gmail.com>
Date: Sun, 17 Mar 2019 09:26:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190317113300.403CC440003@auh.yoctoproject.org>
Subject: Re: [AUH] xev: upgrading to 1.2.3 FAILED
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
X-List-Received-Date: Sun, 17 Mar 2019 16:26:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/17/19 4:33 AM, auh@auh.yoctoproject.org wrote:
> Hello,
>
> You are receiving this email because you are the maintainer
> of *xev* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *1.2.3* has Failed (devtool error).
>
> Detailed error information:

in master-next.


>
> Running 'devtool upgrade' for recipe xev failed.
> NOTE: Starting bitbake server...
> NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to list the core layer names it is compatible with.
> Loading cache...done.
> INFO: Extracting current version source...
> Loaded 1303 entries from dependency cache.
>
> Summary: There was 1 WARNING message shown.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.40.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "i586-poky-linux"
> MACHINE              = "qemux86"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.6+snapshot-20190317"
> TUNE_FEATURES        = "m32 i586"
> TARGET_FPU           = ""
> meta                 
> meta-poky            
> meta-yocto-bsp       = "tmp-auh-upgrades:9fba148a53f70ffa1ec93098be636ef1fe3aa6de"
> workspace            = "<unknown>:<unknown>"
>
> Initialising tasks...done.
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> INFO: Extracting upgraded version source...
> INFO: Fetching http://xorg.freedesktop.org/releases/individual/app/xev-1.2.3.tar.bz2...
> Loading cache...done.
> Loaded 1303 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 786 .bb files complete (784 cached, 2 parsed). 1304 targets, 35 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.40.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "i586-poky-linux"
> MACHINE              = "qemux86"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.6+snapshot-20190317"
> TUNE_FEATURES        = "m32 i586"
> TARGET_FPU           = ""
> meta                 
> meta-poky            
> meta-yocto-bsp       = "tmp-auh-upgrades:9fba148a53f70ffa1ec93098be636ef1fe3aa6de"
> workspace            = "<unknown>:<unknown>"
>
> Initialising tasks...done.
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:  --:--:--
> Adding changed files:   0% |                                   | ETA:  --:--:--
> Adding changed files: 100% |####################################| Time: 0:00:00
> WARNING: Command 'git rebase c7c29d114756ad26881755b75dfc839ac37692ab' failed:
> First, rewinding head to replay your work on top of it...
> Applying: Add xev
> Using index info to reconstruct a base tree...
> M	xev.c
> Falling back to patching base and 3-way merge...
> Auto-merging xev.c
> CONFLICT (content): Merge conflict in xev.c
> error: Failed to merge in the changes.
> Patch failed at 0001 Add xev
> The copy of the patch that failed is found in: .git/rebase-apply/patch
>
> When you have resolved this problem, run "git rebase --continue".
> If you prefer to skip this patch, run "git rebase --skip" instead.
> To check out the original branch and stop rebasing, run "git rebase --abort".
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Upgraded source extracted to /home/auh/build/workspace/sources/xev
> INFO: New recipe is /home/auh/build/workspace/recipes/xev/xev_1.2.3.bb
>
>
>
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper


