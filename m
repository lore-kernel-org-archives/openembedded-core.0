Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18B9665CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 23:19:44 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id o4so3719483obb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 15:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=REnmRnkpnjMfZyCKRMy5pvfc/zjNR/HAGF7mSBWmzek=;
	b=eIO0mcMAm1Wej2SvnmYY64TejbHAb1GgLIm2eLQdn8Hnr1UPJ5LzX5ZaJLqjZH2mKV
	t9VpXNoDf5VXJPG4SamAXzICBeD0F4GwelH5v0U6oY611z2iQ0Lrrs6+O51nbndgrw3w
	XNBAJCUmG6lcUui6CCgRzZiKbiDMyZv6+/3HC1mi8Wjv3SpJKybcy9js/0otPqWPF+8n
	T6V4holZlWU4zsyYVGNoGiWP8Dt8mBx6bPJuXxBbBHaQt+z1gkI7/1lex5Fh+6QdYnBt
	ANq0RZiNXdVWMM/8x57cim+K5gYpDSlEiZOaSKF0ybjY1isurHefJnNNlE4VSO7xTy6t
	uT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=REnmRnkpnjMfZyCKRMy5pvfc/zjNR/HAGF7mSBWmzek=;
	b=LQDZD08Y7Aag/HpjiY9OmwzW2uEQsj0B+sVGEq5FyL2EblJNSAyQUXebEY9G2i2yN/
	Oprlfe+aaCVyMEuXGhxE5p+ByakrveZvA4YmWa/deQiGgTNxeZfWsb6bOuDs9qUkAiX1
	f2MhfgrRUHNr/RsdXPsTmP8T7BVWtRlmoiLBrSdcqlQaN8gcCXrdxZsEMgpsjEH9WdpJ
	6T194miqYyV6yshdYeruL1LDBZzSWGRmQjO92fXovP3pQrwDfnknoMKshKWVVJ/lXkKi
	NOylo8WFz1r6KYzEpuPWClBuOc4n9sIueU2jRgo3t1jDbXBzQZ/LgvhGC332+UdxEydD
	8MPQ==
X-Gm-Message-State: AG10YOTWCTOxYkuKokTv9WidMMCteipy5ZRE3VNImfPcr4r6caLeOVyncntQYfSLuP2rXg==
X-Received: by 10.60.162.102 with SMTP id xz6mr29917605oeb.62.1455146385177;
	Wed, 10 Feb 2016 15:19:45 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm2873000obg.1.2016.02.10.15.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 15:19:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 15:19:36 -0800
Message-Id: <1455146378-29690-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] freetype: formatting tweaks + update 2.6.2 -> 2.6.3
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
X-List-Received-Date: Wed, 10 Feb 2016 23:19:45 -0000

Andre McCurdy (2):
  freetype: minor formatting improvements
  freetype: update 2.6.2 -> 2.6.3

 .../{freetype_2.6.2.bb => freetype_2.6.3.bb}       | 26 ++++++++++++----------
 1 file changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.6.2.bb => freetype_2.6.3.bb} (84%)

-- 
1.9.1


