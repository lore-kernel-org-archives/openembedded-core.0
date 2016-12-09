Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id C7C14719B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 07:55:30 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id p42so47123934ioo.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 23:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=oA1ebZspg/uufe9h5hZuVwCAIOaEuyeyXgBf5PejXUQ=;
	b=veibBMrgGvOYSJmq0AeZZD1lnvAZosaQwC4LsPcGoPfaiSwQXKY8X3Kp7Kz3V/fPMH
	sqz58tntvHHEVEcRfQfSG0RmMrT0S3oK+jWMcA3zyJGnnfBkyqacQiIsDT/2WLJKSo01
	KgVPCT0HR9enLrNBrG0+HYtKkcVIntmhxp5Nf9uTMj6t3/k1LkNzQOcg87rwLE6MWgqQ
	GZATvRelxe8alSr/Pgy9gye+zCKFYrkPOGT2KXNqPTLLgMX7lj7sIHsaMNdMTp0XcdJ7
	/WbCyOw/1UX7m+FIK1V7mqSKrv2tLUhmnY/riqy7wYUBuN/HJ0JA8Z8GOKW4gGl2cq4t
	XL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=oA1ebZspg/uufe9h5hZuVwCAIOaEuyeyXgBf5PejXUQ=;
	b=UI5uHxuxXC0gEPmhxu8qjuKNgQTodBjoKbWuPwSsP3Dhz18/34zsw4rW+CWHHnoGpo
	bTTq96P1xcaVP6Qd6D7J4Tl/MgRk7w7HlkMlORLvMvHTmMm6AOPw8u7OCkc1CKo635xH
	y3MDwZt8yKvSYq/8hqUw++vUG/keLRGgPrbPEVwZ7roVfOYsf9nomKXvog2Jk3Mzg2Q3
	+ylCCTiZstxA6q507xY+4B7PVGScn4GGPu6k37s3hX8yb//j1grRxiv5DM4ZQdPrwWLK
	YWjKNPETykLU3Ic674yG856RWNkLO8YEJDUB5N0Ovd7cC28r99+Y0GxyBt6vi4YAKelz
	5fZQ==
X-Gm-Message-State: AKaTC00R6EdVGF6UxjY1pLw5VLZFpEGdw7BSV/eedE5If5iYuxNDRS2k1HH1wgywO3SAQEce
X-Received: by 10.107.140.65 with SMTP id o62mr30378936iod.17.1481270131847;
	Thu, 08 Dec 2016 23:55:31 -0800 (PST)
Received: from pohly-mobl1 (p57A56EBF.dip0.t-ipconnect.de. [87.165.110.191])
	by smtp.gmail.com with ESMTPSA id e13sm6807599itd.4.2016.12.08.23.55.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 23:55:31 -0800 (PST)
Message-ID: <1481270128.17535.132.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 09 Dec 2016 08:55:28 +0100
In-Reply-To: <5dbe9bcf-935d-dd2c-1a8e-2a62c569aab8@opendreambox.org>
References: <cover.1480346284.git.patrick.ohly@intel.com>
	<d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
	<5dbe9bcf-935d-dd2c-1a8e-2a62c569aab8@opendreambox.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/11] buildstats: add system state sampling
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
X-List-Received-Date: Fri, 09 Dec 2016 07:55:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-12-09 at 01:29 +0100, Andreas Oberritter wrote:
> Hi Patrick,
> 
> On 28.11.2016 16:33, Patrick Ohly wrote:
> > +    def sample(self, force):
> > +        now = time.time()
> > +        if (now - self.last > self.min_seconds) or force:
> > +            for filename, output in self.proc_files:
> > +                with open(os.path.join('/proc', filename), 'rb') as input:
>                         ^
> this fails with a backtrace if /proc/diskstats is not available, which
> may be the case in virtualized environments, e.g. Linux-VServer.

Thanks for pointing that out, I'll send a fix.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




