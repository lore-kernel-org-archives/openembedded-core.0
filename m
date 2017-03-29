Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id C0CB860190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 11:19:11 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id e75so88666307itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=FQcEKYE0zjmcjDUuJT4ykaL+RzXXvd6lXNCk3xfFBMk=;
	b=JMtGZh8PEXo4v7FL//gG/KHI6w1zrh9Bg0WrInHQkkh0w2KdcMMmsr5C3HQI3fwGpw
	ipnbWlMoIC2Xy3pnG3YoXGSTxaM9cZ/1MvM/0A3yXv5qnWwI45t98xdpjEEAFx6g8Q38
	9F0CnWKUZ/GcJRJ57yokGq1rV6jqL5y6okzPKPwN4BEd1GK8S/ps9K7q+DfPTxu3WvnM
	Gqcpilm4tNekIk/vWj23pPBtzdaiMdNbqaRMFZDX/ozC4vvm58dmSn5O+UT2dFrgc/Od
	jbUGEyx60bRb+/bmoz8os7C+Vs9u38h7f6ygVIS+yAkPUJCDB2WrxbCbBSn8Un+g+cpz
	RJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=FQcEKYE0zjmcjDUuJT4ykaL+RzXXvd6lXNCk3xfFBMk=;
	b=N2R37ubydq4cclsCDrzcAh/byMWT+s6BIHq7TgT4sNlaQQ6uFAzGr9q3NQwIlcrXbt
	CSBBco/vhs3FovsLgQU5/crauNoGwR8lrrGm0pMPtloFYvKqj5S7sKmJDYtdpxbha7Fy
	NvPSMJ/uIoup9AmfVC5AelnDEryK19p1K7D1FQ6DFxfi4vWOuv82qrUzVCabpq4U1o18
	k45cyCCaF7j+BwBbDKXflID/Cb4+ldE6gj6kp6qLU2j/Cffri84N9UhdJYObPPbBrLnL
	Zyh9FbTQtvMIeC6ANPUzoU2SzyDSwJic44eODkt9HoMB4i5VhrOZhlzMAo94Jly5h3ch
	pbOg==
X-Gm-Message-State: AFeK/H2lKmvSidTI0VNcTn7Zx0vULozN7QEB3hhF0t1V+dktPLigBxCeiMd6j2dGRK/7kRbt
X-Received: by 10.107.162.76 with SMTP id l73mr181860ioe.1.1490786352818;
	Wed, 29 Mar 2017 04:19:12 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D6D7.dip0.t-ipconnect.de. [93.232.214.215])
	by smtp.gmail.com with ESMTPSA id
	o72sm3168449ite.10.2017.03.29.04.19.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 04:19:11 -0700 (PDT)
Message-ID: <1490786348.6396.415.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Mar 2017 13:19:08 +0200
In-Reply-To: <CA+chaQcd7Pa-w7zWLLbck1Xu+r0t3udzLf0tJQqrkgSzCu+HZA@mail.gmail.com>
References: <20170329072316.GA3298@jama>
	<1490776523.6396.407.camel@intel.com> <20170329091444.GB3298@jama>
	<1490780318.6396.410.camel@intel.com>
	<CA+chaQcd7Pa-w7zWLLbck1Xu+r0t3udzLf0tJQqrkgSzCu+HZA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-03-27
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
X-List-Received-Date: Wed, 29 Mar 2017 11:19:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-29 at 12:14 +0200, Martin Jansa wrote:
> > Can individual recipes choose to be built using the normal ld?
> 
> 
> 
> yes, see example in:
> meta/recipes-bsp/u-boot/u-boot.inc
> 
> meta/recipes-support/libunwind/libunwind_git.bb

Thanks. I'll try to do something similar.

> but it was working with older binutils, so maybe worth tracking down
> where it got borken.

Before my OE-core fix, it was always using /usr/bin/gcc and thus ld. Now
that it actually uses the compiler intended for the target, it ends up
using gold, which fails.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




