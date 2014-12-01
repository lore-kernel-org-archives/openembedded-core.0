Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C87AC72312
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 14:20:33 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id id10so4694464vcb.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 06:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0m5xHnH3zUMy6wKl6cKLP3HfnIF5DigIIYtIjbfU2Oc=;
	b=MVHD3Wboy9s8FjfQ46Nw2HgAnfhW40n70FVJHi2hKUrFX1S+GtIEIV6JHfcqjlRo0W
	BzaCINUcfR7Qq/4JeoMv9FZZ5Hbe/OA751nB9zocYH5s4lkAtV/SWw+/e9s9qDHTRtbG
	PulemvS+PUNPcxBgRXV9CwkVQyu32DnOwSXWTHfdo8532VT0KfqIcgiN1XJ7ebxh4jQm
	wB1TSTlBOFK7G77tBl7TiITezUwuvlwLlZrvZPtcRACdp/O0ERW4dhF9NTtuRZjX7Kbo
	jdmaYliNdAexe/KRMM7nG3MQOei+8AutovPajGwNzBfRfGlVzYCMPCUS6w/0nAyi9p6Q
	2ScA==
X-Gm-Message-State: ALoCoQlLV/4E2/7xlEQw/mlJO5dvL5as9F2UedRfa7JSM3Exgtuciru+GBJVKqqhJeYiV7cspKwh
MIME-Version: 1.0
X-Received: by 10.52.18.98 with SMTP id v2mr23515595vdd.86.1417443634488; Mon,
	01 Dec 2014 06:20:34 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Mon, 1 Dec 2014 06:20:34 -0800 (PST)
In-Reply-To: <CAJTo0LYAOW8YC4bOU9068DFRy0wu67CcF8ztt-1_XPAV9XmC6w@mail.gmail.com>
References: <CAOMwXhPV+N=m+VBZhk70DzZBAXt_QDjMhxm=sy+R9aO1zNpWNA@mail.gmail.com>
	<CAJTo0LYAOW8YC4bOU9068DFRy0wu67CcF8ztt-1_XPAV9XmC6w@mail.gmail.com>
Date: Mon, 1 Dec 2014 14:20:34 +0000
X-Google-Sender-Auth: O7D5wbj4EXXX-0rf40DTIuETNVI
Message-ID: <CAOMwXhM8bBvA0V=HuYYbm8Di_p7KQNTDh9PEftgOVTEp_-8dzQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] toolchain-script: Add support for ccache builds with the SDK
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
X-List-Received-Date: Mon, 01 Dec 2014 14:20:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 29, 2014 at 8:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 29 November 2014 at 08:46, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> Including both Richard Purdie and Saul Wold as they were the main
>> criticizers last time in the beginning of September when I submitted
>> the first version of this patch.
>
>
> I've merged this into my staging branch now that the point of the patch is
> clear.

Thanks!

>
> Ross

