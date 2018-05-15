Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4857E74E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 20:37:43 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id p12-v6so604541pff.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C7fLZeQc5GNdTLCQMwVsMprUm0QsZCfi+mpovkNZcIw=;
	b=hXEHm7eEZD/sGi6TasvBt2itgE58bxEKowkcLJr/nfuAOY8PshitWVILs9N4usA2ZM
	N/UPOW13JJ1vqwdYKBJRQC9Agm15myE+3sxgv42xhRvr9o0aEQWmdzFy1Yio67FOoFHJ
	Z1uaTVRizbg8LIL/G+nIily5pvC6Dotq641B6wPIMHMES8sRXn1pMRkwqnWhd3+VnvPL
	LmeQUXJnDM9UQz43xGu4RVRWU3/tyCjo1QSY0vry5ySdo7kpKjxJ5LSXBmazkuNzucHw
	0Cp57TNHFN5Nn+3lQPa7IueU7QdkukG/2fT95G7IC8kJxkJoOy2uCUVcdoXKXChFpBr6
	gEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C7fLZeQc5GNdTLCQMwVsMprUm0QsZCfi+mpovkNZcIw=;
	b=g8DN6PhRPT/6UXuZAjHbMYbKGpGaVFo2pNGlhVx5/Fo1EXLu/2nN/4gyeqvs9FKAfc
	zA8txIswNR1MaT0VUyaYsjmEIEk1hTACcoRET76gioXFIE8UG51BXN1q8C49kdoZ34M7
	uJIQBDtkB30MNT1NrrU+H0QYYtCeZ/jzEEAXLDopdLAfSA7vgJ73PmnzISZGPXwHXPQT
	Z5KlagGTs2P5cp8wvM80b5nBRB38P/LP/hytqqcV2ogpEWHYs6nZsbmfba38r+SHtGSP
	Nv9h/hmjTRYEGfL2m8d0aME4fGa+gmhySpNn8k+B7n9DBj9YQEEac88phUzoPgkTMOCq
	eaCg==
X-Gm-Message-State: ALKqPwcFQ/aU2QtU8yQc1Yxo2mdcvwl08UJUQRJaEvKK0KJzRZuoPLdC
	hTFJTPrYaUE8niXfmBNOA4fy+w==
X-Google-Smtp-Source: AB8JxZpVd06P7D6iQgvLG69U71TVdDC986s2udpWr3uevRs6okVHybuZp9seBG5f6INO71Lc8MbO8g==
X-Received: by 2002:a62:4544:: with SMTP id
	s65-v6mr16665426pfa.150.1526416664841; 
	Tue, 15 May 2018 13:37:44 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a3-v6sm818566pgw.14.2018.05.15.13.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 May 2018 13:37:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 13:37:24 -0700
Message-Id: <1526416645-4896-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
References: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
Subject: [morty][PATCH 2/3] upstream-version-is-even.bbclass: exclude various alphas, betas, pre-releases etc.
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
X-List-Received-Date: Tue, 15 May 2018 20:37:44 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Was a problem with perl in particular.

(From OE-Core rev: cc40b3ad2c4a725f93d0b984f23d34d247cffb2f)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 428531463574f4e7722912d1960bd288df586c14)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/upstream-version-is-even.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index 99714cb..256c752 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -2,4 +2,4 @@
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
 # This scheme is used by Gnome and a number of other projects
 # to signify stable releases vs development releases.
-UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
1.9.1


