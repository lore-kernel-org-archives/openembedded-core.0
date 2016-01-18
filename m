Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D22916FFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 10:12:02 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so52638202igp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=wsEvRNCp4/62o2fwPzzKdLmgDqB7W10XDVioeF0HKYg=;
	b=mIHRtk6XKSplGUp/S+iPPlnqU1TOJjMf68/kZO/hzdqyDjZHCCQBkZ0Jt53m0iFhTR
	6vYZf7n9bHvNYnilfnltQX1MWR68Ohe2bZ8TNxrch6IOfozNlO1FPoxJf+rs2csbsqiU
	YHMdgOkXH0xPoghrppdpxndpuqPW0m0XsEwyv2uwvF8ixpxt6hOzcPwvZbXZoAy2/Zz/
	FIBbgENsYzC3XmGIrz25ENHuSD4c2wrNL6zqWMJcNS7P7DmUTZHE14ZTu4Htgd1n7uIB
	x2SAQYamsqMbmsNCuAVtkMm3Hm/i+QmKGAnUjI5rKfx3kecjlPrUomZ12XhD3121gsjJ
	Wlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=wsEvRNCp4/62o2fwPzzKdLmgDqB7W10XDVioeF0HKYg=;
	b=Tri4O0w/SWBXpMaXmpZR8QG+CHWfsKEhGzLIaiTOTHdyL4PBjlrGvU+Z/NcZYb++Rd
	xA47EdoIUSfi/rtnQoiKERTO2vt4cTZuQqetorqyUwe5Dms46GHAp0UBV5zFMg5ze05Y
	6dhTuGpmTyux6TkHEeMD44Mivrsh8LClJiFL9rYYS4yjlEVozzkyz1ok6ivuSKOeLkqI
	Z1kWYNrGyuSLCE8U6p8Pzq9r2MUKNaT356FNIizNMa5ttYY1QNHjvwikBb5Aj2uc75iL
	O20a57jlpz8zYLq8Xqf84ODuuh4zdqflFzbDlMmZHToIUR7XmuUFWdoYoMCpAE/H9Tam
	+PyQ==
X-Gm-Message-State: AG10YORt9LNls94aqI9lvVTbjSA4oIABBm8vuza3PDO1vgfdaNY/P/3hpspqKmnjMWZ3cLRW
X-Received: by 10.50.171.162 with SMTP id av2mr10397992igc.32.1453111923403;
	Mon, 18 Jan 2016 02:12:03 -0800 (PST)
Received: from pohly-mobl1 (p5DE8CE7A.dip0.t-ipconnect.de. [93.232.206.122])
	by smtp.gmail.com with ESMTPSA id a5sm5280616iga.7.2016.01.18.02.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 02:12:02 -0800 (PST)
Message-ID: <1453111920.7013.30.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 18 Jan 2016 11:12:00 +0100
In-Reply-To: <569C9B3D.1040201@windriver.com>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
	<2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
	<1452856537.28375.142.camel@linuxfoundation.org>
	<1453102317.7013.27.camel@intel.com> <569C9B3D.1040201@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Mon, 18 Jan 2016 10:12:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-18 at 15:58 +0800, Robert Yang wrote:
> 
> On 01/18/2016 03:31 PM, Patrick Ohly wrote:
> > I believe the "1.42.9+git${SRCPV}" string goes back to Ross, so I'd
> > assume that it is not too unusual. Can we perhaps use "1.42.9+git
> > ${SRCPV}" also in OE-core? Then if I'm not mistaken, the magic behind
> > ${SRCPV} will ensure that the final version number will be higher.
> 
> Maybe use 1.42.13+git${SRCPV} ? Since 1.42.13 is the lastest 1.42 version.

That would also work.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




