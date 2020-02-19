Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8260C611C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:44:46 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id i7so19056473ilr.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yOh29Lpl0NrE9AdHj31e3U48eMGP0+SUg9a4EcAEA6k=;
	b=CXKIlt1ujppaBGqh1UPSonT0pgN+gPtzT9Wyfk6rvfTEUG0Ed33AdvtT8hEDQAUInw
	3LWdOF34mOGvAOiUhsm8v17zzEzxLiOcx4lyyQ7dsdMIRXTk1SQmipwY/o9JxFCDgUQT
	/qfT01Hc+rnUIavqJtOaR4qZmKuXTtJ5qEzuJkSbDms+rDuD7Gcp+Nd0OEZ9X1MCmGNA
	KoHsh0e6jzyrQ+OofRn+XO/5kibvKNPtfTXe/JOlk8vwUXqOg5qjcICOnRhlR1oFRRUx
	qdQXr0lpJaq3uftbAbiYTTtXk0h8JAUAV9X4ls/gnUr7yVqJdeI5VGCJ5eHle/pOWzUD
	4SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yOh29Lpl0NrE9AdHj31e3U48eMGP0+SUg9a4EcAEA6k=;
	b=bS8cZNcVfdq76W9Miw8BumI8OIeA/HphW1M1o/ZGiyrcnYe0xudE71mSrWHjtKsSfc
	5p/T0wp4RhTnX/1uTWZcUYTevMPe9X9TZ/16Ohizp8Z/ktyX8UiQW4Evtb0U9S9gkhK1
	hg+qDOshDqLDc/8D5/OOGLMiyjdu9oyz7F+c1LZ9Wkc4V41JcV7thN21ud8ksBGc7Rmd
	obHbYXsmQBmq2yLbDTTEaO7D7r7JiqNI+9iXUofUdhtsYoJeYYU7JiJIyeHcWFVIui8v
	GAx0W+NflIuRx4ValqHaR/fXk8hgDSrmJwJyTbOO+TUvi0tDq4SoEHaiGaumyGN5yoFV
	5RGQ==
X-Gm-Message-State: APjAAAWS369Qbd8XTSKDzl/HUe1i1Ma+Vtw+TTy3rd8I6IHtkwv02Bzc
	WItA5KCcjVKMTU1YHcSH4GLgYQBo
X-Google-Smtp-Source: APXvYqyyFJky9xwl9vIokik+0q/2jNKwSZvEcEQE395zPBhe1pYr5xtq/w8S7RctoYbok4LQ6vKeoQ==
X-Received: by 2002:a92:8f91:: with SMTP id r17mr20540018ilk.97.1582073087188; 
	Tue, 18 Feb 2020 16:44:47 -0800 (PST)
Received: from farscape.garmin.com ([2605:a601:ac18:c700:d658:3b67:74f4:8891])
	by smtp.gmail.com with ESMTPSA id
	e13sm125163iol.16.2020.02.18.16.44.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:44:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 18:44:42 -0600
Message-Id: <20200219004444.21297-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Use jQuery in diffoscope output
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
X-List-Received-Date: Wed, 19 Feb 2020 00:44:46 -0000
Content-Transfer-Encoding: 8bit

The diffoscope HTML output has the option of using jQuery to make
browsing the output easier. Enable support for this in the reproducible
OEQA test.

Joshua Watt (2):
  jquery: Add recipe
  oeqa: reproducible: Include jquery in results

 meta/conf/distro/include/maintainers.inc     |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py | 13 +++++++--
 meta/recipes-devtools/jquery/jquery_3.4.1.bb | 29 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/jquery/jquery_3.4.1.bb

-- 
2.24.1


