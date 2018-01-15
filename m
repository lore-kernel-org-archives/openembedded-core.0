Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id BBC61780F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 17:53:22 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id b8wjemgcrynkRb8wkeXIdO; Mon, 15 Jan 2018 17:53:23 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=TpjIegfh c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=RgaUWeydRksA:10 a=mDV3o1hIAAAA:8
	a=x_4S4TtC-lCuKaIcevMA:9
	a=CjuIK1q_8ugA:10 a=hG5dX1DpXTEA:10 a=7BCCZg03jq0A:10
	a=_FVE-zBwftR9WsbkzFJk:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1eb8wj-0003qa-KW
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Jan 2018 17:53:21 +0000
Date: Mon, 15 Jan 2018 17:53:21 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180115175321.r7sfuxibr743icio@mcrowe.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfI6fkQlXrq8iZ5KYNV2/5ZaX/br661bftmx1+SENM1UjgbchsmCT/XGH0v5IYdxi40o8dkSbYT3wvx/+JY+hH4n0gG2s6tWDrL3XbvCzCZleDOIMwo3r
	7D+UwQRdleSexaSMbAkZDLcdFwPqUFTralwM3QwdQGJxco7JvuHLMCxB
Subject: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Mon, 15 Jan 2018 17:53:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If I add USE_NLS = "no" to local.conf, then glib-2.0 fails to configure:

| checking for ngettext in libc... yes
| checking for dgettext in libc... yes
| checking for bind_textdomain_codeset... (cached) yes
| checking for msgfmt... no
| configure: error:
| *** You must have either have gettext support in your C library, or use
| the
| *** GNU gettext library.
| (http://www.gnu.org/software/gettext/gettext.html)

It seems that glib-2.0 does not support --disable-nls and always requires
gettext.

I can avoid this error by adding gettext-native to glib-2.0's DEPENDS, but
I'm not sure whether this is solution would be acceptable.

Is there a better way?

Thanks.

Mike.

