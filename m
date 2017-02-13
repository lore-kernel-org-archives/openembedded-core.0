Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 89EB2731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:06:45 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id 203so194689350ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=xKwYW6RBduL38Eh5ZS9IS4jW6Q3oLys2bioUF66s85g=;
	b=drAFI16pJ82HRK/mt28TCEEn/p0crCXqj70lYRCUZjiAd7+w4oAOSVAnqOQH1BkeVi
	LTUZ6/6i4Mwyxi6i78pmwhR4ODDjOltusYJoUGI7PcSmPG8HEQpBO5JVC/RXAKS5eJ9t
	Z6Iga8jCTgp1aGeMfwlFyk9bFLOrqdg2m227c+FjDE3Iqv94apJXrdnlEj2lPNVV0hdu
	7u73VXoon3F4VRK8iZRF3EoM29VmF241WhYk4VhvOMU0cAlGsLyplaYdnq066l+dOWb4
	ilwL2pG4EdWrwhCYJW4L2MKb7cX2Uaf0DctFqtIS0zZ0mec0zy9Zwlx6pIVbGXfSfplh
	boMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xKwYW6RBduL38Eh5ZS9IS4jW6Q3oLys2bioUF66s85g=;
	b=NP519OTs/RRv9en0MLJqOymkAcEiAM9ZNp4JZZLzHbXhe6PwwYOOoUkv5tVSKWHCQL
	SdrX+wEQY7hfurmPvEERRsLhJj13xgstVGzpB8rwVCrSQzDuKhr7+RskL9JSnCX48nm4
	7Ph5+ms5CT8EyCYGA+nkdM+J96Pjsbr7WCRrZZT1/HTiqjPxdeTTRalRGCHbH3zy8dpF
	JvSPypEmg39BnAb9h4jeFhKj29Ur+HrP/x3WvGnGgCprUM0SeQpjJMUigUySxD6UXlMg
	10jMkVGsVgCMNyitJgMxTGYIpOUXVIL2QFaFEpbvX9BfE1puQiCUxidUaVuTUM1bnXd8
	PQNw==
X-Gm-Message-State: AMke39lIqFax0817pmHG4ghHANO0PTRL0c5jmQzggnlW6EcOmrF7No/lQze1qAAIMP4+q6mx
X-Received: by 10.107.59.201 with SMTP id i192mr23867641ioa.196.1487005605534; 
	Mon, 13 Feb 2017 09:06:45 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB6A.dip0.t-ipconnect.de. [93.232.219.106])
	by smtp.gmail.com with ESMTPSA id e126sm23278itb.18.2017.02.13.09.06.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 09:06:44 -0800 (PST)
Message-ID: <1487005601.13854.249.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 18:06:41 +0100
In-Reply-To: <1487005422.13854.247.camel@intel.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<1487005422.13854.247.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 17:06:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-13 at 18:03 +0100, Patrick Ohly wrote:
> On Mon, 2017-02-13 at 16:24 +0100, Patrick Ohly wrote:
> > On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
> > > Hi Andreas,
> > > 
> > > 
> > > I think it's feature which was already there, but almost never
> > > triggered (even in test-dependencies.sh tests), but with RSS it fails
> > > reliably.
> > > 
> > > 
> > > See:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html
> > 
> > That's not quite the same, if I understand it correctly. In that email,
> > Richard was talking about "dependencies of that target are not needed
> > and not installed" and used "quilt-native" and "compiler/toolchain" as
> > example. In other words, if recipe foo DEPENDS on bar for getting foo
> > compiled, that dependency on bar gets ignored when installing "foo" into
> > the recipe specific sysroot because it shouldn't be needed anymore.
> > 
> > But the example here is a recipe foo which has a runtime dependency on
> > bar, so bar must be installed in addition to foo, otherwise foo will not
> > work.
> > 
> > This is where it gets tricky: do native recipes have RDEPENDS? They are
> > not getting packaged, so I suppose not. One could collect all RDEPENDS_*
> > values (regardless of the actual package), but that might be too broad
> > (for example, when "packaging" the native recipe wouldn't even produce
> > that package).
> 
> Apparently RDEPENDS do work, also for native recipes. Based on some
> testing, it seems that all RDEPENDS are considered, even those that
> refer to packages that would normally be empty, i.e. the sysroot
> potentially contains more than strictly needed, but that shouldn't be a
> problem.
> 
> Andreas, does adding RDEPENDS instead of (or, where needed, in addition
> to) DEPENDS fix you problem?

... and to avoid confusion: I meant adding gettext to RDEPEND_${PN} in
kdoctools, not adding it to every recipe which uses kdoctools.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




