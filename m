Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5937656C;
	Sat,  1 Aug 2015 12:47:18 +0000 (UTC)
Received: by padck2 with SMTP id ck2so56597158pad.0;
	Sat, 01 Aug 2015 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TeujuYqu5Mz/V8oDBuHxZ3CG8XddhzFiZUUX6mCkki8=;
	b=kEfw6NUUusmtPR9AOG0KjV60MRp6+LJrcuFyIJ+Pj6PgWbWsN7wW9Ee93FZ/uIiNo0
	c8GeZG2zAl/XawPwHLJ7slRZw45wgrDNqMqDzehU5V61wATnL5Y5Xr4En4dIni0RQ5wG
	pGySdEZC/LISegPkKbGa1PcEyPZylPMWrUl56OpJo4A9BYHxGDzFEYJEYAFODQCBAEBp
	EjGtn8IERnub4pKiSbhzFtV4+h3nTDxBkuAQX4HDYeFN4n1I7E7WqG2vragp27od0OvC
	vSO11pp0zoBSP65lqsCr2X0KEl4m3QrxgYYEPySnM/PZn4L7PIBjWDjEFTji3XMkkg05
	yOLg==
MIME-Version: 1.0
X-Received: by 10.69.11.129 with SMTP id ei1mr5824952pbd.167.1438433239343;
	Sat, 01 Aug 2015 05:47:19 -0700 (PDT)
Received: by 10.70.65.4 with HTTP; Sat, 1 Aug 2015 05:47:19 -0700 (PDT)
In-Reply-To: <20150730180140.GN2457@jama>
References: <20150730180140.GN2457@jama>
Date: Sat, 1 Aug 2015 14:47:19 +0200
Message-ID: <CALbNGRTeSPxqOvbxVBtDW6aHk7ncB2CUFDRa9WBVAy0d68S0Pw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-07-29
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
X-List-Received-Date: Sat, 01 Aug 2015 12:47:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 8:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> === common (12) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb, do_configure
>     * /meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb, do_compile
^ Had a short look into this: It is caused by update of libgphoto2.
Hope to find time this weekend.
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb, do_fetch
^ Required patches for this are circulating in master-next. These are
still matching while writing this.

Andreas

