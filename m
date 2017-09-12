Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id E2045784F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 20:26:08 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v137so4579980ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7upMkXcWRyv/KNdLUxSJbqekjDEGaAOtg/vDTWqZlp8=;
	b=zOGa3ky5F1fmPE8DGEtGYSRDE+FhidTWZd7XhX4DUBWX/AExW8hZKaKl+GUUSMZ41F
	Zr7jn5sUpUpyTnSB0ridekgNVxFZNvOMhZQO1M8p7pIfnkQUAzHp2IsFuIrF94loiUPe
	VZFUzQm9lVENA+NRuB2jrKnb07/J8nNneX/IyBeDjARvN0AXuHZesLmtetaiafE5NzJm
	RvWJqxXiYEqDupj5cSiqCu10CIVsJXFTJ2wJBklHjs4mpSsOPQWf9e2u9HdXWVC/glSg
	XrIxzeYfBS0KsRyBeKtV63jQ+74MTvTbeTj4m/DgEetmIuzDsevPb2VcI3tzeixkY1iM
	4cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7upMkXcWRyv/KNdLUxSJbqekjDEGaAOtg/vDTWqZlp8=;
	b=SP5erRZs/lYlYQo6UrtzdVJCJPI7EWLZO2Y/b9yQkxXcx5tgrXcGMg7Jvhq3JskbSW
	eMjuDjbcPcG4/PQhovjpO9sHKVvviCDQPXs9m3mhVs14IMdjVk5ohp1kuF5k1wolx67N
	4YF5DanR9hlIRdpwViT/CIrMFubzQ8FIONRwKUu3OZrOAl3T10S+R1cPNzmvWJ7/OpOx
	gUhvuaUM0R6vKf1yK4L98L1+mb7z+wbM3m3gDBTUKQ83GERA4LB5pqsNuo7ls2tASLeq
	A5PlQwlpbGn7NDL4v0Nqf3RupvaFpDXIRoLJLfoinVqZttW/+MheGCWqksyar1gd8N2a
	LStw==
X-Gm-Message-State: AHPjjUiy0gwAHnB0V/be3MXTwYn1c1n0fKJYk5QMAudMn9r1l1p2XWrO
	L+oiA3eFpYflVYjYgXc=
X-Received: by 10.129.136.67 with SMTP id y64mr13645646ywf.55.1505247969326;
	Tue, 12 Sep 2017 13:26:09 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169]) by smtp.gmail.com with ESMTPSA id
	t63sm4153777ywt.51.2017.09.12.13.26.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 13:26:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f169.google.com with SMTP id g32so37220226ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:26:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCK3ywUYexnabIp+R7WkfR/2g1iLtwOjlfM0UTDXmRBD/Lqx0tm9C2APt4CWGrN2xfNhQoihY0v0ZSW4GMB1NA=
X-Received: by 10.202.186.7 with SMTP id k7mr711861oif.25.1505247965783; Tue,
	12 Sep 2017 13:26:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 13:26:04 -0700 (PDT)
In-Reply-To: <20170912211057.6c6b9630@t460p>
References: <20170912134551.12678-1-otavio@ossystems.com.br>
	<20170912134551.12678-3-otavio@ossystems.com.br>
	<20170912164531.34d2af4f@t460p>
	<CAP9ODKoNfmgoL0exFEEfwuPXKwRhcruGfRDBS=QKVKsjGGBQNw@mail.gmail.com>
	<20170912211057.6c6b9630@t460p>
Date: Tue, 12 Sep 2017 17:26:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpAV6jdr9F8QGdSxvgZ16bH0WO5kiSAQ5geB+ywrrd6Ow@mail.gmail.com>
Message-ID: <CAP9ODKpAV6jdr9F8QGdSxvgZ16bH0WO5kiSAQ5geB+ywrrd6Ow@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Tue, 12 Sep 2017 20:26:10 -0000
Content-Type: text/plain; charset="UTF-8"

Andreas,

On Tue, Sep 12, 2017 at 4:10 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On Tue, 12 Sep 2017 14:00:43 -0300
> Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Sep 12, 2017 at 11:45 AM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>> > Hi Otavio,
>> >
>> > On Tue, 12 Sep 2017 10:45:51 -0300
>> > Otavio Salvador <otavio@ossystems.com.br> wrote:
>> >
>> >> +do_configure_devicetree() {
>> >> +     if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
>> >> +             if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage'; then
>> >> +                     config="${B}/.config"
>> >> +                     if ! grep -q 'CONFIG_ARM_APPENDED_DTB=y' $config; then
>> >> +                             bbwarn 'CONFIG_ARM_APPENDED_DTB is NOT enabled in the kernel. Enabling it to allow the kernel to boot with the Device Tree appended!'
>> >> +                             sed -i "/CONFIG_ARM_APPENDED_DTB[ =]/d" $config
>> >> +                             echo "CONFIG_ARM_APPENDED_DTB=y" >> $config
>> >> +                             echo "# CONFIG_ARM_ATAG_DTB_COMPAT is not set" >> $config
>> >
>> > what about CONFIG_MIPS_APPENDED_DTB?
>> >
>> > Can we ever make sure to cover all relevant architectures?
>>
>> I don't know the details about the MIPS and its appended DTB support.
>> Do you know what we need?
>
> Just the symbol already mentioned above, see [1].
>
> However, I'd argue that the verification of configuration options specific to one
> or two architectures shouldn't be done here at all. Users are responsible to choose
> suitable kernel options.

Ok; I will prepare the patch to support both.

I prefer to mangle the config here so we provide a turn-key support
for it. I am preparing a new patch revision adding it. I've added you
to Cc for the new patchset revision.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

