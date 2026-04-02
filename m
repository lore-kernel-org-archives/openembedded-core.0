Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4C11112247
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 00:15:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5309.1775088910444846279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 17:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X37f36ur;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48374014a77so3046035e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775088909; x=1775693709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OU7oA/5TmvNQivZbtuYS06+oY/9WD2wSwBW+Dr0F58A=;
        b=X37f36urr5AxDI6kY9xjJQ7d0hd9QyYFUZSblqnVZjHAtvk+u+BjBbdkAvDP1dxroo
         tR/ZmbhtBU1Pb1B25a5Jhe4zAFw/d8+GOt2LfL6aFYTKCFhY6GA8zY6hQhECeMlQxaEy
         kXUE3Q5pOf4S3Ewl/tEGz0DHWvuD6eZsU3DH9Yo2oIsLQuO8gA06Q7lXxFzkl39Dz4kv
         7JlPB2TMI+DANFKG4QKLmJplssLmmJRdlh8kYz6T4r2jzlW7TJMP6AIxIkSbNoR1t8wv
         0nVhYcmtdS6N+R3uvwq8zbUQ1YoUeu9HDk09PaeiTl4OY2ctRrHO7QEVAVFHKVNgWQmu
         MK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088909; x=1775693709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU7oA/5TmvNQivZbtuYS06+oY/9WD2wSwBW+Dr0F58A=;
        b=Er7YUTGMFKy7H4NYk7jXwBZ5Vf4qEIbruDGUj3sb5Kh8DeO38bZ+6TcaaTlvzv0We1
         7/pMYloFftGAZZ09vbBsnkCswDLV6A6RfETOpAAr9NTJkSOZmqRRUdVGxhZJKJuGXD8E
         npfps6YbAw7/j+D42jw6bpEtsaaSEmR1sdwANa3VLteITvyerApKDB37EdnAN+CZ03CA
         ybmDYLhnFTg5d8OzixuZYrqBOVw/HcaToc8N+a1gAcbznhKCfjzaAU+ACdO9UjGPyzCx
         sG4cZu2iXvmuyVTm7+ahcLYWV3oVahcbXXghyfqXOIB9hYqOkMf/Hba40nrOJySnDdCa
         tB+w==
X-Gm-Message-State: AOJu0Yy9aOPs4Rd4NaGqhmasrh9dkGufqhiMFdq6DpeREwwuNW1Yz3Kc
	p5zmdKvpZUilqlfb4346x9EHQJO/2T4Y5Nvqyzp0yW0rqzbDqFxZa7QM9ljHbQ==
X-Gm-Gg: ATEYQzx1UooGB9O961HJ0hT6Ten5fOiNEe/WIVahub5GpQHroFC+y78mvPB9sp3r/pZ
	gCcmGB4XeVTFwBDy5OP6avLvzojb/4wet3Srb302BnyVs7e6Uf+zHvp9w4IzaXTYzlyv352Gy0x
	rxEdYyHTLQwFgAXhJ2kze3G+g6EgE47IEEUUq5Q09XK6xlAxobhY2YBsKwbU8NDREiCmfweOyBL
	KLcKLXUmuNWD6Ci8jHhouL4gqKCuHW5BCGOQqkSvxap6YlSunefMuv1yKYonAY1bKxo+NPHhUmg
	RErj49v/8/Ikun6zikjxH0lpnqqG/1CHMRzEmw8H+4lP5rpgVr6zcRLN4K0xVqa5dxmgJN/Un+u
	OF6TtjgYhzsoQQAjiuJCiefnOY9J8Z1LLmNJDQA/tmQXoZqnFqP7E9MCSv95HzJEjj4kzr+7vWi
	w8adPd1eWq/+8SnAPAAOLbUjGtug==
X-Received: by 2002:a05:600c:1d29:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-4888b7129f6mr22685065e9.11.1775088908499;
        Wed, 01 Apr 2026 17:15:08 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad706d4sm53642145e9.8.2026.04.01.17.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:15:08 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: hongxu.jia@windriver.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] native/cross: ar wrapper: don't prepend 'D' when @<file> is used
Date: Thu,  2 Apr 2026 02:14:58 +0200
Message-ID: <20260402001458.1717490-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234468

From: Martin Jansa <martin.jansa@gmail.com>

In some cases bazel-native build calls ar with
@<file>      - read options from <file>
syntax, where the ar params are generated in *.param file by
separate bazel action before ar is called.

Unfortunately this intercept breaks that syntax by prepending D like:

$ ./ar-intercept @foo
argv before: ['./ar-intercept', '@foo']
argv after:  ['./ar-intercept', 'D@foo']
./ar-intercept: invalid option -- '@'
Usage: ./ar-intercept [emulation options] [-]{dmpqrstx}[abcDfilMNoOPsSTuvV] [--plugin <name>] [member-name] [count] archive-file file...
       ./ar-intercept -M [<mri-script]
...

or might trigger 'non-deterministic mode requested' error on false positive:

$ ./ar-intercept @Ufo
argv before: ['./ar-intercept', '@Ufo']
ar: non-deterministic mode requested
argv after:  ['./ar-intercept', '@Ufo']
./ar-intercept: invalid option -- '@'
Usage: ./ar-intercept [emulation options] [-]{dmpqrstx}[abcDfilMNoOPsSTuvV] [--plugin <name>] [member-name] [count] archive-file file...
       ./ar-intercept -M [<mri-script]

Don't try to inject D into first line of @<file>, lets assume the caller
uses D already (bazel uses 'rcsD' by default).

       * Ar flags for combining object files into archives. If this is not set, it
       * defaults to "rcsD".
       * TODO(b/37271982): Remove after blaze with ar action_config release

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 scripts/native-intercept/ar | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
index dcc623e3ed..fd266c19d4 100755
--- a/scripts/native-intercept/ar
+++ b/scripts/native-intercept/ar
@@ -19,6 +19,11 @@ argv = sys.argv
 if argv[1].startswith('--'):
     # No modifier given
     None
+elif argv[1][0] == '@':
+    # Reading parameters from @file, we can try to inject D on the first line as well
+    # but modifying input files seems a bit too far for this intercept, bazel-native
+    # uses it but with rcsD by default
+    None
 else:
     # remove the optional '-'
     if argv[1][0] == '-':

