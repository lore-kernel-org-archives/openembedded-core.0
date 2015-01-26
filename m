Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB8960670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:17:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1HM44025406
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Jan 2015 17:17:23 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:17:21 -0800
Message-ID: <54C595A0.8070702@windriver.com>
Date: Mon, 26 Jan 2015 09:17:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>, =?UTF-8?B?RXJpYyBCw6luYXJk?=
	<eric@eukrea.com>
References: <54C1AE00.6010402@windriver.com>
	<20150125221821.07fc63b4@e6520eb.localdomain>
	<CABcZANn4U+z7J7VxYRz_LomC2WGSFnErjz7opEQnG-Gbuh8FhA@mail.gmail.com>
In-Reply-To: <CABcZANn4U+z7J7VxYRz_LomC2WGSFnErjz7opEQnG-Gbuh8FhA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Mon, 26 Jan 2015 01:17:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 01/26/2015 06:39 AM, Christopher Larson wrote:
>
> On Sun, Jan 25, 2015 at 2:18 PM, Eric Bénard <eric@eukrea.com
> <mailto:eric@eukrea.com>> wrote:
>
>     Le Fri, 23 Jan 2015 10:12:16 +0800,
>     Robert Yang <liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>> a
>     écrit :
>     > We have several GPLv2 recipes such asm4-native_1.4.9.bb <http://m4-native_1.4.9.bb>, while we also
>     > have GPLv3'sm4-native_1.4.17.bb <http://m4-native_1.4.17.bb>, I think that we can remove
>     >m4-native_1.4.9.bb <http://m4-native_1.4.9.bb> if the target m4_1.4.9.bb
>     <http://m4_1.4.9.bb> builds well ?
>     >
>     > I'd like to remove it because we don't build the lower native version by
>     > default, and we don't know whether it works or when it would fail.
>     >
>     if you want to build a system without GPLv3 ("supported for only
>     minimal and base images" as stated in the manual) you may need GPLv2
>     tools :
>     http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#ref-images
>     INCOMPATIBLE_LICENSE = "GPL-3.0 LGPL-3.0 AGPL-3.0"
>
>
> GPLv3 native tools will still be used in such a build, as far as I know, just
> not the target ones.

Yes, you're right.

Thanks for the reply everyone, I will address your concerns, try to
remove some recipes and send patches out.

// Robert


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

