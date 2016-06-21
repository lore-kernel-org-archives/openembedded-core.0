Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA786FFE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 22:36:47 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id c73so42190825qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tvdflFp6WUfHbw5Jgy+TwDma3yyTzyxrxLF7qFNxvCo=;
	b=jMKaP6OX1wKWcxVvz2YikIy7gtFcFZiDKdoBfUyNiH4OnMvVSHVtavlAIBtf/MGzUW
	610xk6dMe/l1jPd+WijJ2cIjpSaf9l0Cjc7VSMo3m1axh/2MVuNezXavR6DnZ0PCAcM2
	zVTXD6d+PWchKgCI+IOptM6LL4U3Ap5eg4TAiWMIXi2nx04HIyCZ7Oj5jaoTj0LB1M03
	tMyWTKvKBMw9cYV4NCrP8T2vokTkU5TADHTw5E21/Stf+aXTnxEOd4U3pRWUc+RxNzjf
	L0BEbLuUzdoX3tEI9MFRrIIC7vU7JFYpyAnDRD/gzpsJcPFNzbZkO65g6sWBHqJTSlVh
	BCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tvdflFp6WUfHbw5Jgy+TwDma3yyTzyxrxLF7qFNxvCo=;
	b=hV5cVZ/xnyo3rmlvTFuZmMM16+pboV5XQ4eDWE28ekfyupwmy/AE6WFe8n4wrV/hR6
	oS2AwJiDknk599TRQLWrl8A63pbrB78498wjvcRSLQZqPNnepQ7VdfNUccPaymZ00tq8
	2bFTcNeR2D61H3As/EU1KDrR2/F4jJfvtpccNgxOcc2ciF6CqkthuTUXEtETJTMDsYdw
	JwvLjl1O+xdOnHlYQG9gK6VTxMppEki5PHYPI0GbiMvmXwfjERmZUzZbILB07wLzJNt6
	7ddYqmUkzY1vaCt9q/DRLL4Nly4/uCzjF/8K42bgWRHMloKG+WU/LlE6vOySGbZpI9e5
	TgGw==
X-Gm-Message-State: ALyK8tJOunOt4aAccR8E7bMw3qldbIHB1+C7AMb+IOV1vKgQqX0OXtBasnlpaKRe4aDFnO+cbeedz+WxB2+U1g==
X-Received: by 10.200.37.9 with SMTP id 9mr14070325qtm.31.1466548608571; Tue,
	21 Jun 2016 15:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 15:36:19 -0700 (PDT)
In-Reply-To: <574CF026.6060203@windriver.com>
References: <cover.1464595294.git.Qi.Chen@windriver.com>
	<9697a509e56ad274d52f6d82866adfddd0a3d484.1464595294.git.Qi.Chen@windriver.com>
	<574C1A78.3090706@linux.intel.com> <574CF026.6060203@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jun 2016 15:36:19 -0700
Message-ID: <CAMKF1sqpVyOMaEY7jay_Gvv-JR_p344pH5cF5VV4BoatV=h8oA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkitgtk: disable gobject-introspection on mips64
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
X-List-Received-Date: Tue, 21 Jun 2016 22:36:48 -0000
Content-Type: text/plain; charset=UTF-8

does this still happen with Qemu 2.6 ?

On Mon, May 30, 2016 at 7:00 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 05/30/2016 06:48 PM, Alexander Kanavin wrote:
>>
>> On 05/30/2016 11:02 AM, Chen Qi wrote:
>>>
>>> Disable gobject-introspection on mips64 to avoid do_compile failure.
>>> +
>>> +# qemu: uncaught target signal 6 (Aborted) - core dumped
>>
>>
>> Please add the actual error before the above line:
>>
>> | WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119:
>> get_lock_object: Assertion `!"sizeof lock obj"' failed.
>>
>> I just checked that updating libgpg-error to 1.22 does not help.
>>
>> Alex
>
>
> Hi Alex,
>
> I've added the comment and updated the remote branch.
>
> Best Regards,
> Chen Qi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

