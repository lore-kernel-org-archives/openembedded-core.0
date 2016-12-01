Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0640971B2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:50:49 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id w194so11109544vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l/U/zTG26qradqhvVfJ7MCIDMOGKRH17hA7XhdYLcMk=;
	b=iYIttjXbmq2pld0gauXCNdkROLTbQIAjYzVrSi6VeFbizeHA40G7R0xFB2edk5llVl
	1c/AsEMXO3WQ+o+0pbKgl/5CLkkylqm+uAlO7R+IvTCjBZn3X1DlSm68rkRTpT0/YArR
	rum6LFd2QY5B8BmFrJlWOIkLPB8b1CiwSKKqggQoq6gDnoG0fCx7SCqc4qyZMF1ab9e3
	n/+6nE8LHFbxp5BgfpD94vB53GOkbdPna+h1PwLPHIbebXtEcr3UOvJ5ee0q3ZnLZbjQ
	+agUQpJsCJKHn261RpPVo8WqeF1QlOf6AZ8J63y4RHbNuSNRPw5zcH1X1hSRSVDk8h18
	Sndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l/U/zTG26qradqhvVfJ7MCIDMOGKRH17hA7XhdYLcMk=;
	b=UcAG9Q9RE10NWRbaCZ21IOxJbgdeeMGFWIKGgFylihwLfk5FhjS9Gmb/gtzVpLvenE
	zJ3JPLuvj3lws5kqBaauQPqMb5UudlpqR7H1nBL1bspHToetIZSkSLQajrYgM3bquZWg
	nob8P4NBJfIL2jwuPFnjdf+1MfvD3r10cxiO433/321KitvfERcPTn2R60URtPDyy+HI
	dRG1htCdxwl6nnE+kzyN7MUEYug5noQYEtqfN5zClYjuge0wQb2a1c481jcLfIYQrwCn
	mS6Y7mGqTC20nYq1LTN/Q9LM98r8gIQ5VO9DFC0N8zxkLjoJ0gkJX6pwvvxyqgGSvaxb
	hH5g==
X-Gm-Message-State: AKaTC03M0XxWNw0K2BpDs2KD1n2gGnL3CSsxSEap6FLU4fBdC99rh/eS1FGygOE4/pu5LeaB7y6UjPLzoiciCw==
X-Received: by 10.31.108.144 with SMTP id j16mr156129vki.93.1480611050857;
	Thu, 01 Dec 2016 08:50:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 08:50:20 -0800 (PST)
In-Reply-To: <6bd14a6cb6904f409632cae7f29ae287@XBOX02.axis.com>
References: <20161128212606.26139-1-raj.khem@gmail.com>
	<6bd14a6cb6904f409632cae7f29ae287@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 08:50:20 -0800
Message-ID: <CAMKF1sqaZiS4hQZxBHGiRnfPMOp3CTv5Gmh=WjZBWYDZAR9H-A@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V5] systemd: Upgrade to 232
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
X-List-Received-Date: Thu, 01 Dec 2016 16:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 1, 2016 at 1:28 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: den 28 november 2016 22:26
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 2/2 V5] systemd: Upgrade to 232
>>
>> * Drop support for rcS.d SysV init scripts.
>>   These are prone to cause dependency loops, and almost all packages
>> with
>>   rcS scripts now ship a native systemd service.
>>
>> * Drop mount propagation patch, it only happens with libseccomp, OE
>> doesnt
>>   enable it
>>
>> * kdbus option has disappeared from configure
>>
>> * Ignore dev-so for PN now since systemd introduced private .so see
>>   https://github.com/systemd/systemd/issues/3810
>
> Rather than adding:
>
> INSANE_SKIP_${PN} += "dev-so"
>
> would it not be more appropriate to add
> ${systemd_unitdir}/libsystemd-shared.so to FILES_${PN}-dev, i.e.:
>
> -FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> +FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd ${systemd_unitdir}/libsystemd-shared.so"
>
> The binaries are linked with libsystemd-shared-232.so which ends up in
> ${PN} as usual.

As mentioned this is not a typical .so which is a symlink and can be
shoved into -dev package
if we do that, then we have to include -dev package into every image
containing systemd.

>
>> * Add libnss* to PACKAGES_DYNAMIC for libnss-resolve to work correctly
>>
>> * Forward port systemd-boot patches to systemd-232
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> //Peter
>

