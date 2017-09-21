Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 95FCD78205
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:51:14 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id t127so2975541ywg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1QyyrMMjiUsdLAEQyIYV3c5ZrtQazHgSxntMk+BX3vM=;
	b=L1JtuyoQlWMb4TB1pmuWDdeciTm3fQnKMxNX6T+SdPq4eTkt0OeboIpOqKO9zGiHBg
	9n1YDD56mjGetQ0PxGZ99AFP9XI9DsyHPcDcbR469N6Bc4pj3Xxx+nqjsPruGOsw7834
	hRSMHGKK/nxf+HC1k5EXwuEMitkMbXlBvaEaG3RZF1LQpKuB7JbQb+oXCLlT8UTYpPgF
	ZM5IVYQXJarRcRJjCzhJdzQCMC3K3OuiqyH2h2ttDOpagcpAE/Z6Tw97PyNSCTdfkCwM
	eGbe8hNooXsTt7Y3DXKXWO1I7VqCKY9fZupnJPks+Cp8fMgUcBKiMo3kUd6++wlYjN87
	FfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1QyyrMMjiUsdLAEQyIYV3c5ZrtQazHgSxntMk+BX3vM=;
	b=PQDxmhajV5xHMCresSiTLYoJY9THxNK/FydP99yyceFRRxJYxb4tgBYuGZwokDSOle
	8KEzK2U+Eu9+pj3IG0P0CR8B5Ot8gelUSt4La+WLHeVeat4r3C2voE1suxM9E84gk7pW
	RKj4CbokX7FRg11Yb7OoCGwADn7s454Ts7vQem7z/aOQe6THN0uD9pAf5ZHpULAZkcDn
	AQSvrDgCNz9qYUF1hftdgTciWWe/Q1E1QnaEowN++EhNRNDeoUjbUIgDkL/vht13W7Sz
	J5OrJ7fbJFhUj7HvBRCd7Qld2JV+Si2zQ4MPz3rcefeVZqtLvC15o1CJNb+gKshwwyfJ
	OiGg==
X-Gm-Message-State: AHPjjUgY8QShCgg2mmGiAVFo4GTxYgxtSB3gtELJddHJXOTag0pekwyX
	RHKQGrSUIIHGv1gjaKiiObSQFzbE
X-Received: by 10.129.102.213 with SMTP id a204mr1783542ywc.125.1506005475119; 
	Thu, 21 Sep 2017 07:51:15 -0700 (PDT)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171])
	by smtp.gmail.com with ESMTPSA id x4sm601858ywj.97.2017.09.21.07.51.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 07:51:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f171.google.com with SMTP id d16so11378491ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:51:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCeRQOiDiO8O/wT0/QH2efFbHIczjZlyuNlnPo9Rov2OV6BUMAAEpqtc+YfG7LM5qUtjU8sGt1y+UQK1hL/cwQ=
X-Received: by 10.202.81.214 with SMTP id f205mr2632769oib.274.1506005473015; 
	Thu, 21 Sep 2017 07:51:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 21 Sep 2017 07:51:12 -0700 (PDT)
In-Reply-To: <20170921145002.GI30205@bill-the-cat>
References: <20170921135833.11007-1-otavio@ossystems.com.br>
	<20170921143747.GH30205@bill-the-cat>
	<CAP9ODKpzHSkyt7ZdCD2C5WdhbzJ66+CW-Gg9c5i3XkX90yGZSQ@mail.gmail.com>
	<20170921145002.GI30205@bill-the-cat>
Date: Thu, 21 Sep 2017 11:51:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpP2v2To=dG2HTAQg4ZDs05ydvKm1FU4L-s-Q_5b-OfXA@mail.gmail.com>
Message-ID: <CAP9ODKpP2v2To=dG2HTAQg4ZDs05ydvKm1FU4L-s-Q_5b-OfXA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v9] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 21 Sep 2017 14:51:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 11:50 AM, Tom Rini <trini@konsulko.com> wrote:
> On Thu, Sep 21, 2017 at 11:48:39AM -0300, Otavio Salvador wrote:
>> On Thu, Sep 21, 2017 at 11:37 AM, Tom Rini <trini@konsulko.com> wrote:
>> > On Thu, Sep 21, 2017 at 10:58:33AM -0300, Otavio Salvador wrote:
>> >
>> >> The are use cases where the Device Tree appended to the kernel is
>> >> convinient, so we generate the bundle concatenating the kernel (and
>> >> potentionally the initramfs) and the Device Tree binaries.
>> >>
>> >> To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'
>> >>
>> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > [snip]
>> >> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
>> >> index 72814ca224..6e08be4b70 100644
>> >> --- a/meta/classes/kernel-devicetree.bbclass
>> >> +++ b/meta/classes/kernel-devicetree.bbclass
>> >> @@ -1,6 +1,13 @@
>> >>  # Support for device tree generation
>> >> -PACKAGES_append = " kernel-devicetree"
>> >> +PACKAGES_append = " \
>> >> +    kernel-devicetree \
>> >> +    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>> >> +"
>> >>  FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>> >> +FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>> >
>> > Frankly, the most common use case today for still needing to concat the
>> > dtb to the zImage is for very legacy U-Boot where 'bootz' doesn't exist,
>> > so we need uImage (which is in turn why we need to patch the kernel
>> > build process, or manually run mkimage, it must be (zImage + dtb) +
>> > uImage-header).
>>
>> There is also the use case of a single binary to boot. We use it in a
>> customer project and we found it quite useful.
>
> That's what FIT is for.

Without U-Boot.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

