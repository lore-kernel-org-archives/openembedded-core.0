Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 84E7E610AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:35:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48JwsJ2lRCz29;
	Fri, 14 Feb 2020 15:35:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581690932;
	bh=uthiN25Z9CYZyLgqDtrbzFN6XAJH4fLpUtV4bYQ/U9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iX8u39MS4JC0vZDke4W0dCK7aHBgNxKs/PLccwiPBbj/1svgeLgo/xVlfJRGKr2rF
	ZhR2+h1nSKQ5QFALDkCNBe0dNaQ+qEp+PEEhaQT1avkbmBhIFWMLKwxo3Vh+skt2eg
	q3vkfa8y7sroG+/qJxO5GyFdXYtSO+lTFA4Chii/gRZfBYJGfsDHjFDfnLIOiXq3v7
	2606bCMxcV83t8LW3eqXAVF1bMUbqXz4rhsSZ7lkV5hbr+e3idj/NLH8EZzTN1+My/
	QOsXwNeZVgfLlIYAXoBvnEuiTGPxZVnfaqaA4K3OfkckWzlKVNQ6BIp6w+9fRG2e92
	0fFYBnlYMV2OiyY/LGMd+tDoP2mGMIGcgNNNM/WYeAj+2AzwruulyiFtMWIZ9+hchj
	6X8HUJ2fBp2ItOdYX9+y2LXp0lDCsPJPC3+XkBU69rsWMA1Q5ZXLextpgM47sKYIbS
	FXvKSU22cxDFd/ZsXuI/qotu/GJMj5f5dUMEPqEiYZAxulbnPuiJTBBX+DG1AcfP9d
	lZT11pUWFwfUrfG8lIuLwi9XX3X74G4zSemwxO/393eooiLGAA6vmCbdIIdvzgQbOQ
	PuLAGBeADj+5vtGEuBxnWeu94O2fbx/fQ0pZy2PQ4Xi0kFqAhXbN8+tfBfTM0vuIeS
	1em4XzBb92IE3+uxnPFlOOp4=
Date: Fri, 14 Feb 2020 16:35:25 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200214143525.GA31591@localhost>
References: <20200214070352.1206450-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200214070352.1206450-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] swuashfs-tools: Enable on musl
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
X-List-Received-Date: Fri, 14 Feb 2020 14:35:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 13, 2020 at 11:03:52PM -0800, Khem Raj wrote:
> Upstream has a patch [1] to fix musl builds, Prior to this it would not
> build on musl due to missing GNU extentions for fnmatch
> 
> [1] https://github.com/plougher/squashfs-tools/commit/4280e74de14070869787a9166242f9ce2dafd82e
>...

I did already remove a similar bogus squashfs-tools change from OE,
with similar FNM_EXTMATCH "fixes" in ifupdown and elfutils
also resulting in the expected runtime misbehaviour.

I am not a fan of this musl way of fixing build failures by turning them
into runtime breakages.

cu
Adrian

