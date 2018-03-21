Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC4178969
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 20:33:29 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id w3-v6so8540093itc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2TDqB616QGWtKHRnqPjgrFcil1SEveUvCU+Hd4hnTpw=;
	b=CAEMVjHK1AMA2+3CsQ4IzMkcj6ji0jJHcjL4q+IEHQ3kYdqSWKxvH4ojkAGgD/Tf01
	5cnuzopNAPJ4rjZnSFHsQZ6XHwPSXa24/kmRjb+uCuM2QLyr4/cpdC4TGe/g0GeePckE
	wGu0FWlZDa73uWHc/yfFoUX9+V4EKGtDrFosaYXG01mQvWM7fIGSVkBeSiMJOY/r6km1
	wAgPeDpqW75r/C7wEYJKrrXiGR2k90Qarv2RhOsQ6r8BUAQ+rWKs6anuTTMslYWnVSKd
	KNZqf6JMYNI2KsjpT6ujTzZewZZwHdaq8/+5Di+DPVT3HhElSIKIgoO5SXdHlW5nU9Ba
	2EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2TDqB616QGWtKHRnqPjgrFcil1SEveUvCU+Hd4hnTpw=;
	b=CH5kzHvjKsxUKEJwTTv7FWEW0VSy7z0LFzfN99zJpUSdtyJaNJkXFnaNNyAilAM9cG
	meY/JUp/pv+0aWybUsRNk67fcaNSn0yTsHCOrdorpEZ9A/lsqe62hsfDn7zBzDlF+p+G
	5j3RDGTHIrWf1TCBG3BaOl+eJslqTtEbtScSSPxlckYDOHjFbDJyd6reL3QWHi8K7/4/
	LfkpI6JhHHe0EZNBFMfvBxTqdYdae6PyAhCkFKEdXsgi53vn2/DQ+WjHSDOVp2L0Kv2M
	HzjTQWlqP8Miz2/WvnUn6sDMwxrUIZZLGe/WB+AZCFTua+UE2uX7O8uT0a79ereK+Zey
	3Bfw==
X-Gm-Message-State: AElRT7E45AtqkiGDhfyLTCWJRlD+fe5p1sQn2NM/n1CAK/mAxCdng7sh
	rwNEWJ5h+C2SaH6YCxC7oliaGbQd
X-Google-Smtp-Source: AG47ELui9lD43Hzn+CM+YJ7/PSv/iwL8nu24u2I3W6gE6q124QoombDuZ/wbToDWsFF2JzsmjNWBCg==
X-Received: by 2002:a24:8902:: with SMTP id
	s2-v6mr5817014itd.143.1521664411125; 
	Wed, 21 Mar 2018 13:33:31 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	28sm3680385ioj.8.2018.03.21.13.33.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 13:33:30 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 21 Mar 2018 15:33:01 -0500
Message-Id: <20180321203301.18296-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] ref-manual: Update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 21 Mar 2018 20:33:30 -0000

Describes the new wildcard syntax

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 09eb9b9dfc7..58a58b0605e 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                     <filename>mplayer2</filename>.
                 </para>
 
+                <para>
+                    The special token <filename>"*"</filename> may be used on
+                    the left hand side of the dependency, which will match all
+                    recipes except the one on the right hand side.
+                    For example:
+                    <literallayout class='monospaced'>
+    SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
+                    </literallayout>
+                </para>
+
+                <para>
+                    In this example, all recipes except
+                    <filename>quilt-native</filename> will ignore task
+                    signatures from the <filename>quilt-native</filename> recipe
+                    when determining their task signatures.
+                </para>
+
                 <para>
                     Use of this variable is one mechanism to remove dependencies
                     that affect task signatures and thus force rebuilds when a
-- 
2.14.3


