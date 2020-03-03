Return-Path: <leon@sidebranch.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8757D61940
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 21:23:18 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id 11so5026174qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 13:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0knL87p3wUcbzqblSWfumTPAQ/IQSBoyL/0RBqGdIKc=;
	b=euWaNXDdBaA0qIPdSio0mIWHx4lWQTq2CjcLL5OSh+EdxaxrPmkQQEFTV1MekQIm+s
	WB5/fdrcjq2VpHJOf6BZwonw/25FOvhzO8+nx+ZFLXNvhpgBN21hNE2fYpzHCGnIL91n
	SkQe81X8jaNKYvYUGvDmomHp0lrBZfig/sonXwFD2cge/31/68jRcdWRvUn0A3XbIjQ+
	7a7KCHPZHgG4HKQexHcBAoo5PO4DUfKIstdXIimz4QRQPJ7On68vmsw0Bl7kYNSjVUiZ
	gs2xG7lCZ+7vIaneVhvge4yTShVX0U47JarD54CUmJQJ94xst8MtEyE1gXOZIBTLlHOc
	juCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0knL87p3wUcbzqblSWfumTPAQ/IQSBoyL/0RBqGdIKc=;
	b=j1NI38AkKtqHILo0WCnVBhK2YNqh2+I0oKSXFKl7iQl7al8mvY4c5FvhoqYPGptop3
	7t0uS70qZPPkkDPqZVQKtJvz0Z0ye3LcbFc+dl4iivlyVLzp1f0idHzHL65G/hHEgPjF
	J6hzH11tdGSm1webdMvY+M1OSpv8tj0EiO64WAG45S4hl9izM4ugDzQjrOvzCiNsIPlc
	Q4cTWZD1uGdFpi33l64UmvRSULzanjKmr8k3QINmPLdGg61aPMcUGYU0QcyyWhQW/MyC
	8ycaD/Y+MC5TTNBzhQDFugzswvt4ItRkzF0mLufdH+T5VfgPTURn4XxBURjxXN6Wc5zs
	uKQw==
X-Gm-Message-State: ANhLgQ0wl475aEm7VEaTqMbjCXKUrj7k0/fmgwLBiN6N78IfDBhc+en8
	jmjU10aep39s8lczclWXyZnyBaCSuaV6bAQ/lx9eZQ==
X-Google-Smtp-Source: ADFU+vsDWmPbXiVVI36X6T8BzPZGvQthr7RJtvjfMHZ+e0UXPHnNAt9ua0qKIjHohP+RBIGrGBu5l/l6w0z43gdFWpY=
X-Received: by 2002:a37:7245:: with SMTP id n66mr57056qkc.202.1583270599266;
	Tue, 03 Mar 2020 13:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20200229234742.3780-1-matt.ranostay@konsulko.com>
	<6353532b-aa0e-a005-2589-2e8281863fd5@gmail.com>
In-Reply-To: <6353532b-aa0e-a005-2589-2e8281863fd5@gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 3 Mar 2020 22:23:08 +0100
Message-ID: <CAMjhiJjY-9N=J03XNV=TuAUW+RAxWKfzrmM64rqPv0z_tx70yg@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: freetype: add pixmap to PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 21:23:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hello all,

On Tue, Mar 3, 2020 at 6:42 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 3/1/20 12:47 AM, Matt Ranostay wrote:
> > Add pixmap to PACKAGECONFIG defaults to allow consumers to
> > render color emojis without distro changes.
> >
> > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > ---

> > -PACKAGECONFIG ??= "zlib"
> > +PACKAGECONFIG ??= "zlib pixmap"
> >
> Wouldn't it make sense to keep it off by default and let whoever needs it enable it ?
> /Jacob
>
I would agree, and would also vote for opt-in rather than opt-out for
this use-case.

Do we have a more generic stance on how we select the PACKAGECONFIG defaults?

Regards,

Leon.

