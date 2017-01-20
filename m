Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 09984731C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:54:09 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id l66so63026537ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=+iN4jjAHGkoCVcqihXNSxmcas8duk/wsNE6fRHxFV/0=;
	b=KlbLwGZTk2tv/dpYM+EuqA6cmrnXRCk0RfmAzdei8Zbu2A/QQzLnH8S4Ka+R31xW6w
	kFW07V1y6rsntLoqQJ9qEbtKmw3eXbqZ9TA7lQrwGSA6ghh569uR+DQeFUXsASGben2D
	l4FrEGUIPHBIFE3tk9MLS8f4g3mK514I7z+/aBpnTbtCRsWb+du+cOs/niA+IkaeuopY
	5XBfG5ITHGhDPCvM1ByUkahcElkanKiPqLLwmNj6CZbmAf2yQPtEisbYrIADj2k2nXa+
	AMx1Y68VGHijOBSzuwtHgy3l763ckiKs28esNInb3uQ61UCQBVfJCPOHBnZDNWrIlOOe
	vQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+iN4jjAHGkoCVcqihXNSxmcas8duk/wsNE6fRHxFV/0=;
	b=YhSy2UDQstmG6LUTjrlPTtPvChXdg/rEtfUC50jGD0S5X2Rk5u6NordFyLMxM9Qoal
	ZIT+SKYzvB1ZpZ4kW0kRUerESrdX7THvaW7gsZ5JxWS8Y68oP87j6MOSAdwt/k1Omi84
	D7tQ7uj4kaWbC4i+kSD6pYmDJSAqUtuMwOWV/xLuv2zRIsMF/H0W2mEG01/hgcKUBoO0
	1tXZzhitWi2AZR98sVCc5BkbbffxfzH72lJgZu3Lz8RX0R/Mlf/X2phuLwIiAq1N0d3r
	tv26XfatFzUJ5EOPS7LcGc3giCjHl3BFT61aakEu9eet0uw5/OwKjXlbf8diKZhE/CrQ
	dCJA==
X-Gm-Message-State: AIkVDXIbj+AcHMEpNHBnb2LfRTPsb+v7GU93IG8aFGARnWmLDI8pwoU57ssyulkln2gDK/8F
X-Received: by 10.107.130.35 with SMTP id e35mr15069798iod.7.1484924049588;
	Fri, 20 Jan 2017 06:54:09 -0800 (PST)
Received: from pohly-mobl1 (p57A56DD5.dip0.t-ipconnect.de. [87.165.109.213])
	by smtp.gmail.com with ESMTPSA id u63sm1471084ita.1.2017.01.20.06.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 06:54:08 -0800 (PST)
Message-ID: <1484924046.23233.126.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:54:06 +0100
In-Reply-To: <ef36ec5c696cc690af21e560c82924e5dab51a1e.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<ef36ec5c696cc690af21e560c82924e5dab51a1e.1484921498.git-series.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 02/12] acpica: work around flex 2.6.2 code generation issue
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
X-List-Received-Date: Fri, 20 Jan 2017 14:54:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
> Without this patch, linking fails with a missing implementation of
> yy_scan_string. This looks like a regression in flex, because 2.6.0 generated
> different code that called PrParser_scan_string
> resp. DtParser_scan_string.
> 
> Working around that in acpica until this is better understood or fixed
> in flex is the easiest solution for now.

It turned out that flex 2.6.3 has a fix for the problem. But the github
issue tracker for flex has several people who reported issues with 2.6.3
(affecting gdb, binutils, grub) that we probably should wait a bit
before trying to update to that release.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




