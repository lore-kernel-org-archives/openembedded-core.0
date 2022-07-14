Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 13/27] gstreamer1.0: upgrade 1.20.2 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:33 -1000
Message-Id: <2c177d00e1e839593757da5985b411f2770da009.1657772638.git.steve@sakoman.com>
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

The third 1.20 bug-fix release (1.20.3) was released on 15 June 2022.

This release only contains bugfixes and it should be safe to upgrade from 1.20.x.

gstreamer
clock: Avoid creating a weakref with every entry (performance improvement)
plugin: add Apache 2 license to list of known licenses to avoid warning
gst_plugin_load_file: force plugin reload if filename differs
Add support for LoongArch

Base Libraries
aggregator: Only send events up to CAPS event from gst_aggregator_set_src_caps(), don't send multiple caps events with the same caps and fix negotiation in muxers
basetransform: handle gst_base_transform_query_caps() returning NULL
basetransform: fix critical if transform_caps() returned NULL
queuearray: Fix potential heap overflow when expanding GstQueueArray

Core Elements
multiqueue: fix potential crash on shutdown
multiqueue: fix warning: ‘is_query’ may be used uninitialized in this function
multiqueue: SegFault during flushing with gcc11

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b1e4ad9b31f9f6e34dae1d0b73d36adca58eb59)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
index 3aa9aa7048..1f4576c3e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
+SRC_URI[sha256sum] = "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1

