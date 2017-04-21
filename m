Return-Path: <freesilicon@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 51F1C779CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 07:55:24 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id f133so66109427qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 00:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fUQvwacOBcLLqRbj9B21qxQWUTTs20kT1Azl0Y9iRMo=;
	b=QQ8IahyPqDp7qBxaQlwLpUxpi0LUbi6QhArS9lS4oqAidv+l96susef+jS71aTymez
	bzxtODZiAJFlKbVuQn7Vw16IF+l+NHydQ69lZ921IowrQAJYKJWpxFOWteiGmoYu5O8L
	Mr1g0mRLa6KoaiE0NfXPt+vr98amC6Q3gmmevgpC97FGI+1OZmKBixzrOAy+j8cP171H
	9iFbA905TGcX0IXaH1Zkq5Q6ArzzK6jrK03ZdC8uQj2ns9c/02t9ZM4LNEHc3lKtzSlF
	hg/j+NVbrLNuYDJk9WdC9hL6DMVyXPioaf0a2dBVbAXIHCKCVQgerqkP1AhTGeLX3Gu5
	iDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fUQvwacOBcLLqRbj9B21qxQWUTTs20kT1Azl0Y9iRMo=;
	b=Fmk3JJ0rmEwk/hKO1NqIix67MJUrZlzAiDVFsZ4WIir7ABPTmuK15T/GcLN8ipIFWx
	R3X+rr8gMVLRo5LNBIeaVrMMHNTX6joBjpWf8C7T1ufS41BETSUdqf8kA2VuYRyov8JZ
	CEPsoIYUYYP44nhjN/1pNFF2imFWr0pNvPtkE4nt6Q9rJz/N/twyhHCzIKOgFCyLtAZ+
	24Ts2PS2UGW9RHSz8Az/ho0cL27fCOe0GFw+zMf2Xrd87K7njjq61qdjnl5egHDF3cUJ
	mfnUTTQwO//1McsTr8Wl0wUY5IlyB2h1F4zyQQRxK1DYQ4goVbkb8zrXbfEGcoelt8u0
	m4iw==
X-Gm-Message-State: AN3rC/7gNWED28zqkcBtyL3jyUMS8X9h4KkJGy9SxfhwtthfWCGoo+5k
	3Tiyk+rwWcc1HXWPEeKJ6ehnINRINA==
X-Received: by 10.55.12.14 with SMTP id 14mr11540972qkm.249.1492761326192;
	Fri, 21 Apr 2017 00:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.220 with HTTP; Fri, 21 Apr 2017 00:55:25 -0700 (PDT)
In-Reply-To: <20170420130400.GC3059@jama>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
	<64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
	<5023360.N8L8OyXh3V@crde-port-20.cahors.local>
	<d67f6cb5-482e-9e3f-bde5-4284e8eeb31b@linux.intel.com>
	<20170420130400.GC3059@jama>
From: David Vincent <freesilicon@gmail.com>
Date: Fri, 21 Apr 2017 09:55:25 +0200
Message-ID: <CAKRNOGyCF7v02NQR0xX4jSTPiCi0Qh5ODX_GS4q8Dy4z_S8Atw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Fri, 21 Apr 2017 07:55:26 -0000
Content-Type: text/plain; charset=UTF-8

On 2017-04-20 15:04 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Apr 20, 2017 at 03:37:24PM +0300, Alexander Kanavin wrote:
>> On 04/19/2017 04:03 PM, David Vincent wrote:
>> > The problem is that I must be able to manage the configuration of a machine
>> > without physical intervention and only via package upgrades. A new
>> > configuration can be applied simply by incrementing the PR of a configuration
>> > package.
>> >
>> > But maybe this is a use case only needed by me and I should manage it in my
>> > own specific layer ?
>> >
>> > Now that I think of it, I have the same kind of problem for all machine
>> > specific configurations. For now, I just replace the PACKAGE_ARCH in my BSP
>> > layer with a machine specific one to indicate that a package contains a
>> > configuration valid only for a specific machine. Maybe, in a future release, it
>> > should be desirable to create -conf packages based on the CONFFILES variable ?
>> > I don't know if it's a good idea, but maybe I could bring that up on the
>> > architecture mailing list ?
>>
>> By all means please do so. Yocto lacks a solution for configuration
>> management, and this was discussed some time ago, although I cannot
>> anymore find where it happened. Mark, do you remember?

Yes I'll bring that up on the architecture mailing list to gather some advices.

>
> I still haven't seen any argument why not use u-a like for any other
> alternative files.

I don't really have an argument, it's just that it feels wrong to me to manage
configuration files via update-alternatives. Just like it did for
initscripts. I agree that
it works, until some corner cases reveal problems.
(see https://bugzilla.yoctoproject.org/show_bug.cgi?id=10433)

>
> All you have to do is create openssl bbappend (this part might be
> integrated into oe-core):
>
> inherit update-alternatives
> ALTERNATIVE_${PN} = "openssl-cnf"
> ALTERNATIVE_LINK_NAME[openssl-cnf] = "${sysconfdir}/ssl/openssl.cnf"
> ALTERNATIVE_PRIORITY[openssl-cnf] ?= "1"
>
> And then in your recipe which provides alternative config add similar
> fragment:
>
> inherit update-alternatives
> ALTERNATIVE_${PN} = "openssl-cnf"
> ALTERNATIVE_LINK_NAME[openssl-cnf] = "${sysconfdir}/ssl/openssl.cnf"
> ALTERNATIVE_PRIORITY[openssl-cnf] ?= "10"
>
> And that's it. We're using this for last 4 years since:
> https://github.com/openwebos/meta-webos/commit/b13980be3f28bf60582ec3f691e392db03942e21
> and it worked fine until this oe-core change was merged (and I had to
> undo it in the same bbappend).

OTOH, I could also append the install task for my target. There are
many solutions to
this problem, but I think that like it was said before, the main one
is handling properly the
configuration and provide a way to override it in BSP or distro layers.

>
> Regards,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

David

