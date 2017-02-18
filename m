Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2F93171D8C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:04:42 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 68so5191554pfx.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=9bJhsg1Qpnne6c40kRPyOu/MHitqI52/EVK9mqKOHOI=;
	b=OiVSX15X5KmpHwESOS58iLfUR+8mPlcdjWEQMukeS7AnyUwYCKr7rZyRVnH0rIR3Iv
	lCk44NqNMM8yYwwXNcIqI2qhRtZBAY0Nne5Unwvw9MgpD6g4GP4llO/xBwQvqmgBDtH9
	6S4O2W4X/+TWmHsytXldZ9NR17zZmNZYP+XqpgXW7u0NziWCZSpeDXIt/Nb306JyzO1v
	kBs00z3EAKh6x9rzf696BeiFb7/pFcSVRHc4IOAioV5aTfkbKq5jyP70EUNC9aIkK6m1
	TbQfaxQvJpNK6Wzm4fZMblgfbazA5WwXOvnfRXk6PB/lgdAWv72fRUphWGbgeH9Mf6wv
	ZK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=9bJhsg1Qpnne6c40kRPyOu/MHitqI52/EVK9mqKOHOI=;
	b=A18RwwIxP3V5DcJmY9FFP/7Wnnx5Rn2Q4YkO6H89Y3wbITZv/ymepuVt1AeR0BXVOj
	ObMz/MEfh6x8t8Dt7rCKgPwKOi1kl2SrUza7uxQAh/a47Psv0/9uXtbdMM5+kaM3bIXI
	SpkesHbV6G9FP/N6U4STuF5JO4HWIXulQsqJz/pw5ky9LjWd3TN4ieCaVAvL5aO1MKeh
	Mtw3kVzObyDQSUE8lV9hnpxA8OcjFkxMwgnUhBy1ja4CGqeWcVLFx2zJe/Tk+6AilTTU
	Q/8ZEnTYoLHp70DIUooWZbzUTnb8dSHwTfD4yyYwkX9B/2zVKZP7IS1DdGd9iC5lu1MD
	jMkA==
X-Gm-Message-State: AMke39nRpw7gm61sJkkUupCSK/r+jK0jtXVhyk+U3UGzBLU59niZiNz6FL8UsLfW6X3QWw==
X-Received: by 10.99.131.198 with SMTP id h189mr5164636pge.226.1487383483343; 
	Fri, 17 Feb 2017 18:04:43 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	m6sm21654323pfg.126.2017.02.17.18.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 18:04:42 -0800 (PST)
Date: Fri, 17 Feb 2017 18:04:40 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170218020440.GB30443@haswell>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<cb8f971b4cb03c90f6459374609be3dce53f2ab1.1485530988.git-series.patrick.ohly@intel.com>
	<1487365856.4999.47.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1487365856.4999.47.camel@linuxfoundation.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 03/12] ovmf: move from meta-luv to OE-core
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
X-List-Received-Date: Sat, 18 Feb 2017 02:04:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 17-02-17 13:10:56, Richard Purdie wrote:
> On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> > From: meta-luv <luv@lists.01.org>
> > 
> > This is an unmodified copy of
> > github.com/01org/luv-yocto/meta-luv/recipes-core/ovmf revision
> > 4be4329.
> 
> https://autobuilder.yocto.io/builders/nightly-world/builds/156
> 
> which boils down to:
> 
> | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/BootLogoLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/object_files.lst
> | make: *** [/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/DEBUG/BootMaintenanceManager.c] Error 2
> | VfrCompile: ERROR 1003: Invalid option value
> |   VFR file name /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/OUTPUT/BootMaintenanceManager.i is too long.
> | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/NvVarsFileLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/object_files.lst
> 
> i.e. path length issues.
> 
> We saw this on multiple builds :(.

I wonder why its using gcc-ar that should actually be <cross>-gcc-ar
so probably we need to set AR to point to <cross>-gcc-ar, but I would
like to see if we can use normal ar since  gcc-ar would fail with clang

