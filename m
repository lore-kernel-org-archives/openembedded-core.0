Return-Path: <sledz@dresearch-fe.de>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 761CA60666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 06:21:20 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so3521490eek.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 23:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=dQPzYHaIiqugdZQnYuboyQd5ESfC/ROzFinmq+mYy9s=;
	b=YcUJ7M6wYxxNNX/ILYP06xUCpQJPMhHy6xke7F72O/PYl9V9PBmebXR7yIndZFpHg/
	ClXnQWr11ojd35NyXqtPBHopUxUYYxfZbs9U//g+VXv+58ST3D1/x7o6TQBkOaopswJ5
	FY7zh3qsuUDi0NPSPbLYsqhqPj48rB8JtX6NhDwbm4ZXZ5DhKSOfIKOep/XsUyccEITW
	CUF9f+WbVJx6dY6XrHoiRTEGOSbNjST6o1mDVByMtdCryZwPNORfZ3aD/NjzXrq1PGNt
	tKIacJuuKYjJdzPqFjamSiuuLrpzebIQ5yyK3rKJ6Mu4Y3xpBRIi1qDzHfsg5uuBcQlM
	oMCw==
X-Received: by 10.14.204.137 with SMTP id h9mr26387362eeo.13.1374474080435;
	Sun, 21 Jul 2013 23:21:20 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPSA id n5sm48208784eed.9.2013.07.21.23.21.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 21 Jul 2013 23:21:19 -0700 (PDT)
Message-ID: <51ECCF5C.2020505@dresearch-fe.de>
Date: Mon, 22 Jul 2013 08:21:16 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.5.1
X-Gm-Message-State: ALoCoQkN2Hoz+c7pee5Vluum3IWTfJ4ze35OgixWTPTgbRb5eYEUImyLl0PciG8HbFJUWJPnszyl
Subject: SRC_URI and latest HEAD revision with git
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
X-List-Received-Date: Mon, 22 Jul 2013 06:21:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After being OE abstinent for some months i'd like to ask what is the current suggested method for recipes building from the HEAD revision of a git repository (we need this for continuous integration).

I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final decision, documentation and a good example.

Cheers,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

