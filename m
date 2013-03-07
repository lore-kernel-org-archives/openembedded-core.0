Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDkDR-0000OX-PB
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 00:27:15 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so1795897wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2013 15:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=To/3LipVPv1I9PmL+zMl4kWTVYR03O241o+xbpvBxf8=;
	b=KjiCjMP+Z2oaolXWzcPOzpiqhEBjtF8n9caUNkyH+bLjuMitwXV40XEHJu8ZWuPFEN
	sQNn8j0KffLqzWCvT0Z5fk2HmTLtec2e84AI6V3kGmb1eraGvlTlhe9c6DP1IgiMB1Gk
	GFjEhvIDpc9WrDbe73OBX/PLSVL6eI18btD+ZC7ghR436NvpmJwzkRYJ8oNcCzV6zFWW
	Am89zuHZ+u83blrxKH+lMN7x9gHHfAB3WRb4M9JJGIcH3C7FT7zcl2n+3fYKFEugY3WP
	/TMrmhQIVfRj50qqql3+EPdnE8yKH8HrMKBylIqv8q9aLuDn4DSTjVlaNQV/VDkJ3TJM
	/qJQ==
MIME-Version: 1.0
X-Received: by 10.180.98.232 with SMTP id el8mr5455471wib.22.1362697841054;
	Thu, 07 Mar 2013 15:10:41 -0800 (PST)
Received: by 10.216.103.6 with HTTP; Thu, 7 Mar 2013 15:10:40 -0800 (PST)
Date: Fri, 8 Mar 2013 00:10:40 +0100
Message-ID: <CALbNGRSbYeb1J=9_w9Y2vFfj6S8D457VOiGrYUNjdTAyFEHpwg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: multiple providers for gtk-icon-cache
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 23:27:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I get

ERROR: Multiple .bb files are due to be built which each provide
virtual/gtk-update-icon-cache-native
(/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb).
 This usually means one provides something the other doesn't and should.

Do both versions create same output?

If yes: why not remove from gtk+?
If no: ??

Andreas


