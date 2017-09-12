Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1E1F78456
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 17:00:45 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id q80so6155298ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=LHBsotu3z94R/E8j4jh/VvikjSc3AwQB101J4RNZXog=;
	b=QUGF/KRd+XPPFGzdlmSZ12cyrkZ2s40hUMEC7fTr1yhKDHpQPWRI5oACy8zqGtmO7+
	rdgJyyF0fioW8DhhhUK9T3/O5lKJXwAsxmyLN7oG9QTHoapwsGrqN7QqKa9dHbZuOrlC
	IzWMof4GKDcnrBwaimQUROxwmNwAFwrcauBnGgykfc5q9UqcAf4RTiisPRIC9smZiqi7
	Njc+QGCyk5zM3Bta7+wQU5bz5qEz2JJBefb3visa95OhAg0H09aqMa0ZGQz29TWqcys/
	iXOyNDGPV37cugH5ohAmqEXsLnNdPPs5Yb1w8DwYI0nZMkXLP/zmiENfPhHs4O1hwmls
	9oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=LHBsotu3z94R/E8j4jh/VvikjSc3AwQB101J4RNZXog=;
	b=sNEKNSykr77EsEHYfqFrJWU9BxO3WegsDPKFHLVhf+fNkbYOZ0Om8hErUtI9D8kOfZ
	tDUWxoqXQ9zU6XRfOe7LGfFBlkg7taxfYhgT078tXCxxofC8A9zHI25gvfUB9jQ6XHdP
	WBmaGq+eIadJPB43NyM7FDdVGCZNBuw4ABdq3+chdINY9fOxrAbjUZ51qfmkDc1Aw4IR
	XitwoXOYabGcbeUR091uHKIu0H9snoKx87jkpAuK9w6Uvi/zPQvfC/Kyhg62LT2e8Y1V
	cuSbA0TJZmvNXCKxoAxP0zxtxqSvQ/jzHreASFBmkiepcBRPXcQWRTBOn/4aWBwc/f/M
	Tbyg==
X-Gm-Message-State: AHPjjUg6pN7ji0jxe/6SzFJCwfDZlegZ5mdQaRP4eISHgEzLZgnsCTZh
	fth/7Ya00ChBylerCt8=
X-Received: by 10.37.174.87 with SMTP id g23mr7878351ybe.43.1505235646151;
	Tue, 12 Sep 2017 10:00:46 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id j6sm562686ywg.44.2017.09.12.10.00.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 10:00:44 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f175.google.com with SMTP id v36so38323675ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 10:00:44 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDSuWbQNuDfDPs9vHqWRtIfm0e1OnKSieynzVdGqjhxYk2KD9ql2dMWOBNmyx8EtvcUdCEkY80pH9eVeyvnHrs=
X-Received: by 10.202.83.10 with SMTP id h10mr14831540oib.56.1505235643883;
	Tue, 12 Sep 2017 10:00:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 10:00:43 -0700 (PDT)
In-Reply-To: <20170912164531.34d2af4f@t460p>
References: <20170912134551.12678-1-otavio@ossystems.com.br>
	<20170912134551.12678-3-otavio@ossystems.com.br>
	<20170912164531.34d2af4f@t460p>
Date: Tue, 12 Sep 2017 14:00:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoNfmgoL0exFEEfwuPXKwRhcruGfRDBS=QKVKsjGGBQNw@mail.gmail.com>
Message-ID: <CAP9ODKoNfmgoL0exFEEfwuPXKwRhcruGfRDBS=QKVKsjGGBQNw@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Sep 2017 17:00:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Andreas,

On Tue, Sep 12, 2017 at 11:45 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Hi Otavio,
>
> On Tue, 12 Sep 2017 10:45:51 -0300
> Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> +do_configure_devicetree() {
>> +     if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
>> +             if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage'; then
>> +                     config="${B}/.config"
>> +                     if ! grep -q 'CONFIG_ARM_APPENDED_DTB=y' $config; then
>> +                             bbwarn 'CONFIG_ARM_APPENDED_DTB is NOT enabled in the kernel. Enabling it to allow the kernel to boot with the Device Tree appended!'
>> +                             sed -i "/CONFIG_ARM_APPENDED_DTB[ =]/d" $config
>> +                             echo "CONFIG_ARM_APPENDED_DTB=y" >> $config
>> +                             echo "# CONFIG_ARM_ATAG_DTB_COMPAT is not set" >> $config
>
> what about CONFIG_MIPS_APPENDED_DTB?
>
> Can we ever make sure to cover all relevant architectures?

I don't know the details about the MIPS and its appended DTB support.
Do you know what we need?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

