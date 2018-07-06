Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD761787EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 00:57:28 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id l64-v6so5914831vkl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 17:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B7ssqj+UCstY0IoGgt5eFpfXbQYk+4+HEHR8GHeRUNM=;
	b=DQis/8ojXTNucwFQ8wqh2qYTbqQ55ZOhsuWWovmerAzFiFg1ou/U8ImimrcTn4wYFK
	f28crcNANNDjVZ2dcgveKy4uGxP5U2iS0/aK7Afywue18SpqdlHtWZJlvo5GwKBdMsFK
	Qhu2Gc1+Dnz0ustOs8W4XDA9Wf3iITioGqpdArPWwrTxKQ6oPTMdSko5mmxJRF/qe26A
	eJ9Mj9GAcNk8DlzkhU06ArmdBNU45FJyQJbvrxYDaFCoOq6EpenVss3ZvTTCI4OSJQvY
	XJmmOEHjGvBfxKO711xi/acTo+lUmpvSR5Hgxc0lTY9z7jIhedyvn/HBmioyjQAoMLUt
	41DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B7ssqj+UCstY0IoGgt5eFpfXbQYk+4+HEHR8GHeRUNM=;
	b=REMfkLDpCT7ugvzXUJc4+9AF25s6NxaUjJan7mkAM8E7r7Kkyn+Grnzr97e2mCF0vz
	MDnTVnlYmCAyZI2iIxUbEu5aZChvBlWnFpWA3bc1znOG9qAVAMNhaV3FGoDqxzOzHoEt
	PLbO3cGGFhzgztsQ+JmsX+zxMnqIURnOHp8f/Df7Au2WdJMKj+vlhtL5jaeBozdMAV8s
	V3W7zJFVMUCuY3h5C6GbnKYMYV9w3oVCyAhNdgLAf7akaPRbJQu01Do44GYBolzrsWYO
	KvbnAwH5hhZov0QEBNEc400j5LCsWh7+iBmshn2s9BmeTq2gPiG2VeQuK3SyKu4rOtl3
	yF1w==
X-Gm-Message-State: APt69E1FHmQ3h1KAbZnfIAXwqwjuOSmhaxYm1qaCBpXLcc8bRCVOsNuL
	ExSneJh4KsxUxVRUsfGEplk0201kIgfR4f6Hucw=
X-Google-Smtp-Source: AAOMgpcN1efnQkQVmTccruATlQ2LiCgn756W6390L3ZR+wJhJ9kfm8kXucjSbiCdF2dWntjhGtkb4+yADzuEyLMoLXE=
X-Received: by 2002:a1f:3b43:: with SMTP id i64-v6mr4632958vka.2.1530838649580;
	Thu, 05 Jul 2018 17:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 17:57:29 -0700 (PDT)
In-Reply-To: <CAJTo0LaUkxKcPhasnQh6KAsh2kv5rEmy-jMW3oXKxttS-kd1mQ@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
	<CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
	<CAJTo0LaUkxKcPhasnQh6KAsh2kv5rEmy-jMW3oXKxttS-kd1mQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Jul 2018 17:57:29 -0700
Message-ID: <CAJ86T=ULm4BBu2JWmVTDfuVxh4vcd9FVDVJzyC3Qt6tgiTNHZw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 00:57:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 5, 2018 at 5:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 July 2018 at 00:39, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Jul 4, 2018 at 5:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 4 July 2018 at 01:55, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>  DEPENDS += "${PYTHON_PN}"
>>>> -DEPENDS_class-native += "${PYTHON_PN}-native"
>>>> -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
>>>> +DEPENDS_class-native = "${PYTHON_PN}-native"
>>>> +DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"
>>>
>>> Whilst there's nothing wrong with this patch, as the BBCLASSEXTEND
>>> handles DEPENDS-munging isn't this a better fix:
>>>
>>>   DEPENDS += "${PYTHON_PN}"
>>>  -DEPENDS_class-native += "${PYTHON_PN}-native"
>>>  -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
>>
>> Removing the over-rides completely results in both the native and
>> nativesdk variants gaining a new dependency on
>> python-distribute-native (courtesy of setuptools.bbclass).
>
> setuptools.bbclass:DEPENDS += "python-distribute-native"
>
> If python-distribute-native is a build dependency for target then its
> a dependency for native and nativesdk too, right?

DEPENDS has been over-ridden for native and nativesdk for some time,
so either the dependency gets provided indirectly or it's not required
at all?

> Considering python-distribute is just an alias for python-setuptools
> (its a RPROVIDES in the recipe, and the pip entry is just a
> dependnecy) I guess the setuptools class should follow setuptools3 and
> depend on python-setuptools-native instead of
> python-distribute-native.
>
> Context is this from 2015:
>
> commit c4553e07cdbec5c29a74a43e0c5fdb2bb5583f7a
> Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> Date:   Thu May 14 16:49:56 2015 +0000
>
>     python3-distribute: Upgrade to python3-setuptools 15.2
>
>     python3-distribute was merged back to python3-setuptools in 2013,
>     and it is no longer being maintained, this upgrade also provides
>     functionality that will be needed for python3-pip.
>
> The same needs to be applied to the py2 classes, as both Py2 and Py3
> use the same version of setuptools.

That all sounds plausible, but starts to unravel into a bigger set of
potential cleanups. For example, digging a little more uncovers this
from distutils-base.bbclass:

  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}",
""][(d.getVar('PACKAGES') == '')]}"
  RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}'
== 'class-target']}"

The first line adding to DEPENDS for target and nativesdk (but not
native) and the second line adding to RDEPENDS for target only. Should
this be re-written to make use of over-rides?

And looking at nativesdk builds in general, why does
DISTRO_FEATURES_NATIVE contain ipv6 and xattr but
DISTRO_FEATURES_NATIVESDK does not? I couldn't find any comments to
explain that.

