Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D418E782BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:01:57 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id w126so23846604wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zz4B88dhlWP6c2CDKZMmXvpjRSf7INxCJIofSaC3+kY=;
	b=Xg6DX5esGgk3zj14pW79N1MIsN9R8tHJRXb/tBQwDGp91/5lUl6Gz/pdDBosIiQwN9
	fnfWJU3s1XhX/lNFnw+F3D6nkBkmY6t6OsApofj+nl4WM1fdZ4qwVv+bJfo8hhVhXgl9
	AhZymdXFYgvaaKUKNOXPwrbFkJq+IcUmHAgsocRrC/H9HoI+le464R9DU+fOLxZDg9f1
	38op0781MTbr8ffMWr91gUPR+GmpEElbW/yhczD92ukb3RBH6JcWP6Qqaq1CMaIC4s3I
	dpiccXzdCxXNJAxW1kpVVriIcRarg7XpNBJ7EGKpzu4bD0kPZvhr7PwNd8OaQL7zgTXP
	EQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zz4B88dhlWP6c2CDKZMmXvpjRSf7INxCJIofSaC3+kY=;
	b=Y2UunlhzwOcNlKhtsK3++Dwp9mCG7bzufVVfIQKLe+J1HZQZIeAAfXsNmfOkVq+tfM
	fY0QVsBxsor0A/HY98ex2dPVvglIsHvYrq6Mwa5MheiFKJzbSd6GeLLuXHqjUk7gh3w1
	VPnop6bOAvNBpvzn4QgvXzMn6vMh3Sta/tXk0wtCVwZ9wQ54qzhuhJhdWowS1ZGYNJW+
	A4My/nu2/noq99kjuyegxGLaMYoK4hpRQOzt03knRepegH0g3t8k9aZpI1uRC/K+jDVt
	mOUX6870MpwZ9jUF4pE4xGzac77IwGLJea5IJcy0gCHdzM/yiHLRQEBBXkHJ/pOw6fqu
	qqUw==
X-Gm-Message-State: AIVw1110sQIquMbuo0Mgm7lZpHDWJRGT2cgEhovTEvs69jQgQZLefpxO
	FclZsjc6dG08c3g5ihHt3IuH13QlEg==
X-Received: by 10.80.217.141 with SMTP id w13mr2857548edj.228.1500555718301;
	Thu, 20 Jul 2017 06:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 06:01:27 -0700 (PDT)
In-Reply-To: <CAJTo0LaTdL4FFw2Nx6EshRbpx_yP=kuZsAJWseZ8qEf8h8O=pQ@mail.gmail.com>
References: <20170719025055.34644-1-raj.khem@gmail.com>
	<CAJTo0LaTdL4FFw2Nx6EshRbpx_yP=kuZsAJWseZ8qEf8h8O=pQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 09:01:27 -0400
Message-ID: <CAMKF1spmqkJwugwdXLy24G0Rcv+_1fOprdPLRNxzbT0TEcawTA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Thu, 20 Jul 2017 13:01:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 8:51 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Fails in glibc-locale here:
>
> | LC_ADDRESS: language abbreviation `agr' not defined
> | Makefile:1039: recipe for target
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE'
> failed
> | make: ***
> [/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE]
> Error 1
> | make: *** Waiting for unfinished jobs....
> | make: Leaving directory
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree'
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | DEBUG: Python function package_do_split_gconvs finished
> | DEBUG: Python function populate_packages finished
> | DEBUG: Python function do_package finished
> | ERROR: Function failed: oe_runmake (log file is located at
> /data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/temp/log.do_package.7984)
> ERROR: Task
> (/home/ross/Yocto/poky/meta/recipes-core/glibc/glibc-locale_2.25.90.bb:do_package)
> failed with exit code '1'


ok. I think I will wait a week for final release.
>
> On 19 July 2017 at 03:50, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb | 2 +-
>>  meta/recipes-core/glibc/glibc_2.25.90.bb                  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> index 5dd0c70400..429076ea98 100644
>> --- a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> @@ -22,7 +22,7 @@ SRCBRANCH ?= "master"
>>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
>>
>> -SRCREV_glibc ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
>> +SRCREV_glibc ?= "91ac3a7d8474480685632cd25f844d3154c69fdf"
>>  SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
>>
>>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>> diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb
>> b/meta/recipes-core/glibc/glibc_2.25.90.bb
>> index caf1ff4138..477b04d867 100644
>> --- a/meta/recipes-core/glibc/glibc_2.25.90.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
>> "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>>
>>  DEPENDS += "gperf-native"
>>
>> -SRCREV ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
>> +SRCREV ?= "91ac3a7d8474480685632cd25f844d3154c69fdf"
>>
>>  #SRCBRANCH ?= "release/${PV}/master"
>>  SRCBRANCH ?= "master"
>> --
>> 2.13.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

