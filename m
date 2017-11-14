Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2EA784EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:29 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 207so13323820pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=efACWLtfogBS+WhH8IuaKVO7d0a1Y9zYVykbDzwgBs8=;
	b=fHA6v58Lx19h9xFjbOqDg6iGDaJ0xyh0MJTfZ2SpaAgkebcQF5C2nNFKu4B1YEeO+t
	DnWIMBKH750/j26+ujA4agsORKk0OsSfFd7FE2uduKJSOfuNKPv9dicSa2IdD4JZvl7v
	7ZtnYBMQfXo5hXCfG3Ul1X+m8JSTnngKy+3bVsnrVs5xxgu3z2MoBgumKoY+Y+YK/tj6
	X5GL65j1znBkqg7W2LgHUSYmNLT9cjjT4nY+Rg5fcJZNfv3gd4yweo9FXBIoeI4rjkRh
	ED9UdY+Mcss0HEA44XM6i3g3Pq2T84pllGosEasRzzDsoKUbNqHwkjCoAFF1v1lz1xFH
	PSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=efACWLtfogBS+WhH8IuaKVO7d0a1Y9zYVykbDzwgBs8=;
	b=F2jEkEjHBTRI6dvx5/hkq0VBELLyjcLYygBzNTdpbdC1MtHtv1A9yN+x9jIoUAXxhv
	cmIcavIwqYesrFkUHWSx+T+hdhBu5u9rFw2CkG9Ks5N8n+GLb0Sz+8vGCqRy9YdStpZe
	Wp/O8hF9uLkQvYRRjnnUP0JOTZ6pzPcvr3YIUVwsneI+5lYt7dZanm6UHsWFtGrVBibj
	+rsC5Z8HkOciVhnUCGTU7ibAG96HL3hf6B8dx/OTIVIpCOSKlVBqSIFxdXTtLBY2ezdx
	Rjldd9Bg3XTvnMu4VOZycbXC6SLQJ1yB+1Ii1KwoL+7icKvyqvweeRWoOnNLExQIPW55
	l2XQ==
X-Gm-Message-State: AJaThX4nc2TsrdFUyeNrI6bWLpEM0RwUm7IEG1/zLTVcK/ZmB5bnAjll
	YBoi0pRE3aYiVS8OFbeDpsTMgQ==
X-Google-Smtp-Source: AGs4zMbxOPJ2vVIGV4FCgo650rSfpfzzOgpPBrOYWCcJQJhdkHzLN36dHKbwOSx2vQlFTxKG86Mpzw==
X-Received: by 10.159.242.4 with SMTP id t4mr6111093plr.411.1510688370837;
	Tue, 14 Nov 2017 11:39:30 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:18 -0800
Message-Id: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/6] systemd: misc recipe cleanup
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:30 -0000

Andre McCurdy (6):
  tclibc-musl.inc: disable ldconfig distro feature
  systemd: remove musl specific control of ldconfig PACKAGECONFIG
  systemd: use consistent approach for musl PACKAGECONFIG options
  systemd: sort PACKAGECONFIG options
  systemd: use consistent indenting and coding style in do_install()
  systemd: fix duplication of CACHED_CONFIGUREVARS

 meta/conf/distro/include/tclibc-musl.inc |   2 +
 meta/recipes-core/systemd/systemd_234.bb | 239 ++++++++++++++++---------------
 2 files changed, 124 insertions(+), 117 deletions(-)

-- 
1.9.1


