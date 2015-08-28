Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C4E2171633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 18:08:12 +0000 (UTC)
Received: by igui7 with SMTP id i7so21838000igu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 11:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=FwvWiXn+1JzR5So0V+TPzP45bWlPfmms3LqggPaSS3g=;
	b=RBFwP95Sbb1EyCyuCMzcNQlYZ18dPcgt9LIGEwoQ3Rwj1uMuI5/MC6FWIp10GGOCiQ
	nkexa4TtVGo44/7lzwyh8e3jfStf3LJE9Dj8S41UsWCcwzR8yQ1T3H7hkXJuCcV1Tgih
	dfg4toOduOCfEZwsCLWgGrggX4/pxNf48aMQHVCOhTTs0nQ/Hv3F3MKeS2K58ZH1XLgT
	zrkEq34cgx6o9g2NoWQHTDU/U4Q+3pDTC1TygUyOVwKOA9m09Cwkb+A0hq+fw0+pkeWw
	EG6fvnxsEQqa0rUK4ofMqBTkcvVZWTAJNqlt3hqYCR0csTCxfiXM6k5ErPiXP16MW9M6
	bgrA==
X-Gm-Message-State: ALoCoQkJrJ8VgtuOYybhQmi+sAmPv06o2mQb9LnEJOrnVlGK4QK65UyeTrB8M2zprKeemKuSxdar
X-Received: by 10.50.114.68 with SMTP id je4mr4749991igb.78.1440785291651;
	Fri, 28 Aug 2015 11:08:11 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F655.dip0.t-ipconnect.de. [93.232.246.85])
	by smtp.gmail.com with ESMTPSA id 93sm4711568iog.4.2015.08.28.11.08.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 11:08:11 -0700 (PDT)
Message-ID: <1440785288.3006.93.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Fri, 28 Aug 2015 20:08:08 +0200
In-Reply-To: <55E06356.8000607@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<16f26bbb5fa39e399b185cd26fe9205c2e0cc5d4.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1440746955.3006.73.camel@intel.com> <55E06356.8000607@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "Stoppa, Igor" <igor.stoppa@intel.com>, matt.fleming@intel.com,
	leonardo.sandoval.gonzalez@intel.com, ricardo.neri@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
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
X-List-Received-Date: Fri, 28 Aug 2015 18:08:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-28 at 08:34 -0500, Leonardo Sandoval wrote:
> Hi Patrick,
> 
> I do not have much time for a V4 set of patches, but now with all your 
> input I can rework V3 patches on 2.1.

What do you mean with "rework on on 2.1"?

I have some other runqemu changes pending locally (support booting
hddimg), so runqemu internals are still kinda fresh in my mind. If you
don't have time, then I can rework the patch series. However, it's a
side project for me, too.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




