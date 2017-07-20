Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 91A0C78243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 20:14:51 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id 32so30859581qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wn3kwTsO65H9zBuQs2SzL2HWZOvIhutSeEnEzi+nQDg=;
	b=Q9NSmyFTDiXVhXz0Mhg2zrjB8UNXLmfXxFBq8AfDUQeS5ghTvl8VJEAtEO2W8xLxSZ
	d4Xruvo2Ip9tnc/L2qlCLmzsM/k2a2k74FdZy5E0vNh8H7zs0n/xE6SorBKtDwuZ2M6J
	QH6F+jaTxUAvlRS9YKYDVfKToZAKxPDHnXpd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wn3kwTsO65H9zBuQs2SzL2HWZOvIhutSeEnEzi+nQDg=;
	b=KryjZ8RPuQv1URvNKZrPZhLXZfeNxt2RGE3tNU2nETtnDkfT7O3CbIGDoC7kZ+Hj91
	ktIMf4/8AqMPlCKlGGqODwLXRmcHtyskJGescOxk2U3YXh81VT7Q7T70N1jorptdieqn
	qwnvfizh4X5xcEp5/KJMiCxt2BFrw9trflNiP+6ivxjsY1bXOPF4miOAzXipTjuldcjo
	5EPYTHmyfuOU2GhJdKLBdLqWHpjnTa45eGZstNC7nhDgdt/TOVaq5sE78kwhgN8/hkPv
	Myx/4uWg9PetJyBbTV9Q+LJfilVwjdIFB0nGzxMlbvfYUERHPqcn0UofqxOaz6yO2cqX
	2z4A==
X-Gm-Message-State: AIVw113aoradtpIjqCWz8KJSJKOZSAoP4bvavDD4Mw8ssc6DBKmG8/qO
	MTxwu/svfHjvt7HqiKe+/aXWJR8YCN6kYb4=
X-Received: by 10.237.58.102 with SMTP id n93mr7189783qte.109.1500581692407;
	Thu, 20 Jul 2017 13:14:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.194 with HTTP; Thu, 20 Jul 2017 13:14:31 -0700 (PDT)
In-Reply-To: <CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
	<CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
	<CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jul 2017 22:14:31 +0200
Message-ID: <CAP71WjyVmM=a3rpoGm+CoyERx2=q60sHhT-TanoXHxEef_o6PQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 20:14:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 9:56 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Jul 20, 2017 at 4:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Jul 20, 2017 at 3:22 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 20 July 2017 at 16:37, Burton, Ross <ross.burton@intel.com> wrote:
>>>>
>>>> This fails to build on ppc:
>>>>
>>>> | checking for libdrm >= 2.4.75 libdrm_intel >= 2.4.75... no
>>>
>>>
>>> Same on arm and mips now.  Basically everything that isn't x86, so I'm
>>> wondering what the difference between your build environment and the
>>> autobuilder
>>
>> may be pkgconfig is installed on working system.
>
> I wonder why; I will try to reproduce it and also will inspect the
> changes on configure.ac to find possible causes.

It built fine for me (OE-core/nodistro + meta-qcom) with and without
pkg-config installed on the host.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

