Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id B84BB78635
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 01:23:57 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id v18so18599971wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 17:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VxXve7Mu/Gjecjqesb2vSt4XtZubipDbNto3jOOComg=;
	b=EQnpv7gzoNdAcGI4xOtnftZdgSmVhHJdlvy13XULONF8ZytTnWBEmLpQANU0Koix2m
	/Y2d00kipqdVkblM6QAZVqVt0WuiMWLURM3FEONPi50Uvb0CvLQgsfGEba+hNN0garlW
	2PEl+Z8Q/9MSzPB4YDljnd1kLrwIbX9LKLHMUXfvaw7UR2Zu0whhJl40tW3YxYooBPlX
	QUECXFa2O6/3UH2UvAW8hoKrtUWHWx8vPF8dMt2yj+esvGo2oyI16KwurUKxW1J6n3F0
	VpKq6LrTeoEIpgI1+cCOS5Xk/5vOTC+tumsUHLwl4dnAs5rDBVQAoidrj4Ih1r4qCGtT
	bv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VxXve7Mu/Gjecjqesb2vSt4XtZubipDbNto3jOOComg=;
	b=AjJCru65WCpuUsLazBR0heVvyT7ylHy7Fq6vOvSos+s6yw7rc2zNROzMTBbQBxZhmx
	kruHoKK2CAMKtjPikbAbfR4pmqpGjAniYHE0C5bspsEWNVrRqKdTaJc5FEY3qroYVx4N
	Z1yxZrQdYLyjGnePRNu4R7OyTxZELdHB6IJ5/PROQq/XrAa+gsF2VvxZA6aKYDW3tR2v
	UhSxKwpQe/gbZyRmJ/l0VkMHpSusjHlgby9Ge5NljRYoaBEP+EOUUc2b3fX5n/mCxje8
	7bgZAWJRJb+HBnlpmEYRXInhlBfggA0GTCmPBik3mkf3kU0obi0dBaiO+iuFcEFHEoqa
	6r0Q==
X-Gm-Message-State: APf1xPDulZBLFawZdDt93YiWr682tI8Zqw/iNK7StzoItbwMtw+g2o3Z
	Nj2aZ8GTXTOe6IgEZtREP4xCLx938485EqNL8bI=
X-Google-Smtp-Source: AG47ELtgg9k8Ax8TYispzO2oeq7k3X+++u0Rkmg4UURucrAKR4lGYnw/Wmfnv5zWmISy/GFTWUKKp1IWnSWeblBdAr0=
X-Received: by 10.223.177.194 with SMTP id r2mr15171508wra.89.1520299438549;
	Mon, 05 Mar 2018 17:23:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Mon, 5 Mar 2018 17:23:58 -0800 (PST)
In-Reply-To: <365619b3-671f-81b2-f9ee-9e746a77b408@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
	<20180301021518.29564-8-california.l.sullivan@intel.com>
	<CAJTo0LZH136aQ6jL2G=QcYeOvxjrc9mfisrAkEYgD4dVz1G59A@mail.gmail.com>
	<365619b3-671f-81b2-f9ee-9e746a77b408@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 5 Mar 2018 17:23:58 -0800
Message-ID: <CAJ86T=X4+uSWQeO6+uyYi=6ZF4tT6Kwfgu=tV8yvnG9+TSR2+Q@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/21] grub-efi*.bbclass: don't reference vmlinuz
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
X-List-Received-Date: Tue, 06 Mar 2018 01:23:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 5:00 PM, Cal Sullivan
<california.l.sullivan@intel.com> wrote:
> On 03/05/2018 04:50 AM, Burton, Ross wrote:
> On 1 March 2018 at 02:15, California Sullivan
> <california.l.sullivan@intel.com> wrote:
>>
>> +KERNEL_IMAGETYPE ??= "bzImage"
>
> You repeat this line in several classes, can we just move the default to
> default-distrovars or similar?
>
> I was trying to avoid adding to bitbake.conf (or things it inherits from)
> but I think it makes sense here. With the changes switching away from
> assuming "vmlinuz" and instead using KERNEL_IMAGETYPE, we now rely on it
> being set in a number of places, so setting a global default would be best.
> If I have your blessings I can make that change.

Isn't KERNEL_IMAGETYPE now deprecated in favour of KERNEL_IMAGETYPES?

If so, everywhere that's now referencing KERNEL_IMAGETYPE should
probably be updated to parse and deal with the list of types in
KERNEL_IMAGETYPES so that the legacy variable can eventually be
removed.

