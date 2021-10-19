Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 10/65] python3-pip: update 21.2.4 -> 21.3
Date: Tue, 19 Oct 2021 17:33:24 +0200
Message-Id: <20211019153419.3319802-10-alex@linutronix.de>
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

Adjust patch as file is removed from source tree.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-change-shebang-to-python3.patch      | 37 ++++++-------------
 ...hon3-pip_21.2.4.bb => python3-pip_21.3.bb} |  2 +-
 2 files changed, 13 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_21.2.4.bb => python3-pip_21.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch
index 0187001168..d6c27b8461 100644
--- a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch
+++ b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch
@@ -1,4 +1,4 @@
-From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 00:00:00 2001
+From dca973830d4eee3e0f79e61237c44a9dd8201641 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 22 Jun 2021 12:31:46 -0400
 Subject: [PATCH] change shebang to python3
@@ -10,8 +10,8 @@ to "python" instead of "python3", so patch them as needed to ensure that
 they correctly reference the python3 binary.
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
 ---
- src/pip/_vendor/appdirs.py                    | 2 +-
  src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-
  src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-
  src/pip/_vendor/chardet/langhebrewmodel.py    | 2 +-
@@ -21,20 +21,10 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  src/pip/_vendor/chardet/langturkishmodel.py   | 2 +-
  src/pip/_vendor/chardet/metadata/languages.py | 2 +-
  src/pip/_vendor/requests/certs.py             | 2 +-
- 10 files changed, 10 insertions(+), 10 deletions(-)
+ 9 files changed, 9 insertions(+), 9 deletions(-)
 
-diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py
-index 33a3b7741..60b9ef5f7 100644
---- a/src/pip/_vendor/appdirs.py
-+++ b/src/pip/_vendor/appdirs.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- # Copyright (c) 2005-2010 ActiveState Software Inc.
- # Copyright (c) 2013 Eddy Petrișor
 diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py b/src/pip/_vendor/chardet/langbulgarianmodel.py
-index e963a5097..97ea6cea8 100644
+index e963a50..97ea6ce 100644
 --- a/src/pip/_vendor/chardet/langbulgarianmodel.py
 +++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
 @@ -1,4 +1,4 @@
@@ -44,7 +34,7 @@ index e963a5097..97ea6cea8 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/langgreekmodel.py b/src/pip/_vendor/chardet/langgreekmodel.py
-index d99528ede..4a127ea83 100644
+index d99528e..4a127ea 100644
 --- a/src/pip/_vendor/chardet/langgreekmodel.py
 +++ b/src/pip/_vendor/chardet/langgreekmodel.py
 @@ -1,4 +1,4 @@
@@ -54,7 +44,7 @@ index d99528ede..4a127ea83 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py b/src/pip/_vendor/chardet/langhebrewmodel.py
-index 484c652a4..676c1a711 100644
+index 484c652..676c1a7 100644
 --- a/src/pip/_vendor/chardet/langhebrewmodel.py
 +++ b/src/pip/_vendor/chardet/langhebrewmodel.py
 @@ -1,4 +1,4 @@
@@ -64,7 +54,7 @@ index 484c652a4..676c1a711 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py b/src/pip/_vendor/chardet/langhungarianmodel.py
-index bbc5cda64..042eae70a 100644
+index bbc5cda..042eae7 100644
 --- a/src/pip/_vendor/chardet/langhungarianmodel.py
 +++ b/src/pip/_vendor/chardet/langhungarianmodel.py
 @@ -1,4 +1,4 @@
@@ -74,7 +64,7 @@ index bbc5cda64..042eae70a 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/langrussianmodel.py b/src/pip/_vendor/chardet/langrussianmodel.py
-index 5594452b5..564b02e58 100644
+index 5594452..564b02e 100644
 --- a/src/pip/_vendor/chardet/langrussianmodel.py
 +++ b/src/pip/_vendor/chardet/langrussianmodel.py
 @@ -1,4 +1,4 @@
@@ -84,7 +74,7 @@ index 5594452b5..564b02e58 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/langthaimodel.py b/src/pip/_vendor/chardet/langthaimodel.py
-index 9a37db573..c97487959 100644
+index 9a37db5..c974879 100644
 --- a/src/pip/_vendor/chardet/langthaimodel.py
 +++ b/src/pip/_vendor/chardet/langthaimodel.py
 @@ -1,4 +1,4 @@
@@ -94,7 +84,7 @@ index 9a37db573..c97487959 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/langturkishmodel.py b/src/pip/_vendor/chardet/langturkishmodel.py
-index 43f4230ae..7e710c371 100644
+index 43f4230..7e710c3 100644
 --- a/src/pip/_vendor/chardet/langturkishmodel.py
 +++ b/src/pip/_vendor/chardet/langturkishmodel.py
 @@ -1,4 +1,4 @@
@@ -104,7 +94,7 @@ index 43f4230ae..7e710c371 100644
  
  from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
 diff --git a/src/pip/_vendor/chardet/metadata/languages.py b/src/pip/_vendor/chardet/metadata/languages.py
-index 3237d5abf..aa2ec7c35 100644
+index 3237d5a..aa2ec7c 100644
 --- a/src/pip/_vendor/chardet/metadata/languages.py
 +++ b/src/pip/_vendor/chardet/metadata/languages.py
 @@ -1,4 +1,4 @@
@@ -114,7 +104,7 @@ index 3237d5abf..aa2ec7c35 100644
  """
  Metadata about languages used by our model training code for our
 diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/requests/certs.py
-index 06a594e58..bfa7839a4 100644
+index 06a594e..bfa7839 100644
 --- a/src/pip/_vendor/requests/certs.py
 +++ b/src/pip/_vendor/requests/certs.py
 @@ -1,4 +1,4 @@
@@ -123,6 +113,3 @@ index 06a594e58..bfa7839a4 100644
  # -*- coding: utf-8 -*-
  
  """
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/python/python3-pip_21.2.4.bb b/meta/recipes-devtools/python/python3-pip_21.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pip_21.2.4.bb
rename to meta/recipes-devtools/python/python3-pip_21.3.bb
index 1f0f707f4b..924a564f62 100644
--- a/meta/recipes-devtools/python/python3-pip_21.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.3.bb
@@ -10,7 +10,7 @@ inherit pypi distutils3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b"
+SRC_URI[sha256sum] = "741a61baab1dbce2d8ca415effa48a2b6a964564f81a9f4f1fce4c433346c034"
 
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-- 
2.20.1

