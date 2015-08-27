Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9827076DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:43:50 +0000 (UTC)
Received: by iodb91 with SMTP id b91so46377575iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 23:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=FGEZmJcaF9hRDdzDtGMc1OO3PY4Z8Lurf4EYpUp5Zao=;
	b=YV3BUhOuJB1Y3pCit+78jnbFp5FhQbMl6ZTZ4d94WXaiN0LU3YmS1OcKNoo6Rlux8x
	AJ10lflos+0kNa6RF7mVuK3fpFt+btmWnEHL18HSlJtYrZ4OLfJcH1umNHrW/NS/2VgZ
	1cfycljQwBBvlJvhB1fjKbUq/gUr6bWuy8Tu2m0Z37FIa7aDQRSAvh8cJJkm8lUaqjND
	NnXWrkOqxubxWLmXnb+Jpai06+bMwAgkXCljfGT2zdl0gEF8A0Enwc2YMgvYqdTsDG6v
	csqDcP3BrFBz5dA7tmYZSXjp+rBqTKs9+8UZ8YviNAkxALFHOioYapFZRvHIjgJcSTXM
	QopA==
X-Gm-Message-State: ALoCoQm4aAjrXc8xzTlDnObIWId+Z5R13JuRlIpqg0kSOqUltgQutmY8p1KyXhK506/mMLyxu+w+
X-Received: by 10.107.27.148 with SMTP id b142mr9490042iob.114.1440657830533; 
	Wed, 26 Aug 2015 23:43:50 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2EE.dip0.t-ipconnect.de. [93.232.242.238])
	by smtp.gmail.com with ESMTPSA id j3sm1148366ige.0.2015.08.26.23.43.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 23:43:50 -0700 (PDT)
Message-ID: <1440657827.20082.26.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 08:43:47 +0200
In-Reply-To: <CAMKF1speSYjijUeuHAyVXRQf5DQtaWsCRjZ3=02dXPOeOdRb=g@mail.gmail.com>
References: <1440605035.20082.20.camel@intel.com>
	<f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
	<CAMKF1speSYjijUeuHAyVXRQf5DQtaWsCRjZ3=02dXPOeOdRb=g@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Thu, 27 Aug 2015 06:43:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-26 at 12:16 -0700, Khem Raj wrote:
> 
> On Aug 26, 2015 9:11 AM, "Patrick Ohly" <patrick.ohly@intel.com>
> wrote:
> > +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
> >
> Do I see a spurious " in the middle

The one in bb.utils.contains()? That is there intentionally: it's for
the "xattr enabled" case, in which case nothing gets added to
EXTRA_OEMAKE.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




