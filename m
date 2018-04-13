Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8637060574
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 13:23:23 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id e123-v6so8318273oih.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PFOjZpPPTuM+cAwy9ooFd1XXKxykXtisE+TuLIe2LeA=;
	b=0fOs9CvArV2qVtbhqpHLYzZKG3R63M1EWjL1CG62mgy6tFtP0QGd7zZLs8zvBPkQka
	jy3MxMp6WXHWhZ72dtCu4+lhfmsk4qRytbeNxCvRoDVqGIN5EufPc9AakkTmYmxSLNUw
	jrevLkKmHiWNMCb0Jr+GAg197jjitB89ISRlnj8PsOMew/9N97lOttK9AnlwbQYLP7jz
	x21kfCeDKXfkJWhYRHVvXxqqNq5jGJoUP0VTGBEbR6oEiuA/ga2/HiNs05QhpiQLslqp
	bVtneWzx+EAw4UvetSCOOr7Qt1IH/dfWHZjFGpGwJ6kk0Z9Skrmv8WSsH8Imb/ceBmFU
	nJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PFOjZpPPTuM+cAwy9ooFd1XXKxykXtisE+TuLIe2LeA=;
	b=TViqCtc6kmUsboIOsjeIYpc1pEjkrIYMq4Nv+SkEibgF8tiKcflDjfCBEOGQ8DNgho
	b2R3i7STFivYuqp51EsPoHkoqMUDDGJKvyt9z5QfkvJB3igZyXy3b48E89t+iUm+yRJj
	ErZAw06by2VsO6Np1gm96KMuT0NudY7uN1a/R8s1i8qzogUBDIsLqmmmPgPxeh+2eF6N
	/VX89/+t3Nk4dCgxKsgoxCkUQXTiaecZzV1qxtoplCRAvl2CPBNcfq0GcPd++gFad0Ws
	qdjYma+gaedWCU4kJYjlJ/pbPK29xXoXXoUSpN/ZSBBKogK9PrjWRUGetZr8ci/X1OPF
	BNoA==
X-Gm-Message-State: ALQs6tBd07CBLBvHqrk2W8hFJZkyQUkKX1UcLVSzZryHbQyknN619/CR
	PM7xerrTZT9djRDRFDM51UD1+6dtr6qWszX/WuEwew==
X-Google-Smtp-Source: AIpwx49ydruod0wHmm6DD7TSp6vGhAUJODlEW6Vz3qxeal8GQpOShjITAjEWL35PBxJdaK62ILAEOGfR0FODJS793Gc=
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr8851164oig.102.1523625804394; 
	Fri, 13 Apr 2018 06:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Fri, 13 Apr 2018 06:23:03 -0700 (PDT)
In-Reply-To: <1522769101-4576-1-git-send-email-kamensky@cisco.com>
References: <1522769101-4576-1-git-send-email-kamensky@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Apr 2018 14:23:03 +0100
Message-ID: <CAJTo0LZbtOda6KA6RkCr+mFHi04zUusQt3_Nwv6OfqVSoMJE3g@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oeqa/runtime/stap.py: add runtime test for systemtap
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
X-List-Received-Date: Fri, 13 Apr 2018 13:23:23 -0000
Content-Type: text/plain; charset="UTF-8"

On 3 April 2018 at 16:25, Victor Kamensky <kamensky@cisco.com> wrote:
> +    @OETestID(1652)
> +    @skipIfNotFeature('tools-profile',
> +                      'Test requires tools-profile to be in IMAGE_FEATURES')
> +    @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
> +    def test_stap(self):

Instead of skipIfNotFeature use OETestDepends(systemtap), as platforms
which don't support systemtap can still have tools-profile enabled
(such as musl systems).

Then please add stap to the default cases in testimage.bbclass for the
sdk images.

Also shouldn't the test be looking at the output to check that 'hello
world' was displayed?  Otherwise stap might have done exit(0) but the
script didn't actually run.

Ross

