Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0273D6AE6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 21:10:37 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id gf11so9571309vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=HdUr0TlCKJcJ8uqMk3mNRDPSAaaKOT4+tBlNvPuRc5U=;
	b=ezTofBJOYt6AUfZm9g0DEwPZlYOhWOzPNxnS17NyuCVxCRfJA82Tqx+KxPdixHcJCB
	g77+YKCu6r9c6/pdTCn1QlAmea6kKcPIGmyLGwg86HghxGYykly2RArvwjxBz2MO9lzx
	Aaitv93EULZhgdeK5neLPjbNgwD2NUJCHkmew0bU64sF7DGKQ3+HQecQj6cYBjfFALSB
	OOqtLqU4rZdA3os0zUzkBU2NlZlOQXT/7PfjsG6C0kGXnLI83XhGJQ3bjf3rDIyVmUGB
	EZxFKliEH6Ipl1FdorTt9ON2sw5srnICHnZQQR+8akGonfi0E/jAvvB+sTBZOzWMAkyp
	u5FQ==
MIME-Version: 1.0
X-Received: by 10.220.79.73 with SMTP id o9mr29086449vck.78.1373922638604;
	Mon, 15 Jul 2013 14:10:38 -0700 (PDT)
Received: by 10.52.236.136 with HTTP; Mon, 15 Jul 2013 14:10:38 -0700 (PDT)
Date: Mon, 15 Jul 2013 23:10:38 +0200
Message-ID: <CALbNGRQZe5Qso_hK3BPUi3qEbRaq+1t-as_E1LsGSf8exUnV5Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: gdk-pixbuff-xlib missing
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
X-List-Received-Date: Mon, 15 Jul 2013 21:10:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi

while playing around with libreoffice, configure complains for missing
gdk-pixbuff-xlib.

I checked: although I have 'x11' in 'DISTRO_FEATURE', gdk-pixbuff-xlib
is an empty package.

The responsible lines in gdk-pixbuf_xx.bb are:

X11DEPENDS = "--without-x11"
X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11',
'--with-x11', '--without-x11', d)}"
X11DEPENDS_class-native = "--without-x11"

I got two questions:

1. why not
X11DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11',
'--without-x11', d)}"
X11DEPENDS_class-native = "--without-x11"

2. (maybe this answers also 1. - but I would like to understand): what
is linuxstdbase (image) about

enlightenment appreciated

Andreas

