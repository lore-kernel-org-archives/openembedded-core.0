Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BE4C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 10:11:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.84648.1738577478535889309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 02:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wr284pmY;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3309458f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 02:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738577477; x=1739182277; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTyzXonu03NAZc9HbDfJ7oyL8BF/6/3Kw08X6zuZzLY=;
        b=Wr284pmYztgGZGd3HeLAF6HbTxrXiDq4GOPDTloRL3G7mr//sQD0jlo21cX6TTBzZr
         eJ8m2imZ6qhcunj2dM1r3FUXoMUN4i4vLrC98TXdTGD/tEIznZl3wZn8wFfd2xA5eMkF
         UBQ+7oYTDNrp7AB6QPs82npoNClMtgBXsl4zWlmwh9Filk0fYzVOe4aFRV1+a9F8OvFa
         762lf9a4r8k7pw6vUustsKU36DlL1/npdGadZFiRiClOCC9gLZMJxry6yTojJ4KiFQzE
         uJjShkYLaF5NH5pi5zQ29NBrmZX/X+ScMh8lbIRQ1NyKJwrNkH800Y4hBcg2KxCnpNgK
         /qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738577477; x=1739182277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTyzXonu03NAZc9HbDfJ7oyL8BF/6/3Kw08X6zuZzLY=;
        b=fQvL6NYXIoDVKJJ4lh4zrGobrlKMXdqu4bjCg21PkKryd79XCztOWR/Wb8sZUisxFu
         kMTJOWaw4D3wIc11H+qDfnVBVUhc3PYhlwFsr1u6eYXIgbfZs+naTf6FLov3t1sOfVE5
         OO/wkJ6KbbnQsa2wRywqH2zMXFKmT/JNHRFOFH0YuRFu6eynK8wVxndW/AZo9kQn4rPe
         iJirrNnR6df2hBGRLRKcLwRKZMqFQBgBKx51nLjXcHMjSSomiZ/+A6L3bmQW0ATQyYqd
         d9HjfMh9YaaUO+QL3at6ssuoXLW2hIGUgf4jumuSupic5BPO1B32UkF/gWPT5dNsNGsw
         Cgqg==
X-Forwarded-Encrypted: i=1; AJvYcCVk/Cffkj6nsxE1Eb0XVynD+apxkZ+OAfeGDChHFfnSUg7oLkzlWzrEpAnSt/9eyaKouLfO+m1axpoIsHeoX69lgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3znoluVZsdFniwrm6mvm32RhXHUKYuKRmLIh2lcngDPM5BGVv
	/0d2hLqP3igOsL2Wwm6AUakvIgarlqMguR+aXolkC6Fusl5SHUjA
X-Gm-Gg: ASbGnctTc/InyK9U7LB8U24wJ/DA2pXScTuYAhswx0UphJ74luVQpvb7MoMyhHmdRMH
	WiJvoM+djMmQA3hUVMnhQCRpf+2LJtk48YTjq6iiXCapKigESZIImHyN2jr9xPeTsZOawIvkv7l
	fz3oY1ALSns8uvs0ownNgf7wQqiuJFMtWzX1rYAVcVLtePVJMZv8EwNlLFn0EkRlQmTMQwiSKhd
	zhaKCeomb8CmAzb+2W9UrmSY0XHO3HhpkU02MKr5TLvDbyTFT0ie34S36YXllY0QC034jUF7NZG
	TA8pQ3IlcfIOtvxCr5nzVXiJQhCfo2FHDh+2sA99/3np1AoZ
X-Google-Smtp-Source: AGHT+IGdnJj0rlgOod6ceVs93UTwZm99k3nYJCtjLNMwjSje1obUR2sqm4l/srtYHCi/kwiXCwj0bA==
X-Received: by 2002:a5d:64eb:0:b0:38c:5dcb:313a with SMTP id ffacd0b85a97d-38c5dcb3574mr10728500f8f.5.1738577476608;
        Mon, 03 Feb 2025 02:11:16 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df36sm191354915e9.25.2025.02.03.02.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 02:11:16 -0800 (PST)
Message-ID: <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
Date: Mon, 3 Feb 2025 11:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <20250131064352.2613105-1-zboszor@gmail.com>
 <20250131064352.2613105-2-zboszor@gmail.com>
 <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <182057ACF258490B.1760@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <182057ACF258490B.1760@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 10:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210637

2025. 02. 02. 9:44 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 02. 01. 15:37 keltezéssel, Mathieu Dubois-Briand írta:
>> On Fri Jan 31, 2025 at 7:43 AM CET, Zoltán Böszörményi wrote:
>>> Enable building rpm with rpm-seqouia for the test.
>>>
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>> Sorry, I still get some errors while building:
>>
>> 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618 (56.20s) (0 failed) 
>> (signing.Signing.test_signing_packages)
>> 2025-02-01 14:28:32,979 - oe-selftest - INFO - 
>> testtools.testresult.real._StringException: Traceback (most recent call last):
>>    File 
>> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/signing.py", 
>> line 113, in test_signing_packages
>>      runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
>>    File 
>> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", 
>> line 214, in runCmd
>>      raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % 
>> (command, result.status, exc_output))
>> AssertionError: Command 
>> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native/usr/bin/rpmkeys 
>> --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import 
>> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-selftest/files/signing/key.pub' 
>> returned non-zero exit status 1:
>> error: Certificate 7B31316B5D64AD52:
>>    Policy rejects 7B31316B5D64AD52: No binding signature at time 2025-02-01T14:28:26Z
>> error: 
>> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-selftest/files/signing/key.pub: 
>> key 1 import failed.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893/steps/14/logs/stdio
>>
>> Do you mind having a look at this ?
>
> I have run the self test on a Fedora 41 host and it succeeded there.
>
> Probably you need to fix the crypto policy to allow such a cert with a
> "no binding signature" or replace the cert.
>
> This github issue may have some useful pointers:
> https://github.com/rpm-software-management/rpm-sequoia/issues/46

Can you please try this below?

Setting the envvar SEQUOIA_CRYPTO_POLICY to an empty string
will use the built-in default policy. See
https://github.com/rpm-software-management/rpm-sequoia/blob/main/src/lib.rs#L54

===============================================
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..9a820ebc72 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
          """
          import oe.packagedata

-        self.skipTest('This test requires rpm-sequoia support in rpm')
          self.setup_gpg()

          package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
          feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
          feature += 'RPM_GPG_NAME = "testuser"\n'
          feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'

          self.write_config(feature)

+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
          bitbake('-c clean %s' % test_recipe)
          bitbake('-f -c package_write_rpm %s' % test_recipe)

@@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):

          self.write_config(feature)

+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
          with self.create_new_builddir(os.environ['BUILDDIR'], builddir):

              os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
@@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
          feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
          self.write_config(feature)

+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
          # Build a locked recipe
          bitbake(test_recipe)

===============================================

It succeeded for me:

$ oe-selftest -r signing
...
2025-02-03 10:53:11,900 - oe-selftest - INFO - oe-selftest () - Ran 3 tests in 2801.617s
2025-02-03 10:53:11,900 - oe-selftest - INFO - oe-selftest - OK - All required tests 
passed (successes=3, skipped=0, failures=0, errors=0)

As for an actual crypto policy for rpm-sequoia, I am not sure
how appropriate it would be to create a recipe for Fedora's
crypto-policies package in Yocto.


