Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QYlem-0008QZ-PP
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 23:05:16 +0200
Received: by pzk36 with SMTP id 36so4399730pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ePjomUWyWUpbwU841aqsBYsiLOD4DB8XFZKWcAMbIXw=;
	b=wXg+/HzRzjtHW3riNB8OEZR1UjualDjySufeLrfP4nhSO+mrtdlP59VX+BLar3XCuj
	LvDcWuFgnJll+OynmO/tgVkJewKK5Gqh8lL2ZVTxdWXyUCJQ1YgIPKDlespiOaBoHVAs
	5oLWWRW1QfT3mDuI9VPzNDVmsM0JOlf30ksZo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vMw2B8pdWoof+2/gsmdeurGSqtkAn5tVH2Jt0hRGqc30vzRZGC2ROOhIGAir7CKgtK
	6qLalpI3lm38SE6GnjQc0k6dnNn/v/etmWpQGgRKgyazm6RWxzhoRS1Gpn7y1QqRnVE6
	btxfxWryap7RKFeKFqX1l5VLmm7B+0gV2WZc4=
Received: by 10.68.32.66 with SMTP id g2mr2772032pbi.26.1308603700382; Mon, 20
	Jun 2011 14:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.195 with HTTP; Mon, 20 Jun 2011 14:01:10 -0700 (PDT)
In-Reply-To: <4DFEA6E4.6060108@windriver.com>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
	<9A9B307C-87E6-445D-9432-739EBF04090F@dominion.thruhere.net>
	<4DFEA6E4.6060108@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2011 14:01:10 -0700
Message-ID: <BANLkTiknBxHhpfuJJaFkDx83CJamSZr2EQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6 V3] Share gcc work directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2011 21:05:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 19, 2011 at 6:48 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> How does this interact with rm_work?
>>
>
> The rm_work does not delete anything in work-shared, I think this is fine,
> otherwise the source can not be shared.
>

it also limits the possibility of patching the sources differently if need be.
Can it do that easily suppose gcc intermediate needs a patch for a given arch
and others don't then can it make gcc cross intermediate not use shared source


