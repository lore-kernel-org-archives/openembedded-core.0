Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 32BA76AFC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 15:17:30 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so1118898oag.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5MBh+xeeNMfc9uRQASRLAf87nXAmOKAyAo0s85EJMBw=;
	b=b4RhieuC0f8vNj30S/9/SONeKzt6GYzxlPci/oKGwlfPLglRoU7w4vQpMADRedtUqs
	sN+4rYsfr3H0JES6Y8fR6maH8u1KlmOp9MMPfUVqwJvHSGggMnGS30H4iivtLka4PXdm
	qhpxLFF5fCzDmyuVN3LuysvG3c5U3j416rykWHRKHRACwbYYqZ6C3pi/fTNMtwuHN+eE
	hKgwGv4lCQW+RZI+AWjftYFRRUbVC/Ol9i0j8U2+9fRI59xc2UYBiQE0DI/t2HILG89O
	JtnkPw55fO469w/HEiCHTvEG2/58WRdUhURkNyuG7zfoVl/CG7DyrJuoO5qkVUPtbfxM
	NZ3Q==
X-Received: by 10.50.103.3 with SMTP id fs3mr1006142igb.39.1377098250074; Wed,
	21 Aug 2013 08:17:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Wed, 21 Aug 2013 08:16:59 -0700 (PDT)
In-Reply-To: <BE68E9C8E0850C43B0F0B0B7D57FA5AE2E7FC669@IRSMSX105.ger.corp.intel.com>
References: <cover.1376641437.git.cristiana.voicu@intel.com>
	<f9e441cc3a1beefe5e6463ed1db730f8803af38c.1376641437.git.cristiana.voicu@intel.com>
	<62aeb7c8b74f56c0b8c04956847505fe7d3db0e0.1376641437.git.cristiana.voicu@intel.com>
	<CAMKF1sr5qE0aRvZGxOKisEJd2ZTr2VPXegH2_kCikVSf+L0Q8A@mail.gmail.com>
	<BE68E9C8E0850C43B0F0B0B7D57FA5AE2E7FC669@IRSMSX105.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Aug 2013 08:16:59 -0700
Message-ID: <CAMKF1srh5xG29WrF0KCzQMbq6P2p+7Og6EDT9bmq23_Uc8PCCw@mail.gmail.com>
To: "Voicu, Cristiana" <cristiana.voicu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sudo: upgrade to 1.8.7
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
X-List-Received-Date: Wed, 21 Aug 2013 15:17:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 20, 2013 at 3:18 AM, Voicu, Cristiana
<cristiana.voicu@intel.com> wrote:
> Hi,
>
>
>
> There were some minor changes:
>
> diff sudo-1.8.6p8/doc/LICENSE sudo-1.8.7/doc/LICENSE
> 3c3
> <    Copyright (c) 1994-1996, 1998-2012
> ---
>>    Copyright (c) 1994-1996, 1998-2013
>
>


thanks, we have to be very careful when license checksums change


>
> diff sudo-1.8.6p8/plugins/sudoers/redblack.c
> sudo-1.8.7/plugins/sudoers/redblack.c
> 2c2
> <  * Copyright (c) 2004-2005, 2007, 2009-2011
> ---
>>  * Copyright (c) 2004-2005, 2007, 2009-2013
>
>
>
>
>
> For the next upgrades, I will mention them in the commit message.
>
> Thanks,
>
> Cristiana
>
>
>
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Friday, August 16, 2013 6:57 PM
> To: Voicu, Cristiana
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 2/2] sudo: upgrade to 1.8.7
>
>
>
>
>
> On Fri, Aug 16, 2013 at 1:30 AM, Cristiana Voicu <cristiana.voicu@intel.com>
> wrote:
>
> Also, the license had some modifications in two files.
>
>
>
> would be nice if you mentioned what the changed were.
>
>

