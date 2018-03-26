Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55698786C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:34 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 9-v6so12034336ple.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TKhVP1c85I60DAerdzsDRerg01oygRlHTgjCcn24nDc=;
	b=lMQHIfFpvQduMHqTQHVACZmIzHaqzKkwyxo/EWYztStnYr5yxNuNlmBYJxAiYoGsk8
	zQ8pSfpqNWn4K36KoE7MCvPZyz9CR60orTysgRbhvYm1P65kgjr731m8oXmof8wTAJfC
	gRoerddEyJcdAw3lpZLtNmuyHWT27egiU+NIIJZLqbOZSt9ZPQMkKPwWlld5CI3HFaJf
	CHLRpiQnf6gX6sRRcQOj9Nsf7oEzjpyFGhSkkjSuFfRrO7eMDIKHqvutBrvhxCITpiaA
	A89dqOlUHLdl9Nbsvwhe1O3We3t0dR72eFJ3WHwVBgKbXsVL3X7F+noqy9WQ87qpewxB
	iusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TKhVP1c85I60DAerdzsDRerg01oygRlHTgjCcn24nDc=;
	b=X4JElvE2GFyrvOhA2sqs5LiUMYwE04/V7DN4vbuqfe9uVdJzNnCermpssD/LsPEz6I
	Y+YN+IhD75xzHW7lo0EIvfbP6R2LXQM4X3VhNZSOtWcrYqqGXpnKNIxIUTp5vxXbsknx
	yHIpneyetjTR/JoQDvg+e386P9rairNDgI0n4HTp1LrK9QvGnbpVGiBCnb+uLy6u1mTe
	qSaI43G6O03WMWdXsjZxsIrgPvRoXIUCXEz3aCIAGMnHru3OfJprLm/8dSaZP85wDOwR
	FB+u/vkD/J1Hs0kFXhrDfK1vQe2bXVhC1wNfUibs7e01XDT7NpMqhijO1mxLNFWVUWuJ
	3vvA==
X-Gm-Message-State: AElRT7G6JTJI8f20QK3pkww8AJjEv45brbv0c2nQXXGR/gkpPw8BNAVE
	y72qN5NrCScO8OBgX8ZVvl14bA==
X-Google-Smtp-Source: AG47ELuVi11yjLhhQ74IpWjkGtKcv8E3Xu7EijemEOKPufsehickRAPhGQ445CJArnzxcBlCOVOKGQ==
X-Received: by 2002:a17:902:5a87:: with SMTP id
	r7-v6mr35841629pli.173.1522074696020; 
	Mon, 26 Mar 2018 07:31:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:23 -0700
Message-Id: <d48971024ed79109e25c463ec77ecec12b3c44bc.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 20/21] tzcode-native: update to 2018d
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:34 -0000

From: Armin Kuster <akuster@mvista.com>

 Changes to code

    zic now accepts subsecond precision in expressions like
    00:19:32.13, which is approximately the legal time of the
    Netherlands from 1835 to 1937.  However, because it is
    questionable whether the few recorded uses of non-integer offsets
    had subsecond precision in practice, there are no plans for tzdata
    to use this feature.  (Thanks to Steve Allen for pointing out
    the limitations of historical data in this area.)

    The code is a bit more portable to MS-Windows.  Installers can
    compile with -DRESERVE_STD_EXT_IDS on MS-Windows platforms that
    reserve identifiers like 'localtime'.  (Thanks to Manuela
    Friedrich).

  Changes to documentation and commentary

    theory.html now outlines tzdb's extensions to POSIX's model for
    civil time, and has a section "POSIX features no longer needed"
    that lists POSIX API components that are now vestigial.
    (From suggestions by Steve Summit.)  It also better distinguishes
    time zones from tz regions.  (From a suggestion by Guy Harris.)

    Commentary is now more consistent about using the phrase "daylight
    saving time", to match the C name tm_isdst.  Daylight saving time
    need not occur in summer, and need not have a positive offset from
    standard time.

    Commentary about historical transitions in Uruguay has been expanded
    with links to many relevant legal documents.
    (Thanks to Tim Parenti.)

    Commentary now uses some non-ASCII characters with Unicode value
    less than U+0100, as they can be useful and should work even with
    older editors such as XEmacs.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2018c.bb => tzcode-native_2018d.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018c.bb => tzcode-native_2018d.bb} (70%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018c.bb b/meta/recipes-extended/tzcode/tzcode-native_2018d.bb
similarity index 70%
rename from meta/recipes-extended/tzcode/tzcode-native_2018c.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018d.bb
index 85e9b70..7933a5d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018c.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018d.bb
@@ -11,10 +11,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "e6e0d4b2ce3fa6906f303157bed2612e"
-SRC_URI[tzcode.sha256sum] = "31fa7fc0f94a6ff2d6bc878c0a35e8ab8b5aa0e8b01445a1d4a8f14777d0e665"
-SRC_URI[tzdata.md5sum] = "c412b1531adef1be7a645ab734f86acc"
-SRC_URI[tzdata.sha256sum] = "2825c3e4b7ef520f24d393bcc02942f9762ffd3e7fc9b23850789ed8f22933f6"
+SRC_URI[tzcode.md5sum] = "96612b4f5d7e8804fd9a0981c021be90"
+SRC_URI[tzcode.sha256sum] = "7de44e85baad748d217e3fd60706f599f9aec68bce6356b163f52b0dbd40a8d9"
+SRC_URI[tzdata.md5sum] = "871a7ef808eb42ebc551acdb3d661554"
+SRC_URI[tzdata.sha256sum] = "5106eddceb5f1ae3a91dbd3960e1b8b11ba0dc08579a31cf0724a7691b10c054"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


