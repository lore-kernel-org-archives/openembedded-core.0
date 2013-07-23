Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B3B246A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 13:25:04 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha11so235958vcb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Dk8Y3wK3c5J2gZ1t0kIyyaEF0sgw9ISsa9iXdHTWLuE=;
	b=C6ykyp/SYopF9u9F3O9zjvDTIIa+Do/zGVR7rGEkCrv7qfv/Wtb7q8o84cXPfLQGa1
	LEw9NfSfUPMk3Q/8qSnWkF3oKz7BTGCzLFhq6TnqAzLbpYRuUZMFWekd/qnopF7p/hVH
	vftkBi0HRO2BPNlq/QA+inlGjMIHG7jsVGvJ/FiVcCZObdGHyj688HrHHKkTJ33hrUQx
	oxMZAncqYpfvcYPt1adDVsJ3T8DWGGRW8GUlQ0/rTRt94bdANLvUzZYjXKRRziANTW/a
	OTXSvJ9Ra4HSbExgoUr+rV5a320n0dSUMzMtrI5f8dMSPwjKWpzC4WqIChfbzu1eQiae
	9sXg==
X-Received: by 10.220.162.200 with SMTP id w8mr11331603vcx.90.1374585905124;
	Tue, 23 Jul 2013 06:25:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 06:24:43 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C0D0B0@IRSMSX105.ger.corp.intel.com>
References: <1374502085-16914-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LaP8syHY_LMCcdFopi61T0XT7xZ_oUa6EO+VqNdHnD0TQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C0D0B0@IRSMSX105.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 14:24:43 +0100
Message-ID: <CAJTo0LZ5_WBLNVpfTNfwo2NJ9YHba+nnO7hh2==-Eor3Qdkv_Q@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQl1wcppNx586pacdvFNbib/EIBwXEkWdbxxdyxnSpqDWEsPNb/MafmJboynHx96hj2dQgvq
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to v1.16
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
X-List-Received-Date: Tue, 23 Jul 2013 13:25:04 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2013 12:24, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> qemux86-64 core-image-sato.

I'm always paranoid of connman breaking something.  Can we test this
on something real and not-Intel, and something that uses wifi?

Ross

