Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5160177109
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 15:05:55 +0000 (UTC)
Received: by ioii196 with SMTP id i196so92426723ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EUkVCICvZS+3lYYUU7BH7Ui+9ayI8aWzwuyKNB+MZms=;
	b=tRKDxf0KyLe4fSrCVn2ZLGXcd2FnVnzho/PtCRnNqNxgEXbebsOBvoCMgzSMB6ujsS
	wEvG0qo6WKUK53zpD4JY8i4BH2rS8KZywUdDCMmACfXxizhJwDLbaZIVdv3W0M54DZ9H
	9D1Q+345YN914+fSoLVpY6QNq8liPJB9lePRiTL5sj2Cg4KrUlugDrwP59rEB8+AR0F9
	8/Qjot6sJGpN2X8i47pSStTKvP1Vn3GVHHuLeMLKohdDG5Ax4hipBXDNjd6Cx3AbUCaw
	e6un33d8+kMZQL9TnuToyQpO0rSUDRGKhUIZs0vlL/0YklRA+RccBr2oAjtrz72DmsAj
	CM/w==
X-Received: by 10.107.34.149 with SMTP id i143mr12324256ioi.195.1444921555142; 
	Thu, 15 Oct 2015 08:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 15 Oct 2015 08:05:25 -0700 (PDT)
In-Reply-To: <20151015110817.GA2588@jama>
References: <1405530244-16849-1-git-send-email-Martin.Jansa@gmail.com>
	<1444821692-31980-1-git-send-email-Martin.Jansa@gmail.com>
	<E583B37D-93A8-4D9E-83BC-B158FE9B5B00@gmail.com>
	<20151015110817.GA2588@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Oct 2015 08:05:25 -0700
Message-ID: <CAMKF1sqiQmF5BGe0r_vL0mKG_--rhcCP5hA_o9LR=ravYfzqWw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icu: force arm mode
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
X-List-Received-Date: Thu, 15 Oct 2015 15:05:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 4:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 14, 2015 at 11:40:35PM -0700, Khem Raj wrote:
>>
>> > On Oct 14, 2015, at 4:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > +# http://errors.yoctoproject.org/Errors/Details/20486/
>> > +ARM_INSTRUCTION_SET_armv4 = "arm"
>> > +ARM_INSTRUCTION_SET_armv5 = "arm"
>> > +
>>
>> would it make sense to have it for armv4t and armv5t only
>> since thumb may not be possible on sub arches without 't'
>
> I don't think there is override like that and setting it for arches
> without 't' does no harm as it's set for them anyway.

it doesn't, it would be more expressive if it was there but no big deal.

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

