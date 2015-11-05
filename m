Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 575C4766B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 02:23:20 +0000 (UTC)
Received: by ioc74 with SMTP id 74so9908429ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 18:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=2QamyPoVq7Eru62COLuZwzIFQJG3eF7KHxvjar4c5as=;
	b=0ff7iN2zW8hSpB6e09hm8k2m5Zx1xJpMOWdEmiI9XudiLABr7AiTnpy5IUlGT8haMp
	GRDkehPXPZrNGe4aeVrtveS9HUfHzKzUiIcmScmA6KLt7KMMUnXno22mRXJU/vGDkZLq
	VehbmFWdBxmCeHEV5/Q86mhC4I1VadsDwhXU08LWC6VxRN2Qv1HQwXZiTaHHkI4M9uU7
	ABviJtikO15U0WyJCzIeKHX3eGbfbQpWiDkvhVZUgBLL8q8l5+jETASOwOU2E3qN7gZZ
	RnCWRhOgq/WWLhRsMcBH/bCyNYExMA9Y67cOVRN2cy3NPUWgghkFYVJOeeX8m4s8txV1
	0ypA==
X-Received: by 10.107.4.3 with SMTP id 3mr7714206ioe.195.1446690200847; Wed,
	04 Nov 2015 18:23:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Wed, 4 Nov 2015 18:22:51 -0800 (PST)
In-Reply-To: <563ABB70.8060400@windriver.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
	<CAMKF1sqBfdSMphfZJ_O3nEd3cMA7A=5tKa2Xu0wGUsSr-HtuNg@mail.gmail.com>
	<56387CE7.5040907@windriver.com>
	<6A9FCF09-82E7-4A16-AEDD-D081F67704E7@gmail.com>
	<563ABB70.8060400@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Nov 2015 18:22:51 -0800
Message-ID: <CAMKF1spD5BoS+b8h72_4pOXvaDU5xJ5snnONVQFP57Ez7TTfRQ@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Thu, 05 Nov 2015 02:23:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2015 at 6:14 PM, Jian Liu <jian.liu@windriver.com> wrote:
> Hi,
>
> All kernels I list bellow will perform do_fetch(), do_unpack(),
> do_kernel_checkout().
> do_unpack() will put a bare git repo under WORKDIR and then
> do_kernel_checkout()
> will move the bare repo to bitbake/tmp/work-share/<board
> name>/kernel-source(value of variable S),
> then performing "git checkout".
>
> So do_ar_original must wait until do_kernel_checkout() is completed and t=
hen
> make tarball using the code under S.
> Do I make that clear?
>
>
> You refer to kernels other than linux-yocto. Can you give me an example?
> I do not know how to build such kernel.

Add another BSP layer e.g. meta-raspberrypi to your bblayers.conf
and then MACHINE=3Draspberrypi2

and see what you are trying to do still holds.

>
> Thanks!
> Jian
>
>
> On 2015=E5=B9=B411=E6=9C=8804=E6=97=A5 13:57, Khem Raj wrote:
>>>
>>> On Nov 3, 2015, at 1:22 AM, Jian Liu<jian.liu@windriver.com>  wrote:
>>> >
>>> >Hi,
>>> >
>>> >I test linux-dummy linux-yocto-dev linux-yocto-rt linux-yocto-tiny and
>>> > the result is as follows,
>>> >
>>> >linux-dummy: this package just meets some dependency and there is no
>>> > source code for it.
>>> >                      The patch does not impact it
>>> >linux-yocto, linux-yocto-dev, linux-yocto-rt, linux-yocto-tiny: The S
>>> > variable of all packages is set to STAGING_KERNEK_DIR.
>>> >                       do_fetch and do_unpack just leave a bare git re=
po
>>> > of kernel and do_kernel_checkout gets the source code
>>> >
>>
>> does it cover the case when kernel is not linux-yocto was basic question=
,
>> I am not clear if thats covered in any of above
>>
>>> >Thanks!
>
>

