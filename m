Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 986E078993
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:20:02 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u14-v6so6322364lfu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c4+C5wPjd8FoMUp4tPo+M3Yp0zJusi3JnTY/r+tVxI4=;
	b=T/aqgGLHYqa+ChYtTkWlv49hKKgTMtP1pRTvDopZTWEnNlEuVgI1K3q99O5iMFugL9
	zl3+6sHvq/DJvPit+VKqnzRZQOkjlFMevAZw0jC7vFwibnvlVu3V0T9O0rYBpyKNaCNc
	fAI6AeZMwkYtK1sX/Qip2MS90kAdmoUkZu9OmA+CKTdGQLoSfB49sYv2wLS13FmuJ/Me
	PZIluRyGhbcDd2eSpAte5Tt+83HH68dxkjGpQe4iuxClKBfrtwcGlKtnTkjDO+kBwQsy
	dbJ1FuOX1oriF3+1gWscbdbUb1NSUbVJW+96XtpR5Y3681EHmGYIEKiZgF3+HAIIEkX9
	3OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c4+C5wPjd8FoMUp4tPo+M3Yp0zJusi3JnTY/r+tVxI4=;
	b=lhsSkJkJDEH1vt2o5TPGlYKTuYp0mHditGMgTdo+Vrnp4Oof+R1N8LVsbYnIzvqvbp
	M53uY/YcYM24HxxXjRooQsnggIvRR4lAgBx25WEgWapTlSAExm5if2sGZFQfzQuySGkZ
	G3Ty2AznFkbk+4Qd3uVhgl84TzJwpTVh3GDotUCvKxh2EZrHlpXrMcdmGN0Yj8TwdmsH
	hCicE2LyJNn+Mh2R2c+jGWuBwtQWNgzsFKlveOka/YBzHI6NX7nYn0qURSfIybwr9N18
	FS6z3YmA1UD1Xqr0YAa04l1oJc0UHKU3ero0swszLYM9SUMM8Hwas7i6PW7WY6uIyLQk
	O05g==
X-Gm-Message-State: AOUpUlHmrVvr3OboNVZLh2dosoge52gwbq87K13mxTJF9aCUpCWGokwD
	jIhF6mH2sBY8aNNQLeNYPJbBF6po9qkAzL6bWWs=
X-Google-Smtp-Source: AAOMgpfPg+2dE/gIv8zV+rQtiuNDcj4x5ZSArj98uKDrvthQDRYWRCMdGF2lNDO3/rCQ1ZgE5+4TrFpBtPys9ZK76Gc=
X-Received: by 2002:a19:c403:: with SMTP id
	u3-v6mr13192334lff.87.1532550003160; 
	Wed, 25 Jul 2018 13:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 13:20:02
	-0700 (PDT)
In-Reply-To: <CAJTo0LbSCjmpOD0fnLCfT87OaGdOU2B8_SbZMeka9LB-RLiWSw@mail.gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
	<CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
	<CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
	<CAJTo0LbSCjmpOD0fnLCfT87OaGdOU2B8_SbZMeka9LB-RLiWSw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Jul 2018 16:20:02 -0400
Message-ID: <CADkTA4M_67sat73QPFaXeuo522=Nt_qdLcUjoc-KSMYvXHMDpQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 20:20:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 4:17 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 July 2018 at 21:05, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> My question about the change .. is why ? I really don't like cleanup
>> patches on principle, and want things pinned to a bug, a performance
>> issue or something else.
>
> See a post by RP to the oe-core list a few days ago: a general cleanup
> of Python code that spawns is well overdue.  In this case
> oe.utils.getstatusoutpus is a wrapper that just calls a deprecated
> function in subprocess, is best to pass arguments as an array instead
> of string, best not to use a shell, etc.

ah ok.

I still don't like it, but it is what it is.

My comment stands, I'll figure out how to incorporate this and send it
along with my next pull request.

Bruce

>
> Ross



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

