Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 34C8A601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 03:48:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id x66so2274083pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 19:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HpImUe4qLMH0mv78rc3+JLw+H+T+rg2LlwqpssLfPPQ=;
	b=VkCsv9fIaMlSvSE+XCUTOM3UDNUewPb/sGGJInJ23UapeIGrr3VwkcQ6pP4TFV55fu
	Vt+ksjLfHahrJbPzJJYRtv6Nh5CXsf3R0OdUR+ciqN4dYvcOYqTSXiIuNzHrBp/iM5ga
	giXkVF58pm7FDhx5n4vDA8yFgBaehwM4LyyJKgKgCbBoo8JzK9v4XARlw/PeOC/VMkON
	vCZ2JC2XxNaxtrzKGonRn+4I35FXfw6+EPLuKU0afgmZU1p8woP0xZlgy57DQv7DrBX6
	s3lT6Yj4MUjRqodRipu/D3ox1VQK/k9dYF6cY/ATmE9fxT93UzKORRaoHr4yGfGIZXkO
	z3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HpImUe4qLMH0mv78rc3+JLw+H+T+rg2LlwqpssLfPPQ=;
	b=FQsZ2ZipKBXWHTO9MlRlOAFLHb7oa8ZMkHQDFtt8Bdvt7yVAbTu1Kd4xaxJWHePTXo
	dLPICSevIQ1I+r/tgjkZlTdryHx7mGHEFblSpSJp9MFFT7V221GFa3izveqDYFx/SEzg
	bkz37h4lCto8cX5+taQxwcZtlNosLpf/YDFmQQkMerx+2uJRHetJ067AEyxWc58j49WU
	BEEj30G/jrmPriWrq/3+0T/hn632Ih2TKJPKbdaGFgwS82tK226oDPM7k0iPOmZTB/os
	9O/3OZfi94Ley8MkUiQRKLlbjxq7qIpTc+InQWmLRVLQAeWuUHq9Yi0N+kpqmws5IrDl
	L7sA==
X-Gm-Message-State: AMke39mrjfPC6p69cDg343kiDTol2QEI8/I/BCVaqJggeZ+GxfWgnlZd01yd0fz+YoezJA==
X-Received: by 10.98.65.83 with SMTP id o80mr6301145pfa.3.1488340114171;
	Tue, 28 Feb 2017 19:48:34 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:e4b7:46c1:514a:983f])
	by smtp.gmail.com with ESMTPSA id
	v186sm6832075pgv.44.2017.02.28.19.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 19:48:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 19:48:31 -0800
Message-Id: <1488340111-13204-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488340111-13204-1-git-send-email-akuster808@gmail.com>
References: <1488340111-13204-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/2] tzdata: update to 2017a
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
X-List-Received-Date: Wed, 01 Mar 2017 03:48:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

 Briefly: Southern Chile moves from -04/-03 to -03, and Mongolia
  discontinues DST.

  Changes to future time stamps

    Mongolia no longer observes DST.  (Thanks to Ganbold Tsagaankhuu.)

    Chile's Region of Magallanes moves from -04/-03 to -03 year-round.
    Its clocks diverge from America/Santiago starting 2017-05-13 at
    23:00, hiving off a new zone America/Punta_Arenas.  Although the
    Chilean government says this change expires in May 2019, for now
    assume it's permanent.  (Thanks to Juan Correa and Deborah
    Goldsmith.)  This also affects Antarctica/Palmer.

  Changes to past time stamps

    Fix many entries for historical time stamps for Europe/Madrid
    before 1979, to agree with tables compiled by Pere Planesas of the
    National Astronomical Observatory of Spain.  As a side effect,
    this changes some time stamps for Africa/Ceuta before 1929, which
    are probably guesswork anyway.  (Thanks to Steve Allen and
    Pierpaolo Bernardi for the heads-ups, and to Michael Deckers for
    correcting the 1901 transition.)

    Ecuador observed DST from 1992-11-28 to 1993-02-05.
    (Thanks to Alois Treindl.)

    Asia/Atyrau and Asia/Oral were at +03 (not +04) before 1930-06-21.
    (Thanks to Stepan Golosunov.)

  Changes to past and future time zone abbreviations

    Switch to numeric time zone abbreviations for South America, as
    part of the ongoing project of removing invented abbreviations.
    This avoids the need to invent an abbreviation for the new Chilean
    new zone.  Similarly, switch from invented to numeric time zone
    abbreviations for Afghanistan, American Samoa, the Azores,
    Bangladesh, Bhutan, the British Indian Ocean Territory, Brunei,
    Cape Verde, Chatham Is, Christmas I, Cocos (Keeling) Is, Cook Is,
    Dubai, East Timor, Eucla, Fiji, French Polynesia, Greenland,
    Indochina, Iran, Iraq, Kiribati, Lord Howe, Macquarie, Malaysia,
    the Maldives, Marshall Is, Mauritius, Micronesia, Mongolia,
    Myanmar, Nauru, Nepal, New Caledonia, Niue, Norfolk I, Palau,
    Papua New Guinea, the Philippines, Pitcairn, Qatar, Réunion, St
    Pierre & Miquelon, Samoa, Saudi Arabia, Seychelles, Singapore,
    Solomon Is, Tokelau, Tuvalu, Wake, Vanuatu, Wallis & Futuna, and
    Xinjiang; for 20-minute daylight saving time in Ghana before 1943;
    for half-hour daylight saving time in Belize before 1944 and in
    the Dominican Republic before 1975; and for Canary Islands before
    1946, for Guinea-Bissau before 1975, for Iceland before 1969, for
    Indian Summer Time before 1942, for Indonesia before around 1964,
    for Kenya before 1960, for Liberia before 1973, for Madeira before
    1967, for Namibia before 1943, for the Netherlands in 1937-9, for
    Pakistan before 1971, for Western Sahara before 1977, and for
    Zaporozhye in 1880-1924.

    For Alaska time from 1900 through 1967, instead of "CAT" use the
    abbreviation "AST", the abbreviation commonly used at the time
    (Atlantic Standard Time had not been standardized yet).  Use "AWT"
    and "APT" instead of the invented abbreviations "CAWT" and "CAPT".

    Use "CST" and "CDT" instead of invented abbreviations for Macau
    before 1999 and Taiwan before 1938, and use "JST" instead of the
    invented abbreviation "JCST" for Japan and Korea before 1938.

  Change to database entry category

    Move the Pacific/Johnston link from 'australasia' to 'backward',
    since Johnston is now uninhabited.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016j.bb => tzdata_2017a.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016j.bb => tzdata_2017a.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016j.bb b/meta/recipes-extended/tzdata/tzdata_2017a.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016j.bb
rename to meta/recipes-extended/tzdata/tzdata_2017a.bb
index 1ef330e..ce59d71 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016j.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2017a.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "db361d005ac8b30a2d18c5ca38d3e8ab"
-SRC_URI[tzdata.sha256sum] = "f5ee4e0f115f6c2faee1c4b16193a97338cbd1b503f2cea6c5a768c82ff39dc8"
+SRC_URI[tzdata.md5sum] = "cb8274cd175f8a4d9d1b89895df876dc"
+SRC_URI[tzdata.sha256sum] = "df3a5c4d0a2cf0cde0b3f35796ccf6c9acfd598b8e70f8dece5404cd7626bbd6"
 
 inherit allarch
 
-- 
2.7.4


