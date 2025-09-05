Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE26DCA1017
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 20:28:21 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3550.1757104095777834479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 13:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bW879MqJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61e8fdfd9b4so5742200a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 13:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104094; x=1757708894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhu8x1J+Yx7OBofk+MhRsVxLIBaWz7Zte+jLyI7g+Ck=;
        b=bW879MqJt0Ne72JvZaqSuMus7HSxm8Wses0PdXwOLr7krNxx1jqirUXpfMKO0GzZmA
         eMn5q2psQButPdwQEMwMPvKjKUYyVn99S19jMQpDzuYCY0AdQuuhQbAV/9iUEeG9YRBM
         CMAMf/c6EEQncegW8j8Dg1/QiQsgVfogbFlNPVAVhyFXGXMC7NA2cYk8ZeXe+w2DvHZV
         3CEBoqQapbSQ5Hf7dO0ya0VK20U4LBhPY4nEZufKG/S+s/+mD/jlOKTorTdjM/EBiBeo
         nTOojpUpsC2+HOVMIgX9B55OyQLdVjHcISJabKmy5gcQGUPHbrdjnNl1sqaKN2+D++27
         0dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104094; x=1757708894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhu8x1J+Yx7OBofk+MhRsVxLIBaWz7Zte+jLyI7g+Ck=;
        b=PcrCbcJ29/2yNK0OazOp/As161qeyn5HX/2SvxUXJN+OpWS5bBpbOazH2PytAzJH9H
         h7blinQkvx/DoImU0xRIcD7Zronadugm6+cqurEb6AUDlm/RuOaXZxpNpucxB+mUy/xk
         RyH6GCsuQulPYGIq/z0dTzBM3gY8dlF9Bd/4f9Nt9y3U9MsfIRkG4ZRstsgHP4dzo2Y4
         I036tXI8UXlp6LfSnaruNMLpakF/UGhBRTdbTm7AnFD/xt4wCnWGcD9wVcRvNSR+Dc1e
         WoDx9WQG9JkUb/tHcr/kgE/5ogJU60SCDpAmu+3jJTtlqe/z5iUMm0Kt3sGwlJ4Gwbpc
         vSUg==
X-Gm-Message-State: AOJu0YyZoRQmlLbgQHsA1IhQuCaL2lbEQSr6ybZpjAnUSj8ugCPYzhBb
	WaRyFJyalTrU4o8QaWCqQjorPdbD5551/eakLTqIkI4iNsqPE58zzQz8sTDr7g==
X-Gm-Gg: ASbGnctv+a3Dz4r9uukC7R4Y2UqneSzlHhHnQMtRzoxl0hIyM7alWI/Z/vlasAUZNKL
	tNfVr4xS9qXtkeMprhyvoXUaw+iOonutR5ZOq9L0Wocufb1HIW9JUj0rCHCg9Zql4ZuStwPCIGH
	JXplAPTSSI7jhf/Ec6IMn1TTKe3OOBl7qAuB52TDZX71K/FB2Hpjf6OD7eEbFMIz69i6a7WnV9s
	csEoY4ts0J3iygRRKIbw2hfzNNK2DUMGjnIwH7a7h/Pvtks2L6oG3yuWVXgPY3c1umQA69H58YD
	WVIs4fK65Pt/sdjNMPofhzHusNr5f+bY2iMVkGnQuD6vkWDIq0t8qanpRb4irzWC3uR0qri+n1i
	OqwhDZ6OGVhglZ2ustbnq
X-Google-Smtp-Source: AGHT+IHaR4518Vvwb07UR/++VcxWIL9IJBQHbHLyJmBXxXpQu/0cFvf3JYQaPaOXgLG4a50O0Km9sw==
X-Received: by 2002:a05:6402:13d6:b0:618:4a1b:e311 with SMTP id 4fb4d7f45d1cf-620f3b7413emr5628946a12.3.1757104093894;
        Fri, 05 Sep 2025 13:28:13 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6225c55758asm1018182a12.20.2025.09.05.13.28.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:28:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-target-config.bbclass: move target generation before do_configure
Date: Fri,  5 Sep 2025 22:28:12 +0200
Message-ID: <20250905202812.403790-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 20:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223039

The rust_get_targets task from the rust-target-config class generates some
Rust compiler configurations for different the target and host machine, which
is used by Rust during compiling a recipe. These configurations supposed to
be available by the time the Rust compiler is used for the first time.

By default, this task is executed "before do_compile" - it assumes that
this is the first task that would use this configuration.

However this is not always the case, especially with projects which are not
pure Cargo projects, rather Cargo/Rust is called by a different build system.
As an example librsvg uses meson, and during the do_configure step Meson probes
the Rust compiler, trying to gather some library info from Rust. In case the
rust_gen_targets task was executed before the do_configure task, then
everything works. However this is not always the case - sometimes the job is
executed between the configure and compile steps, in which case the configuration
fails.

To avoid such problems, generate these targets before the do_configure step.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

Alternatively I believe I could also do some deltask + addtask combo in the
librsvg recipe to reorder the tasks, however I haven't seen other recipes doing 
that in oe-core.


 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 8ab5317c3f..7b238c1840 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -442,7 +442,7 @@ python do_rust_gen_targets () {
     rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
 }
 
-addtask rust_gen_targets after do_patch before do_compile
+addtask rust_gen_targets after do_patch before do_configure
 do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
 
 # For building target C dependecies use only compiler parameters defined in OE

