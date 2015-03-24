Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3C173BD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 03:05:14 +0000 (UTC)
Received: by iedm5 with SMTP id m5so51167584ied.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 20:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MRYOqxQ8Wu6h0ipA1u3A69ut6zQJdTFIm0scdk/spIM=;
	b=ojPuL7ft56jf892agGXBM0OGrP7Ab482E9B0VAiyjSiib1wXoHcOMZBGJzDf5QEBhe
	fg7w0ydbxF6WK0hTKqRBRV/5Dkf9FU+c7qoV2IY0+GQwnKU4AevygwUAxpR57XaNY78k
	GAOT89SHSnoX4Tcgo4w8qRRD+s5Ym0XViSWacW3U19Ue3y5uqh6CRgIfoWyi7xJt0D9c
	/XbcWtENFYyXo5CuBxt0lVxURyI3lwFEn4vQHt56seZG7YjLBLRtWNQ3eGcAovxOyY1x
	Xzd2DyCKQ0wPszmKRMmCKYkll2VZ+MxnGX/FqOfjoYPAS1MAwg2D0G6vX+jRNr57bsfU
	dN4A==
X-Received: by 10.50.112.98 with SMTP id ip2mr18761181igb.15.1427166315809;
	Mon, 23 Mar 2015 20:05:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 23 Mar 2015 20:04:45 -0700 (PDT)
In-Reply-To: <0F5768A5-BBE1-491A-8C22-3CDF941D8654@gmail.com>
References: <1347436503-17966-1-git-send-email-raj.khem@gmail.com>
	<CAC1BbcR=K2mc7Z94+wpoWKCwzCzGqTfMuV2PQYU3u04TGZgmqQ@mail.gmail.com>
	<61B03CA5-4945-49E7-9463-87CEADB22C67@gmail.com>
	<0F5768A5-BBE1-491A-8C22-3CDF941D8654@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Mar 2015 20:04:45 -0700
Message-ID: <CAMKF1sqzvZxTM-7arVxkia_XK4+6UXwkWqL+qK7NDHzgc0BdqA@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc and uprev SRCREV
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
X-List-Received-Date: Tue, 24 Mar 2015 03:05:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 4:28 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On March 20, 2015 7:36:49 PM GMT+01:00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Mar 20, 2015, at 6:07 AM, Bernhard Reutner-Fischer
>><rep.dot.nop@gmail.com> wrote:
>>>
>>> On 12 September 2012 at 09:55, Khem Raj <raj.khem@gmail.com> wrote:
>>>> This patch is causing systemd based systemd to not boot
>>>
>>>> meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>>>> ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321
>>++++++++++++++++++++
>>>> 2 files changed, 324 insertions(+), 2 deletions(-)
>>>> create mode 100644
>>meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
>>>
>>> Khem,
>>>
>>> Do you remember what exactly this was fixing?
>>>
>>> I don't immediately see how reverting it makes sense..
>>> Many thanks in advance for a hint or reproducer or instructions on
>>how
>>> to reproduce!
>>
>>just remove the patch. System use to hard lock during boot. you will
>>not miss it.
>
> Cannot reproduce this on current OE with qemux86-64 -smp 22 kvm nor qemumips (no smp as that just hangs before or early in the kernel) both sato images. Nevertheless I have reverted this now and will redo it piecemeal.
>
> Sounds more like a since fixed (?) systemd bug or something.

its possible, but before we put a lid on that try it on arm

>
> Thanks,
>
>

