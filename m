Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0B30F707C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:49:12 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn18so5937437igb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 18:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WPlMeuJEdmbBZH9jpvSQSHwY46ZXsa3nVCd1GxtVi78=;
	b=rkzCk2i3AcbYIcN40BQPI5fMtPlDCtPHRxqRiHRnMcms+A59AvIxtVDlMXvLxcn3v7
	vgo0WMX1YOxqlwy0usklCB2HLpvzYtOytBFGcttuKe9L1URrHwPc9lOBTzAo3HCH1FPm
	IsOrd92NPjFip67NdvhFWjQNdk6yZTU8M/S29i6RkBw1oGbVGgLdmmXUpd1Ni00dJpGc
	xbcAYCTGdbJ76RLl92Nfp8nVrv1h7Hb305Fzwe7sxVuQ9RsN8I/EqTWbL3u0dKxNXQrq
	U9xKbOub6GrZNjy+XLzth0qe4hWVr08qVbwDJLx8NiXsZx/HxwUONp6ZlytOKYECqs3H
	Aq6w==
X-Received: by 10.42.90.74 with SMTP id j10mr7787324icm.29.1406166553478; Wed,
	23 Jul 2014 18:49:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 23 Jul 2014 18:48:43 -0700 (PDT)
In-Reply-To: <20140723185052.74ad39d3@e6410-2>
References: <1406155290-25903-1-git-send-email-ben.shelton@ni.com>
	<20140723185052.74ad39d3@e6410-2>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2014 18:48:43 -0700
Message-ID: <CAMKF1sqy70-p_sJ9waC6yJGxxfcY=Fgbr=DdK6Cv019GM=YNEg@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Make ld.so.conf more flexible
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
X-List-Received-Date: Thu, 24 Jul 2014 01:49:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 4:50 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> On Wed, 23 Jul 2014 17:41:30 -0500
> Ben Shelton <ben.shelton@ni.com> wrote:
>
>> Most modern distros will include conf files in /etc/ld.so.conf.d/
>> when generating the ld.so cache. This change will bring that flexibility.
>
> I was just looking at a patch to do roughly this. Mine added a
> USE_LDCONFIG_CONF_D flag, and then had eglibc's install create the directory
> and append that line to ld.so.conf if the flag was set. I'm not sure whether
> the extra functionality justifies the effort. I would suggest that, if
> this is going to be unconditionally present, the directory should be too.

Many embedded systems dont use ldconfig and we have USE_LDCONFIG knob
to control it.
This should fall under that knob as well.

>
> -s
> --
> Listen, get this.  Nobody with a good compiler needs to be justified.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

