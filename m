Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82.1795101863177885084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=phzWlcFO;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1389615f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101861; x=1795706661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hOuSjuvLkT5beRUffWJ/AJlvfHqOhxzk+VKgbu5oKnY=;
        b=phzWlcFOAemC3HWbE0HcSqdjWWGuYCldQbL72RyeFi033RjJC1NCyNFkuPhP4l3XW+
         tMJ31irhKbKbc13UgPamHKZgc1g4PA8ohcimRJicpF2/1m02bfjBv8OLI69Z0akngPTT
         4KYZWmdOPmzr/n7KyIVu8qofChHGJKMND+LBO4e95HkzTRCnAWKrfMGS1MO77qjxoW3w
         qOhyp2O0yUfYJJ3L+/cKyYDbfo/qhUHu0EYbhEDizv2kcm382bGP3NOSCe3hffEJKd9k
         1Oosr1MOHPFh6E05/fWwnGBoTCE7EqKIW0mOT0bzLpQosLuqQfMDkTMfUHCHMw7wgybQ
         FyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101861; x=1795706661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hOuSjuvLkT5beRUffWJ/AJlvfHqOhxzk+VKgbu5oKnY=;
        b=duxeaM4E7l82zY/ei2SqLRrVHn2B3EoUPxXIfdxGZXqHG0PU2YBFnXnj848D2GVVwI
         id+6OWxQ0lhsaH5Gsw3H24kmqD13mGrEEG5B0uv7cN5x8uQzxL3iFtU6r2L+K6fj/jQM
         kCuXFVVSi5P9rzPNPE+Au/6VvWkXkP7M/BZIszqx/qC1Ey+IkIObkPcmRVyecFzLApR3
         ITPD8v7kSNFa+dVXQfsmaGb8Fa1acGZN4l4B9vCA7hIYH4CMqRuv0kFyLaMLgCwV4M3s
         E8zSad4XF8Vh3ccNYWIJFifglaX/+UzOd10jfQsKReXPMmn+Gg3LapbwqI2ZLTA9E/7v
         0wPA==
X-Gm-Message-State: APuU4Z+PiO53oZ3oycp5LGYQu2ippO5Pu0GAMOuOVmCErLQ0U34fIzDl
	mYol7HcpZZk1G0ZIWguN04bGPqh4xb+8Svms3IMowpyqT+NxDBGlLkRHCsueOaP+gH/hIWJnYx7
	NWsy9dOQ=
X-Gm-Gg: AYBFou1+hOPE8lGPNXurwweZjl9jnV7f8OY9m0kNxxVE/HAL+SXSPNwxiGooo55YG5v
	8+f3CJyXa1A64LIU6TZpCXNncjj1UazMbGmSI+ox2E125KmlsFmEMgfJ7Zjpq4W8ABFwaLMZVQl
	tbmzlVy8KfJq5/ESVB1mZabXMhStKO63ZZVu7otthmuoYlr/I4mG28mcP7kwUruua7YsxUuMBXk
	cS/KUQkm4q2JV3OdGPeklwYicYafPh7HF/3IPe06vtBUMzU1UekKZQfCQG2mZIUmlG/mS+fcHPA
	zroBpQRhOrInbVvnEvn6vCgGn/2WLhwabOS9jgTAFyGOGD9tfP7TWaFlSCpumUQTFgEy5IBQOiV
	6W9hyQpayZLlfzXtPVqKJaWcoTcQyiTGssUf7qHbkYsBFdjNY7s+QgPXfnsFHcTxOLs6s+804Wu
	y3xJ85V0m36EhjT326ePObKdXV7w58NfVmH20tm+kCuXOvczI18isgXHEXd+utL0ZrS/iQpNsZD
	ZjlIClT2KWmrSH/+Jvov7+w7Kxtxr25iuXFsAEZskJeCzUoG08kvCUjZAu6LGD4iQ8RPU3t8eKM
	rmkIjnvodSeUSPejm5iRPwMwJRfjMLQNcZd+f6/L9NGs5I1VojIQ3H9EO0ZDV0qei1xHKdWmnSk
	a3uZbJerqX+ds9+rRvWohUpSiEd2mqTkKUUmkqxTxMM3prkMWpDShmQw=
