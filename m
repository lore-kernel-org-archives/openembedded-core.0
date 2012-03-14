Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S7rdg-0000qv-0O
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 18:05:28 +0100
Received: by wibhj13 with SMTP id hj13so6493156wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 09:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=bgsIeouE8YL9Zjn2+sk2W+i5Cp3xvn+kATlJ+AJNo0o=;
	b=b0r0qh1mgASVwZKP4bzbnRLKx9ltdIVeZWzwlQoA/zBHn80ccmnoKuoftGDob5p8ZY
	5VLbkbSxR7oGgXECV7OB4gAuh0DtcT4YnVu2C7xed0fY+hDBO69QYdDHZsePGfIHckHr
	ZxXxlmKY+SpF41lEUInhnqo5bUD6oPEuPEOOENznYaq+QOfG/F3BotFPBRPORikdvYO9
	EC1Y+HIjTqVp7oRpbCzOTr5yTr/q8QjwgQwwV1k0eIxr6fiKrB0PieT7m2KCvLci5gbg
	E8qhWVhPYGtEfFMv9nCBiASnQcybj27uBbEZOAotyXVOrmcL0kY6WR4zSI/eRiKtJP9c
	vkRg==
Received: by 10.180.94.33 with SMTP id cz1mr8058874wib.13.1331744202426;
	Wed, 14 Mar 2012 09:56:42 -0700 (PDT)
Received: from [10.68.37.6] ([87.111.147.121])
	by mx.google.com with ESMTPS id e6sm50065837wix.8.2012.03.14.09.56.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 09:56:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <db023a254e70a7cb819a6cab3008a666305ceafd.1331742556.git.scott.a.garman@intel.com>
Date: Wed, 14 Mar 2012 17:53:47 +0100
Message-Id: <6E6948ED-51D0-4E19-8D09-E82DB6438AA4@dominion.thruhere.net>
References: <cover.1331742556.git.scott.a.garman@intel.com>
	<db023a254e70a7cb819a6cab3008a666305ceafd.1331742556.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnuLmYUMYJ7Qp9GfUBNoXPv7uyb50M9Yx6Cx/cfysKuM3gJlf7ELAxtLvK/Jy8pTxbvzcJB
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 17:05:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mrt. 2012, om 17:36 heeft Scott Garman het volgende geschreven:

> The recent move of some of the ncurses libraries to base_libdir
> does not work with our automatic library packaging, so this
> explicity creates packages for libncurses, libncursesw, and
> libtinfo.
>=20
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>

This is still missing a PR bump for all the packages depending on =
ncurses. Those need to get rebuilt to unbreak the package feeds.

regards,

Koen=


