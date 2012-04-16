Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJmW0-0006bH-E6
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 16:02:48 +0200
Received: by wgbds1 with SMTP id ds1so7271348wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 06:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MdugOu6Gc5Pbadt/dh/RHz/RT48GOo/cA9H0mHUvryM=;
	b=OXKjQ0EWGFnGgdHcHTl2lj5gU63FVTdDm+VATlMB8YBjUj1Zv9Nn1HoLFY63jIPZEH
	f+AmvN+jgsAR7ipgpRtX+uZ0KjDQ/ddp4QO6jYyDX/9K+MpTHsq1tw1+R4NG/kezaOD4
	hw0RuiRaKQ+ef2Sx4V+H1RrNm/qtZwUjVo8hHfNUfOYVxK297hvgGpkks2Ga3473Zcz+
	vIBlBVQX1YqJyF/bDPiMkA/2vp2zY0k2fNr1JEhtGNLcvhDnaJtZDKePLcPB45Qc5Jgg
	Dq0Q/hSVUmvBK62B3Lf5yWMDbniWBR4/qPTmvLAEllspYBXJlU388FdbEPuBGMmW7CE3
	/5Pw==
Received: by 10.180.96.228 with SMTP id dv4mr19000876wib.14.1334584403574;
	Mon, 16 Apr 2012 06:53:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ea6sm19821167wib.5.2012.04.16.06.53.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 06:53:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6d586b1ec34616f2eb4d485c58cf67ad9524d9c7.1334583221.git.liezhi.yang@windriver.com>
Date: Mon, 16 Apr 2012 15:53:19 +0200
Message-Id: <DE326386-EBAD-41FD-A618-91BA010EBE7B@dominion.thruhere.net>
References: <cover.1334583221.git.liezhi.yang@windriver.com>
	<6d586b1ec34616f2eb4d485c58cf67ad9524d9c7.1334583221.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkWGTloTSnBC2y2N8mhTpUnUSWJjEB5L2Iud9LTg25/vNaR532P/KmiyzQwWqLX7M7i9eB9
Subject: Re: [PATCH 1/3] glib-2.0: fix builds on fedora 17
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
X-List-Received-Date: Mon, 16 Apr 2012 14:02:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 16 apr. 2012, om 15:38 heeft Robert Yang het volgende geschreven:

> Generally distros keep perl at /sur/bin/perl

/usr


