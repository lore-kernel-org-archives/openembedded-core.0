Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1B967615EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:18:33 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so1256807pde.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=XTZ9EDxZ1XT+8i0OAJy3DrRYf7z3wNKI4Uw0OIHZ0D0=;
	b=Ej4OdGbjMoo7p0/2LeonJQL0HzHZeoygHHKZkifpTBnSOaEUilSGVcdsd30TGT/KJQ
	I4BcosBBy0XuWYnLh/Qw9jtC+ud6sSH6frfWPPxyckU53r72NiZf/RghTiobsXnnseYf
	SWUlBOPjMRTkvdG3eIGaILcpD6QKYYHAH0goZZX8T4vAdM3WXliFDiXSI+cc6uP6lC2F
	SEi55AVRzbB0EaGxzPiMiLAbq5AiW+JnwRkolhnJ1aSIYxIM2is90tNsTqJY329vLlyr
	uADnqLK4mcfpspKoh8CzBrlT9rWip2Jx8oqO80e3Dta4GIU7fIWpzIhRH7CzIRZow8s1
	OmRg==
X-Received: by 10.66.155.69 with SMTP id vu5mr6770017pab.176.1378354715229;
	Wed, 04 Sep 2013 21:18:35 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	mr3sm32567212pbb.27.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:18:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZKRmPzCGxh_DzTx+AHgGMFWybg0UvMNjZrP4jEW3D0-w@mail.gmail.com>
Date: Wed, 4 Sep 2013 21:18:31 -0700
Message-Id: <791FC990-6EFC-4F2D-92BF-F0D92BFAAD58@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
	<CAJTo0LZKRmPzCGxh_DzTx+AHgGMFWybg0UvMNjZrP4jEW3D0-w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 00/20] Add python 3 support
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
X-List-Received-Date: Thu, 05 Sep 2013 04:18:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Sep 3, 2013, at 9:59 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

> On 27 August 2013 18:15, Khem Raj <raj.khem@gmail.com> wrote:
>> python3: Add recipes
>>  python3: Add native recipe
>>  python3: Upgrade to 3.3.2
>>  python3, python3-native: Consider OE staging installation
>>  python3: Fix host include contamination issue
>>  python3: Fix the compiler invocation and linker flags when cross
>>    compiling
>>  python: Add Patch description and status information
>>  python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
> 
> For bisecting and clarity, why can't all of those be squashed into
> "add python 3"?  I don't see the point of merging a broken Python 3
> recipe and then six required fixes.

I have squashed all of the above patches into 1 and posted a V5 series.
Let me know if anything is still unsatisfactory

Thx


