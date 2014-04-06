Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id A3B3D6E79A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Apr 2014 15:42:57 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz11so2865911veb.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Apr 2014 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=8Kq7+HB9oU9NMACnOEYW6ulDbCYUlJZAlh2AhPmY1mQ=;
	b=gGtW3Yi1byFabco93O45rv+umm8Ymhu4oO88DCxA/QGiLxi9FCM6F56NSQpQ+tpJqr
	vqdzAr+Riz1G+OCQaSgIwxwxvhjcpLjzfUHkx53bLFgIum8ILZ8P2ycyXK9yMKe4DDFF
	6rC3WERI2Ql04V6vUvTbrAgl/EYvovlfaQV4qJ0soyyuLc6jg2Ic+/oHX4dw2TTLDWFj
	Hluz14o4I3O0laOz8k2eAHlBXP9mU/hw86cf1aFjjIDbyjEzR82ceVMBhzGDMgU+TELd
	2nY5yGTnn8tOPtkXKIYcGlnpIghDDfQTnf/TW6WkCodMvYmxRKtvT4N16hc8blOmz/n9
	dsJA==
X-Received: by 10.58.96.36 with SMTP id dp4mr1711880veb.21.1396798977702; Sun,
	06 Apr 2014 08:42:57 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Sun, 6 Apr 2014 08:42:17 -0700 (PDT)
In-Reply-To: <20140403223234.GH2132@jama>
References: <1396313895-21200-1-git-send-email-denis@denix.org>
	<CANyK_8cu-czs-qmB1PJHosLt-TYnmu=u8F9J9ip1MmVZuE7zVA@mail.gmail.com>
	<CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
	<20140403162312.GB3370@denix.org> <20140403223234.GH2132@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 6 Apr 2014 16:42:17 +0100
X-Google-Sender-Auth: NCarEu_s0j6vryVCbOLOGZUip7c
Message-ID: <CANyK_8d+pAHXhtdPUYVaZNJe+eOnyATd9cCWXHxgG3mVxrbeeA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [dora][PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Sun, 06 Apr 2014 15:42:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 3 April 2014 23:32, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I haven't read whole discussion, but the idea of adding just one needed
> patch from the repo into oe-core metadata seems reasonable to me (unless
> someone wants to create dora branch in opkg-utils repo and cherry-pick
> just that one required commit there + update SRC_URI + SRCREV
> accordingly).

I'd rather not keep a 'dora' branch in opkg-utils as I'd like it to
align with opkg and be independent of which build system is being
used. I think putting the patch into the dora branch of oe-core is the
best way forward as the change in question is tiny.

>
> It's imho better than creating new "less-tested" combination of all
> changes from opkg-utils with only some changes for opkg-utils recipes.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

