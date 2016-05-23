Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6220560290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 21:37:47 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id r64so30351187oie.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1iC9d/9vWAqRjrrrMy8BWjXGdMEVHfL/gib4T6MpAV0=;
	b=r+PQi9Mn1uaRSODsGnOQCMuS4i7IGir5B7h872ltxvaNcuj+SL2g4GoNUDfvukiUCq
	ot6zIAccsUYvN7cYPqFaVkGmADOJzshYZCYjYmuQs0NCLlOjYICCBIljvpZbapTAVqeD
	RCT01XnV4bazsaYVihNFIFXxANu+SQsAWTVfmmf4tekW2j+GvFqFoXnPHPhKHEgWBZMN
	kNTXBPmp3mJLj/Se7Agy1b/HKD6aOjLnR7yHVgQXu+PmZngl4CDjlGtg7/d55LrWl4PR
	cpc2AtQGY4f/OSevPx7WHx3ad9iCebW+4Xjb3UIr03IYVR5oV4BiuHgQgBmsFNN4che5
	u12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1iC9d/9vWAqRjrrrMy8BWjXGdMEVHfL/gib4T6MpAV0=;
	b=mGHptTMDgy5zccM328IfrEwpKKFYjMjv2SPpaWc4N9l2/KS5wEEoI6qS2COHOgX++e
	88r836fwE0RnOhl+1xy2tpXEETcZtcxRgMEzBYvOzgcTwbv572/OYI67A1O8PWgxpO+X
	geEn858yLuI6G4vYbykwV8DpozUCH94rhMlVG3vO398Vd0aMN0vSZguQoLn3FSoRcJKl
	IHvuBV5rvpGyhc473a/ehIB3UORZAkMFQzxzNxhTdfsdM76KlDMi02pVvoyyT7AIdG9h
	3rGUejYg/AWc/irWjY64+tXokJwyEpZJi98LU3FRQByzeghmEzoplcAJoPYgFIBy4V/D
	xeew==
X-Gm-Message-State: ALyK8tL/TbwZwIhAQyBPRC8tYBowbJ3a2TUGrDvpbEUE22nCv7QuvYJeM9X76dtSRU1WvTMMNmFeztYnvS3ZPA==
X-Received: by 10.157.40.46 with SMTP id m43mr663085otb.49.1464039468474; Mon,
	23 May 2016 14:37:48 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.98.137 with HTTP; Mon, 23 May 2016 14:37:19 -0700 (PDT)
In-Reply-To: <CAJTo0LYJuy3vJG_nDp_qA_YTRr62FgN5YUzYcWb5=i6WoAv2Ow@mail.gmail.com>
References: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKPPRF+AvEShiFopGj-WtzM6Hdr48nBanA4TEwdWKq2ZSg@mail.gmail.com>
	<CAJTo0LYJuy3vJG_nDp_qA_YTRr62FgN5YUzYcWb5=i6WoAv2Ow@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 23 May 2016 14:37:19 -0700
X-Google-Sender-Auth: rA7NIeOPJ8F-QN_u7d84ZiVqUOc
Message-ID: <CAKmqyKPw2M0aso8Ti6aChzx_EBDMveOHwkzdiERy-qnQ4jn09w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] runqemu: Add suport for qemuzynqmp
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
X-List-Received-Date: Mon, 23 May 2016 21:37:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 21, 2016 at 2:33 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 May 2016 at 17:40, Alistair Francis <alistair.francis@xilinx.com>
> wrote:
>>
>> On Thu, May 12, 2016 at 2:37 PM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>
>> Ping!
>
>
> Sorry meant to reply to this a lot earlier.  There's a RFC from Robert Yang
> which proposes a series of patches to completely rewrite how runqemu works,

Are you talking about the 'runqemu/runqemu-internal: refactor it' patch series?

I talked to him about that and I'm happy to help convert the Xilinx
machines to the new method.

> so the machine-specific knowledge is contained in the BSP itself.  As a BSP
> maintainer who is working on runqemu, would you be able to have a look at
> see if it should solve all of your needs?

I haven't looked into it too much yet, but I can't see why it wouldn't
work for us.

>
> (this is now marked for my staging branch too)

Thanks!

Alistair

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

