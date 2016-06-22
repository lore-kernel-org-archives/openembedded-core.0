Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 16FBB60088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:54:33 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id h14so19383975pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 09:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=RAXeHvXrVLQZ1eOedVy8VG5GCRV4ibHN6F97zhV8EMo=;
	b=PheO15mMa9ei5IkY1JseueMN7sfBfBk5NfgO/etyGpJciVJPUjQabG8CdeZ8jg2wGD
	PYO9q3ZIA4AkMnxZToBWPl17K/6fzXBrHGRfgrcu8s2dl8E9HD3nks4H1SIFaB3ru4FS
	jBqbkg320wFLOc70RoQh+jdNf8thQiIbqWedY5pvcCpgvRqls72dy7l/uTOOl2S4ZVp0
	V+rSQAugOUuZEDUQQXv2tYLQZgt9hvgBjt5RdY6Ef1VxhLrJwDsQryF7Za68NaKEdfR9
	y74A42eia51Si4fQ/HhcO60mDe+EtqTLd6Fcm8ddavFyhidcbRxjtijtZUsz8eBeb/M3
	uMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RAXeHvXrVLQZ1eOedVy8VG5GCRV4ibHN6F97zhV8EMo=;
	b=flJ/agMx4LvqNRodDsrJ689OAzKUcQlbg5SVvShM4+LsxBhCp4ULPqWi6TQh0lsN17
	lgLMGDVDbsPWZ++VUOgAOvjm/M9ga/ElY5chZZzZu7DALtrtIEljaQJPfWYBws3jaSEe
	4+5hfjY99NYJ47FR+/cPSjG8ySSGk/rZxokFumK4tv40lnSZhxddiPUATNWshJP4dHz/
	wmpwczFMNkKU6dtGOn0gX62hznLKE21VvIfk4DoKoOsOks4ZqsYsxcucfxNZr8kEdXYW
	4SM8krSZG03Nn0wUAR/yhR0jq09BVJweUJVGDQ/gEfct3QCoxSndDvM5VR8taubhq3rK
	Q/jQ==
X-Gm-Message-State: ALyK8tKojPlQ1hjhgYtU23DvxuNTqChMx2h5YQwPM24OfEvAs/6X/OCrDGOUtC6Ucc5lhQ==
X-Received: by 10.98.67.7 with SMTP id q7mr15409278pfa.150.1466614474021;
	Wed, 22 Jun 2016 09:54:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:509e:4be1:bb63:3d6f?
	([2601:202:4001:9ea0:509e:4be1:bb63:3d6f])
	by smtp.googlemail.com with ESMTPSA id
	e20sm1064235pfk.1.2016.06.22.09.54.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 09:54:33 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spPd9sX7DmuLtzOuYuQT+jRgZhze6hCiNWwbW2-U_MytA@mail.gmail.com>
	<CAJTo0LYtMSmqz-hr6zxfPDrv3x0kDDEO02ceH5zDU3o6H5iY1w@mail.gmail.com>
	<6b1040c9-6ca6-92e5-ac9d-c2a74d67db8f@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576AC2C7.5080801@gmail.com>
Date: Wed, 22 Jun 2016 09:54:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <6b1040c9-6ca6-92e5-ac9d-c2a74d67db8f@linux.intel.com>
Subject: Re: [PATCH 0/3] Add qemuppc64 target
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
X-List-Received-Date: Wed, 22 Jun 2016 16:54:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


Alex,

On 06/22/2016 04:43 AM, Alexander Kanavin wrote:
> On 06/21/2016 07:03 PM, Burton, Ross wrote:
>>     Can you also see if usermode qemu needs to be changed for ppc64 as
>> well
>>
>> It needs enabling entirely - qemu-ppc64 doesn't exist currently so every
>> build-time postinst fails.
> 

When I enable qemu-ppc64 in the OE build, I can boot the kernel and get
to the login prompt. When I type in the passwd, nothing is echo'd back.
If I use the Ubuntu 14.04 qemu-2.0 version , it works.

> There were reports that qemu-ppc64 does not work even when enabled:
> 
> https://lists.yoctoproject.org/pipermail/yocto/2016-April/029698.html

Haven't seen those errors.

- armin

> 
> Alex
> 

