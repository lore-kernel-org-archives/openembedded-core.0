Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3938377FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:58:53 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id t186so34798215pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-language;
	bh=x9erBgJFOJSZrLQMGmgntwaxHBpRMLkB0pDj9T3Iv5E=;
	b=ZuIOk/mMONpkFGgdhS+exZYlTOP6JOtcmMwqWZOu+5gvvkw5yGB1altbnu1uXuJBQC
	lGnPSwFnH5gZyU1PVKbegkVyQZrwRWcPvDAnA7zvY81RS0KnHgvmbUDtBquR3kqoXF8e
	zR8S/G4zczT/Yk8taZZPo2WJZjthnqRZYVuUQhclB9gQYPDthtnDGPZzB9gEtU1CDUMd
	W8pISd1ck4mcmxPf9F3nyuXMzGZ6Kk5igvbwhFb8ftoeGm3b+NtfXQ1hfN/giQguPnOG
	hebPXbmhfEvKuzFspyxF99oO9xe4GVZmdso1p5qh9V/jI4YWM1IA9RKeQR6797NtS0gO
	v0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-language;
	bh=x9erBgJFOJSZrLQMGmgntwaxHBpRMLkB0pDj9T3Iv5E=;
	b=jl/UCSy3Q+IW0o/7s9pFbYlDMPegafCIuoBEkZf5OsiPSa96bssIyE1XxeZzXmeyIK
	Ohem6OqepdHTahzxcY2o0+Zu33s7CaHy0JWV4MwnKV8xyVLlOBwFfLXZqHNlqW8dBUwy
	KcWXo6rUPRAMz6vpXa8XTHYUH7FwF1Z6B6Nf+x6EHfAYI4BTYRqktQr5zWEAs8ZsXN9/
	Ce+gEQHziY4ReEKHalqrgfszWNSsphXnbKc30Um9FxPUXWm/k4Krm77ru9CXt+5ruHCv
	tGkt4b+Mfk4ZqMk1q/ELLX01Rk4BWURMxP3LlS2ulRd7LIYvgoSlQxdIgtIbuVxnCO37
	L4XQ==
X-Gm-Message-State: AKS2vOysTmXW6aEHA+NOnmaqO4guSD78G1AZqjozJNpbqml0MtW/Cjci
	dyqYF4JHrFrZBiZ7wcw=
X-Received: by 10.84.142.129 with SMTP id 1mr12602955plx.84.1498669134768;
	Wed, 28 Jun 2017 09:58:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f93b:3d41:8f3f:2bd0?
	([2601:202:4001:9ea0:f93b:3d41:8f3f:2bd0])
	by smtp.gmail.com with ESMTPSA id
	e77sm6029048pfk.123.2017.06.28.09.58.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:58:54 -0700 (PDT)
From: akuster808 <akuster808@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <c240efbb-9c3d-999e-3aa7-d77af977edab@gmail.com>
Date: Wed, 28 Jun 2017 09:58:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: revert e7fca5d looks wrong.
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
X-List-Received-Date: Wed, 28 Jun 2017 16:58:55 -0000
Content-Type: multipart/alternative;
	boundary="------------B9D677FE6337481DB1021889"
Content-Language: en-US

--------------B9D677FE6337481DB1021889
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please double check the revert in master. Is the commit message wrong or 
did the wrong thing get removed?


It is not removing the patch introduced 
6765fcec154b1c81250c124fcb46414dcac9be12


+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb 
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/libxml/libxml2_2.9.4.bb?id=6765fcec154b1c81250c124fcb46414dcac9be12>
@@ -23,6 +23,7 @@ SRC_URI = 
"ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
file://libxml2-CVE-2016-5131.patch \
file://libxml2-CVE-2016-4658.patch \
file://libxml2-fix_NULL_pointer_derefs.patch \
+ file://libxml2-fix_and_simplify_xmlParseStartTag2.patch \
file://CVE-2016-9318.patch \
file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \


e7fca5d libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all 
entities loading even local"


