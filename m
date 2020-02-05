Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6245760B34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 19:02:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id g1so3652186wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=DM1B/ybidRIZe0Uz/ZAmiVaSiPh5Oe3JVCWVF5wdk3U=;
	b=E02qJOTNDKZpJ9zbpwxYxVt4Ywx5DUE8CF6SrSNPgRwtC5nAWUccR7CBYvI1D6ILsa
	rirXuck2tOLhoBErOH9Jj57SBNm4CvLnFfiYEC8L5NjKtmZPiYP/rKWPfwUGUBT5rJca
	Gp6xqHbxs2J0tRC8W7NWTvhm2liEGsO+IWBdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DM1B/ybidRIZe0Uz/ZAmiVaSiPh5Oe3JVCWVF5wdk3U=;
	b=Fp2zTzD0SZQ/pzCEyKGx4rCvmYqI/W1clXeZDCoOxI8QDLieJMdBFBxqp0rO9PWmdp
	O8CJB4/+lODrq6q7bTSZnKhLKrJRoV2wdWfmVLo4TYfrRFdLQPkelHogWRT+ES46K1KK
	9JaPDOAz5ayYRvp8+iRIIXS6vOk7M2Q3WdcTx09ixj5fEuwfkidADA/tRt+wz3SXhx6w
	1tLI190IiT2sicvpJe0fTjcUA0KOq5bkppqN4b2+inj7kzjUOPhSC7KWliLFe19doSIx
	ZikMdzP1ich3BV/0RmbsaqCnPLpzPp6UoHl3nRt4ISnN42CLY/AGngQ0IOROijmr1pXk
	p3Zw==
X-Gm-Message-State: APjAAAUNV4fKCWODUGQKh5m/LpZ5Gp5BzldMdez2pA2IBe8zdSeaPVNw
	D17lV5CE4QKWRxJO8riHy7f0t6gPsjM=
X-Google-Smtp-Source: APXvYqz2OhO6x4Nr7GSZhFDD7W7tEPWwOJNLe/3gOoYXF4TN7A0fZWJzV/Md7vhf5RSsMMtQlMR8xQ==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr6826587wmc.115.1580929327548; 
	Wed, 05 Feb 2020 11:02:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w20sm536052wmk.34.2020.02.05.11.02.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 11:02:06 -0800 (PST)
Message-ID: <763401698becd74610d4771100229b0a5350847f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Feb 2020 19:02:04 +0000
In-Reply-To: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
References: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Reproducible Builds Issue Status
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
X-List-Received-Date: Wed, 05 Feb 2020 19:02:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-05 at 14:27 +0000, Richard Purdie wrote:
> Good news is we're down to a set of specific issues and those issues
> seem "stable". The ones we haven't fixed yet with master-next are:
> 
> /srv/autobuilder/autobuilder.yoctoproject.org/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl:
> (https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl/)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
> (needs a bug)

Ross has a patch for the gtk3 issue (thanks!).

> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13771)

I've sent a patch for libidn2.

> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20191019-r0_amd64.deb
> (needs a bug)

Still needs a bug, not looked at.

> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13770)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13773)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13772)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13774)

13772 is looking to be partially a dash vs bash issue.
13774 is partially a sorting issue from perl-cross, I've something
locally I'm experimenting with.

There are multiple perl issues intertwined and I suspect several more
issues to find.

> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
> (unfiled, may be related to above 13772)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
> (unfiled, may be related to above 13772)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
> (unfiled, may be related to above 13772)
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
> (needs a bug)

This one is fixed, patch out for review.

> Also:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13776
> (didn't show on this set of builds)

I looked at and commented on this but don't know how to reproduce.

Cheers,

Richard



