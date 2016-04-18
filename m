Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF0160088
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 14:16:51 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id a6so22985937vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gfXdzPsEcp3BU3Q/zm00DX71/134fBDyjCi5TiwR6w8=;
	b=KNW049UluMPsyOLCt21J6deIvo97juS+jdE/PDufj/sMVk3lMqKNDvlcPisxkFzuTX
	ofGK+Cw1hOOXCyPG0xQt4teKITqB60SFVdvYhxkTcTtCipkZgE25j05mCRL3EFNFuKDu
	AcebnZJb6DnyDGRdkzIE9+EheW8FOwcUc5Fak5NQNtwa/OehNhQQWiAzbrIN3oKlll7z
	q3O+T1lXKui1I0pr8FeXpsvDC59+k0l6AzK9t7/m4HJy5Qn6yHkGeGoXaPnvJVOW7vZV
	sfUaV/IFDGJQb8wmdxZ/yPIz+uj1zR+BRQk4/HpRDtZYBzglDduC4yWfYlbbDb103Ndd
	2WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gfXdzPsEcp3BU3Q/zm00DX71/134fBDyjCi5TiwR6w8=;
	b=gJ99GKe5OfY1qRZwdDWz0MOt/F2KFlgBvdRKvA53/RzQYU+SIAdoziO2cyxbMRi9Sk
	CYUEOFZ9SIY7SaaiZkPypKUch99L7Zv1bcpSt2eijVAw4V1NHGoljAzMm1t8YX+HSvHU
	QjpdPoRGFY9nkS1baq5AdsQLW9h4iIBDx9gPt9fLOKFwkZtTi+rOA0oI+1m+4+t+4iUc
	BmZ7ApWqGzCLBAwA7BHSUN/CAReAc/nI3Ag8TAZ/RP4AWKh9aSu29I0krJM5KgLw9r1r
	zCaaLfH9Q47+6Z6/AspqcHt0qvT8HGHstiquslGVQnoxMcm+9EQ/wfeHY/SFH19zCKuW
	JHPA==
X-Gm-Message-State: AOPr4FU3qf6x0sHYZOR8N4QkowbJsf5Wu1gOsDh6bHJcgAg/ZFjbjWiFKXpViHvRjq3K7YEE5ljh1sMrq9/uXQ==
MIME-Version: 1.0
X-Received: by 10.159.34.71 with SMTP id 65mr18499030uad.103.1460989012204;
	Mon, 18 Apr 2016 07:16:52 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 07:16:52 -0700 (PDT)
In-Reply-To: <CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
Date: Mon, 18 Apr 2016 16:16:52 +0200
Message-ID: <CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 14:16:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2016 at 3:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>
>> If sysroot is required, override DEBUG_FLAGS to remove -fdebug-prefix-map
>
>
> We should probably get this in the release notes, as many people do indeed
> want remote debug to work.
>
> Can you tell gdb the base path to use when looking for symbols?  I've not
> done remote GDB for some time but wouldn't "set substitute-path /
> //my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?
>
> If gdb can't be told then instead of having to replace all of DEBUG_FLAGS it
> would be neat if the prefix mapping variables where in another variable that
> could just be unset.
>
> Ross
OK I think I could live with removing -fdebug-prefix-map for now.

A thought: We have the setting IMAGE_GEN_DEBUGFS - I have not yet
tested. As far as I understand it creates an unstripped sysroot and
does not affect target rootfs - is that correct? Does the sysroot
created by IMAGE_GEN_DEBUGFS contain the sources? If yes we could set
that as sysroot for gdb.

I think one of the problems we have here is that there is no reference
way documented (or it is outdated) how remote debugging is meant to be
performed.

Andreas

