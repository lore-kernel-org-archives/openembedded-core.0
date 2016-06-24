Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6468A65CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:59:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 187so4034128wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fLV4Lv6qud688OFAY7XnrZFjXGwh2UobeQI8lj838EQ=;
	b=TmlmDr/S5XAmPTGn/gZ3QOOmf9Qtv8O5RnxhI83XnDzjvUdapOADiROFJhUD2fzQf+
	1ScAUxSgCvekCgHpMjptmMMROWbY42XBy1f3jWvusRdciVrrf+oHpGUtn246bgZwt96b
	3ypabJSVncU0dpMPQfN5qePh6zkmKliE9SopVyEBEGZs20CnsKP5PHTIYP4eH6R6Okhe
	I5gfnenwbAJObo8xOANN/Y8eNlDGXqdpgEJFEB9ZQqy4iEwNZwfJQlEhjWixxGbv43D+
	94tKGgoi6j8bL+XBW2Id7iVrPB2P8mRWzj6xiw6IL4xZwGUChcSmY5maiI8+EJLaBits
	kQJA==
X-Gm-Message-State: ALyK8tIWuyqiwagspryLFLIoPHyPTeJxJ/E5fyIxSqTTFV6oVLE0tXYnw5PCAk4JU+sELg==
X-Received: by 10.194.42.69 with SMTP id m5mr3293484wjl.89.1466765965230;
	Fri, 24 Jun 2016 03:59:25 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id
	ue1sm4561143wjc.44.2016.06.24.03.59.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:59:24 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:59:22 +0100
Message-Id: <1466765962-23197-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] security_flags.inc: libidn fails to build w/ -Wformat-security
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
X-List-Received-Date: Fri, 24 Jun 2016 10:59:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

../../libidn-1.32/src/idn.c: In function 'main':
../../libidn-1.32/src/idn.c:172:7: error: format not a string literal and no format arguments [-Werror=format-security]
       error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be specified"));
       ^~~~~
../../libidn-1.32/src/idn.c:187:5: error: format not a string literal and no format arguments [-Werror=format-security]
     fprintf (stderr, _("Type each input string on a line by itself, "
     ^~~~~~~
../../libidn-1.32/src/idn.c:202:4: error: format not a string literal and no format arguments [-Werror=format-security]
    error (EXIT_FAILURE, errno, _("input error"));
    ^~~~~
../../libidn-1.32/src/idn.c:220:8: error: format not a string literal and no format arguments [-Werror=format-security]
        _("could not convert from UTF-8 to UCS-4"));
        ^
../../libidn-1.32/src/idn.c:245:8: error: format not a string literal and no format arguments [-Werror=format-security]
        _("could not convert from UTF-8 to UCS-4"));
        ^
../../libidn-1.32/src/idn.c:281:6: error: format not a string literal and no format arguments [-Werror=format-security]
      _("could not convert from UTF-8 to UCS-4"));
      ^
../../libidn-1.32/src/idn.c:340:6: error: format not a string literal and no format arguments [-Werror=format-security]
      _("could not convert from UCS-4 to UTF-8"));
      ^
../../libidn-1.32/src/idn.c:364:6: error: format not a string literal and no format arguments [-Werror=format-security]
      _("could not convert from UCS-4 to UTF-8"));
      ^
../../libidn-1.32/src/idn.c:442:8: error: format not a string literal and no format arguments [-Werror=format-security]
        _("could not convert from UCS-4 to UTF-8"));
        ^
../../libidn-1.32/src/idn.c:498:6: error: format not a string literal and no format arguments [-Werror=format-security]
      _("could not convert from UTF-8 to UCS-4"));
      ^
../../libidn-1.32/src/idn.c:527:5: error: format not a string literal and no format arguments [-Werror=format-security]
     _("could not convert from UTF-8 to UCS-4"));
     ^
../../libidn-1.32/src/idn.c:540:6: error: format not a string literal and no format arguments [-Werror=format-security]
      error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
      ^~~~~
../../libidn-1.32/src/idn.c:551:5: error: format not a string literal and no format arguments [-Werror=format-security]
     _("could not convert from UTF-8 to UCS-4"));
     ^

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a7be185..3f52afb 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -105,6 +105,7 @@ SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-gettext = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
+SECURITY_STRINGFORMAT_pn-libidn = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
 TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
-- 
2.8.1


