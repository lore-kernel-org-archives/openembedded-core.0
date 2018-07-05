Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF4AA78464
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 23:39:29 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id r18-v6so6463041ual.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uk76lV7XXTcB59eGv64+NdeauVhzQXBwDguVwWyESEE=;
	b=gvKuiQVJl4Mpx6P5y88CPx8daLBQgUYzm5SGWV/0LCHbsm9qwrgMRjcIRi457vWTT7
	H7lUYBzWMtXuaM/WjDNiav++3kUMFuuatafKneCxmAxcWbLhnF2EyxFlpBytRCFkbUQp
	3CboOds+xmcWcMEbYnkpRLIZqE9ouewLDOhkrw7QVxJHMgqewVgm8gq+CHP/jHP4AKfM
	iUH+J8w8JYcxlTtqp6GSWstHyNlHkozy0z+1G2yvDR3HnaofI6m3NDS3pc/PU8B+wb+s
	AN+lq/o5G0xqpnkatJxv/PMWZmlZjCfxYkcFsWg8dDIfp1ZKUYOhsuIPscgnMRRs/Qqu
	rYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uk76lV7XXTcB59eGv64+NdeauVhzQXBwDguVwWyESEE=;
	b=ObZQQRn2zNqFslxARsTKj6KednqQs7wuwFXI0Od/GCR6HEdQJJ+UXHLFIsbtMlVy9f
	+ruOOME03eUBYNQR6DEX1jc/W/Bwiqd0t68L2t6Us/Lyfs1G9lXpioFPDSMu+ZLvC5nE
	WlGTIAJKhnlm22geqKUtXVV6doDMuumVZu8v44u3R7PVCkObL0rDio+dEfgjf02pUX9z
	oJ24pf/bLCJOjogsm/LtvVZ7cKfZs34/k79I9oBMdcYjouV1yLkmbAEI58+bRtks+5eC
	CTZZVVMmODaYxgIMlNL6nWrJWSTZOoZ9aEMhYhq/hOyaKuom+FAfPhGx7irQJtHCIb+5
	AfFA==
X-Gm-Message-State: APt69E0AmiykMa1szfA35dbNFZJtril0GwOrOjnsMCyKqirhPuiy8WkT
	fxgZCGMSZ8TJPCJZLkdDgw1+WASy3bvVSed8/T0=
X-Google-Smtp-Source: AAOMgpdfI7QVxptTOpt5IKyQ7xB+xYSX//6r1XgYo4UAfsOQQEbJxDLjxTHUYxttK6tyC8Wk7/XNWcKHHn4JrlriN6I=
X-Received: by 2002:ab0:136c:: with SMTP id
	h41-v6mr5173747uae.193.1530833970517; 
	Thu, 05 Jul 2018 16:39:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 16:39:30 -0700 (PDT)
In-Reply-To: <CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Jul 2018 16:39:30 -0700
Message-ID: <CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Thu, 05 Jul 2018 23:39:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 4, 2018 at 5:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 July 2018 at 01:55, Andre McCurdy <armccurdy@gmail.com> wrote:
>>  DEPENDS += "${PYTHON_PN}"
>> -DEPENDS_class-native += "${PYTHON_PN}-native"
>> -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
>> +DEPENDS_class-native = "${PYTHON_PN}-native"
>> +DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"
>
> Whilst there's nothing wrong with this patch, as the BBCLASSEXTEND
> handles DEPENDS-munging isn't this a better fix:
>
>   DEPENDS += "${PYTHON_PN}"
>  -DEPENDS_class-native += "${PYTHON_PN}-native"
>  -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"

Removing the over-rides completely results in both the native and
nativesdk variants gaining a new dependency on
python-distribute-native (courtesy of setuptools.bbclass).

