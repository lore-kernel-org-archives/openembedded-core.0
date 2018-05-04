Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5380674CB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 17:05:17 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p9-v6so12927239pgc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zSb+HBDpDEOZ+HaTkhhpdGVlWO5qbUPFrLs4TDWGJfE=;
	b=sAU5JTAb4mrAQDKUywt5KHOoenLrn4gfRPW1dkRTUhR3hrokLl6VWySWN5hWm5vRV5
	iEb9/JxCUOztNfHF14Qwso7/kaeHe7ka5OgoTUEer2+6pOiVUqcHi/XIh2rk8cDaIWGr
	BYIAWjzj6QSM4edL/AaFzq34jZ73Gw5nVBHEmQESbW2/JburSSC4M6lOhcB6GpogYrPE
	lyPuP0AFy9GjTU0efTf39KXyeJA6T2rsv9/iQzU6kch/DZLa88Dq5Il3Co/ihrjHKhHX
	5K/C7cjZ7CQI/vRuDtfuVubFnWA66+F/Zko0fRZ86GytcvIo5343VpTYZR5P6aA3mPxw
	AvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zSb+HBDpDEOZ+HaTkhhpdGVlWO5qbUPFrLs4TDWGJfE=;
	b=YbJx5noxTYx1YFwxFNi+q0CnJVvrb0ROXo90Uzr/lZWGLuouMHUrZvKIK1T4ewlHyE
	6n2Atcj8HbzgDbDCv2dcckk9fe2iHq35jeTxdVNERcTeZcm6b9rs9yqAS6mAj2utNKIL
	3MXqzPJ4vfDbu9vP9XCamlteXNSY/ovF5W29J3MIsuh/vv52LfaOu/W1OfLnxzTiDBQf
	TFrLptuW0EtO/667hRR+XDtEq/fcke7RjHVt3qe0PxDTasCkAUqkBHkmVLftQ7vAVRmq
	gRsEUt+A50KPKGmJ0ovwzYh9E5nQqChe7SuOcJhWfu2Ui0lmgP6wvfTxXM9KYvbj/elf
	Zkxg==
X-Gm-Message-State: ALQs6tCObpnCW7RO9OQMDMT0rqKscuOXp8rA6+ZDw5OKMyA//x0mgTg3
	rVulyfQk/NqKywBmwokOqG0=
X-Google-Smtp-Source: AB8JxZoVlzE96tW06KrdWtUhbAsk4RA5RiYNDzE6hrR/Gt5vfIkrlnXoIRYM+TZnfxGsfhGcgZZuCA==
X-Received: by 2002:a17:902:bc88:: with SMTP id
	bb8-v6mr17543273plb.175.1525453519031; 
	Fri, 04 May 2018 10:05:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	k13sm39807126pfj.186.2018.05.04.10.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 10:05:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 10:05:16 -0700
Message-Id: <1525453516-12693-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525453516-12693-1-git-send-email-akuster808@gmail.com>
References: <1525453516-12693-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2018e
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
X-List-Received-Date: Fri, 04 May 2018 17:05:18 -0000

 Briefly:

    North Korea switches back to +09 on 2018-05-05.
    The main format uses negative DST again, for Ireland etc.
    'make tarballs' now also builds a rearguard tarball.
    New 's' and 'd' suffixes in SAVE columns of Rule and Zone lines.

  Changes to past and future time stamps

    North Korea switches back from +0830 to +09 on 2018-05-05.
    (Thanks to Kang Seonghoon, Arthur David Olson, Seo Sanghyeon,
    and Tim Parenti.)

    Bring back the negative-DST changes of 2018a, except be more
    compatible with data parsers that do not support negative DST.
    Also, this now affects historical time stamps in Namibia and the
    former Czechoslovakia, not just Ireland.  The main format now uses
    negative DST to model time stamps in Europe/Dublin (from 1971 on),
    Europe/Prague (1946/7), and Africa/Windhoek (1994/2017).  This
    does not affect UT offsets, only time zone abbreviations and the
    tm_isdst flag.  Also, this does not affect rearguard or vanguard
    formats; effectively the main format now uses vanguard instead of
    rearguard format.  Data parsers that do not support negative DST
    can still use data from the rearguard tarball described below

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2018d.bb => tzdata_2018e.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2018d.bb => tzdata_2018e.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2018d.bb b/meta/recipes-extended/tzdata/tzdata_2018e.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2018d.bb
rename to meta/recipes-extended/tzdata/tzdata_2018e.bb
index f7fce80..f806d5b 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018e.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "871a7ef808eb42ebc551acdb3d661554"
-SRC_URI[tzdata.sha256sum] = "5106eddceb5f1ae3a91dbd3960e1b8b11ba0dc08579a31cf0724a7691b10c054"
+SRC_URI[tzdata.md5sum] = "97d654f4d7253173b3eeb76a836dd65e"
+SRC_URI[tzdata.sha256sum] = "6b288e5926841a4cb490909fe822d85c36ae75538ad69baf20da9628b63b692e"
 
 inherit allarch
 
-- 
2.7.4