X-Received: by 2002:a05:600c:4504:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb82f754e8mr68943075e9.19.1795101860777;
        Thu, 19 Nov 2026 07:24:20 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:20 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/19] oeqa/selftest/recipetool: Update create_go test.
Date: Thu, 19 Nov 2026 16:22:31 +0100
Message-ID: <25c3032bf21ea1c0191e897373b16f385854da11.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250688
Content-Type: text/plain; charset="utf-8"

From: Alexander Yurkov <alexander.v.yurkov@gmail.com>

Adjust test_recipetool_go_create test to a smaller repository.
Combine test_recipetool_go_create and test_recipetool_go_replace_modules
tests into test_recipetool_go_create, the new test performs both tests.

Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1256f8ff4a94d4f32b2b9ca855359dd2d691beb)
Backport to fix test_recipetool_create_go failing on the autobuilder:
google.golang.org/protobuf's go-import meta now points to
github.com/protocolbuffers/protobuf-go instead of go.googlesource.com/protobuf,
so the hardcoded expectation no longer matches. Upstream switched the test
to a dedicated small repository, which avoids this dependency entirely.

Seen on https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5235

Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 212 ++-------------------
 1 file changed, 16 insertions(+), 196 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 8c54e65ad6..5bde8903f3 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -760,13 +760,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
 
-        recipefile = os.path.join(temprecipe, 'edgex-go_git.bb')
-        deps_require_file = os.path.join(temprecipe, 'edgex-go', 'edgex-go-modules.inc')
-        lics_require_file = os.path.join(temprecipe, 'edgex-go', 'edgex-go-licenses.inc')
-        modules_txt_file = os.path.join(temprecipe, 'edgex-go', 'modules.txt')
+        recipefile = os.path.join(temprecipe, 'recipetool-go-test_git.bb')
+        deps_require_file = os.path.join(temprecipe, 'recipetool-go-test', 'recipetool-go-test-modules.inc')
+        lics_require_file = os.path.join(temprecipe, 'recipetool-go-test', 'recipetool-go-test-licenses.inc')
+        modules_txt_file = os.path.join(temprecipe, 'recipetool-go-test', 'modules.txt')
 
-        srcuri = 'https://github.com/edgexfoundry/edgex-go.git'
-        srcrev = "v3.0.0"
+        srcuri = 'https://git.yoctoproject.org/recipetool-go-test.git'
+        srcrev = "c3e213c01b6c1406b430df03ef0d1ae77de5d2f7"
         srcbranch = "main"
 
         result = runCmd('recipetool create -o %s %s -S %s -B %s' % (temprecipe, srcuri, srcrev, srcbranch))
@@ -775,207 +775,27 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits = ['go-vendor']
 
         checkvars = {}
-        checkvars['GO_IMPORT'] = "github.com/edgexfoundry/edgex-go"
+        checkvars['GO_IMPORT'] = "git.yoctoproject.org/recipetool-go-test"
         checkvars['SRC_URI'] = {'git://${GO_IMPORT};destsuffix=git/src/${GO_IMPORT};nobranch=1;name=${BPN};protocol=https',
                                 'file://modules.txt'}
-        checkvars['LIC_FILES_CHKSUM'] = {'file://src/${GO_IMPORT}/LICENSE;md5=8f8bc924cf73f6a32381e5fd4c58d603'}
+        checkvars['LIC_FILES_CHKSUM'] = {
+            'file://src/${GO_IMPORT}/LICENSE;md5=4e3933dd47afbf115e484d11385fb3bd',
+            'file://src/${GO_IMPORT}/is/LICENSE;md5=62beaee5a116dd1e80161667b1df39ab'
+        }
 
-        self.assertTrue(os.path.isfile(recipefile))
         self._test_recipe_contents(recipefile, checkvars, inherits)
