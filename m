Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24417751CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 11:20:15 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id c128-v6so2536938oig.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IfuNcdv1CnB7wRd4XqZH432cBzqMsT5yUvddlL7DqFQ=;
	b=JPlQXKhWG4kQSI40fhLoOWwY1tLRND/5hTgVz8UznYJHUKl4/qhGsB6srVQEtWILBA
	mdUaiTJ7+o5E/XmCvrBwEabVC5EpPWt1XvODE59RNqm7jM0yVYSC+lJbznPr+yaMzMio
	j4jpQHtEI6dJDqW6kka8eF5d7onhnYUFre+mfAQt4Sgtu6qTwpx/vuQcsrTPDfcZ1wRU
	wzrKv+bpF6ssq5Jo0lBdZn8M8oo1ioMs4l5hncPiCC6N+n/s/sBtbxe7OTNT71b0QTO8
	Sn66HxFN/Gjl4SKcP99CIuTqU1mo2aNdqEdEYN2vLzTqPu+Sy5dK7DzPO8t7mUVIokmk
	hOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IfuNcdv1CnB7wRd4XqZH432cBzqMsT5yUvddlL7DqFQ=;
	b=sHLU1jPnFjHvJdTpu5UII/ZBYyA5lVb7Gu5c8zmy1wyFZHt9N4Odih9N0gQeXZR2IB
	RVYbSTK+me9DKTwcdWBKLLx2ailIZRZGiq2M2chjCsGrIRFHUIxACmTWtsnrruyjzpLH
	QNdC3l6HpZLc656keAnC58hAG6L77FzmKspw+yMMHPMS4CeixQITZ/0KB68hD8VBXB6t
	FuFgcPVtjsqf8oTVV03xMplVZxMze4cpcyACWkUOVVs/kHKE56flUttZDI5YvxqGVBKY
	D0zC6ylwjfz5hW+PxycEBr1sxzrK+QPPWN8IGvlOyKx9R/MHLlW/XcGcBXd6GRl5F4qk
	9URw==
X-Gm-Message-State: APt69E0YjY5AUkDGYXXp5UtCZzhHlNbKqEA71n4S6/WR/oxF8rGi7neh
	SLPOXHLRrTEue1Lk7+OMZ1gtei1bsViYVOwKtHFkuw==
X-Google-Smtp-Source: ADUXVKJhQG5Gun+iKDaWJxBJInzMEcB6Rjs6C4Ao+cDeOivkLSoIo2ovSiMYucCEeGhbHP8L5B92HG1UTRYvswgppMA=
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr14836262oig.102.1529580016245; 
	Thu, 21 Jun 2018 04:20:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 04:19:55
	-0700 (PDT)
In-Reply-To: <CA+chaQdwQVw+8e3Vz6pWNpv8_TY4R3vXUgCME=fWeHXBHcw1-g@mail.gmail.com>
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
	<CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
	<CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
	<20180619235320.GN19965@denix.org>
	<CAJTo0LaTOqJ=4qRY+BhktCPj6BgOj2Do1yp9XXtVZcZ4dgBSKQ@mail.gmail.com>
	<CA+chaQdwQVw+8e3Vz6pWNpv8_TY4R3vXUgCME=fWeHXBHcw1-g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2018 12:19:55 +0100
Message-ID: <CAJTo0LbaVbuZW9XS+pjusuH+wRY0Db3KBcGnN73H5aGNQhe0eA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] mtd-utils: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Thu, 21 Jun 2018 11:20:17 -0000
Content-Type: text/plain; charset="UTF-8"

Master builds fine for me, but interestingly I don't see that in my
mtd-utils unpack.  Do you have patches?

Ross

On 21 June 2018 at 12:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> Does this upgrade fix the build failure with gcc8?
>
> With current master I'm seeing:
> super0.c:238:32: error: 'snprintf' output may be truncated before the last
> format character [-Werror=format-truncation=]
>
> On Thu, Jun 21, 2018 at 12:33 PM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Sorry, no it doesn't.  I've just picked this in ross/mut but a
>> follow-up patch to remove that mystery patch (can't see it being used
>> in image generation anywhere) would be good.
>>
>> Ross
>>
>> On 20 June 2018 at 00:53, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:
>> >> On 22 May 2018 at 08:49, Andrea Adami <andrea.adami@gmail.com> wrote:
>> >> > I am just wondering about this patch:we carry it since 2009  [1] and
>> >> > is still marked as pending.
>> >> > Why was it necessary to ignore part of the filesystem? Can you
>> >> > remember?
>> >>
>> >> Make that at least 2004.  This commit in oe-classic touches it:
>> >>
>> >> commit c70605ebdca81412a93b4d867de7931543193f26
>> >> Author: Chris Larson <clarson@kergoth.com>
>> >> Date:   Thu Dec 23 21:24:57 2004 +0000
>> >>
>> >>     Update mtd to a current snapshot, change the mkfs.jffs2 -i cmdline
>> >> option to
>> >>     -I, and rename mtd and mtd-native to mtd-utils and
>> >> mtd-utils-native,
>> >>     respectively.
>> >>
>> >> Prior history is lost to the git/bk migration unless anyone has a
>> >> BitKeeper clone to mine...
>> >
>> > So, does this prevent the version upgrade from being merged?
>> >
>> > --
>> > Denys
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

