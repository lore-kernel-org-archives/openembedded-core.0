Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 48DFE784B0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 22:50:08 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b85so5313719pfj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 14:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tjmzq4cSY5xC8EbW58/Z4TItnnkr8pzsvFEIpuZ1htw=;
	b=Nug/lt8hAmVfGez1/ih9kTac0G/UAA8vKfjfP7uwgSQeXkbVweQJNFKZs77gYU2Zue
	gv7l97RlTnhepUpGgh5eKopyXbVwBCz9osDXJcvmiZ6GCuLlufVYrri8WhQFxfujsbWv
	OFwlfDgGc7iVmZvCGktHkCJC6leF/pq9rCCuCVwEtG1MPSnH2cLStSvli9oIZw+bHlVR
	ugFt9ZavjkBTECXOPnc7Nw7HworF+qLvPk2YFr2r4IsuPaCSSKsKwBw/F+FGtHkSB+6/
	6rY6BYJkH2ydB01h9cQBbPzyAYkC+THsHP1s8lfBKNlgtYLvTzr//b2AC6C9tYE8o2Iu
	OqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tjmzq4cSY5xC8EbW58/Z4TItnnkr8pzsvFEIpuZ1htw=;
	b=WI8WXVtf/eGJ6F5Z3XSdmfJ6b+J1DL7Ga6ck6oeiJnSc7qeMW0zz1m5DA3UKfMHuN9
	8AXP7Q5kRE1EHSUG/wzL/331YjnAkZuEddH1apxogyzTOdWwOkJRLpoNjkIlsSMyHDVy
	0m+wHMlEudhPfUEHROmKzjVc22EcuXRqNqx1jRS0CxRjADC368FmBbN2lRN3fb3GE0SV
	3I4zmVxuOpPeB2fYWaBj6VxCCzU1TcPCu4wxtOQDhHTymS90H9SCTEuk9ejC6JQ0AbEz
	OIs1E25cMg33PPzyx2dLA1mronkpdc4Gd3BeXZeBf+PTNlNM2RaVE1Zfq4nc9T4NA5Ty
	EBlA==
X-Gm-Message-State: AJaThX7Y8xz+vHyxKQxvpeBPWpAc0iRPaN/ifADeqkZrJWeSDyD4iEEL
	MtGJq6H9trMypDFtulRMWvWjYXyR5zYmLEqfeS0=
X-Google-Smtp-Source: ABhQp+TDPuWyY/eHK1kOCbg/3zT1yRUpUjTSVjNTymJtpUlfXKVcGsxNPlVEUK5fi0cagy/NtkAZMx91GCN9lziQ4u8=
X-Received: by 10.98.30.133 with SMTP id e127mr2026041pfe.137.1510267809358;
	Thu, 09 Nov 2017 14:50:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.166.171 with HTTP; Thu, 9 Nov 2017 14:49:38 -0800 (PST)
In-Reply-To: <CAJTo0LYazanyLCCXD0p5yQZCNa7PM0XNGKt2O5KidsS=aRF9Uw@mail.gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
	<6eb7d501a2a8422cf0ee6a36bb99143f39255be3.1510192517.git.raj.khem@gmail.com>
	<CAJTo0LYazanyLCCXD0p5yQZCNa7PM0XNGKt2O5KidsS=aRF9Uw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Nov 2017 14:49:38 -0800
Message-ID: <CAMKF1sqKdRk6haN4x4DAM6oyMXfJpey3abU+evrdh9Ydjr+4kQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Thu, 09 Nov 2017 22:50:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 9, 2017 at 12:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
> How does this help?  A bbappend is parsed after the bb so it can just assign
> to SRCREV.
>
> Also is it actually useful to change the git url but apply the same patches?
>

yes, this helps with using local forks of upstream and at the same
time apply the
patches from OE-Core being on same version. Especially for new archirectures
where all support may not be upstream.

> Ross
>
> On 9 November 2017 at 01:58, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This makes it easy to override them in bbappends
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/binutils/binutils-2.29.inc | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc
>> b/meta/recipes-devtools/binutils/binutils-2.29.inc
>> index 27d46eb088..35f76cba6d 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.29.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.29.inc
>> @@ -18,9 +18,10 @@ BINUPV = "${@binutils_branch_version(d)}"
>>
>>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>>
>> -SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
>> +SRCREV ?= "37e991bb143ca2106330bcdc625590d53838b7a1"
>> +BINUTILS_GIT_URI ?=
>> "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
>>  SRC_URI = "\
>> -
>> git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git
>> \
>> +     ${BINUTILS_GIT_URI} \
>>       file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
>>       file://0004-Point-scripts-location-to-libdir.patch \
>>
>> file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
>> --
>> 2.15.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

