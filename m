Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29ED2744C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 10:43:32 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 36-v6so12522964oth.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N7z+VuP7n8uQYNcxwrFNlRpigLCbc6YvAodrvFTwN04=;
	b=dgf6l3l5LqITyzJ5ti1Y0MZUVHIyB5FhuMqPRdKtIrkSG7I+s1fUDZ0+hlnz7WT8Yp
	C07HiF/byctrUniV3n14Fy5WyxJXp4RI9MDogko+rOqMRb5F4zEuQUem3dH+erdQN5f6
	ql5+hzf1O+yCF83e5bliHESNdTOmeArCWOipz23et8cO9aaLHnupMhEPMXd0qJjAVHSU
	DW/YNQa1xwRiaUSsv2ue0cEoueKSKfwUakJ78u3sSVbWUTTgFsfVFUGuXFIiwI+rZgna
	Is1t37fpdVsCWd9ys2Oww6hqouHLTC8shcFFgO6NVAH2O3Sb8n7aLFXIKeJSOlK/gOo9
	P53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N7z+VuP7n8uQYNcxwrFNlRpigLCbc6YvAodrvFTwN04=;
	b=YQN2UwIoIymc3u4gDD4d8VI6uak0YHaSIdLYjVFZxJ8Nyb6JfLR4OPfdBO7Wh8Ewq4
	keWTy2Hef9VzPnSwYqGsFq4CYWlc9/SGR8rJvUuPtDTIpwYfesQ6cOajAbXpwLWoVzQp
	UM/BYvO/TfMHDa+cmCH1uYa5+dMH+wG6N1KlELn568vpp91w3wIU/SNYi6kZ7y8pd+Af
	2X4zQv+NzHyT9rHWZad7dD0UzuhTV+xyPSlAlSdwS83bqMEvUbOq2rdRdAffzNOvA6Ex
	3ABFA7wh+Ik5XDOcu1QI8Xe50XEkcmW8B51B6tZliI7Lt3KFTbHXL4lKrHhPxCUdjBSq
	nnew==
X-Gm-Message-State: APzg51BAKRlIGJK6oRW3SLxkus8BbyCuK5m50+u3V5SwROdq/pH60J4t
	Rl18Z7ndyCFMvXBb+3QeZkfvogYQa1CmHQ0iuo6RvA==
X-Google-Smtp-Source: ANB0VdZTpH/28FZyuTBHB3RZLsrATPnZgMYyux9kNcZ83RB8ItnRFQFSR5Zn4e+rCv+YUfzK4wAH6fupiJ4LzgJRVjA=
X-Received: by 2002:a9d:11ee:: with SMTP id
	y43-v6mr24208384oty.341.1537526613053; 
	Fri, 21 Sep 2018 03:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-6-abrodkin@synopsys.com>
In-Reply-To: <20180920204232.10583-6-abrodkin@synopsys.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 11:43:21 +0100
Message-ID: <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
To: Alexey.Brodkin@synopsys.com
Cc: linux-snps-arc@lists.infradead.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/9] libgpg-error: Add ARC support
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
X-List-Received-Date: Fri, 21 Sep 2018 10:43:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Sep 2018 at 21:44, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:

>         case ${TARGET_ARCH} in
>           aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
> +         arc)        TUPLE=i686-unknown-linux-gnu ;;
>           arm)        TUPLE=arm-unknown-linux-gnueabi ;;
>           armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
>           i586|i686)  TUPLE=i686-pc-linux-gnu ;;

Is that right?  Just saying, it looks wrong...

Ross