+        self.assertNotIn('Traceback', result.output)
 
         checkvars = {}
         checkvars['VENDORED_LIC_FILES_CHKSUM'] = set(
-                 ['file://src/${GO_IMPORT}/vendor/github.com/Microsoft/go-winio/LICENSE;md5=69205ff73858f2c22b2ca135b557e8ef',
-                 'file://src/${GO_IMPORT}/vendor/github.com/armon/go-metrics/LICENSE;md5=d2d77030c0183e3d1e66d26dc1f243be',
-                 'file://src/${GO_IMPORT}/vendor/github.com/cenkalti/backoff/LICENSE;md5=1571d94433e3f3aa05267efd4dbea68b',
-                 'file://src/${GO_IMPORT}/vendor/github.com/davecgh/go-spew/LICENSE;md5=c06795ed54b2a35ebeeb543cd3a73e56',
-                 'file://src/${GO_IMPORT}/vendor/github.com/eclipse/paho.mqtt.golang/LICENSE;md5=dcdb33474b60c38efd27356d8f2edec7',
-                 'file://src/${GO_IMPORT}/vendor/github.com/eclipse/paho.mqtt.golang/edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-bootstrap/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-configuration/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-core-contracts/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-messaging/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-registry/v3/LICENSE;md5=0d6dae39976133b2851fba4c1e1275ff',
-                 'file://src/${GO_IMPORT}/vendor/github.com/edgexfoundry/go-mod-secrets/v3/LICENSE;md5=f9fa2f4f8e0ef8cc7b5dd150963eb457',
-                 'file://src/${GO_IMPORT}/vendor/github.com/fatih/color/LICENSE.md;md5=316e6d590bdcde7993fb175662c0dd5a',
-                 'file://src/${GO_IMPORT}/vendor/github.com/fxamacker/cbor/v2/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-jose/go-jose/v3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-jose/go-jose/v3/json/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-kit/log/LICENSE;md5=5b7c15ad5fffe2ff6e9d58a6c161f082',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-logfmt/logfmt/LICENSE;md5=98e39517c38127f969de33057067091e',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/locales/LICENSE;md5=3ccbda375ee345400ad1da85ba522301',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/universal-translator/LICENSE;md5=2e2b21ef8f61057977d27c727c84bef1',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-playground/validator/v10/LICENSE;md5=a718a0f318d76f7c5d510cbae84f0b60',
-                 'file://src/${GO_IMPORT}/vendor/github.com/go-redis/redis/v7/LICENSE;md5=58103aa5ea1ee9b7a369c9c4a95ef9b5',
-                 'file://src/${GO_IMPORT}/vendor/github.com/golang/protobuf/LICENSE;md5=939cce1ec101726fa754e698ac871622',
-                 'file://src/${GO_IMPORT}/vendor/github.com/gomodule/redigo/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93',
-                 'file://src/${GO_IMPORT}/vendor/github.com/google/uuid/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1',
-                 'file://src/${GO_IMPORT}/vendor/github.com/gorilla/mux/LICENSE;md5=33fa1116c45f9e8de714033f99edde13',
-                 'file://src/${GO_IMPORT}/vendor/github.com/gorilla/websocket/LICENSE;md5=c007b54a1743d596f46b2748d9f8c044',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/consul/api/LICENSE;md5=b8a277a612171b7526e9be072f405ef4',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/errwrap/LICENSE;md5=b278a92d2c1509760384428817710378',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-cleanhttp/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-hclog/LICENSE;md5=ec7f605b74b9ad03347d0a93a5cc7eb8',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-immutable-radix/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-multierror/LICENSE;md5=d44fdeb607e2d2614db9464dbedd4094',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-rootcerts/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/golang-lru/LICENSE;md5=f27a50d2e878867827842f2c60e30bfc',
-                 'file://src/${GO_IMPORT}/vendor/github.com/hashicorp/serf/LICENSE;md5=b278a92d2c1509760384428817710378',
-                 'file://src/${GO_IMPORT}/vendor/github.com/leodido/go-urn/LICENSE;md5=8f50db5538ec1148a9b3d14ed96c3418',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mattn/go-colorable/LICENSE;md5=24ce168f90aec2456a73de1839037245',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mattn/go-isatty/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/consulstructure/LICENSE;md5=96ada10a9e51c98c4656f2cede08c673',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/copystructure/LICENSE;md5=56da355a12d4821cda57b8f23ec34bc4',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/go-homedir/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/mapstructure/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd',
-                 'file://src/${GO_IMPORT}/vendor/github.com/mitchellh/reflectwalk/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd',
-                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nats.go/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nkeys/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/nats-io/nuid/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/pmezard/go-difflib/LICENSE;md5=e9a2ebb8de779a07500ddecca806145e',
-                 'file://src/${GO_IMPORT}/vendor/github.com/rcrowley/go-metrics/LICENSE;md5=1bdf5d819f50f141366dabce3be1460f',
-                 'file://src/${GO_IMPORT}/vendor/github.com/spiffe/go-spiffe/v2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327',
-                 'file://src/${GO_IMPORT}/vendor/github.com/stretchr/objx/LICENSE;md5=d023fd31d3ca39ec61eec65a91732735',
-                 'file://src/${GO_IMPORT}/vendor/github.com/stretchr/testify/LICENSE;md5=188f01994659f3c0d310612333d2a26f',
-                 'file://src/${GO_IMPORT}/vendor/github.com/x448/float16/LICENSE;md5=de8f8e025d57fe7ee0b67f30d571323b',
-                 'file://src/${GO_IMPORT}/vendor/github.com/zeebo/errs/LICENSE;md5=84914ab36fc0eb48edbaa53e66e8d326',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/crypto/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/mod/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/net/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/sync/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/sys/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/text/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/golang.org/x/tools/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707',
-                 'file://src/${GO_IMPORT}/vendor/google.golang.org/genproto/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57',
-                 'file://src/${GO_IMPORT}/vendor/google.golang.org/grpc/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57',
-                 'file://src/${GO_IMPORT}/vendor/google.golang.org/protobuf/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956',
-                 'file://src/${GO_IMPORT}/vendor/gopkg.in/eapache/queue.v1/LICENSE;md5=1bfd4408d3de090ef6b908b0cc45a316',
-                 'file://src/${GO_IMPORT}/vendor/gopkg.in/yaml.v3/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c'])
-
+                 ['file://src/${GO_IMPORT}/vendor/github.com/godbus/dbus/v5/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed',
+                 'file://src/${GO_IMPORT}/vendor/github.com/matryer/is/LICENSE;md5=62beaee5a116dd1e80161667b1df39ab'])
         self.assertTrue(os.path.isfile(lics_require_file))
         self._test_recipe_contents(lics_require_file, checkvars, [])
 
