Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id D44416B1A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 09:09:28 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 14so298616vea.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 02:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6yO0aoFq2PWNFX1yY23vpzVAUX0eC3qqaPLctEb276E=;
	b=gR3aCCyUclT1H+i6EW8th6FOxVv28R+cgJwTXgLveUQhYfsBgpRmiRbm1sgEMghFg5
	UVUViDs65hjuNTZZrzCXdiwVOl02970jjNDcE/ObfwsxooY7N5jysKfGOCieqB60rNWB
	I0/lpJdGiaJ0EdhrnU9qx2/6EKvp0Py7o6N9LOjo6pe/ZVaxmrjPLmdzgQkDGJiptVw9
	c+wmDb/6PA7yafKOJerleKOBG94dHe4Y5Cgoo8iuwgyh/o7ogsVbJ/Hv7poHiTpIekp+
	fqYwodZaIZ+WyiVmqTLWAC/HdTgqtE1oA9DeuVKxMA1d/B1CG3+HVZFIggI0hkpYy9Bn
	S6Kw==
X-Received: by 10.58.219.232 with SMTP id pr8mr134435vec.80.1373965768977;
	Tue, 16 Jul 2013 02:09:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 16 Jul 2013 02:09:08 -0700 (PDT)
In-Reply-To: <51E46A13.6070506@linux.intel.com>
References: <CALbNGRQZe5Qso_hK3BPUi3qEbRaq+1t-as_E1LsGSf8exUnV5Q@mail.gmail.com>
	<51E46A13.6070506@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jul 2013 10:09:08 +0100
Message-ID: <CAJTo0LZYhHvSaoyzPu5fz8Zwh+uhshDyE12NfEaWfWZRrF_WPQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlJ/0YAVnUT8Zu+VVEXGy5pSkUxh5uDm+MWcKP7Tu60bCWzoDOAxgIDI+Cq1jqfX3x4jd+4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gdk-pixbuff-xlib missing
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
X-List-Received-Date: Tue, 16 Jul 2013 09:09:29 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 22:30, Saul Wold <sgw@linux.intel.com> wrote:
> I believe that this is because the original recipe was defaulted to
> --without-x11 and the person adding the linuxstdbase code just preserved the
> behavior
>
> It seems we should really make this a PACKAGECONFIG with the PACKAGECONFIG
> using the linuxstdbase override as default.

Libreoffice, bastion of all deprecated libraries...

As gdk-pixbuf-xlib is a separate library we could build it based on
the x11 DISTRO_FEATURE, and put it in a separate package.

Ross

