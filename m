Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0E13960E7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:30:17 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id la4so300062vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0daJHxZaTOzV9jNCGFAQayP0UpoevmP9sOlWMotDjoY=;
	b=cC5PLsW9yoDQwNq/6MrSfFKvCDuJzofOp0x4NKgRV/naDuKqdzSmaJL2MhtIe9sbIS
	pKMa1IMAVc+xUtEw8EA6dxDqx/dK4zcoBiZOLUYnpDqIEX/KeyuOYcpBdJlYQR3FUBD/
	j8vpK/D6hwy0yA3ey1ptW6bM7Y5oPu+1miE78lWHadPtzC3WsqC3Z7KNlJnuSJLuPHqC
	uWUvJWjcYObt3tcpfMV+AywcrA9sdhn5IdGf/rp9eHFdAVOuJRzXxPRkoBkUiJbhfsfH
	RbcjBzjBlK/shfYjdXCcvexLc43PErkzljQrn1vJPmhmkYz4G5W+8A4UCpAYFt/Ppdlc
	yoEQ==
X-Gm-Message-State: ALoCoQmxHg+pVUQJFkocct/b30T3zzqDLaFDVpB4/ivgKsAghVldOfG/i/CwzECK9Z2gHZsULzAR
X-Received: by 10.220.186.202 with SMTP id ct10mr1332450vcb.14.1390404618777; 
	Wed, 22 Jan 2014 07:30:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Wed, 22 Jan 2014 07:29:58 -0800 (PST)
In-Reply-To: <52DFDE73.1040201@intel.com>
References: <20140108173801.GB3709@jama> <52DFB95F.5080206@intel.com>
	<52DFBE2C.2080209@intel.com> <20140122125724.GU4100@jama>
	<52DFDE73.1040201@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jan 2014 15:29:58 +0000
Message-ID: <CAJTo0LbghkTP2Xp7UOhyCjEPVK=KDwhqDZyACd--=9fHchCm3A@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Wed, 22 Jan 2014 15:30:19 -0000
Content-Type: text/plain; charset=UTF-8

On 22 January 2014 15:06, Valentin Popa <valentin.popa@intel.com> wrote:
>> The conclusion is that if we cannot fix all apps to use pkgconfig when
>> searching for mesa, can we restore rebased
>>
>> meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>> to fix them automatically?
>>
> Nice reply, now I know what's the problem!
> You are right, for an app that doesn't use pkgconfig this patch is a must .
> I'll put the patch back.

Please engage with upstream here as patches to the build system are
always a pain to work with going forwards.  The problem is that
upstream doesn't really have a build system maintainer but if you
harass enough people you'll get somewhere. :)  If you try in the mesa
IRC channel find daniels - he wrote that patch originally and should
have some more feedback or advice on how to get it integrated.  Tell
him I sent you. :)

Ross

