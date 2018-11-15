Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 74EA06C154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 13:08:01 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id k141-v6so29129086itk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hN51hNolSSw+05YdFbD3XucFi4Xz5GN51unG29zQbWw=;
	b=a9V0wqmj6/LaWGtZQnUbba5iG7kegeUZtcN9JIEaD6BDR0NGIgF+eurEzkexHmOQvT
	pd/JUvrOSFBwOGl8gC3w86IlV2eRAU9A1qRgNRgPqwTD6Q7RciCsrEmSFvr1A9Ci4uC6
	fBVDMUGPRfgROb4CC/urksgzxsCs5TnlNBeX/lLh6dXdLhMMTirefqxSnaJlm9tS8eQR
	6FWaDLw2wqqnYcvFZVf1IP3Kwrl2L4VDNYSjYw1h8jmBwsnclJcJZi/WrwLTO1HqLCPY
	0Z2WSMYFtBrusc5/5S19i80ct+fb8HsN2lmKk/60tXrchaR4oKojBDonW1c50dO7hdqT
	Eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hN51hNolSSw+05YdFbD3XucFi4Xz5GN51unG29zQbWw=;
	b=bx21fPtmNHNruwd3HXVMqknRwIgBDtT/Gt3b3H2v2KNNebj0Ah/qpXRmxLaPzy2DiM
	Th5mfXS4yW+FPATkRASvqGmAwx5tp1LEwdIEisORQgG+Lzs9RoLdtwiNe9aStkaD6KSQ
	LWd2BPfoqhUOcARnq6KSu9yYBUwbjnPY1NSzBcibgS0drgjEgMos9sHqQICoyGxL/EEE
	WGui5NO0W683dMvGFkxeM+DUA0J1GOZxwheveB7lOje3GUjb4RTlhnkyTBoTDZp5HFh7
	o++HDP2EH7WzEt0rysW+OpAc5uJTHJTkz3+02svz9mM7Z4kcSfJqpANhhRnoOkr6Vm2P
	4unQ==
X-Gm-Message-State: AGRZ1gLR8pvIdJo18zgvAekLLIEgZzPDqYeY0VB8+TOQKl3vm0HMQHlk
	5EBaa9EcmGjjelMOzNgnpS4UjgLc05QSdQEMOxC1NA==
X-Google-Smtp-Source: AFSGD/Ups2y4py1AYCgIxFLAl12xxUGhPu7UBLW5c5xObkoZtET5Q2WclcjkwDxxaP36aRntkGggzDP+M2zOG4Pg9S0=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr6183566ite.130.1542287282582; 
	Thu, 15 Nov 2018 05:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20181016232143.5016-1-anibal.limon@linaro.org>
	<6b883ed64458a2153437d7519adefb513556864c.camel@linuxfoundation.org>
	<CA+_AqisrOphM_bZ=jkfX1boP2aSA-8YR_bAT08EZo5RDHweLtA@mail.gmail.com>
In-Reply-To: <CA+_AqisrOphM_bZ=jkfX1boP2aSA-8YR_bAT08EZo5RDHweLtA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2018 13:07:51 +0000
Message-ID: <CAJTo0LZENsJUFBWgE_P_Zs8GWQy-FUxyeK6u-Jutnd53xgoKnw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
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
X-List-Received-Date: Thu, 15 Nov 2018 13:08:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Oct 2018 at 01:38, Anibal Limon <anibal.limon@linaro.org> wrote:
>> > -    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')

>> > +    fstypes = d.getVar('IMAGE_FSTYPES')
>> > +        fstypes = [fs for fs in fstypes if fs in supported_fstypes]

That's the problem, the old code takes IMAGE_FSTYPES and splits it on
whitespace, the new code iterates over each *character*

Ross

