Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A40B60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:35:28 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id v6so15030220vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=mnI6vV6ur7tjrpDJkRTKDSj9rslIe1CdjUOKRKXrNF4=;
	b=DszU7Ikjxed6C71JMZ+944fxtEvaDlJ5olzMbXohh4NPw/9GT6Utpxv0vLXm8Jr+YQ
	7OvnvMd9IE9bc1nuJoDNwkPSdTdzEpUjr+4BQpLlAh+L8wQoGoC3A94stFYuWaa+ScaE
	Rfm/cAeZbGPS/aN7cxOKB933nUi84SjAghhjL5tnisoUm7gAODoJWyWVTT/zGcLP5d51
	eND6ZtUNM8meet/PTgocQFjAvQse4YB0ObbjU63ZDHWcnJ1OMpuSaOY2Zb89QXVIqAF5
	TpmXWj4v1Iq4W9cDE7IGEt/ggyduNMDXZI0/WRNZz6uhqhomgqWwJ1HD1ajwdfr69+g8
	QijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=mnI6vV6ur7tjrpDJkRTKDSj9rslIe1CdjUOKRKXrNF4=;
	b=YyyFxOK2WIeFDKLoP+zaORj9U6dcRbv3NrBpo5XICvqj2M8Q2PxZjYophIxdsiVeFI
	x7VN/9roCngVRiQQI02PoxBvxDlEfbBF1dKWLWRqMIZfv6JK9Jk0RT/5nbmFKXAo3xaI
	urCZhhHcdoyUw6BCrfzG/UMI+hoCerCXfmp9QflAdDfWKlahdL2kiv9YlOqY/nZM1obp
	6KqUxg79erI1Ji89cNL1dSOu2g5zPAhUpPjAbNKHiTWedJploZwaveIJbVujgwYGFoaq
	v08D5ml3gSxaVimc2JNGXTUAhCqqRAPmHojFNnskXoASb7KL8A7xX6O/u8nX+9neRURa
	9CvQ==
X-Gm-Message-State: ALyK8tJ5LgqaW/4E/9gNi4It2gQi0CfB5K10LKGR/4647Z4j8i8A1HpVc6DPEWlrMYZtgg==
X-Received: by 10.31.192.14 with SMTP id q14mr9696410vkf.51.1468247728302;
	Mon, 11 Jul 2016 07:35:28 -0700 (PDT)
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com.
	[209.85.213.46])
	by smtp.gmail.com with ESMTPSA id 40sm814334uat.9.2016.07.11.07.35.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 07:35:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f46.google.com with SMTP id o63so58222253vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:35:26 -0700 (PDT)
X-Received: by 10.176.1.106 with SMTP id 97mr6003592uak.154.1468247725055;
	Mon, 11 Jul 2016 07:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 11 Jul 2016 07:35:24 -0700 (PDT)
In-Reply-To: <CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
	<25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
	<CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
Date: Mon, 11 Jul 2016 11:35:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
Message-ID: <CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
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
X-List-Received-Date: Mon, 11 Jul 2016 14:35:28 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ross,

On Fri, Jul 1, 2016 at 2:50 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Fri, Jul 1, 2016 at 10:53 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> On some hardware platforms (Gigabyte, qemu), detection of USB devices
>> by the kernel is slow enough such that it happens only after the first
>> attempt to mount the rootfs. We need to keep trying for a while
>> (default: 5s seconds, controlled by roottimeout=<seconds>) and sleep
>> between each attempt (default: one second, rootdelay=<seconds>).
>>
>> This change intentionally splits finding the rootfs (in the new
>> "rootfs") and switching to it ("finish"). That is needed to keep udev
>> running while waiting for the rootfs, because it shuts down before
>> "finish" starts. It is also the direction that was discussed on the OE
>> mailing list for future changes to initramfs-framework (like
>> supporting a "live CD" module, which would replace or further augment
>> mounting of the rootfs).
>>
>> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>
> Agreed but please split the rootfs in another module; so we don't
> force it to be included. The e2fs can rdepend on it.

I noticed this has been merged but my comment here was totally ignored. Why?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

