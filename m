Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id A1E816079E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:26:17 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id p66so3032723pga.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=U5azcWOeoMS/zrhz664s/Eono8xxyJaIOcfdUvw6NeU=;
	b=HJ4hEBpNrwo0gOdlXkk7gdhSrdN1yq8FdKy+pdjiMVxx5yHDgYsiZO5RmsAWe+Sia8
	sh2ogvBy+Rfirl8S8MvxOLzUCfomkawerl7pRrVgRKs7IPL7bf4KIw0MldALGDgxV3zZ
	L7ko9VUjTIwHrMnN3/NEGqUCuJdK2PUTBDjvKAcbHgE7rSKsY5J46ozUeplZTu8TseDA
	46KlxoF71YL6jeV8l6mN35OhOkLastbZ4jAMp8ptKKuZpzDasJrCYkuxjm9wuqe+WQgY
	S6ugFscWTGzt1fxIwyk1hhBelHD4HtgGB2WsTsHd1cWZnhdesfrrTV3Lo5YmzCdwSRtJ
	fl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=U5azcWOeoMS/zrhz664s/Eono8xxyJaIOcfdUvw6NeU=;
	b=kQXyG5YKTvlRntpXxZ7Yh6qF6M/JH8zGP0yDXe5Afl6naAbU9qbuVpAz+wYAoUodsJ
	H1iIZkspdcY/po4lyzOh5lZ68E4H5RZpcq5u4b2Xv5kQlczuMHDTkocVV7VUTRviPufl
	1n0qxBJOerTo0LrgUQA4CIaRMtl/1YRGcTHinqyssrv4biemFEbdYlSSFP6io+KGutEB
	QmF5VqMkMSi4J4AgnbN2cTNDtGU03O3eDUzI4XURTUKYIoH//iVdO0zqNxOxZjxDkCA8
	o8ZHm8RpO8i2IN7fz0mFWIblkB20XIrb0KO+ozWQ4oJUVYKsB9oWiFffmXQhOdHo1Vnc
	2v9w==
X-Gm-Message-State: AKaTC00egE9w8F0fKkwotyAibnFB1G0nLUgmbnmaTzy2Av9ZW0KMuy4MTSR26JVTR/ek/A==
X-Received: by 10.98.220.157 with SMTP id c29mr1599236pfl.29.1479885978654;
	Tue, 22 Nov 2016 23:26:18 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5159:9909:3ede:f0af?
	([2601:646:8882:b8c:5159:9909:3ede:f0af])
	by smtp.gmail.com with ESMTPSA id
	o29sm13670241pgn.28.2016.11.22.23.26.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:26:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <839768d8-710e-b4b0-88ad-1c5780f4c51d@mender.io>
Date: Tue, 22 Nov 2016 23:26:16 -0800
Message-Id: <FDD8C344-D3E7-45B6-A463-2E4803B95572@gmail.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1d5954ab-1a9a-b73d-7f72-fbe84c8e2250@gmail.com>
	<839768d8-710e-b4b0-88ad-1c5780f4c51d@mender.io>
To: Kristian Amlie <kristian.amlie@mender.io>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 07:26:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 22, 2016, at 11:13 PM, Kristian Amlie =
<kristian.amlie@mender.io> wrote:
>=20
> On 23/11/16 00:45, Khem Raj wrote:
>> On 11/22/16 1:05 AM, Kristian Amlie wrote:
>>> Hey
>>>=20
>>> In Mender we are using a dual rootfs partition layout (A/B layout) =
with a persistent data partition on the side. We're using wic to do the =
actual image building.
>>>=20
>>> However, putting files into this data partition is not a =
straightforward operation ATM. All recipes in OE put files into the =
rootfs only, and we'd like there to be a way to specify that files =
should go into the data partition.
>>>=20
>>> I haven't seen any straightforward way to do this in OE. Some =
suggestions for how it could be done:
>>>=20
>>> * A "DATA_FILES" variable (like "IMAGE_BOOT_FILES"), where you can =
list files you'd like to be included. This is very straightforward, but =
has the disadvantage of being a bit hairy when paths are involved, and =
it doesn't allow for much logic.
>>>=20
>>> * Keep a special "data" directory, something similar to sysroot, =
where recipes could install files into in order to have it included on =
the data partition. We could potentially have a bbclass for use in =
recipes to make this more streamlined.
>>>=20
>>=20
>> Firstly, it needs to be defined what the data partition is about.
>> 1. is it some pre-initialized/seeded data that can then be modified =
during
>> subsequent boots ?
>> 2. Is it read-only data which is then used to populate r/w data =
segments in
>> RAM during boot
>> 3. is it data that does not change over the course of install and =
reboots of
>> the device
>=20
> It's preseeded, but modifiable data, that survives complete rootfs
> updates. IOW if you overwrite either of your A/B rootfs partitions, =
the
> data partition and its content survives.

at some point this data segment will be seeded.
think of factory case.=20

So in such a case updates should not touch them unless user does a =
factory reset
which should clean it up

>=20
> --=20
> Kristian


