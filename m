Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id A3E2377B7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 19:09:06 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id z13so3588402iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=m5vQsK4Atno1dQLaRbsJ7x93OEYDUSUvtMHs99ssDJ0=;
	b=Cv/00QSe2PkfQGx2JSCRjLfVahdHSG7thYkh9qGbY4OY6DeW74UwLloWOu5tmUFiwT
	MvYncXVk36VM8YTX1hkKmXVrYXKHBgepMplBrNSowPBJ4ogW5F8IvzuGFlrA+eD/Y34a
	VpK2n0k5AmhMSYWKdePz4KxP4hd0T+mc7HMQNuxsXNsUBMcOKigiF6wgEqsz2P6I+Yja
	bV2CAyKo5BHObhOE29CjrmqgspOdXdirEe7vvVlLHeukJBFlBqKH+C7F2doNHabNbGmX
	uhYkUiu23/oumU/sHuF3f0D0j2RS8EBT/W8IKinZ7iHMcQD0slVXBexnRUizcV5DdUKM
	xScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=m5vQsK4Atno1dQLaRbsJ7x93OEYDUSUvtMHs99ssDJ0=;
	b=SXul21EZRdHMZOz2Nd5REu2c9ZCU8L243S4PH6swSGrqYnuOUA9jSuo/si+vzwKoo8
	+hBGok1uBeqP5cWBx74O+h6Pf5Kn3F7eMpLPKSdaa+B3c2CcoblVBQ6wkLc81fumTbw0
	bK2Dgq/f2DxlF1TTdY0TajNEBi6NwLNuuuIVVGIc2w+8muKU4UrXl8dsbl17F0Pfx2qp
	YP4GVckEeIz6URHkbQ58L23HPYj/ckhimi5kyom3DRjJv38vLrAYwiGN7u97e0bvkzAQ
	VEAhbjZXh1DMviekCZZ5KHJiu07lyg9BiBQmjard9OGUfERjWCzI9IfhQGdSeMS/R+T7
	qbtA==
X-Gm-Message-State: AFeK/H1sXCJqcGbDs5zXnZA+i1YecSagBebl9BnsqK8jwKGp9lDfhMhHCDziUbwnLAZYCRnm
X-Received: by 10.107.174.220 with SMTP id n89mr4630023ioo.166.1490296148147; 
	Thu, 23 Mar 2017 12:09:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E879.dip0.t-ipconnect.de. [93.232.232.121])
	by smtp.gmail.com with ESMTPSA id
	l79sm2094931itb.24.2017.03.23.12.09.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 12:09:06 -0700 (PDT)
Message-ID: <1490296143.6396.253.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Mar 2017 20:09:03 +0100
In-Reply-To: <CAJ86T=USCOn32KPsH1TURbJL671wPwGXLBeajkL06wyvs4Q0wA@mail.gmail.com>
References: <1490222875-16219-1-git-send-email-armccurdy@gmail.com>
	<bca89655-d4fd-d6ea-74c7-9f6050473b89@topic.nl>
	<CAJ86T=USCOn32KPsH1TURbJL671wPwGXLBeajkL06wyvs4Q0wA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native.bbclass: clear MACHINE_FEATURES
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
X-List-Received-Date: Thu, 23 Mar 2017 19:09:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-23 at 11:59 -0700, Andre McCurdy wrote:
> On Thu, Mar 23, 2017 at 2:06 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> > On 22-03-17 23:47, Andre McCurdy wrote:
> >>
> >> Try to avoid native recipes accidentally being dependent on
> >> MACHINE_FEATURES. This simple change doesn't prevent MACHINE_FEATURES
> >> set via MACHINE_FEATURES_BACKFILL sneaking through, but it's better
> >> than nothing.
> >
> > Maybe this would work:
> >
> > MACHINE_FEATURES_BACKFILL_CONSIDERED = "${MACHINE_FEATURES_BACKFILL}"
> 
> I guess it doesn't work if MACHINE_FEATURES_BACKFILL_CONSIDERED is set
> elsewhere using _append.
> 
> The real solution would probably be to skip backfilling
> MACHINE_FEATURES entirely for class-native?

Perhaps set MACHINE_FEATURES_forcevariable = "" in native.bbclass?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




