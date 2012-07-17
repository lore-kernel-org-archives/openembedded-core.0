Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sr9Tu-00006J-N1
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 17:14:34 +0200
Received: by eeit10 with SMTP id t10so185844eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=4GnYKuMOat7+n+Y2UOW+OVM1uGEb1GUzeAzbHmVQBJk=;
	b=FqyuT5QbwcQd+YLYHvungPlHgIQ+ZEL3W45DGtko1cybV19SY9SsjyJrubNoE0S0mI
	mcTKkzxx0Qxy2WruaNt05EBep4YGLVt0m1ZL5k2Os3j/xKRnYjJOrAWvgI2mrtChrciO
	OviTqBuhWFbsuk01Kah+bKleFsl+J0e+0wJprU+/7zb2YpYAsup78dOXTr8saB6SS+HO
	frp7jioxDk8WYS0p03VgWmpnLfdS3QSu840K90gVbJUSQEGWB2sfc0YazasP+6nP8W5Z
	qLCYI7xE0QgHkBkFSEsamL6NMSJLpg9FQs+zMyonLRGMa7+kuIb6PBLgzmGRcseJtCu0
	dSdg==
Received: by 10.14.203.193 with SMTP id f41mr902264eeo.14.1342537395427; Tue,
	17 Jul 2012 08:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Tue, 17 Jul 2012 08:02:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jul 2012 08:02:45 -0700
Message-ID: <CAMKF1srhq8aiRBmZArGLvYmM_6EQ6PgMe1ja+x1VpwwpvkLKrA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: giflib: Move to OE-Core
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
X-List-Received-Date: Tue, 17 Jul 2012 15:14:34 -0000
Content-Type: text/plain; charset=UTF-8

Hi

giflib: Move to OE-Core patch was posted some months ago here
http://patches.openembedded.org/patch/24015/

one objection to this patch was which other layers use it. Now I have
figured that meta-java
is also depending on it along with meta-kde and that

For meta-java thats the only dependency on meta-oe so far as I see.

Thanks
-Khem


