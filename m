Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id EE709771F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:57:05 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id q80so1290932ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ZxJjCFHOXq3YnpAGqpLCc8zDGFWljf7w6nCIKDqcxVI=;
	b=Ppoj5W37ngpgryJWF78rPpaa2Cv2Mmp4ahdTeSsrQagIV/z8Zjl3wdDUcBKgAPvGcx
	O5LNSWZSLWf93JjvvglQSpvaZJHMnE74/CUjljX/aVHzENQfm4WpubaHCnNpc/WLhqhf
	0O8RlfDwR8d/k1vL7jZnBuhrRkArpJ31LzdPHIoV3LK+mJEtZqg1jUhH0yzLZ9wRKbtb
	dNB8PMVjZxdJfpl+cmQXpnXbDRLmUT0WOuhltW6yMPwMwY01pzm7cDuTF+E8TLgZKsKK
	dA2Z/vEjDmz/g+I2VL2KuWONFAevCCifXteUloKaMcmBX3ecjkhDHQ3xZb8tUtZ/KNo9
	QfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ZxJjCFHOXq3YnpAGqpLCc8zDGFWljf7w6nCIKDqcxVI=;
	b=XMmeOd/td1Earu3yCQaNTmWzEiDuJCMXOPTSosGN+Ittg0h5w2Gl8CwUxZmqIyYg6j
	ovCIrO8JeijhEqnjn219s+wl59reBLkFQyAJRJdj45HUSv7fyGQRhcCZqpelAx5ZA10B
	v8aG/P9QvXq8+piFp+jhWGT7bfwKWtIf434AdhEnoyOT7Mfr2fo8rHKJj9o54N0RwTlo
	0XsJofmLrb+2qmjiTVd5QYIr6dEvw0Omle7q1Ij4npusQQ+yVs+Rb919L0HsC9dUxVGT
	E+fs3pfJECuRV/0+cbeVkUSY9253yMIAwjfKCb8vY/RHz2l5lIgxpQDVPEGXFUZoFZPf
	0wng==
X-Gm-Message-State: AHPjjUieh3O2Jt3+3Pwpb1CD4QH5kma1Z2PQFIIyNLO0y7hUT2yS1nzo
	zqwqB1kvkVpzKT/pSHpUtbF+ogz+
X-Received: by 10.37.177.10 with SMTP id g10mr4303175ybj.244.1506621426635;
	Thu, 28 Sep 2017 10:57:06 -0700 (PDT)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52]) by smtp.gmail.com with ESMTPSA id
	o190sm834786ywo.50.2017.09.28.10.57.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 10:57:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id x85so3576841oix.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:57:05 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB+/9hPQGBkeraTfXCJrSzoIfBsxrAL6EC3ijcWk9Q1L9NWca8mlbyZlqNJakxTDiJ/b4zHFQc4Jj6Vbeaw8O4=
X-Received: by 10.157.41.100 with SMTP id d91mr1626085otb.426.1506621424890;
	Thu, 28 Sep 2017 10:57:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 28 Sep 2017 10:57:04 -0700 (PDT)
In-Reply-To: <20170928174942.GP3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
	<20170928174942.GP3112@bill-the-cat>
Date: Thu, 28 Sep 2017 14:57:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrN8R_BpNobDUQNw33vEeQVJKF7g9mGK3-m=TUiyRukSQ@mail.gmail.com>
Message-ID: <CAP9ODKrN8R_BpNobDUQNw33vEeQVJKF7g9mGK3-m=TUiyRukSQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 17:57:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 28, 2017 at 2:49 PM, Tom Rini <trini@konsulko.com> wrote:
> On Thu, Sep 28, 2017 at 02:46:23PM -0300, Otavio Salvador wrote:
>> Hello Tom,
>>
>> On Thu, Sep 28, 2017 at 2:44 PM, Tom Rini <trini@konsulko.com> wrote:
>> > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
>> >> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
>> >> > In the case of non-wic images there is logic today to generate a
>> >> > startup.nsh file that will be executed by EFI to run the loader that the
>> >> > image contains.  In the WIC case is currently depends on that file being
>> >> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
>> >> > present there.
>> >>
>> >> What's wrong with this approach?
>> >
>> > No one ever provides a startup.nsh and everyone that wants one creates
>> > the same one line trivial example.  The end result is that no WIC images
>> > are Just Bootable on UEFI systems unless you first go and spell that out
>> > as the desired booting device.  This isn't an awesome workflow which is
>> > why the non-WIC cases make the required startup.nsh :)
>>
>> I think it could be done as we did for u-boot-extlinux support.
>
> That's complete overkill for a static one line file.

No, it is not. It allows for reproducable builds.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

