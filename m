Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4D17DBBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:07:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t17so16211326wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yur5gDnjiO9eq7qC9HHpiPNy5bGVgtmQRjhIqA2IHHk=;
	b=s1NeCG9N7HttwlGkQHeFi70gvaiwJeW7SBaZcJHAvJkO26sx/jQT698K2K0saXRsvE
	QHkijGE2t+n+cGbqR1MtWgwP8bQumGYLKkid7M2z5yah2+O90fAlBgYkx0Jsuc9AI16K
	7CANMn1fgwO30IAjCV2yDk9tkyCUxRGd8DBBYN8PDwcAwhEgwrvhq7J/GkZzCagYyDxd
	Aq8Np8YfRqFRtpeNl1P3LRnyHUiAkFwefjLArHe4LiJ3SIbGtqKoA3ONTeX3wCDY1Je1
	pzWdbUaNn+Cj/Kj5BpMj0lrm8YnOPH1C9D5saRlaxYyU0JtCncjPygSRUDT6c8e44vpu
	2PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yur5gDnjiO9eq7qC9HHpiPNy5bGVgtmQRjhIqA2IHHk=;
	b=O3zQA5KVjBXDVqNzJHsx1dvQxr0J9aUoXGMQry6HI/MDIkEKj+HKROL3XHWbUDCvXm
	fbbaQaUXAaKG0u22yG14KF6W857QN5CKFVlNugpPLHtXaxyhadH/ocQJqTACOf8LL0lm
	7dsha1BwevOVCxllkPQA43vjC5tzwvrAbTQmFScx7ByBYLWygf6bs7F1lueCTbY0/ZyZ
	H8MOwBIdEkxHp5jRzqiblIbbPK42xudrKuIdGEKeMCDjzuf6WyCPKE2XJmJsE66UauOr
	8FVHuEp1Xk3eSoJifthVV0jSor0JYr2W4y/UYhl/iiGZW9ldDzf7wiTramfr7EK7p5iD
	0VJw==
X-Gm-Message-State: APjAAAXQAvzmEFZssA3Qh1vmnkTdNlZeArN6PUiajFGRQngxQRI8/VKP
	h9Fr+zv16u5ir05CbZ6e3syTolbk
X-Google-Smtp-Source: APXvYqy+jfYDbGjh4bljCFqLixdr1m7cJUBXFkqMb83x5Ih/DnbUl7N0ghtEGeRwZ1DtovXv8B5GQw==
X-Received: by 2002:adf:db05:: with SMTP id s5mr10099147wri.247.1556546862667; 
	Mon, 29 Apr 2019 07:07:42 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q7sm2627964wra.57.2019.04.29.07.07.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 07:07:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 16:07:29 +0200
Message-Id: <20190429140730.2899-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Mon, 29 Apr 2019 14:07:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Let the autobuilders decide :)

Andreas Müller (1):
  vte-native: reduce c++ requirements from c++17 -> c++14

 ...uce-gcc-required-support-downto-c-14.patch | 34 ++++++++++++++
 ...001-Revert-parser-glue-Use-std-clamp.patch | 44 +++++++++++++++++++
 ...replace-std-clamp-by-std-min-std-max.patch | 33 ++++++++++++++
 meta/recipes-support/vte/vte_0.56.1.bb        |  7 +++
 4 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-14.patch
 create mode 100644 meta/recipes-support/vte/vte/0001-Revert-parser-glue-Use-std-clamp.patch
 create mode 100644 meta/recipes-support/vte/vte/0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch

-- 
2.20.1


