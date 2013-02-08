Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3moH-0006ez-GE
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:12:05 +0100
Received: by mail-vb0-f46.google.com with SMTP id b13so2225521vby.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=aqz54eJ9XPBSysgB5PuFt7Gy0zDQxnHoZ9fJaAsAAVE=;
	b=NoBQNWB1LeSpN7xLnJEAGHqni9gxC4h7oTPuXifTz4y8BoxP13V7lPwK7Xat1/D5Kx
	Uo0xMAkWEKw0LXTgcolJzjhQFWux7g9GX56buDIzmdyHAiGDTNdahHlxea7rapVBpu2e
	6eqDEdNeEikQo9448nfUyYWXM7EoszBxaHiiR5jhaFHHIH3hLOJ/jaFB3FaFyt+XT74M
	nEmas8G8zOVBVRv0dRusBycalqH0GxSLUjLiomzkPqTj9rXL0C+REif3mpSX5uaIwX+e
	Nj46MWpni2+OlfozbNuyv00jT+pr2WQwbtFBtLkHAV6ZHTpbMGzxtEl0lrEtbAGvZ1Cy
	97SA==
X-Received: by 10.220.228.138 with SMTP id je10mr5941429vcb.67.1360324571430; 
	Fri, 08 Feb 2013 03:56:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 03:55:50 -0800 (PST)
In-Reply-To: <CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 11:55:50 +0000
Message-ID: <CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQk5FB0R4UJ7kDnlcZ0FwvlBTf361P7DTeLJtrHKTGiru0wYUfZEPO3ZUcoxCgXBPpYftQq7
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 12:12:05 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 11:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Can you fix the code to symlink instead of copy?  systemd and more
>> needs a symlink so that it can identify the name of the timezone from
>> the link target.
>
> You mean inside the if?

I mean in general /etc/localtime should be a symlink and not a copy.

Ross


