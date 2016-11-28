Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3129971AB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 21:34:05 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id c21so244135780ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=YQb5sKc9Jf7RjA3GhkH1SriRFd1I+0OW8+efweMwusQ=;
	b=M3j1jlIXeuVwm+pMVcnKoVHlzK5SGikrw+AKksTPbiBA9ydR7l0HXJJUxhtPBx3GBj
	r75gtreg2asLnsJPK/HWYGBXPE2jV2qwiyGXoWIJt3wpNXh49IBHul4n7Na01ylzl7MD
	mAFf0Vra5G2bRRxtM+7yNfYD5XrI1sTk+tURnFYjwR8jNTeNBGNqNjPJuVDb1fAtYVcC
	35/xTIV7+M6xDjesUp6kcwbMZs4NtfrJXS8OpO9BRdUDN75KmKye2wL4p5O3vPw4W2Nj
	N/FcBofSqy5DIywBpfuSvcGboZ+bsBr7nVhoRkWxNW14hgm2F0Uhi6n9Bddu9v0OnWFk
	1Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=YQb5sKc9Jf7RjA3GhkH1SriRFd1I+0OW8+efweMwusQ=;
	b=IbaGIi3V3PHQfVRPQaGkdmcHEd8/m4pn4VDfnO2X1FGPFEuBg69mveiH7l2H85DDyJ
	poLBNLcYNSgnTcSl8wwVrFCRqh6DRMdyMvKHI8Xy0wnheas7ZP/p7JBhLkPt6m9JUHKf
	V3CN51ABpSfZJcDVNFPKqZczIoF7mFxFRSh66lTY1I/c5ct1ckzDd2NpD3FZoQWxXVGx
	5REm4kbtwUkGDiq4ybZPSLpsitZDLEPdsCL+kPvkMW/v1sasOZe25uRHSYBAyaO746ns
	UfEiDMKedZMb7xE/8J6hK3FTHWOcvuO+TC3dDqsKJ3en1hWIoKAuvppGHRd/QlW96YQ7
	n2QQ==
X-Gm-Message-State: AKaTC01S4gth/3uWcaXuSF2WV7Vco3Ng0NKAM5jV+Z2sSQpcJWo21NmgpNyl85iCDJ4Y7wQE
X-Received: by 10.107.50.12 with SMTP id y12mr18823721ioy.159.1480368846646;
	Mon, 28 Nov 2016 13:34:06 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C83A.dip0.t-ipconnect.de. [93.232.200.58])
	by smtp.gmail.com with ESMTPSA id
	k130sm9874062ita.20.2016.11.28.13.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 13:34:05 -0800 (PST)
Message-ID: <1480368843.6873.215.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Date: Mon, 28 Nov 2016 22:34:03 +0100
In-Reply-To: <967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480362425.6873.209.camel@intel.com>
	<967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] scripts.send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Mon, 28 Nov 2016 21:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-11-28 at 14:28 -0600, Jose Lamego wrote:
> Agree. Please provide feedback about below comments and I will submit a
> v3 patch.
> 
> On 11/28/2016 01:47 PM, Patrick Ohly wrote:
> > On Mon, 2016-11-28 at 10:23 -0600, Jose Lamego wrote:
> More than 1 "In-Reply-To" and "References" message headers are in
> violation of rfc2822 [1] and may cause that some email-related
> applications do not point to the appropriate root message in a
> conversation/series.

Fixing that makes sense. Just add it as reason and the "why" part is
covered.

> > And I don't understand why this proposed change has the described
> > effect. Does changing the threading parameters change the output of "git
> > send-email" and thus indirectly the mail headers of the following
> > patches?

The "how" part still isn't clear to me. Perhaps I'm just dumb, but would
you bear with me and explain a bit more how changing the sending of the
cover letter affects sending of the patches?

As it isn't obvious, perhaps even add a comment to the script explaining
it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




