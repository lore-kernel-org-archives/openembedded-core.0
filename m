Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id F17DE60557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 15:32:00 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id f10so3478573yha.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 07:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nxMakegzqlfPNzLW0aWp0hIKx3T035K6P6mcLdtmXuQ=;
	b=qbTI4pDazcrhasAr4g8D+e+92ptRI2yeZ7M89T7DcxyQ3UoT6gOLiV/uZOaTz/MB7q
	25c3PXIXODLWCbaKnswDrcU0/xIgrbvjZoc7ZqUG6DVKlYw874pgyg31OOOkgdxt2Cnz
	BTACntd0jyio6QMyvSNlRaTeD8XCDDtwZ4J4ZBiRXGf/fez+nSCfbYt7AdrJnoAF+qeR
	OxjDn58koPnxTZ/L4w0sHhxx8QE0bgLvUNlA6rvb8kxu1iYxqVkk4X5skSpkbR1iWT4m
	9s+A/6lqA727GvvyipFSXwMV+CMxsKM5klL2gqh86ENN+hdttHVQWzD6zi0GVFdVA7fR
	zGSQ==
MIME-Version: 1.0
X-Received: by 10.170.160.9 with SMTP id b9mr48310595ykd.50.1415115121093;
	Tue, 04 Nov 2014 07:32:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 4 Nov 2014 07:32:01 -0800 (PST)
In-Reply-To: <1415107447.23396.27.camel@ted>
References: <1415100396.23396.17.camel@ted> <5458C1A5.7060800@mlbassoc.com>
	<CAP9ODKpQmRo-yXMMURRDU8QpSo1fA4vx+wcXFXuBaT=hOgTC_A@mail.gmail.com>
	<1415107447.23396.27.camel@ted>
Date: Tue, 4 Nov 2014 13:32:01 -0200
X-Google-Sender-Auth: YxYGlsMxATlOG4pag2yFTafRu3s
Message-ID: <CAP9ODKpUtRSddg8_x1zpnP1ndEKuz_hxV8w+HiTVK6krU_z-EA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Tue, 04 Nov 2014 15:32:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 4, 2014 at 11:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-11-04 at 10:12 -0200, Otavio Salvador wrote:
>> On Tue, Nov 4, 2014 at 10:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> > Won't this just silently make use of PRINC a no-op?  What about
>> > the users that had their head in the sand for the last few months
>> > but still expect PRINC to have some effect (and maybe don't use
>> > PR server)?  I would think escalating this to an error would make
>> > more sense (and follow other warnings that are now errors).
>>
>> I agree with Gary, move this to ERROR now and drop in 1.9.
>
> Its been printing warnings since May 2013. I tried to merge this 6
> months ago, I was told to wait another release, by you:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2014-March/090169.html
>
> Now I need to keep the patch for another 6 months. This really is taking
> too long IMO. I may well get bored and just drop the patch (and forget
> any other ideas about trying to cleanup things).

I understand your frustration but I think we ought to be conservative
here. People tend to have old layers around and we risk to those never
get PRINC removed if we don't 'explicit' the error for those users.

I think we ought ERROR now and remove it in 1.9.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

