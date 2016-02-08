Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49DA460043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 20:35:16 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id fl4so450041pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 12:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cu0UVvJZqPspuuFo9iBpCT99/Zpfvxttbchsl1Q5K8g=;
	b=ZfK4MPF2fARY78My7NhUPdKHoOlPr+RDswcbk6cekN/FEhqhYAYq5LoSPjgpAl5yNz
	+D8x+AWqZYykoWWoqbPTQ9HVbbx59AIedRXB/CwoRiPg1c0xIdll7FI9yFqqtw2IZHa2
	aHhzxsb4iH196qu0UIn9R2V8L3fBCdnxQgysLRfcgEEgC71ffMxh+tdSoX7r/jXqzmvS
	3TjvxU2vQuJh5PB92EzFFZOvr+9pWTWH1aFi7Otgw+FqIz1JrFJgA2SvwbJ+XncN0zRJ
	H8cmn2aFNtAJMbP3CeIjX/fYV8wbLmVf16ThnoBadFxH0w62qcn1YdYX2ie185Q/hGU7
	QsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cu0UVvJZqPspuuFo9iBpCT99/Zpfvxttbchsl1Q5K8g=;
	b=PVB18eRdBjPzE2t3ktZYdf1rQ9u4cOpzVfHb5XE0kqukqlwGI/mbgZg1V5Ia7rMFYB
	bTTEPtEwjgytCO9dWGyGjyzEs/L6d1hHf7LqSyRWVSXnnPFky8W8MjWKRrWyOV+0bgkm
	6jwLvQsAeDKkgQVV6QmT8210PbZNqEQena1+n2yiqqlTloFx9cW3oHDRnIZPue8Kp1KK
	uJEqkC0lPK5RrMahW2ut+ln6UgNdVuX+gmjPlpJhkKdLgJKe4qONLSWPdxFG2wh4F/6J
	TFrzcXyGrOBHKoaC1EA//wCp6Oo159SKrOfeNwiE+EJc04w59ZAPWiu8SphQnHXj2Q27
	ZYgA==
X-Gm-Message-State: AG10YOStq3nFkOiAgZbMgYv6qJ10mG/1gArFxGlBEs6BIpmBDaoeP0cVnhBWw03fxAeHZA==
X-Received: by 10.66.148.99 with SMTP id tr3mr45366311pab.19.1454963717465;
	Mon, 08 Feb 2016 12:35:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	u90sm45313301pfa.60.2016.02.08.12.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 12:35:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 12:34:39 -0800
Message-Id: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] libproxy: PACKAGECONFIGisation
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
X-List-Received-Date: Mon, 08 Feb 2016 20:35:17 -0000

Andre McCurdy (2):
  libproxy: replace PACKAGECONFIG equivalent with the real thing
  libproxy: add PACKAGECONFIG control for gnome3

 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 31 ++++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

-- 
1.9.1


