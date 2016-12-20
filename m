Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA66877317
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:55:56 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f73so22630028ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gKDmw2UGdhJKPfNEPPb5x+OkwQTsCJSR7bccm9dVbB4=;
	b=JFHr8RRstfvsroMyIPBSTi+jN2mDt72p15PFE3hbScgiOEvr15Pu8NReY5n89x9jgv
	07kHUb5CF7d7n4pzP8T0IFQ57y2Q/OB6PCP1swPzJ8NVkpmyJTelMfnJSZtSfD1yGxvT
	KICBqxAOIg9slKiyEdMvVoPQB/NrlgXWdSCPHLCwQ+cbSnSjiun0xRt8wNOY85Vvdqkz
	vlMOV1iIRQQSsZIyI/ZNDiCA/6xmPRvYl+5oPXlTh48QwdGwdeoNU9j9dQRiuAynqw8b
	pChL9pcBudGg0mbRwWFRTfwC7ajnAJxNoJK6zU57EEnj0fp5KgLP8iFFZMBVZKbjLX0L
	nfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gKDmw2UGdhJKPfNEPPb5x+OkwQTsCJSR7bccm9dVbB4=;
	b=sWm1iN0grGA8mtwoiheQWeizn52/uVxGGoEp8w0SKfouk7cYzCKmh7W1idj5jzCZtF
	Px2nJSIMsIee1dNyVhaTWQeoz+OKVrJna9NVvdvXfuKALS9JrTtQUUTpUYHwAPnPRxdG
	mpRFlssfWksXxs5fjO7Vk69UKRXc+ZM123oyf04RUMAqjT8EJCuOXFJHdnYv4thP20r5
	wFH8UnJobZEOMiek0FzCx87AWbB0Lt8B0jcXHyQtwQOapozqrK5luieNUp4voWLopCA7
	mMc4bCjfSR8392TtsHgR5DGa+OdDy+riL3M1E4BoU3rvHVeqk4hk8usMkrGjwdCJ2zXR
	VKCA==
X-Gm-Message-State: AIkVDXJjoS5cyZuiSLggsswp/IQO81Map13/d/9ltTdkNFxj+3cC1vOA0UDfibzpldPowA==
X-Received: by 10.107.178.12 with SMTP id b12mr367528iof.164.1482245757820;
	Tue, 20 Dec 2016 06:55:57 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	p71sm10366422ioe.33.2016.12.20.06.55.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 06:55:57 -0800 (PST)
Date: Tue, 20 Dec 2016 09:55:55 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161220145554.GA11748@openSUSE-i7.site>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 14:55:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2016-12-20 @ 02:41:21 PM, Burton, Ross wrote:
> On 19 December 2016 at 22:12, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > checking ncursesw... (v6) yes
> >
> 
> I'm pretty sure this indicates that it found a ncursesw-config binary,
> which we disable. So it must be running the host tool.  I'm seeing if we
> can force it to use the sysroot easily now.

Hi Ross,

Thanks for continuing to look into this! :-)

I spent the last while trying some things to see if I could fix this issue. I
tried adding --disable-widechar to OECONF since that was one of the new things
added between 2.28.1 and 2.29 (no change).

Looking through the config.log I found a couple things that weren't right:

	$ cat -n config.log | grep "\/usr\/include" | grep -v x86_64
	  3326  In file included from /usr/include/linux/gsmmux.h:4:0,
	  3328  /usr/include/linux/if.h:211:19: error: field 'ifru_addr' has incomplete type
	  3331  /usr/include/linux/if.h:212:19: error: field 'ifru_dstaddr' has incomplete type
	  3334  /usr/include/linux/if.h:213:19: error: field 'ifru_broadaddr' has incomplete type
	  3337  /usr/include/linux/if.h:214:19: error: field 'ifru_netmask' has incomplete type
	  3340  /usr/include/linux/if.h:215:20: error: field 'ifru_hwaddr' has incomplete type
	  8662  NCURSES_CFLAGS='-I/usr/include/ncurses6/ncursesw -I/usr/include/ncurses6'

The biggest one is probably the last one (line 8662) where something is
setting NCURSES_CFLAGS explicitly to /usr/include. I'm looking for that one
now.

The first issue I see in my config.log is confusing to me too. Looking at the
full log around that area gives:

	3325 configure:17946: gcc  -std=gnu99 -c -isystem/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/usr/include conftest.c >&5
	3326 In file included from /usr/include/linux/gsmmux.h:4:0,
	3327                  from conftest.c:82:
	3328 /usr/include/linux/if.h:211:19: error: field 'ifru_addr' has incomplete type
	3329    struct sockaddr ifru_addr;
	3330                    ^
	3331 /usr/include/linux/if.h:212:19: error: field 'ifru_dstaddr' has incomplete type
	3332    struct sockaddr ifru_dstaddr;
	3333                    ^
	3334 /usr/include/linux/if.h:213:19: error: field 'ifru_broadaddr' has incomplete type
	3335    struct sockaddr ifru_broadaddr;
	3336                    ^
	3337 /usr/include/linux/if.h:214:19: error: field 'ifru_netmask' has incomplete type
	3338    struct sockaddr ifru_netmask;
	3339                    ^
	3340 /usr/include/linux/if.h:215:20: error: field 'ifru_hwaddr' has incomplete type
	3341    struct  sockaddr ifru_hwaddr;

The compile line is clearly telling gcc to use -isystem/z/layerindex.... In
other words gcc is being directed to look in the correct locations. But in the
error messages it's saying that it looked in "/usr/include/linux/if.h". Does
this mean that -isystem isn't doing what we hope it should be doing? Or is gcc
stripping out the -isystem prefix when reporting this error?

