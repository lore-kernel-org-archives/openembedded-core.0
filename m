Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1362074942
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:13 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id q84so691228iod.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=goU5+cV/DYCK54gVfacXSHZM8Em9/vr3FfiXWad3l+0=;
	b=ER1hPPp3zQlOAy27zXe0KNFfhrs5lZ8VXB99ge1Uyhxmk6XBr52rsAKCA9t5saU12V
	jA4JnvUZQPxK1AqJQSF/JBKh9ObPqaA5oovw1CLje4ghzRHn+WHJImGxC7KENGovBNV4
	rDJ8r0KUr7REibQUyjbyGfWxIsnbPgE57oBnmRQzkMpXvwRuCylh3kgBnLDEiid5CxQr
	svwdbehY8J0sfBJuL20kXyX0JWsWjoSfbnZjSBWPFW7hZvS6vWZDqQp4VJNbzPEItFTL
	G9SqMC9c6p1MoR29IMdp29MI4DTNnPm+0/qJR1sRGPhpwF1zfHgKS+QO2DxO9T6sGuup
	Sc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=goU5+cV/DYCK54gVfacXSHZM8Em9/vr3FfiXWad3l+0=;
	b=WvkoMVr47sXSZOUDXasWFGS1WVp1qtz82OPAA7a4Aq0vlfO9071/DMrE79JIVC+Jov
	w7BwKJhBsvIOJP9RGHONEAp4S8uVIP4FA9tSG7FG2unsJP2FozS2VaX0A/9B/f4iaA20
	gmLwrdyOQPpqKJDEpNwMQei7B/kWJxYZBCEHFepuwwJI5u1Sa/09kcy5yG4Xr1N81KdB
	e4zbOKraJuiiFbK3uoUAn6orxGUkrWwzn9dw40RBBBkhYo0UoSvK8sy5Ix9hW3ui0o1S
	eEXIKPmZtQvqBfH/9ksf24dKM2NF1FhcKsw9fYfvR6oPf3uYSLXF5y/VrCGsta7fBLhx
	j73g==
X-Gm-Message-State: ALQs6tDSXxnZcON4B4h+vr0gMRyrCFctSKNzBq/icu6h5ReMBoBT0WhE
	ix2TPv1j3Uj92mEav266nWourpSh
X-Google-Smtp-Source: AIpwx4+upHXwsOmMmnBQidC7GQ5GKp2p9lUWQsW794MgPMgkslFO4hNXBTglb+N1uUk+c7NtHJEmTg==
X-Received: by 10.107.89.10 with SMTP id n10mr2889552iob.67.1523413334544;
	Tue, 10 Apr 2018 19:22:14 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:57 -0500
Message-Id: <20180411022200.22277-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 4/7] icecc-create-env: Add extra tools option
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:14 -0000

It can often be useful to include additional debugging tools the
toolchain such as strace. Add an option to include an arbitrary path.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env/icecc-create-env       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index b88c53a424b..64b5e207853 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -197,6 +197,9 @@ while test -n "$1"; do
         --log)
             do_log=1
             ;;
+        --extra=*)
+            extra_tools="$extra_tools ${1#--extra=}"
+            ;;
         *)
             break
             ;;
@@ -284,6 +287,15 @@ else
     exit 1
 fi
 
+for extra in $extra_tools; do
+    if test -x "$extra"; then
+        add_file "$extra"
+    else
+        print_output "'$extra' not found"
+        exit 1
+    fi
+done
+
 link_rel ()
 {
     local target="$1"
-- 
2.14.3


