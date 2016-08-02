Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id BDF326E667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 13:52:32 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id u186so13996057ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 06:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ye8AlGoBF48aHwmbVCAkXxSiUW/13QxnVfnL/RlrJ2s=;
	b=q4l7BOyu9hSeLA2jJDe43ixcwGtY+PDvbNiXW+EoxNhPnPZkjCxU+7qlQd/GJKtZFd
	7JnPV9DuXsEUiXQ9800+hbJkhi+evdQrk+MU5Ng614IwasjQV3O7TU5T0uIpCA2DMS3G
	R5qucISknddYh1JIgHrhgRzbBSZomdCoECe+/OnCNLbf+9DwCeORNlQfTD7j5hzg9u9N
	RInPBajzW+M2djOaYsGh1ZdZYTERABUWZ29Yn2KV2IwEyQp6zj9xqKTB9AB2QPai+faM
	dfDecr0G1IAtgM2MqTabMCQ4zwovMk+oDrx2TD2GKHX2hZZJjmG6roRfiGmwzPwWABXg
	9RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ye8AlGoBF48aHwmbVCAkXxSiUW/13QxnVfnL/RlrJ2s=;
	b=Gbqa/sdwa68aDRkk9exm4uETCs+vjG5zgEEHn79WNN0y9w3AM773E+T0tGxUkAZES5
	dxIuwm5NpqQqwaZuFRZ2EYKj3mpJIbZlN4cixO67RwG0EgnZ7mGGN2w/B+jwXobITvsa
	weqpjCMO6DtqazQjjjsSR6KM6biTiho/jm8+ZYTsU107yFzdGxJznhbCTHpgB4LK1UDU
	YQeakp2bKObcLkqKpPAwH1+Yewfhjo3P8uNRE4FlNGlXyng4hYEFqoOS6G/HAvfr0SK8
	aVFfyWIx4oZdj6j/+wZfxAuSpDppxNm83OdIsT+ec83/NwtdA4cV0pE44aHY7XT2iIQ6
	HIRw==
X-Gm-Message-State: AEkoous+eKeKsDJFFNOIuDGcByqnGpRDacshTeOUfB715uuI2w4PxECX0f9liGeLsv06BQ==
X-Received: by 10.36.110.212 with SMTP id w203mr17935132itc.62.1470145953063; 
	Tue, 02 Aug 2016 06:52:33 -0700 (PDT)
Received: from openSUSE-i7.site ([108.161.121.178])
	by smtp.gmail.com with ESMTPSA id
	140sm10127006itl.4.2016.08.02.06.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Aug 2016 06:52:32 -0700 (PDT)
Date: Tue, 2 Aug 2016 09:52:29 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160802135229.GA14681@openSUSE-i7.site>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
	<CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Tue, 02 Aug 2016 13:52:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2016-08-01 @ 03:08:36 PM, Burton, Ross wrote:
> On 1 August 2016 at 15:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> 
> > Not a large dependency, but it does bring to mind the question if this
> > could be conditional on the type of image being built ? via  distro
> > feature, some other mechanism ?
> >
> 
> Exactly this: image building adds dependencies automatically based on what
> is actually being used, so can the kernel do this too?

I'm uncertain regarding the status of this patch:

1) will it be applied? (doesn't sound like it)

2) do you want me to work on it some more? (i'll look for other examples of
conditional DEPENDS, i'm not aware of any off the top of my head)

3) should i be looking to push this into a BSP layer? (since BSPs usually
choose their kernel)