its removing a CVE fix not the patch above.

index 677d8c9..f67c47d 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb 
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/libxml/libxml2_2.9.4.bb?id=80aac29b3845cd5e415fe4a30eb7daad10764e90>
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb 
<http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/libxml/libxml2_2.9.4.bb?id=e7fca5d0d8811d5b664e6fda734221e159fcbde5>
@@ -28,7 +28,6 @@ SRC_URI = 
"ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
file://libxml2-CVE-2017-5969.patch \
file://libxml2-CVE-2017-0663.patch \
- file://CVE-2016-9318.patch \
file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
"



--------------B9D677FE6337481DB1021889
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Please double check the revert in master. Is the commit message
      wrong or did the wrong thing get removed?</p>
    <p><br>
    </p>
    <p>It is not removing the patch introduced
      6765fcec154b1c81250c124fcb46414dcac9be12</p>
    <p><br>
    </p>
    <div class="head">+++ b/<a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/libxml/libxml2_2.9.4.bb?id=6765fcec154b1c81250c124fcb46414dcac9be12">meta/recipes-core/libxml/libxml2_2.9.4.bb</a></div>
    <div class="hunk">@@ -23,6 +23,7 @@ SRC_URI = "<a
        class="moz-txt-link-freetext"
        href="ftp://xmlsoft.org/libxml2/libxml2-$">ftp://xmlsoft.org/libxml2/libxml2-$</a>{PV}.tar.gz;name=libtar
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://libxml2-CVE-2016-5131.patch">file://libxml2-CVE-2016-5131.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://libxml2-CVE-2016-4658.patch">file://libxml2-CVE-2016-4658.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://libxml2-fix_NULL_pointer_derefs.patch">file://libxml2-fix_NULL_pointer_derefs.patch</a>
      \</div>
    <div class="add">+ <a class="moz-txt-link-freetext"
        href="file://libxml2-fix_and_simplify_xmlParseStartTag2.patch">file://libxml2-fix_and_simplify_xmlParseStartTag2.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://CVE-2016-9318.patch">file://CVE-2016-9318.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
href="file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch">file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch</a>
      \</div>
    <p><br>
    </p>
    <p>e7fca5d libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all
      entities loading even local"</p>
    <p><br>
    </p>
    <p>its removing a CVE fix not the patch above.<br>
    </p>
    <div class="head">index 677d8c9..f67c47d 100644<br>
      --- a/<a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/libxml/libxml2_2.9.4.bb?id=80aac29b3845cd5e415fe4a30eb7daad10764e90">meta/recipes-core/libxml/libxml2_2.9.4.bb</a><br>
      +++ b/<a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/libxml/libxml2_2.9.4.bb?id=e7fca5d0d8811d5b664e6fda734221e159fcbde5">meta/recipes-core/libxml/libxml2_2.9.4.bb</a></div>
    <div class="hunk">@@ -28,7 +28,6 @@ SRC_URI = "<a
        class="moz-txt-link-freetext"
        href="ftp://xmlsoft.org/libxml2/libxml2-$">ftp://xmlsoft.org/libxml2/libxml2-$</a>{PV}.tar.gz;name=libtar
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://libxml2-CVE-2017-9049_CVE-2017-9050.patch">file://libxml2-CVE-2017-9049_CVE-2017-9050.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://libxml2-CVE-2017-5969.patch">file://libxml2-CVE-2017-5969.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
        href="file://libxml2-CVE-2017-0663.patch">file://libxml2-CVE-2017-0663.patch</a>
      \</div>
    <div class="del">- <a class="moz-txt-link-freetext"
        href="file://CVE-2016-9318.patch">file://CVE-2016-9318.patch</a>
      \</div>
    <div class="ctx"> <a class="moz-txt-link-freetext"
href="file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch">file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch</a>
      \</div>
    <div class="ctx"> "<br>
      <br>
      <br>
    </div>
  </body>
</html>

--------------B9D677FE6337481DB1021889--
