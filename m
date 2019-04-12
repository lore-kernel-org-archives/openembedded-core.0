Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id A63247DADD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:15:54 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n25so10516648wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 04:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=T98nrEt00gbtKHCyqL7qOBH2EFSif47dvNuCF3AFokU=;
	b=G4olYAwC0hK2NkB+menvWzgoxWbOZygfHp3VvIoLddKgE9TdcN7/ON8cuCb3kbd0pb
	4xwSaZLe/Q+9eaWy20BqYcouIJBZMWNlpseX0UuY+FM56bngkx9OZ2w7/WZqCyMpm6dz
	UJXRs6mXl30LjeDzd9mxnAd3OsqAIuHwponiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=T98nrEt00gbtKHCyqL7qOBH2EFSif47dvNuCF3AFokU=;
	b=PugaJT+GOfxW4EMA4SKyWnrBqyO1XzVxeS858LeaUB8e7y+6/2TtyKenWl6YMALVq9
	/+2z3SPIZr1mYk7/l9dn6oafPCKHdJJIDQg+5+vc4PbtzKlFVBeVRjb5I6x/ELaXS601
	uKG3KFIOdpZqR5WOdR45xpS256ttJPapj0lYRjfUj1nQEkjHM/5bGfiAvG+SGF1nqxuP
	MKK+kYKHv/f0WrpKt8v00wrkPe22I82Ubo799gxCEZtwr8ZYyXgj+PaeOXxmxPmDuxVh
	qE5rC2QIlQRn6g1B5eej3+MIL5BYcdhwSoDfRltO1WSd7SRRoOQwFwlm443tV5d7qYth
	zQLw==
X-Gm-Message-State: APjAAAWjsVzWW1fhk7XR25O0NGvEPJZxE3aJyeVpllsitTpGs0LMVWux
	JcmR95yFJPzofVBg7AAgRdLg2A==
X-Google-Smtp-Source: APXvYqxJr9Vz1Ef1Xry5OWVmR/DE8uPV0vy3gNLlBGx+ZtrJn0YkcdV6r7hQ3rlS95B/trxlFyszqQ==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
	x19mr10771043wmj.2.1555067755217; 
	Fri, 12 Apr 2019 04:15:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t74sm15126007wmt.3.2019.04.12.04.15.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Apr 2019 04:15:54 -0700 (PDT)
Message-ID: <6efbe3299710921b8da6988b37e53ce34ed14314.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>, "'yocto@yoctoproject.org'"
	<yocto@yoctoproject.org>, "Eggleton, Paul" <paul.eggleton@intel.com>, 
	'Michael Halstead' <mhalstead@linuxfoundation.org>, "Erway, Tracey M"
	<tracey.m.erway@intel.com>,  "'sjolley.yp.pm@gmail.com'"
	<sjolley.yp.pm@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 12:15:53 +0100
In-Reply-To: <015AB11D45F2C442929CB2765DAE738634DD053D@PGSMSX110.gar.corp.intel.com>
References: <015AB11D45F2C442929CB2765DAE738634DD053D@PGSMSX110.gar.corp.intel.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: QA cycle report for 2.6.2 RC3
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
X-List-Received-Date: Fri, 12 Apr 2019 11:15:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-04-10 at 02:38 +0000, Jain, Sangeeta wrote:
>  
> QA cycle report for 2.6.2 RC3:
>  
> No high milestone defects. 
> Test results are available at following location:
> ·        For results of all automated tests, refer to results at
> public AB [1].
> ·        For other test results, refer to attachment [2].
> ·        For test report for test cases run by Intel and WR team,
> refer attachment [3]
> ·        For full test report, refer attachment [4]
> ·        For ptest results, please refer to results at public AB [5]
> ·        For ptest report, refer to attachment [6]
> 1 new defects are found in this cycle, Beaglebone [7].
> QA hint:  Similar issue for sysemtap failure (bug 13153) was found in
> 2.7 M2 RC1 which is now resolved for master.
> Number of existing issues observed in this release is 3- toaster [8],
> Build-appliance [9] and qemu-shutdown [10]
> For ptest, regression data is not available for this release. 3
> packages are facing timeout issues: lttng-tools [11], openssh [12]
> and strace [13].
> Test result report on Public AB shows following failures:
> buildgalculator.GalculatorTest.test_galculator
> QA Comment: Expected failure for hw limitation
> python.PythonTest.test_python3
> QA Comment: Failure due to “python3” test case not backported to
> Thud. No bug filed as not real Yocto failure.

Thanks for running QA on this. Firstly, I can comment on the bugs:
 
> [7] Bug 13273 - [2.6.2 RC3] Systemtap doesn't work on beaglebone
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13273

We've root caused this on master and believe we know how to fix this,
its a kernel makefile configuration issue. We can likely document this
as a known issue and fix in 2.6.3.
 
> Previous Bugs observed in this release:
>  
> [8] Bug 13191 – [Test Case 1439] Build Failure after adding or
> removing packages with and without dependencies
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13191
>  
> [9] Bug 12991 - [Bug] [2.6 M4 RC1][Build-Appliance] Bitbake build-
> appliance-image getting failed during building image due to webkitgtk
> package.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12991

This is a long running issue we've been "ignoring", its likely resource
issues on the machine/VM running the test.

> [10] Bug 13234 - [2.7 M3 RC1] qemumips & qemumips64: failed to
> shutdown
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13234

This is an issue root caused to be from 4.19 and 5.0 kernels. I thought
2.6.2 had a 4.18 kernel so shouldn't have this issue? The bug wasn't
reopened?
 
> ptest Bugs:
>  
> [11] Bug 13255 - [2.7 M3 rc1] lttng-tools ptest facing timeout issue
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13255
>  
> [12] Bug 13256 - [2.7 M3 rc1] openssh ptest facing timeout issue
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13256
>  
> [13] Bug 13274 - [2.6.2 RC3] strace ptest facing timeout issue
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13274

ptest has been a bit tricky and we've been actively working these bugs
on master. Once we have them resolved there we can backport to older
releases.

There is one other critical issue we have with 2.6.2 which is the
revert of the boost upgrade. I'm very reluctant to release without that
revert as it caused problems for a lot of people.

I'm wondering whether we should rebuild 2.6.2 one commit later and then
release that assuming it passes a rerun of the automated QA (but not
the manual QA). Opinions on that?

I'd propose fixing the systemtap and ptest issues for 2.6.3.

Cheers,

Richard




