Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4B48060125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:54:14 +0000 (UTC)
Received: by iodv82 with SMTP id v82so53769144iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Y9miAUDxV1LSZiUhd1k3mVpPhvU4s0oPD14cUWuU2p8=;
	b=Dmopj0LE1bvY2FreXY6/mgoV8/3WdYUZlzIlhpKDHKYsNmBshAocgPSCzoEO4zH5wY
	4jwD0uvJBp2dMVJIWHiIZ9UQvonq4D7tH3OAezruo4OTYMhJp3Pdu/ljPxupc9x9obyk
	AKpeEI3epAYZQvIytHrgFaJiLhN19fCA+dXINDdGVltirMoZgXzdX05QXTRevEJyfl0/
	YEj/bsUbP6fztNw6jy4TqGDYW5eRDwkSt+cL6RowYEOD5ICln9BzNjeMEKUAoatFO32n
	KwXp85pBVCiBZFemX/bU+t/e30f3/WxHOpDiDrL5/zRlg99aHQs9uVCkshJ1NCypiSat
	CsIA==
X-Gm-Message-State: ALoCoQkozClzz+HKcLHUWayrblCPnd420IK3LvsKt8VBP79uGmomD/6Lxgho2ierTsn97iMPcnrb
X-Received: by 10.107.29.70 with SMTP id d67mr3474109iod.27.1444827254831;
	Wed, 14 Oct 2015 05:54:14 -0700 (PDT)
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com.
	[209.85.213.172])
	by smtp.gmail.com with ESMTPSA id t2sm9045891igs.18.2015.10.14.05.54.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 05:54:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so111538916igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:54:13 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.12.39 with SMTP id v7mr3834874igb.46.1444827253598; Wed,
	14 Oct 2015 05:54:13 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 14 Oct 2015 05:54:13 -0700 (PDT)
In-Reply-To: <CAHiDW_G10f50vzvQGWvnCc=2ztB0QLLTNrxDMLB-K9p6Wd=KUw@mail.gmail.com>
References: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
	<CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
	<CAHiDW_G10f50vzvQGWvnCc=2ztB0QLLTNrxDMLB-K9p6Wd=KUw@mail.gmail.com>
Date: Wed, 14 Oct 2015 09:54:13 -0300
Message-ID: <CAP9ODKofedBS83=fKmPk_GyfV09UTUPRDxcCPgy7dAtozjsSUg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Wed, 14 Oct 2015 12:54:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 14, 2015 at 4:31 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 14 October 2015 at 00:42, Burton, Ross <ross.burton@intel.com> wrote:
>>
>>
>> On 13 October 2015 at 22:32, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>>
>>> This includes a forced rdepends on libgl and I see no reason for this.
>>
>>
>> Mainly because gtk3-demo will link to libGL.so on startup.
>>
>> It would be interesting to see what happens on platforms where libgl.so
>> isn't available if you remove the dependency.  If GTK+ handles that
>> gracefully then we can make the rdepends conditional on DISTRO_FEATURES.
>
>
> If dlopening libGL.so.1 fails, gtk3-demo will not run. I'm sure it's
> possible to patch it to fail gracefully (after all GL is only needed for one
> demo out of many) and I would guess upstream would take that as well, but
> for now I just did the minimum required to get the current dependencies
> correct in the recipe.

In worse case, it would be a RRECOMMENDS. Anyway fixing it seems the
best way to handle this IMO.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

