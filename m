Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1838E74B83
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:15:56 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 13-v6so13869139ois.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6fBXW+4pFpT3LHPeMI0FNAo2DWSGtci2PBG26lsKTlg=;
	b=ofXp1FEZEWtSznvWOvJmsq4YCY9YSbaNkYhfKS696WTmWSDKWz2FnifmhabiWUKZe9
	P3mMjCGf2V/oPjiRGFPaxlvaUZADCeEv9kTzm0UwW2jPqG5tnPdpoi8buuPaKn/nbV8E
	X7n0YrFP7qFEYlfg0Oxs65bba0KS9egYQ5H8HY2XZb8nTTv4Nq7iPXV/yPazcADjcgUJ
	La4+ZLY4CComFYPGr5PLpltYldBSjf5QAMRhWs/4DXV2HHWZRES59C5qrTmoNKXnx3PL
	QSZu3RP+K+pwmccmfrudiSeL/mIFXwME+5f/fWkUruQRETDteMaJAzQqFKhWxLOofuuA
	JQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6fBXW+4pFpT3LHPeMI0FNAo2DWSGtci2PBG26lsKTlg=;
	b=haCF5JFu6/amdnYgpM6v00LI4nZQVE4sNxbbti0SMkpJGEFV3sPUQ4eYZa85wG+Fn3
	Jxj15wxEkCAHpOXtvXOVirhXRMFGIT7+qkrwkPIFTKL1W1JG6DHjY0wM5SNdCkGH487R
	ouG4QC/1dVymmp/y96KhPWv6aipO00QR1XwYvflWwNnQW0tJtrm4EpNQ4cPx/2mCdF9T
	1HaZo75+vRx/s5AOOSXwg+r6pN3dnSj/nraQ3IIyeMNkBZ1K2x24Df6semOJUTUmmfKF
	TqgMti93rbw5u+gkFSXQCuL2FOLZvxCExOh4goeZ0PzW99RhQZvllX+eyxsNVaJcetU+
	bGRA==
X-Gm-Message-State: AOUpUlFNz+l5inmiwoYS852VdtNueoOxIk/z/xuknhVVm5BWO2BkOcIG
	CpIOyLQlzN1aMuaXNEF4JO60mtqp1ws6qWP3o5btOg==
X-Google-Smtp-Source: AAOMgpe9h85PQ9lADTE2dguApMn+3XAKdX9CrIBkj+hqiioWumKVL47usVtcoLnUf0R/HDkR7jtZBw8GHflAaR/gnIg=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr11555560oih.70.1532783757977; 
	Sat, 28 Jul 2018 06:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Sat, 28 Jul 2018 06:15:37
	-0700 (PDT)
In-Reply-To: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
References: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 28 Jul 2018 14:15:37 +0100
Message-ID: <CAJTo0LaSchdmbebhtcrLf-neM-1HE=jC_xswmg306qYLwTFFXw@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] binutils : enable x86_64-pep for producing EFI binaries on x86/x86-64
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
X-List-Received-Date: Sat, 28 Jul 2018 13:15:57 -0000
Content-Type: text/plain; charset="UTF-8"

On 27 July 2018 at 00:51, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> +ENABLE_EXTRA_TARGETS ?= "--enable-targets=${ARCH_EFI_EMULATION}"

This has an interesting implication in that it's not building support
for all targets now, specifically buildhistory-diff shows that large
chunks are no longer being built:

--rw-r--r-- root       root            15269
./usr/src/debug/binutils/2.31-r0/git/elfcpp/mips.h
--rw-r--r-- root       root             9539
./usr/src/debug/binutils/2.31-r0/git/elfcpp/powerpc.h
--rw-r--r-- root       root             5994
./usr/src/debug/binutils/2.31-r0/git/elfcpp/s390.h
--rw-r--r-- root       root             8243
./usr/src/debug/binutils/2.31-r0/git/elfcpp/sparc.h
--rw-r--r-- root       root             5654
./usr/src/debug/binutils/2.31-r0/git/elfcpp/tilegx.h
--rw-r--r-- root       root           329045
./usr/src/debug/binutils/2.31-r0/git/gold/powerpc.cc
--rw-r--r-- root       root           136896
./usr/src/debug/binutils/2.31-r0/git/gold/sparc.cc
etc

(that's a diff, so the leading - is a removal marker)

So binutils on x86 only support x86, but binutils for ARM supports all
architectures.  Inconsistency doesn't seem right. Can we *add*
x86_64-pep to the target list? Or can we make all binutils just build
their native formats?

Ross

