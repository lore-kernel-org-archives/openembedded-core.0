Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8AA6017E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 07:20:19 +0000 (UTC)
Received: by oihq81 with SMTP id q81so11636148oih.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 00:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lUDzd50UMzRQH0D6A2Uffl1myVGdninU9vVqFcrgtoA=;
	b=U6bQyDXrX1g5ZLRX0LJ0Zt4S3O4icfpm44MDg4nTWN+uG7ItKcp7bprHLCzOOa3T+w
	NRBRWtRD/QFCBTzo/KGxX0YquBFdi1tCiUx/ZJlNsYbQJBrdRb8lVWhNPlIQ6yr0ksoG
	Bi7tn/l8JwKjulzq0dGoiguhbTUCA0xO6Dq/PisO7Sr/KhyPx8ve/doEvJ9ouK6YjGxX
	VCH26dnL9zzBr66cqqHnTrSExs4tAqZifogmxB7AiaOENNFJLinfzI+6LzW7AYS86eVN
	628acRA/zjX7mCDt0JPEY2bjqxggc6wWmtLw8kNrTPU5vInx+btA4A9anrnCixTynjHn
	bq9w==
MIME-Version: 1.0
X-Received: by 10.60.176.37 with SMTP id cf5mr22108608oec.19.1436599219641;
	Sat, 11 Jul 2015 00:20:19 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Sat, 11 Jul 2015 00:20:19 -0700 (PDT)
In-Reply-To: <CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
Date: Sat, 11 Jul 2015 00:20:19 -0700
Message-ID: <CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Sat, 11 Jul 2015 07:20:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 10, 2015 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 9 July 2015 at 12:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> Parted 1.8 is very old and not supported at all. The number of fixes
>> after it is such huge which makes Parted mostly useless in new storage
>> and disk formats. I see NO benefit in having it and a serious
>> maintenance burden.
>
> I wasn't aware the situation with the old parted was that bad...  maybe this
> should be in meta-oe (if anywhere) after all?

GPLv3 was released in June 2007 and most GNU packages transitioned to
it fairly quickly, so by definition, the pre-GPLv3 version of any GNU
package is now very old and unsupported. We do have a precedent for
keeping pre-GPLv3 versions alive though (a good thing for those of us
who need them!). What makes parted different from the other pre-GPLv3
packages which are already in oe-core?

Looking at the parted changelog, there have certainly been a lot of
bug fixes since 1.8.7 (the last GPLv2 version) but it's difficult to
tell how many are for functionality which would be relevant to a
typical embedded system.

  http://git.savannah.gnu.org/cgit/parted.git/tree/NEWS

RHEL 5 seems to have been maintaining it's version of parted 1.8.1 up
until Jan 2013. RHEL's 33 patches might be a good source of fixes for
parted 1.8.7.

  http://vault.centos.org/5.11/os/SRPMS/parted-1.8.1-30.el5.src.rpm

As someone has volunteered to maintain the pre-GPLv3 parted recipe
(and I'll volunteer as a secondary maintainer, if that helps)
hopefully there would not be a "serious maintenance burden" on anyone
who doesn't have an interest in the older version.

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

