Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 44743758E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:12:47 +0000 (UTC)
Received: by yhan67 with SMTP id n67so14420575yha.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 18:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qaQCLuVk5jIhvKtyW9xnqOwPB/38AIgVfbkRC6zPAlE=;
	b=nBL34+G22khdVI2mzELHrtwP1oi2THzxvF0p6u7p1DAB4l17jswxQy3O3312N89ktU
	2wxCKAbBYFOG7DIl04UlXzZ9g3j3wH1rI9j0uhxMAtSWMHBlI2FsvsmQG3feBySWNFWO
	J9v+3mdgkR+RzCNv+GXQZFFwxRPWh/1D8HIetEoyrDpdYzRqu8P3doaZtvZRlgvAfe2h
	nojS67ESCt7wDtfpLMRHdUhONKHu5QlJWhy1dSRLbyhfll9tY/7ijpHHwj+G2nD9rU1p
	MuSC45bqRouN/6uT50/u/hKMktPZtrXT+N+KrlhbrwltFNTyCEAMe9RtWMlBKy7nWUJe
	PSHA==
X-Gm-Message-State: ALoCoQk61FXI+YU/0XG/jPSOd//o5W+uYZFhqg/aXecA8TqWy+gHuMb7E84ilDFD2OCn7rSSEMxE
MIME-Version: 1.0
X-Received: by 10.13.194.198 with SMTP id e189mr591982ywd.127.1433898768648;
	Tue, 09 Jun 2015 18:12:48 -0700 (PDT)
Received: by 10.129.109.68 with HTTP; Tue, 9 Jun 2015 18:12:48 -0700 (PDT)
In-Reply-To: <CAFoFrHZLi0mdvxj8Go1eEviFzfaDmvBOOkUng5YC67f0QzAn7A@mail.gmail.com>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
	<CAFoFrHZLi0mdvxj8Go1eEviFzfaDmvBOOkUng5YC67f0QzAn7A@mail.gmail.com>
Date: Wed, 10 Jun 2015 06:42:48 +0530
Message-ID: <CAFoFrHYqdmf6ez-SHcp6DwOPk4ctGu3qht0iLxdhoFkcZN1gcQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: Re: [OE-core v2 PATCH 0/5] aarch64 changes for meta layer
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
X-List-Received-Date: Wed, 10 Jun 2015 01:12:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

On 8 April 2015 at 12:45, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> On 18 March 2015 at 16:57, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> I am adding the support of aarch64 to LUV OS Distribution project.
>> The luv-yocto project is based on poky distribution.
>>
>> https://01.org/linux-uefi-validation
>>
>> While adding support I find that these are the few meta layer changes,
>> which I have been asked to upstream. If we merge these changes into
>> openembedded-core it will be more helpful to maintain the minimum set
>> patches at dependency projects like luv-yocto.
>>
>> Changes since V0:[RFC series]
>> - grub: grub-efi: bootimg: Include all the chages suggested by Bernhard Reutner-Fischer
>> - grub: Add grub recipe changes suggested by Burton Ross
>>
>> Changes since V1:
>> - grub: More documentation on grub recipe and remove CACHED_CONFIGUREVARS as suggested by Richard Purdie
>> - bootimg: Add NOISO as suggested by Bernhard Reutner-Fischer
>> - syslinux: Impliment as suggested by Richard Purdie
>>
>> -Naresh
>>
>> Naresh Bhat (5):
>>   bootimg: Add support to install Image
>>   syslinux: Remove bootimg dependency on aarch64
>>   bootimg: Skip iso image build on aarch64
>>   grub-efi: Add to support to install grubaa64 efi
>>   grub: Update grub git recipe
> Ping,
> Are you going to pick up any patches (out of above 5) in 1.9 release ?

Ping, If any of the patches makes sense (out of 5) please pick up in
1.9 release.  If something which does not make sense let me know.  I
will try to re-work on it according to requirement.

I will be on vacation rest of the week and get back on your response
on Monday 15th June.

Thanks
-Naresh
>>
>>  meta/classes/bootimg.bbclass      |   12 ++++++++--
>>  meta/classes/grub-efi.bbclass     |   17 +++++++++-----
>>  meta/classes/syslinux.bbclass     |    5 +++-
>>  meta/recipes-bsp/grub/grub_git.bb |   47 +++++++++++++++++++++++++++++++------
>>  4 files changed, 65 insertions(+), 16 deletions(-)
>>
>> --
>> 1.7.9.5
>>

