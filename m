Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id EAA2D60E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 16:34:54 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so972566ykb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MZExgq+iC/f0hnA1P88A2fM4s0DwTpKqvrUVrnbqrAQ=;
	b=zaRvpVyja72tGs8br9ybz2bajGo/c+wyYXd3/ztapimcS8lCmAjtEcSHm6cOuNlBe6
	WduPxBSRLFY+jQa2UNp7g4CmC0WQ4Ph9z/OvXTQml1otYS5wT2GljkDe6sMiXuzOO4lM
	QBg9X99n/4VyT3z5OjOskmczq6iTV1JQ8ebtRszaXTmSqkj5vQVg1Z2OQSUdBXczBRBU
	hAE91/aOcsekUwjA9Gs6/CO8jxbtcIUSa4QK3oN7p5kYzRprzPhPA8YjuCdx1BeQfDIE
	ydJrCZWbxT6SD3q3jwlQKGqm1TOGFAOIWp9Vs6Ewk7JZf8frFdeTcFNKp+qS+/eE34nA
	FExw==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr51491256yhq.14.1395851614669;
	Wed, 26 Mar 2014 09:33:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 09:33:34 -0700 (PDT)
In-Reply-To: <CABcZAN=qBmEp4nzWwKc0=3_sb_oPk1mUWqP-M3Y8tQ6xRZJB0w@mail.gmail.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
	<CABcZAN=qBmEp4nzWwKc0=3_sb_oPk1mUWqP-M3Y8tQ6xRZJB0w@mail.gmail.com>
Date: Wed, 26 Mar 2014 13:33:34 -0300
X-Google-Sender-Auth: GzhIb9agLrfGcaMEqseLvuhsv6g
Message-ID: <CAP9ODKo+iWPY0Mb9ptxmhVBXCO5czW=dMC9839DaTU=fU3cDsA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>, Lauren Post <lauren.post@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 16:34:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Chris,

On Wed, Mar 26, 2014 at 12:40 PM, Chris Larson <clarson@kergoth.com> wrote:
>> Last time I've asked for bluez4->bluez5 upgrade path fix on target I was
>> told that it's not supported and bluez5 isn't drop-in replacement for
>> bluez4 (yet), did that change already?
>
> Afaik libbluetooth is API compatible, but the dbus api isn't. I haven't done
> much runtime testing, though. So I don't think virtual/bluez is an
> appropriate name given they aren't 100% compatible bluetooth implmentations
> across the board. In meta-mentor, we moved to a combination of two
> virtual-runtimes (for flexibility, to facilitate replacement not just with
> bluez5, but also potentially with a third party implementation, two
> virtual-runtimes, one for hardware support, one for the userland bluetooth
> stack, (and potentially others in the future)) with a virtual/libbluetooth
> build virtual, and then you need to ensure obexd/hcidump are left out of the
> build, since they were merged into bluez5.

I did a look in meta-mentor and I think the interesting commit is:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?id=1444d8b0d3617bea503e498150e558abe5b20114

and a blog post about the API changes:

http://www.bluez.org/bluez-5-api-introduction-and-porting-guide/

and an issue in Fedora, which might help in the migration:

https://fedoraproject.org/wiki/Changes/Bluez5

I don't know if someone is tracking the packages which uses the D-Bus
API of BlueZ to be check if there are available patches for it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

