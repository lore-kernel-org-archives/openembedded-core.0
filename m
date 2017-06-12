Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4687178209
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 06:22:49 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id m62so19542884itc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 23:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=BUiHDqiusprYJK5mat/6U0w6dLpL0xVvBFJKkh6H8jY=;
	b=Sa6XbF2TGK5QuXYESwMCatT/T0mcdDFRg1UbY13Hl3lXj2YXb5RM6sRAd0qy1FvSN1
	lZKoombmRmUQ07vScleR/6Jm6/0bJiQBK5a8Mk3KDJDlgQ8T3Mp9qcjn7UZNJ28NnrHP
	cFzgniL+Cn5ka79PGj3XMLabARLC4HkQqaMo3Kblbvl/CseAIsT9Z6kqRgAKGxRg5RXe
	H+3hGmpCAOOeGicVXdtDESpXPb8+S7T9sldnakN4HlA//luSZWvwTybkn/SBNdCXqznf
	Rr8htYEfmeFsNsjS4sjMEpxfbfZ3MKicGEY/cHn05jn51RMqRLzHlJVy+waY99zznBvw
	U7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=BUiHDqiusprYJK5mat/6U0w6dLpL0xVvBFJKkh6H8jY=;
	b=tPp/qN/Xzr0H+ARFSVh4bxjWsL+5MVuJkWb4kFRUIX7iQL17uRhUHd1sfrGyjJIYSX
	fovdcQ+3NnIbLBvTz8r3BSef0eQusTTUnOEipGeVIElG61fqeONLEnlLdvx23pML2eWp
	VjYT7PNHvhtKNm294t5EmSTyAZOFynX8zTfsWjSNUyLb1pcSoRkhUDyCA0glaesY5/SX
	gGdUApSTtbXrpxcX4q3iUlhrGyNZPPvACh2rRMF4MJlAbK5LP0125+NkIv/GDd5r3pik
	Lfoi9Gy+JaH7yu4kHOPhOCcV/cCJDkM5IPOsaAmHVd8gTuzrzu5shx5cMrTM40crahbP
	QrIQ==
X-Gm-Message-State: AODbwcBH73syWyxyII3ABUHuWfvo+b0S6fPI6Up0MffovYqMaNXegVkP
	fRYCEKavJ1wfv389UsQ=
X-Received: by 10.36.141.134 with SMTP id w128mr10178737itd.84.1497248570527; 
	Sun, 11 Jun 2017 23:22:50 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DFA4.dip0.t-ipconnect.de. [93.232.223.164])
	by smtp.gmail.com with ESMTPSA id
	g198sm3666349itb.29.2017.06.11.23.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Jun 2017 23:22:49 -0700 (PDT)
Message-ID: <1497248565.30163.223.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 12 Jun 2017 08:22:45 +0200
In-Reply-To: <20170611184701.GQ28053@denix.org>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<20170611184701.GQ28053@denix.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Mon, 12 Jun 2017 06:22:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-06-11 at 14:47 -0400, Denys Dmytriyenko wrote:
> On Fri, Jun 09, 2017 at 03:04:02PM +0200, Patrick Ohly wrote:
> > As discussed in the "[Openembedded-architecture] Yocto Compatible 2.0
> > + signature changes" mail thread, changes in a .bbappend cannot be
> > done unconditionally. Making _append and _remove depend on overrides
> > which get set based on DISTRO_FEATURES is one way of achieving this.
> 
> Just wanted to confirm that this feature is going to be optional, right?

To achieve "Yocto Compatible 2.0" status, something like this will be
needed. But not everyone needs (or wants) that, so those who don't are
free to not use it, and it is off by default.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




