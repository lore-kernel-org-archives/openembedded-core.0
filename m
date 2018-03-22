Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDEA5788AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:31:24 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id m22-v6so5639678pls.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vsb4hsfitQoXEq6bp63D+wHxKR5bXxIvIni5pGJNObc=;
	b=rIqKBz1XOLjDBBzNi/FPNB6gUK7BSfE6RMCFUdu7E7UTOPwSfXm1Ib9w6aylDqJxlg
	NQXaZ1v425ID+uD7liawl+2x1uuzESCncAuMj8bI2NrT8c6K7ikEIOGZinX260AY1tK8
	p2oYXPb48FTyTDgfI1C+TQOElWNDVSQ6V3ysNgpwiZ3uIMNRbKmFkd0IH2JAfO2d0YOR
	eyhQaYKXRC3WZQaCOO5xUkJEHXq8WbxbltFVRNJYPa6wib5AU4qoiL+9ebdRYQc5g6Nq
	g9r+q+852sy5NohHC/imRo/wVrGDT/59psFIkt6tMtWu8v0WLmzsEhdR9UJUJjQHt+JA
	Ey5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vsb4hsfitQoXEq6bp63D+wHxKR5bXxIvIni5pGJNObc=;
	b=FT6dH5+qWiq9wJrf0/uSpDZSRbR3RFGCd9yGVLFYZ1LtmMP1x6Ja5205MpUBiRb+jV
	kTFXbTY2yqx4hbR+mxM7tRkulvHiDVTtZ1C0AzkDBMPaaRrdm4ykm3BUuwopwiPxoqKF
	NyiezzqxiD4OPQIJqEtfNKhR0GZKE1ffQI3L528BttAAXYmleii8RxU6Xzhqtdm1IeIb
	KLgpgy/4JVaXhN9QNWw4I4ZFV76WL/9CZsFeIDEuKdmoh7dP7WsFE1umY+uO3yRj+rrs
	boGxoKsaITHdixJjXLqIqJvo1ggT8uVXfFKP5QQWwkr7zawcOpwYkS7/9944ZYRL0QKr
	oSYw==
X-Gm-Message-State: AElRT7F1eM7/csICMMaAuS3dBIoVAA0291iaY3mdKUlA/UHOaxtWLGR4
	sNTTBRb1bpu9kP6r4gHkl3FwbIeTr/cwPml71t0=
X-Google-Smtp-Source: AG47ELtFkj57LqyoednAl/fZzx4jzVdP6DOjzMLzCJp2mJQ09un0MBbpN6+vsjGrGIqVGNkaTSpfsNWvhX3OGJBC7DM=
X-Received: by 2002:a17:902:6e01:: with SMTP id
	u1-v6mr15716636plk.96.1521736285807; 
	Thu, 22 Mar 2018 09:31:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Thu, 22 Mar 2018 09:30:55 -0700 (PDT)
In-Reply-To: <CAJTo0LaTf794zGj82O3nhk_66PcoUDZn=LEZTNBOEyonksj8Vg@mail.gmail.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
	<6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
	<16a50e80-4e34-e7aa-016e-12e2b1d32958@windriver.com>
	<bf908c93-3935-e053-e601-445400ff7ed4@linux.intel.com>
	<c0ceed82-d9c2-ccea-8140-9f212a10d49e@windriver.com>
	<CAJTo0LaTf794zGj82O3nhk_66PcoUDZn=LEZTNBOEyonksj8Vg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 09:30:55 -0700
Message-ID: <CAMKF1soE+j0d5s3HX033Mav_nRZoCKxwZNJgGj1SFPnEmbu55Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Thu, 22 Mar 2018 16:31:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 9:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 22 March 2018 at 16:12, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> Best if we could pitch this to the meson devs on their list:
>>
>>     The Meson Build System <mesonbuild@googlegroups.com>
>>
>> The earlier that we describe the problem and our proposed solution with them
>> the better.
>
> There's already a bug filed against Meson for installable test cases,
> but nobody is working on it right now.

while that gets worked, we can create a general template in meson.bbclass may be

