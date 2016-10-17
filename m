Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id CE6A1700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:20:38 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u9HFKdfv021677
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 17 Oct 2016 17:20:39 +0200
Received: from [139.16.78.254] (MD1FZU9C.ww002.siemens.net [139.16.78.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u9HFKcS1016577
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 17 Oct 2016 17:20:38 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
	<CADkTA4PHxV6uoUXiGRm7PfPP_sqs8G_9Uxg6wqsB++xKSOp=uw@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <ece016ec-8f57-fe4f-c730-54fa99f02b1b@siemens.com>
Date: Mon, 17 Oct 2016 17:20:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PHxV6uoUXiGRm7PfPP_sqs8G_9Uxg6wqsB++xKSOp=uw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 15:20:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


>
> Whatever we replace it with has to be part of linux-yocto and the meta data that is
> carried there, so it can be used for the sanity/smoke test machine for arch arm.
>
> As such, it has to be feature compatible (network capabilities, disk boot, etc) with
> the existing arm versatile 926ejs platform
>
> There have been newer variants for ages, but since there's been no compelling
> reason to upgrade, I continue to carry the existing platform support along to the
> new kernels. (In fact, I've had a qemuarma9 around for nearly 3 years now, but
> it lacked some disk controller support).
My main motivation is to get valgrind running. This requires at least armv7 to be useful.
Most physical boards are not powerful enough (memory and cpu) to do real work with valgrind.
QEMU would be helpful for that.
>
> From the kernel point of view, updating the platform doesn't have any big benefits,
> but for userspace it could shake out issues with toolchains and instructions, so
> there is a gain to be had there.
In order to find more bugs there would be multiple qemuarms (qemuarm = armv5, qemuarmv7 = armv7, ...).
Is this what you are suggesting?
>
> If someone is motivated, I'm happy to help work on an update to the core qemuarm
> platform .. it just has to meet the criteria above.
>

Pascal

