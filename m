Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11542.1795084235757467346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=s4FBEPOe;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so21574675e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 02:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084234; x=1795689034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOyqYxnH3gCvRiqrqcHkmeaK8v4YRrZyu2BDD5qBhz4=;
        b=s4FBEPOe7qFO69vGCB9emsKIBFrlPs7SNUEuCRahUSMt6NFawIn1Nc/q86tMwdqDEt
         HBADU1so3SchTpC/dXnlJgyNuWp4nwPUbQp3J6FNhR1vIZCVxT7Q6Y1dYcUMe3ScU7uT
         AeFECtg55n43hzz0KT/xN+4Prcu7ZrXXH1SMBPEtTPgUfpuSrBfEEyFBbXi9EFJpGKJm
         bnQX5tD0ODiFDP0qlvCWlwEQjkQkf0+VeF5uWrGEca2C70ogOsIu5i1mASRDU3rdyQEe
         oT+yH6OhTT8tINR1uS2o1zjvH075BPyfEt3ZSPGG+96h4lWEF7Jll6nEEaO6wXAsfmyd
         1tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084234; x=1795689034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOyqYxnH3gCvRiqrqcHkmeaK8v4YRrZyu2BDD5qBhz4=;
        b=M3XtcnDcKAKs/KYkj7KCV8WMxecTH++DAQKcwV9Djt0CI1t5imvT3/0kKXHeWJgs0P
         LFZ5jhYXBVLPAVHW3WAYmXOUN/uumvpE+1dzvJgM/2fkjS2wymJ9CZUNcotYWUpqLC2F
         ahrsyTMbV3Mmi0SIhinow6KLKn/lcU7Z9UxjVFW85nOeUZ2g7UUPJo28LJyBwy7GilDD
         b/+VsxZQidJtwKeyOYIQsEv2ko7QOGdP6yD0FgicXjRdHVPMAPfaeH2baRLBZEmw1q1G
         WFist4Jfj4DI9WHFDYWPWmqcsgTTLmkCT1GqDzJgTfZez/S5hY5WfGFEgbNuh//0DwTa
         6z9w==
X-Gm-Message-State: APuU4Z/vwoRYQKCwbfvBQ89MBrdjkrZAZXNi5zvbG0L7FP5TU8Pp4N2D
	nndBJlAMpAY6du+BkyJMcHMBTnSo5cassPSAr8/PIxwbV0zdMyQ176be
X-Gm-Gg: AYBFou3pYd0SY72UD3mTzr+RZIUwzHQSpq1iZ1yb5S8ICcORM427kaMPtr+VqzLfxTP
	v6WO9rqF6sXKfk7jQxB6aPklFe+I9egFzjdzsYoxO81l3534sswZQE6v00p7Q+Sn+yC7Lo9XvUm
	qS1VNRZzXx9zaHaADJTHf66bRpHIyHVT2tuZStojbQU5SIsWfPUM6rpWB4mmOEb/eZk5Hl27w7S
	PgOqfU1xEDKkNngECRPbN9hb4NyydVyUt1xMmLEFb4ZteZLeAxCIvJOu7yy13VjQnHuLfTsUssT
	e8oaQ1dvFKuVLuv8GZl2cWDgnjXCGC8/KSDci5PK+mdF4UWFDGl79AUT1PqI26JHNEJA2TV06ho
	MI5SEYfklSu1UpHSvvnpCS1HfwuvnQHwz/Xxrb7CzbdtbT+igWxpNWY2RbJ+IyXR4pbdqtZBurH
	9jSiaUbQ9ho/GloBS4RzLCVIGsWHfbAOuzbIwxuYZQ01FcBOAj45Zw69+GYw2OPmUnB+SpkF/75
	XhL6szRvq4nzGzi8o1ZRvhRMIxZHmx6bPFCDOJ8ox7hzKmh2hN9LoNzce5tL8HbCxLpvc3fq8ko
	eXYtOb/MSKQ=
X-Received: by 2002:a05:600c:1553:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb7da48319mr94505085e9.34.1795084233532;
        Thu, 19 Nov 2026 02:30:33 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm9755030f8f.17.2026.11.19.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:30:30 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org,
	Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	stefano.tondo.ext@siemens.com
Subject: Re: [PATCH v2 4/4] oeqa/selftest: spdx: Test crate identity, scope and output PURLs
Date: Thu, 19 Nov 2026 11:30:29 +0100
Message-ID: <20261119103029.311675-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <DMZ3O22TVVFQ.155PGZ293VQJO@pbarker.dev>
References: <20261118234425.3681880-1-stondo@gmail.com> <20261118234425.3681880-5-stondo@gmail.com> <DMZ3O22TVVFQ.155PGZ293VQJO@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 10:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250661
Content-Type: text/plain; charset="utf-8"

On Thu Nov 19, 2026 at 10:03 AM GMT, Paul Barker wrote:
> Does it use a fixed version of the python3-bcrypt recipe or just
> whatever version is currently in OE-Core?

Hi Paul,

It uses the version that is currently in OE-Core. There is no copy of
the recipe in meta-selftest.

> If it tracks the version used in OE-Core, is it likely to start failing
> when python3-bcrypt adds or removes dependencies in the future?

I do not expect it to fail. I wrote the tests for this case. They do
not contain crate versions or crate counts. The 42 crates are only in the
commit message. The tests get the expected values from the build:

- The name, version and PURL of each crate must agree with its
  crates.io download URL.
- Each crate must have exactly one lifecycle scope, or an annotation
  that it is not built.
- The cargo PURLs of the output package must be equal to the set of
  crates that have the runtime scope in the build SPDX.

When the recipe adds or removes a dependency, these sets change together.

The tests use three facts about the dependencies of python3-bcrypt:

- blowfish has the runtime scope. It is the cipher of bcrypt.
- syn has the build scope. The pyo3 proc-macros use it.
- At least one crate is for another platform, so it is not built.
  Today there are five: r-efi, wasi, wasip2 and wit-bindgen come
  from getrandom, and portable-atomic comes from pyo3.

Only a large change in bcrypt or pyo3 can make the first two false.
The third is less certain, but getrandom supports WebAssembly and UEFI,
and it is unlikely to stop. If this check fails, the message shows the
fact that changed. Then we can use a different crate or remove the
check.

Best regards,
Stefano
