Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29835.1793868247931415637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=mGjif/hb;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11433645e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868246; x=1794473046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eU7nCwwv4DMF78MnNCt82akO3iH831gUy5/d3EDAlQU=;
        b=mGjif/hb9auJ19ujLrMfm3UbBH/0HMmIvtAKuNAcJ/11qMg4kp2zpA6UqAJWrEUNkb
         2Vc6UbmSwAPbLpIghCmXK5OWdjfppR3h2hfXIKjKbes8RNnxdYBySHloEVF7Tv9LwqNd
         8Y8E4eE66AgqjqSF1kCxd0usQLpJF4vqXZzumJ1NqT9paGf4dTk4FTdpkgiBgiWQ4nOu
         EdqepxtQQSVzILZfYsXsJk1z2qdUXD5GswlvrCD1n6+EHfbP7kTwCxQNkeL4ahaXNdc9
         tbNkEI3GYWvMfXRZ3hK7wSyPzfnSHIuu5NuCN6oFytsfX+7Nfc9spqktSewbUlycO5BQ
         g41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868246; x=1794473046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eU7nCwwv4DMF78MnNCt82akO3iH831gUy5/d3EDAlQU=;
        b=YQAzJDc5Ac8DL9eTwCfCK4seL/7eV2xUDZOYbysLqOxDFAeV5ihf+lSSTXdtpTU5go
         6GJzj5fNRbDTnGAXy2ExJTbFZj48MHbbHzJy30AajQCKDcOZGrP0BSXozb3P4IBt0doD
         eyJPoxgl2NuHEQcn9+TXuZp6XAz5DRLf2/QWNXS8rLm3ga94BK9KPZS+1gTvZB3T85aJ
         yVJ3O0xYwhbm5Thw+bjiRN8XsICgEvqs5MUjX08bjqPHCZRPvSCW8OzW0LlEr4ZWTKKK
         F3d0sGD/uKlHDhmn3TSbTNGATjfV3zNJ9/4yETv4jN/dJESs7FXQU95Bo6+e8eEmdX4L
         3C4w==
X-Gm-Message-State: APuU4Z+1z16/ks+4n7ZJ1oHW7cggUInY0aH60plVDre4Hz4ExDjmx867
	aTwvCmK01+JgA2nRmJWmumsVGvc3NgVmztjftfa5t7GmmcoaWjQkN6w7aLKZrQOVwCmBy0nMria
	4lH8z960=
X-Gm-Gg: AYBFou1vufstA4fE82gdZxDGxavdIj8Mln8JJ6OG4AoU6hSZjKqdnkL4ITv8CQteJ8V
	+8e5h/QPGy3vk0e6+EOnU0GfQaooRTPAwsxReLELGMocus93R1k+chCFaBP9UYnn1puycsrxdHd
	rlwLnmK0OaMlRDkrMWQ9jf2lXCmW3mdMb0o8aKcPuIvLN1YvF5laghLa+zOkPgLO+iTc2OTLGdD
	aNdTGyLMOWRT9NzhyWsUTCUiLSj6cXAxBv3RVXq01sdJdxMQA+bXMv76rb5cjZHyJnj4d33PwqY
	aGFk1K+RXBIvPXHgfGVToA/fXpPIayV8qoMzzqEEwNRphjGp6zpc6i247XWP7vb8CazD3ltz33S
	1papTGpi0SizLFkM+XsRX9eyY7/Df5cVqJ6oMTvJAd55nhHHWZlgioj2+NSaZknQeXnYl7X76OF
	STT3/Ur2MpqdwUq6dUTyfji0BSy2XGzMfKERogqNnQEtzZ1cGUi6NYNRPooe120Y3aFdcEYuO98
	WFqBcFg1UvpaTmG7mOLftWokH+m4+fscmvQySGkHRy48UaHgJ+q9N45KE2QQACV+hjjpFfCgyC8
	CyjnZzBDAMhOnD+EK/uoXrYHR6cXO6oQPuw+49L4qZ0ChRGx0FWxyulf/N3ne/maTuoFRxJgL+T
	oug5mK1sR5XBYfA78Co9CeBxVrFca
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr430574595e9.2.1793868246165;
        Thu, 05 Nov 2026 00:44:06 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 53/60] sstatesig: write locked-sigs.inc atomically
Date: Thu,  5 Nov 2026 09:43:12 +0100
Message-ID: <b30dc96d6b282807d845ae4904e6a78b89c7e0f4.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249512
Content-Type: text/plain; charset="utf-8"

From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>

dump_lockedsigs() writes the sigfile in place, so if bitbake fails or is
killed partway through, for example on a full disk, a truncated
locked-sigs.inc is left behind. yocto-check-layer's test_signatures and
test_machine_signatures run bitbake with -k and ignore its exit status
when the file exists, so they would compare a partial set of signatures
without noticing.

Write to locked-sigs.inc.new and move it over locked-sigs.inc with
os.replace() once complete, as epochfile_write() in oe/reproducible.py
does, so a failed dump leaves no sigfile behind.

Tested by making dump_lockedsigs() fail with ENOSPC halfway through on
meta-qcom data: yocto-check-layer previously accepted the partial file,
now it reports the error. Complete output is byte-identical and a
meta-qcom yocto-check-layer run gives the same results as before.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54a5173ff507de4b2bfd54bd12a6836fb6129286)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/sstatesig.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 9928f3af495..928fe2e44f8 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -259,7 +259,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             if taskhash != unihash:
                 unihashmap[tid] = "    " + self.lockedpnmap[fn] + ":" + task + ":" + taskhash + ":" + unihash
 
-        with open(sigfile, "w") as f:
+        tmpfile = sigfile + ".new"
+        with open(tmpfile, "w") as f:
             l = sorted(types)
             for t in l:
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
@@ -277,6 +278,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             for tid in sortedtid:
                 f.write(unihashmap[tid] + " \\\n")
             f.write('    "\n')
+        os.replace(tmpfile, sigfile)
 
     def dump_siglist(self, sigfile, path_prefix_strip=None):
         def strip_fn(fn):