+        # make sure that dependencies don't mention local directory ./matryer/is
         dependencies = \
-            [   ('github.com/eclipse/paho.mqtt.golang','v1.4.2', '', '', ''),
-                ('github.com/edgexfoundry/go-mod-bootstrap','v3.0.1','github.com/edgexfoundry/go-mod-bootstrap/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-configuration','v3.0.0','github.com/edgexfoundry/go-mod-configuration/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-core-contracts','v3.0.0','github.com/edgexfoundry/go-mod-core-contracts/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-messaging','v3.0.0','github.com/edgexfoundry/go-mod-messaging/v3','/v3', ''),
-                ('github.com/edgexfoundry/go-mod-secrets','v3.0.1','github.com/edgexfoundry/go-mod-secrets/v3','/v3', ''),
-                ('github.com/fxamacker/cbor','v2.4.0','github.com/fxamacker/cbor/v2','/v2', ''),
-                ('github.com/gomodule/redigo','v1.8.9', '', '', ''),
-                ('github.com/google/uuid','v1.3.0', '', '', ''),
-                ('github.com/gorilla/mux','v1.8.0', '', '', ''),
-                ('github.com/rcrowley/go-metrics','v0.0.0-20201227073835-cf1acfcdf475', '', '', ''),
-                ('github.com/spiffe/go-spiffe','v2.1.4','github.com/spiffe/go-spiffe/v2','/v2', ''),
-                ('github.com/stretchr/testify','v1.8.2', '', '', ''),
-                ('go.googlesource.com/crypto','v0.8.0','golang.org/x/crypto', '', ''),
-                ('gopkg.in/eapache/queue.v1','v1.1.0', '', '', ''),
-                ('gopkg.in/yaml.v3','v3.0.1', '', '', ''),
-                ('github.com/microsoft/go-winio','v0.6.0','github.com/Microsoft/go-winio', '', ''),
-                ('github.com/hashicorp/go-metrics','v0.3.10','github.com/armon/go-metrics', '', ''),
-                ('github.com/cenkalti/backoff','v2.2.1+incompatible', '', '', ''),
-                ('github.com/davecgh/go-spew','v1.1.1', '', '', ''),
-                ('github.com/edgexfoundry/go-mod-registry','v3.0.0','github.com/edgexfoundry/go-mod-registry/v3','/v3', ''),
-                ('github.com/fatih/color','v1.9.0', '', '', ''),
-                ('github.com/go-jose/go-jose','v3.0.0','github.com/go-jose/go-jose/v3','/v3', ''),
-                ('github.com/go-kit/log','v0.2.1', '', '', ''),
-                ('github.com/go-logfmt/logfmt','v0.5.1', '', '', ''),
-                ('github.com/go-playground/locales','v0.14.1', '', '', ''),
-                ('github.com/go-playground/universal-translator','v0.18.1', '', '', ''),
-                ('github.com/go-playground/validator','v10.13.0','github.com/go-playground/validator/v10','/v10', ''),
-                ('github.com/go-redis/redis','v7.3.0','github.com/go-redis/redis/v7','/v7', ''),
-                ('github.com/golang/protobuf','v1.5.2', '', '', ''),
-                ('github.com/gorilla/websocket','v1.4.2', '', '', ''),
-                ('github.com/hashicorp/consul','v1.20.0','github.com/hashicorp/consul/api', '', 'api'),
-                ('github.com/hashicorp/errwrap','v1.0.0', '', '', ''),
-                ('github.com/hashicorp/go-cleanhttp','v0.5.1', '', '', ''),
-                ('github.com/hashicorp/go-hclog','v0.14.1', '', '', ''),
-                ('github.com/hashicorp/go-immutable-radix','v1.3.0', '', '', ''),
-                ('github.com/hashicorp/go-multierror','v1.1.1', '', '', ''),
-                ('github.com/hashicorp/go-rootcerts','v1.0.2', '', '', ''),
-                ('github.com/hashicorp/golang-lru','v0.5.4', '', '', ''),
-                ('github.com/hashicorp/serf','v0.10.1', '', '', ''),
-                ('github.com/leodido/go-urn','v1.2.3', '', '', ''),
-                ('github.com/mattn/go-colorable','v0.1.12', '', '', ''),
-                ('github.com/mattn/go-isatty','v0.0.14', '', '', ''),
-                ('github.com/mitchellh/consulstructure','v0.0.0-20190329231841-56fdc4d2da54', '', '', ''),
-                ('github.com/mitchellh/copystructure','v1.2.0', '', '', ''),
-                ('github.com/mitchellh/go-homedir','v1.1.0', '', '', ''),
-                ('github.com/mitchellh/mapstructure','v1.5.0', '', '', ''),
-                ('github.com/mitchellh/reflectwalk','v1.0.2', '', '', ''),
-                ('github.com/nats-io/nats.go','v1.25.0', '', '', ''),
-                ('github.com/nats-io/nkeys','v0.4.4', '', '', ''),
-                ('github.com/nats-io/nuid','v1.0.1', '', '', ''),
-                ('github.com/pmezard/go-difflib','v1.0.0', '', '', ''),
-                ('github.com/stretchr/objx','v0.5.0', '', '', ''),
-                ('github.com/x448/float16','v0.8.4', '', '', ''),
-                ('github.com/zeebo/errs','v1.3.0', '', '', ''),
-                ('go.googlesource.com/mod','v0.8.0','golang.org/x/mod', '', ''),
-                ('go.googlesource.com/net','v0.9.0','golang.org/x/net', '', ''),
-                ('go.googlesource.com/sync','v0.1.0','golang.org/x/sync', '', ''),
-                ('go.googlesource.com/sys','v0.7.0','golang.org/x/sys', '', ''),
-                ('go.googlesource.com/text','v0.9.0','golang.org/x/text', '', ''),
-                ('go.googlesource.com/tools','v0.6.0','golang.org/x/tools', '', ''),
-                ('github.com/googleapis/go-genproto','v0.0.0-20230223222841-637eb2293923','google.golang.org/genproto', '', ''),
-                ('github.com/grpc/grpc-go','v1.53.0','google.golang.org/grpc', '', ''),
-                ('go.googlesource.com/protobuf','v1.28.1','google.golang.org/protobuf', '', ''),
-            ]
-
-        src_uri = set()
-        for d in dependencies:
-            src_uri.add(self._go_urifiy(*d))
-
-        checkvars = {}
-        checkvars['GO_DEPENDENCIES_SRC_URI'] = src_uri
-
-        self.assertTrue(os.path.isfile(deps_require_file))
-        self._test_recipe_contents(deps_require_file, checkvars, [])
-
-    def test_recipetool_create_go_replace_modules(self):
-        # Check handling of replaced modules
-        temprecipe = os.path.join(self.tempdir, 'recipe')
-        os.makedirs(temprecipe)
-
-        recipefile = os.path.join(temprecipe, 'openapi-generator_git.bb')
-        deps_require_file = os.path.join(temprecipe, 'openapi-generator', 'go-modules.inc')
-        lics_require_file = os.path.join(temprecipe, 'openapi-generator', 'go-licenses.inc')
-        modules_txt_file = os.path.join(temprecipe, 'openapi-generator', 'modules.txt')
-
-        srcuri = 'https://github.com/OpenAPITools/openapi-generator.git'
-        srcrev = "v7.2.0"
-        srcbranch = "master"
-        srcsubdir = "samples/openapi3/client/petstore/go"
-
-        result = runCmd('recipetool create -o %s %s -S %s -B %s --src-subdir %s' % (temprecipe, srcuri, srcrev, srcbranch, srcsubdir))
-
-        self.maxDiff = None
-        inherits = ['go-vendor']
-
-        checkvars = {}
-        checkvars['GO_IMPORT'] = "github.com/OpenAPITools/openapi-generator/samples/openapi3/client/petstore/go"
-        checkvars['SRC_URI'] = {'git://${GO_IMPORT};destsuffix=git/src/${GO_IMPORT};nobranch=1;name=${BPN};protocol=https',
-                                'file://modules.txt'}
-
-        self.assertNotIn('Traceback', result.output)
-        self.assertIn('No license file was detected for the main module', result.output)
-        self.assertTrue(os.path.isfile(recipefile))
-        self._test_recipe_contents(recipefile, checkvars, inherits)
-
-        # make sure that dependencies don't mention local directory ./go-petstore
-        dependencies = \
-            [   ('github.com/stretchr/testify','v1.8.4', '', '', ''),
-                ('go.googlesource.com/oauth2','v0.10.0','golang.org/x/oauth2', '', ''),
-                ('github.com/davecgh/go-spew','v1.1.1', '', '', ''),
-                ('github.com/golang/protobuf','v1.5.3', '', '', ''),
-                ('github.com/kr/pretty','v0.3.0', '', '', ''),
-                ('github.com/pmezard/go-difflib','v1.0.0', '', '', ''),
-                ('github.com/rogpeppe/go-internal','v1.9.0', '', '', ''),
-                ('go.googlesource.com/net','v0.12.0','golang.org/x/net', '', ''),
-                ('github.com/golang/appengine','v1.6.7','google.golang.org/appengine', '', ''),
-                ('go.googlesource.com/protobuf','v1.31.0','google.golang.org/protobuf', '', ''),
-                ('gopkg.in/check.v1','v1.0.0-20201130134442-10cb98267c6c', '', '', ''),
-                ('gopkg.in/yaml.v3','v3.0.1', '', '', ''),
+            [   ('github.com/godbus/dbus','v5.1.0', 'github.com/godbus/dbus/v5', '/v5', ''),
             ]
 
         src_uri = set()
