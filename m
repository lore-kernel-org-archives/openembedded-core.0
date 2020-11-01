Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.14083.1604233674408170268
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 04:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W3G1qNuc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id b3so5476467wrx.11
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 04:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vRzdSBgZ+Q0h0XEhxMeYljwbic8tTRPC8DpBygSe2Ys=;
        b=W3G1qNucshNDPBIFVMw/eoNAPUbwLZZJfleh34maP45WHMZKkCAoZLVd9+BZCykrPA
         BPNrlK3lphVLESR/8F57EIoFXk7PCfjrvjk6mT/KP88f3Tn52hh7X1PCAxXLiRZx7zNJ
         hEp/fEpxs4cQQOXQGPHqNz8jAd/21Z7Bewkok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vRzdSBgZ+Q0h0XEhxMeYljwbic8tTRPC8DpBygSe2Ys=;
        b=lQY+PCZqSKDlbddpfQLSa0k/2bhxvlkW+rt27zYdFlmvzDNOOo1aB2T7WiBY8WEmoP
         tmoKCz/OReOc/saksJUYe5NeVPmeFpScuEm7Go6Pq7gKkr3UVHpd09bOloFosQJZHvbs
         kk4I9iVIDEe+g2GWG5o5sqoPeDukCbfF7G7O2HLQT56U3X1ZnyzWDO5+qxB69t6d1o6s
         9xe6IcH3h3hk/G9SWySSfzVu782+dmDdGtujfB/3nXb678i3TV2mE6vA9SCWQd9FlT11
         mHlreiok0hfQd7pKefzD8DMjkMBrj6Unfvjpw0fHnoTta+rGvyVzYSEYXDTDAql7dIpr
         ZFgA==
X-Gm-Message-State: AOAM532mjHJ4Y74lrq7t5dkGEAsg2dK4FeTa7HyM7Wi/KKs4Q2s2qmzB
	uytxhHPdcjx4C1LwDECi+Dtw5w==
X-Google-Smtp-Source: ABdhPJx6k7UmZnuDFF1HjgHGktnzbnKbY+zS5rpkseBwYE3V4WscJHtKdx7M/ilkINnVS4xg9a28NQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr13791427wrt.23.1604233672872;
        Sun, 01 Nov 2020 04:27:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id w1sm7996155wro.44.2020.11.01.04.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 04:27:52 -0800 (PST)
Message-ID: <ef608819d2cb9129ae2783ecf6040b77cc0cf4e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: Change virtio-vga to virtio-gpu.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Vasyl Vavrychuk
	 <vvavrychuk@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sun, 01 Nov 2020 12:27:50 +0000
In-Reply-To: <CANNYZj_7KWx7h=LGJd_zwN3gNEcRY1_i4cOriciQBxCns5mvKA@mail.gmail.com>
References: <20200830201522.23701-1-vvavrychuk@gmail.com>
	 <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
	 <CAGj4m+5pTiiiqmncAU500S6AnGmBuxdFyE3t0btJzcj7wibhpg@mail.gmail.com>
	 <CANNYZj_7KWx7h=LGJd_zwN3gNEcRY1_i4cOriciQBxCns5mvKA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-10-31 at 13:27 +0100, Alexander Kanavin wrote:
> I think you first need to set up a build directory to use sstate-
> cache in some common location, then build-st will pick it up, and you
> can then easily delete it without destroying the cache.

You can do something like the patch below. I would warn that the tests
assume clean directories so you have to be careful doing this though.

Cheers,

Richard

Subject: HACK:selftest/context: Allow reuse of existing build directory

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index dd3609c1d6..3a2447d026 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -73,12 +73,16 @@ class OESelftestTestContext(OETestContext):
         newselftestdir = newbuilddir + "/meta-selftest"
 
         if os.path.exists(newbuilddir):
-            self.logger.error("Build directory %s already exists, aborting" % newbuilddir)
-            sys.exit(1)
+        #    self.logger.error("Build directory %s already exists, aborting" % newbuilddir)
+        #    sys.exit(1)
+            bb.utils.prunedir(newselftestdir)
+            bb.utils.prunedir(newbuilddir + "/conf")
+
+        if not os.path.exists(newbuilddir):
+            bb.utils.mkdirhier(newbuilddir)
+            oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
 
-        bb.utils.mkdirhier(newbuilddir)
         oe.path.copytree(builddir + "/conf", newbuilddir + "/conf")
-        oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
         for e in os.environ:



