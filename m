Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42BAC6FA96
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.879.1667349634272121238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QYOy4jVQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c865fb-27c843f9-8da9-4e93-b091-e52e44ff38c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JKAfstwCdj36UZO0aqUo/5obNSk5qHVswjc0eeLgduI=;
	b=QYOy4jVQhGWXTN6yK2pz45roM+deo1oMmuzcDRZgOMIrc9/jeVmRmmDk5OOXy7Si
	VVlrGkrfoiTPhExFHulzeEMESG6O8tMOezxteGN1qWYgajwKVy/cPKmIIkQ7NmlF279
	n0fru2CyEgoQJgL+1KR7lZgZ8+U2gPlWfFJagZiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JKAfstwCdj36UZO0aqUo/5obNSk5qHVswjc0eeLgduI=;
	b=aqDVS63r+lYFwJZUwys4Ugosri/YYg+6tG3gpOu2xjvkbDGfjHZIj+6Om3l9Rpm/
	+v65tZ+vscxmn9N5e12wY61Jl3mnG7FxuAY5vX+wCksVgn5mCJFPr4py3/F09nHdpjm
	S5AoAV0LaWxCOm7y/4yp3CPppy9HDId1aBF4LvGg=
Content-Type: multipart/mixed; boundary="===============1558101286531935522=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.86.0 SUCCEEDED
Message-ID: <0101018435c865fb-27c843f9-8da9-4e93-b091-e52e44ff38c6-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172530

--===============1558101286531935522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.86.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-7.85.0-7.86.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1558101286531935522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/curl/curl-dbg: PKGSIZE changed from 3616044 to 3654160 (+1%)
packages/core2-32-poky-linux/curl/curl-dbg: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-dbg: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl-dev: PKGSIZE changed from 242960 to 245853 (+1%)
packages/core2-32-poky-linux/curl/curl-dev: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-dev: FILELIST: added "/usr/include/curl/websockets.h"
packages/core2-32-poky-linux/curl/curl-dev: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl-doc: PKGSIZE changed from 1824353 to 1859397 (+2%)
packages/core2-32-poky-linux/curl/curl-doc: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-doc: FILELIST: added "/usr/share/man/man3/CURLOPT_WS_OPTIONS.3 /usr/share/man/man3/curl_ws_send.3 /usr/share/man/man3/curl_ws_recv.3 /usr/share/man/man3/curl_ws_meta.3"
packages/core2-32-poky-linux/curl/curl-doc: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl-locale: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-locale: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl-ptest: PKGSIZE changed from 7974428 to 8052963 (+1%)
packages/core2-32-poky-linux/curl/curl-ptest: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-ptest: FILELIST: removed "/usr/lib/curl/ptest/tests/server/disabled.o", added "/usr/lib/curl/ptest/tests/data/test644 /usr/lib/curl/ptest/tests/markdown-uppercase.pl /usr/lib/curl/ptest/tests/libtest/lib2301.c /usr/lib/curl/ptest/tests/unit/unit1614.c /usr/lib/curl/ptest/tests/data/test445 /usr/lib/curl/ptest/tests/libtest/lib1955.c /usr/lib/curl/ptest/tests/data/test1947 /usr/lib/curl/ptest/tests/data/test1948 /usr/lib/curl/ptest/tests/data/test1614 /usr/lib/curl/ptest/tests/libtest/lib3027.c /usr/lib/curl/ptest/tests/data/test3027 /usr/lib/curl/ptest/tests/data/test2302 /usr/lib/curl/ptest/tests/libtest/lib1947.c /usr/lib/curl/ptest/tests/data/test496 /usr/lib/curl/ptest/tests/server/disabled-disabled.o /usr/lib/curl/ptest/tests/data/test2300 /usr/lib/curl/ptest/tests/data/test1955 /usr/lib/curl/ptest/tests/libtest/lib2302.c /usr/lib/curl/ptest/tests/data/test2303 /usr/lib/curl/ptest/tests/data/test1275 /usr/lib/curl/ptest/tests/data/test415 /
 usr/lib/curl/ptest/tests/data/test2301 /usr/lib/curl/ptest/tests/libtest/lib1948.c /usr/lib/curl/ptest/tests/data/test495"
packages/core2-32-poky-linux/curl/curl-ptest: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl-src: PKGSIZE changed from 4103272 to 3503460 (-15%)
packages/core2-32-poky-linux/curl/curl-src: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-src: FILELIST: directory renamed /usr/src/debug/curl/7.85.0-r0/lib/vauth -> /usr/src/debug/curl/7.86.0-r0/lib/vauth, directory renamed /usr/src/debug/curl/7.85.0-r0/tests/server -> /usr/src/debug/curl/7.86.0-r0/tests/server, directory renamed /usr/src/debug/curl/7.85.0-r0/lib/vtls -> /usr/src/debug/curl/7.86.0-r0/lib/vtls, directory renamed /usr/src/debug/curl/7.85.0-r0/lib/vssh -> /usr/src/debug/curl/7.86.0-r0/lib/vssh, removed "/usr/src/debug/curl/7.85.0-r0/lib/formdata.h /usr/src/debug/curl/7.85.0-r0/lib/hash.c /usr/src/debug/curl/7.85.0-r0/lib/smtp.h /usr/src/debug/curl/7.85.0-r0/lib/nonblock.c /usr/src/debug/curl/7.85.0-r0/lib/timeval.h /usr/src/debug/curl/7.85.0-r0/include/curl/multi.h /usr/src/debug/curl/7.85.0-r0/lib/curl_get_line.h /usr/src/debug/curl/7.85.0-r0/src/tool_util.c /usr/src/debug/curl/7.85.0-r0/include/curl/mprintf.h /usr/src/debug/curl/7.85.0-r0/lib/easyoptions.c /usr/src/debug/curl/7.85.0-r0/lib/progress.h /usr/src/debug/c
 url/7.85.0-r0/lib/strtoofft.h /usr/src/debug/curl/7.85.0-r0/src/tool_sleep.c /usr/src/debug/curl/7.85.0-r0/lib/dotdot.h /usr/src/debug/curl/7.85.0-r0/lib/strerror.c /usr/src/debug/curl/7.85.0-r0/src/tool_parsecfg.c /usr/src/debug/curl/7.85.0-r0/lib/curl_md5.h /usr/src/debug/curl/7.85.0-r0/lib/rename.h /usr/src/debug/curl/7.85.0-r0/src/tool_urlglob.h /usr/src/debug/curl/7.85.0-r0/src/tool_operhlp.c /usr/src/debug/curl/7.85.0-r0/lib/netrc.h /usr/src/debug/curl/7.85.0-r0/src/tool_sdecls.h /usr/src/debug/curl/7.85.0-r0/lib/dotdot.c /usr/src/debug/curl/7.85.0-r0/lib/curl_base64.h /usr/src/debug/curl/7.85.0-r0/lib/warnless.h /usr/src/debug/curl/7.85.0-r0/include/curl/header.h /usr/src/debug/curl/7.85.0-r0/lib/http_ntlm.c /usr/src/debug/curl/7.85.0-r0/src/tool_libinfo.c /usr/src/debug/curl/7.85.0-r0/src/tool_formparse.c /usr/src/debug/curl/7.85.0-r0/lib/hostasyn.c /usr/src/debug/curl/7.85.0-r0/lib/transfer.h /usr/src/debug/curl/7.85.0-r0/src/tool_hugehelp.c /usr/src/debug/curl/7.85.0-r0/li
 b/sockaddr.h /usr/src/debug/curl/7.85.0-r0/lib/hostip.c /usr/src/debug/curl/7.85.0-r0/lib/curl_memory.h /usr/src/debug/curl/7.85.0-r0/lib/slist.c /usr/src/debug/curl/7.85.0-r0/lib/sendf.c /usr/src/debug/curl/7.85.0-r0/src/tool_main.c /usr/src/debug/curl/7.85.0-r0/lib/http_ntlm.h /usr/src/debug/curl/7.85.0-r0/lib/timeval.c /usr/src/debug/curl/7.85.0-r0/lib/curl_hmac.h /usr/src/debug/curl/7.85.0-r0/lib/connect.h /usr/src/debug/curl/7.85.0-r0/lib/formdata.c /usr/src/debug/curl/7.85.0-r0/src/tool_helpers.h /usr/src/debug/curl/7.85.0-r0/src/tool_dirhie.h /usr/src/debug/curl/7.85.0-r0/lib/strdup.h /usr/src/debug/curl/7.85.0-r0/lib/dynbuf.c /usr/src/debug/curl/7.85.0-r0/lib/parsedate.h /usr/src/debug/curl/7.85.0-r0/include/curl/options.h /usr/src/debug/curl/7.85.0-r0/lib/curl_range.c /usr/src/debug/curl/7.85.0-r0/lib/pingpong.c /usr/src/debug/curl/7.85.0-r0/lib/fopen.h /usr/src/debug/curl/7.85.0-r0/lib/sigpipe.h /usr/src/debug/curl/7.85.0-r0/lib/nonblock.h /usr/src/debug/curl/7.85.0-r0/lib
 /easyoptions.h /usr/src/debug/curl/7.85.0-r0/lib/http.h /usr/src/debug/curl/7.85.0-r0/lib/llist.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_wrt.h /usr/src/debug/curl/7.85.0-r0/lib/http_aws_sigv4.c /usr/src/debug/curl/7.85.0-r0/src/tool_sleep.h /usr/src/debug/curl/7.85.0-r0/lib/hostip.h /usr/src/debug/curl/7.85.0-r0/lib/urlapi-int.h /usr/src/debug/curl/7.85.0-r0/lib/bufref.c /usr/src/debug/curl/7.85.0-r0/lib/content_encoding.c /usr/src/debug/curl/7.85.0-r0/lib/rtsp.h /usr/src/debug/curl/7.85.0-r0/lib/rand.c /usr/src/debug/curl/7.85.0-r0/lib/mime.h /usr/src/debug/curl/7.85.0-r0/lib/strcase.h /usr/src/debug/curl/7.85.0-r0/lib/base64.c /usr/src/debug/curl/7.85.0-r0/lib/wildcard.c /usr/src/debug/curl/7.85.0-r0/lib/fileinfo.h /usr/src/debug/curl/7.85.0-r0/lib/if2ip.h /usr/src/debug/curl/7.85.0-r0/src/tool_cb_dbg.c /usr/src/debug/curl/7.85.0-r0/lib/parsedate.c /usr/src/debug/curl/7.85.0-r0/lib/conncache.c /usr/src/debug/curl/7.85.0-r0/include/curl/typecheck-gcc.h /usr/src/debug/curl/7.85.0
 -r0/lib/netrc.c /usr/src/debug/curl/7.85.0-r0/lib/multi.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_hdr.c /usr/src/debug/curl/7.85.0-r0/lib/strcase.c /usr/src/debug/curl/7.85.0-r0/src/tool_parsecfg.h /usr/src/debug/curl/7.85.0-r0/lib/cookie.c /usr/src/debug/curl/7.85.0-r0/lib/curl_get_line.c /usr/src/debug/curl/7.85.0-r0/lib/ftplistparser.h /usr/src/debug/curl/7.85.0-r0/lib/curl_fnmatch.c /usr/src/debug/curl/7.85.0-r0/lib/altsvc.c /usr/src/debug/curl/7.85.0-r0/lib/dynbuf.h /usr/src/debug/curl/7.85.0-r0/lib/sendf.h /usr/src/debug/curl/7.85.0-r0/lib/speedcheck.c /usr/src/debug/curl/7.85.0-r0/lib/curl_threads.h /usr/src/debug/curl/7.85.0-r0/lib/socks.c /usr/src/debug/curl/7.85.0-r0/src/tool_getparam.h /usr/src/debug/curl/7.85.0-r0/lib/slist.h /usr/src/debug/curl/7.85.0-r0/lib/curl_range.h /usr/src/debug/curl/7.85.0-r0/lib/curl_addrinfo.c /usr/src/debug/curl/7.85.0-r0/lib/easygetopt.c /usr/src/debug/curl/7.85.0-r0/lib/curl_ctype.c /usr/src/debug/curl/7.85.0-r0/src/tool_writeout_json.c /
 usr/src/debug/curl/7.85.0-r0/lib/http.c /usr/src/debug/curl/7.85.0-r0/lib/mprintf.c /usr/src/debug/curl/7.85.0-r0/src/tool_writeout.h /usr/src/debug/curl/7.85.0-r0/src/tool_xattr.h /usr/src/debug/curl/7.85.0-r0/lib/curl_ctype.h /usr/src/debug/curl/7.85.0-r0/lib/http_proxy.c /usr/src/debug/curl/7.85.0-r0/src/tool_msgs.h /usr/src/debug/curl/7.85.0-r0/lib/mqtt.h /usr/src/debug/curl/7.85.0-r0/src/tool_listhelp.c /usr/src/debug/curl/7.85.0-r0/lib/doh.h /usr/src/debug/curl/7.85.0-r0/lib/ftp.c /usr/src/debug/curl/7.85.0-r0/include/curl/curl.h /usr/src/debug/curl/7.85.0-r0/src/tool_getpass.h /usr/src/debug/curl/7.85.0-r0/lib/share.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_prg.h /usr/src/debug/curl/7.85.0-r0/lib/version.c /usr/src/debug/curl/7.85.0-r0/lib/md4.c /usr/src/debug/curl/7.85.0-r0/lib/curl_setup_once.h /usr/src/debug/curl/7.85.0-r0/lib/getenv.c /usr/src/debug/curl/7.85.0-r0/lib/if2ip.c /usr/src/debug/curl/7.85.0-r0/lib/rename.c /usr/src/debug/curl/7.85.0-r0/lib/hostip6.c /usr/src
 /debug/curl/7.85.0-r0/lib/urldata.h /usr/src/debug/curl/7.85.0-r0/lib/wildcard.h /usr/src/debug/curl/7.85.0-r0/lib/headers.c /usr/src/debug/curl/7.85.0-r0/src/tool_cfgable.c /usr/src/debug/curl/7.85.0-r0/lib/select.c /usr/src/debug/curl/7.85.0-r0/lib/fopen.c /usr/src/debug/curl/7.85.0-r0/lib/fileinfo.c /usr/src/debug/curl/7.85.0-r0/lib/urlapi.c /usr/src/debug/curl/7.85.0-r0/src/tool_help.h /usr/src/debug/curl/7.85.0-r0/src/tool_progress.c /usr/src/debug/curl/7.85.0-r0/src/tool_progress.h /usr/src/debug/curl/7.85.0-r0/lib/asyn.h /usr/src/debug/curl/7.85.0-r0/src/tool_util.h /usr/src/debug/curl/7.85.0-r0/src/tool_msgs.c /usr/src/debug/curl/7.85.0-r0/lib/escape.h /usr/src/debug/curl/7.85.0-r0/lib/curl_fnmatch.h /usr/src/debug/curl/7.85.0-r0/lib/file.h /usr/src/debug/curl/7.85.0-r0/lib/easy_lock.h /usr/src/debug/curl/7.85.0-r0/lib/hash.h /usr/src/debug/curl/7.85.0-r0/src/tool_dirhie.c /usr/src/debug/curl/7.85.0-r0/lib/hmac.c /usr/src/debug/curl/7.85.0-r0/lib/content_encoding.h /usr/src/
 debug/curl/7.85.0-r0/lib/curl_endian.h /usr/src/debug/curl/7.85.0-r0/src/tool_help.c /usr/src/debug/curl/7.85.0-r0/lib/http2.c /usr/src/debug/curl/7.85.0-r0/include/curl/easy.h /usr/src/debug/curl/7.85.0-r0/include/curl/urlapi.h /usr/src/debug/curl/7.85.0-r0/src/tool_writeout_json.h /usr/src/debug/curl/7.85.0-r0/lib/curl_memrchr.c /usr/src/debug/curl/7.85.0-r0/lib/http_digest.h /usr/src/debug/curl/7.85.0-r0/lib/getinfo.h /usr/src/debug/curl/7.85.0-r0/lib/easy.c /usr/src/debug/curl/7.85.0-r0/lib/curl_addrinfo.h /usr/src/debug/curl/7.85.0-r0/lib/http_chunks.h /usr/src/debug/curl/7.85.0-r0/lib/http_digest.c /usr/src/debug/curl/7.85.0-r0/lib/http_proxy.h /usr/src/debug/curl/7.85.0-r0/lib/pingpong.h /usr/src/debug/curl/7.85.0-r0/src/tool_helpers.c /usr/src/debug/curl/7.85.0-r0/lib/doh.c /usr/src/debug/curl/7.85.0-r0/lib/hsts.c /usr/src/debug/curl/7.85.0-r0/lib/altsvc.h /usr/src/debug/curl/7.85.0-r0/lib/asyn-thread.c /usr/src/debug/curl/7.85.0-r0/src/tool_operate.h /usr/src/debug/curl/7.8
 5.0-r0/lib/strerror.h /usr/src/debug/curl/7.85.0-r0/lib/url.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_dbg.h /usr/src/debug/curl/7.85.0-r0/src/tool_cb_hdr.h /usr/src/debug/curl/7.85.0-r0/lib/rand.h /usr/src/debug/curl/7.85.0-r0/src/tool_operhlp.h /usr/src/debug/curl/7.85.0-r0/lib/connect.c /usr/src/debug/curl/7.85.0-r0/src/tool_filetime.c /usr/src/debug/curl/7.85.0-r0/include/curl/system.h /usr/src/debug/curl/7.85.0-r0/lib/transfer.c /usr/src/debug/curl/7.85.0-r0/lib/share.h /usr/src/debug/curl/7.85.0-r0/lib/strdup.c /usr/src/debug/curl/7.85.0-r0/src/tool_urlglob.c /usr/src/debug/curl/7.85.0-r0/lib/ftp.h /usr/src/debug/curl/7.85.0-r0/lib/getinfo.c /usr/src/debug/curl/7.85.0-r0/lib/curl_ntlm_core.h /usr/src/debug/curl/7.85.0-r0/lib/multiif.h /usr/src/debug/curl/7.85.0-r0/lib/select.h /usr/src/debug/curl/7.85.0-r0/lib/http_chunks.c /usr/src/debug/curl/7.85.0-r0/lib/setopt.c /usr/src/debug/curl/7.85.0-r0/lib/warnless.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_see.h /usr/src/debug/cur
 l/7.85.0-r0/src/tool_operate.c /usr/src/debug/curl/7.85.0-r0/src/tool_paramhlp.c /usr/src/debug/curl/7.85.0-r0/lib/cookie.h /usr/src/debug/curl/7.85.0-r0/lib/curl_ntlm_core.c /usr/src/debug/curl/7.85.0-r0/lib/escape.c /usr/src/debug/curl/7.85.0-r0/lib/bufref.h /usr/src/debug/curl/7.85.0-r0/src/tool_getpass.c /usr/src/debug/curl/7.85.0-r0/lib/curl_sha256.h /usr/src/debug/curl/7.85.0-r0/lib/curl_gethostname.c /usr/src/debug/curl/7.85.0-r0/lib/mime.c /usr/src/debug/curl/7.85.0-r0/lib/http_aws_sigv4.h /usr/src/debug/curl/7.85.0-r0/lib/file.c /usr/src/debug/curl/7.85.0-r0/lib/curl_md4.h /usr/src/debug/curl/7.85.0-r0/lib/curl_endian.c /usr/src/debug/curl/7.85.0-r0/lib/pop3.h /usr/src/debug/curl/7.85.0-r0/src/tool_findfile.h /usr/src/debug/curl/7.85.0-r0/src/tool_paramhlp.h /usr/src/debug/curl/7.85.0-r0/lib/splay.h /usr/src/debug/curl/7.85.0-r0/lib/curl_threads.c /usr/src/debug/curl/7.85.0-r0/src/tool_filetime.h /usr/src/debug/curl/7.85.0-r0/lib/llist.h /usr/src/debug/curl/7.85.0-r0/lib/sp
 lay.c /usr/src/debug/curl/7.85.0-r0/src/tool_hugehelp.h /usr/src/debug/curl/7.85.0-r0/src/tool_cfgable.h /usr/src/debug/curl/7.85.0-r0/lib/curl_memrchr.h /usr/src/debug/curl/7.85.0-r0/lib/progress.c /usr/src/debug/curl/7.85.0-r0/src/tool_findfile.c /usr/src/debug/curl/7.85.0-r0/lib/sha256.c /usr/src/debug/curl/7.85.0-r0/src/tool_writeout.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_see.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_rea.c /usr/src/debug/curl/7.85.0-r0/lib/conncache.h /usr/src/debug/curl/7.85.0-r0/src/tool_cb_prg.c /usr/src/debug/curl/7.85.0-r0/lib/timediff.h /usr/src/debug/curl/7.85.0-r0/src/tool_libinfo.h /usr/src/debug/curl/7.85.0-r0/lib/hsts.h /usr/src/debug/curl/7.85.0-r0/src/tool_getparam.c /usr/src/debug/curl/7.85.0-r0/lib/speedcheck.h /usr/src/debug/curl/7.85.0-r0/lib/multihandle.h /usr/src/debug/curl/7.85.0-r0/src/tool_cb_wrt.c /usr/src/debug/curl/7.85.0-r0/lib/timediff.c /usr/src/debug/curl/7.85.0-r0/lib/socks.h /usr/src/debug/curl/7.85.0-r0/lib/ftplistparser.c 
 /usr/src/debug/curl/7.85.0-r0/src/tool_xattr.c /usr/src/debug/curl/7.85.0-r0/lib/strtoofft.c /usr/src/debug/curl/7.85.0-r0/src/tool_cb_rea.h /usr/src/debug/curl/7.85.0-r0/lib/headers.h /usr/src/debug/curl/7.85.0-r0/lib/md5.c /usr/src/debug/curl/7.85.0-r0/lib/url.h /usr/src/debug/curl/7.85.0-r0/src/tool_formparse.h /usr/src/debug/curl/7.85.0-r0/lib/imap.h /usr/src/debug/curl/7.85.0-r0/lib/setopt.h", added "/usr/src/debug/curl/7.86.0-r0/include/curl/mprintf.h /usr/src/debug/curl/7.86.0-r0/lib/multiif.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_wrt.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_rea.c /usr/src/debug/curl/7.86.0-r0/lib/mime.h /usr/src/debug/curl/7.86.0-r0/lib/sockaddr.h /usr/src/debug/curl/7.86.0-r0/lib/curl_memrchr.c /usr/src/debug/curl/7.86.0-r0/lib/parsedate.c /usr/src/debug/curl/7.86.0-r0/lib/headers.c /usr/src/debug/curl/7.86.0-r0/src/tool_writeout_json.c /usr/src/debug/curl/7.86.0-r0/src/tool_cb_hdr.c /usr/src/debug/curl/7.86.0-r0/lib/escape.c /usr/src/debug/curl/7.86
 .0-r0/lib/md4.c /usr/src/debug/curl/7.86.0-r0/src/tool_dirhie.h /usr/src/debug/curl/7.86.0-r0/lib/hostasyn.c /usr/src/debug/curl/7.86.0-r0/src/tool_util.c /usr/src/debug/curl/7.86.0-r0/lib/llist.h /usr/src/debug/curl/7.86.0-r0/lib/curl_endian.c /usr/src/debug/curl/7.86.0-r0/lib/http_aws_sigv4.c /usr/src/debug/curl/7.86.0-r0/lib/timediff.c /usr/src/debug/curl/7.86.0-r0/src/tool_helpers.c /usr/src/debug/curl/7.86.0-r0/lib/warnless.h /usr/src/debug/curl/7.86.0-r0/include/curl/header.h /usr/src/debug/curl/7.86.0-r0/lib/http_aws_sigv4.h /usr/src/debug/curl/7.86.0-r0/src/tool_operate.c /usr/src/debug/curl/7.86.0-r0/src/tool_libinfo.h /usr/src/debug/curl/7.86.0-r0/lib/netrc.c /usr/src/debug/curl/7.86.0-r0/src/tool_sdecls.h /usr/src/debug/curl/7.86.0-r0/lib/http_digest.h /usr/src/debug/curl/7.86.0-r0/lib/easygetopt.c /usr/src/debug/curl/7.86.0-r0/lib/strdup.c /usr/src/debug/curl/7.86.0-r0/lib/mime.c /usr/src/debug/curl/7.86.0-r0/lib/transfer.c /usr/src/debug/curl/7.86.0-r0/lib/curl_range.c 
 /usr/src/debug/curl/7.86.0-r0/lib/mprintf.c /usr/src/debug/curl/7.86.0-r0/src/tool_cfgable.c /usr/src/debug/curl/7.86.0-r0/lib/hostip.h /usr/src/debug/curl/7.86.0-r0/include/curl/websockets.h /usr/src/debug/curl/7.86.0-r0/lib/curl_addrinfo.h /usr/src/debug/curl/7.86.0-r0/lib/ftplistparser.h /usr/src/debug/curl/7.86.0-r0/lib/fileinfo.c /usr/src/debug/curl/7.86.0-r0/lib/pingpong.h /usr/src/debug/curl/7.86.0-r0/lib/hash.h /usr/src/debug/curl/7.86.0-r0/lib/share.c /usr/src/debug/curl/7.86.0-r0/src/tool_cb_wrt.c /usr/src/debug/curl/7.86.0-r0/src/tool_main.c /usr/src/debug/curl/7.86.0-r0/lib/strdup.h /usr/src/debug/curl/7.86.0-r0/lib/url.h /usr/src/debug/curl/7.86.0-r0/lib/netrc.h /usr/src/debug/curl/7.86.0-r0/include/curl/typecheck-gcc.h /usr/src/debug/curl/7.86.0-r0/lib/curl_range.h /usr/src/debug/curl/7.86.0-r0/src/tool_findfile.h /usr/src/debug/curl/7.86.0-r0/lib/curl_md4.h /usr/src/debug/curl/7.86.0-r0/lib/sendf.c /usr/src/debug/curl/7.86.0-r0/src/tool_progress.c /usr/src/debug/curl/
 7.86.0-r0/src/tool_findfile.c /usr/src/debug/curl/7.86.0-r0/lib/speedcheck.h /usr/src/debug/curl/7.86.0-r0/lib/noproxy.c /usr/src/debug/curl/7.86.0-r0/lib/socks.h /usr/src/debug/curl/7.86.0-r0/lib/mqtt.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_hdr.h /usr/src/debug/curl/7.86.0-r0/src/tool_urlglob.c /usr/src/debug/curl/7.86.0-r0/src/tool_getpass.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_dbg.c /usr/src/debug/curl/7.86.0-r0/lib/setopt.c /usr/src/debug/curl/7.86.0-r0/lib/http_digest.c /usr/src/debug/curl/7.86.0-r0/lib/escape.h /usr/src/debug/curl/7.86.0-r0/src/tool_msgs.c /usr/src/debug/curl/7.86.0-r0/src/tool_paramhlp.c /usr/src/debug/curl/7.86.0-r0/lib/share.h /usr/src/debug/curl/7.86.0-r0/src/tool_libinfo.c /usr/src/debug/curl/7.86.0-r0/lib/curl_fnmatch.h /usr/src/debug/curl/7.86.0-r0/lib/if2ip.c /usr/src/debug/curl/7.86.0-r0/lib/strtoofft.c /usr/src/debug/curl/7.86.0-r0/lib/ws.c /usr/src/debug/curl/7.86.0-r0/lib/select.h /usr/src/debug/curl/7.86.0-r0/src/tool_writeout.c /usr/src/
 debug/curl/7.86.0-r0/src/tool_writeout_json.h /usr/src/debug/curl/7.86.0-r0/lib/splay.c /usr/src/debug/curl/7.86.0-r0/src/tool_filetime.h /usr/src/debug/curl/7.86.0-r0/lib/rand.c /usr/src/debug/curl/7.86.0-r0/src/tool_getparam.h /usr/src/debug/curl/7.86.0-r0/lib/curl_threads.h /usr/src/debug/curl/7.86.0-r0/lib/curl_fnmatch.c /usr/src/debug/curl/7.86.0-r0/lib/doh.c /usr/src/debug/curl/7.86.0-r0/lib/http_ntlm.c /usr/src/debug/curl/7.86.0-r0/lib/bufref.c /usr/src/debug/curl/7.86.0-r0/lib/file.h /usr/src/debug/curl/7.86.0-r0/lib/bufref.h /usr/src/debug/curl/7.86.0-r0/lib/fopen.c /usr/src/debug/curl/7.86.0-r0/lib/parsedate.h /usr/src/debug/curl/7.86.0-r0/lib/timeval.c /usr/src/debug/curl/7.86.0-r0/lib/setopt.h /usr/src/debug/curl/7.86.0-r0/lib/fileinfo.h /usr/src/debug/curl/7.86.0-r0/lib/rand.h /usr/src/debug/curl/7.86.0-r0/src/tool_filetime.c /usr/src/debug/curl/7.86.0-r0/include/curl/system.h /usr/src/debug/curl/7.86.0-r0/lib/slist.h /usr/src/debug/curl/7.86.0-r0/lib/getenv.c /usr/src/
 debug/curl/7.86.0-r0/lib/nonblock.c /usr/src/debug/curl/7.86.0-r0/lib/altsvc.c /usr/src/debug/curl/7.86.0-r0/lib/http2.c /usr/src/debug/curl/7.86.0-r0/lib/curl_threads.c /usr/src/debug/curl/7.86.0-r0/src/tool_util.h /usr/src/debug/curl/7.86.0-r0/lib/curl_hmac.h /usr/src/debug/curl/7.86.0-r0/lib/curl_setup_once.h /usr/src/debug/curl/7.86.0-r0/lib/curl_ntlm_core.h /usr/src/debug/curl/7.86.0-r0/lib/nonblock.h /usr/src/debug/curl/7.86.0-r0/lib/file.c /usr/src/debug/curl/7.86.0-r0/lib/progress.h /usr/src/debug/curl/7.86.0-r0/lib/ftp.h /usr/src/debug/curl/7.86.0-r0/src/tool_formparse.h /usr/src/debug/curl/7.86.0-r0/lib/hostip.c /usr/src/debug/curl/7.86.0-r0/src/tool_listhelp.c /usr/src/debug/curl/7.86.0-r0/include/curl/curl.h /usr/src/debug/curl/7.86.0-r0/lib/dynbuf.c /usr/src/debug/curl/7.86.0-r0/src/tool_writeout.h /usr/src/debug/curl/7.86.0-r0/lib/ftplistparser.c /usr/src/debug/curl/7.86.0-r0/lib/altsvc.h /usr/src/debug/curl/7.86.0-r0/lib/base64.c /usr/src/debug/curl/7.86.0-r0/src/tool
 _helpers.h /usr/src/debug/curl/7.86.0-r0/lib/transfer.h /usr/src/debug/curl/7.86.0-r0/lib/pop3.h /usr/src/debug/curl/7.86.0-r0/lib/wildcard.h /usr/src/debug/curl/7.86.0-r0/lib/http.c /usr/src/debug/curl/7.86.0-r0/src/tool_operhlp.h /usr/src/debug/curl/7.86.0-r0/lib/curl_memrchr.h /usr/src/debug/curl/7.86.0-r0/lib/pingpong.c /usr/src/debug/curl/7.86.0-r0/lib/md5.c /usr/src/debug/curl/7.86.0-r0/src/tool_getparam.c /usr/src/debug/curl/7.86.0-r0/src/tool_paramhlp.h /usr/src/debug/curl/7.86.0-r0/lib/strtoofft.h /usr/src/debug/curl/7.86.0-r0/lib/doh.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_see.h /usr/src/debug/curl/7.86.0-r0/lib/curl_get_line.c /usr/src/debug/curl/7.86.0-r0/lib/curl_addrinfo.c /usr/src/debug/curl/7.86.0-r0/include/curl/multi.h /usr/src/debug/curl/7.86.0-r0/src/tool_urlglob.h /usr/src/debug/curl/7.86.0-r0/lib/warnless.c /usr/src/debug/curl/7.86.0-r0/lib/getinfo.c /usr/src/debug/curl/7.86.0-r0/lib/sendf.h /usr/src/debug/curl/7.86.0-r0/src/tool_operhlp.c /usr/src/debug/cu
 rl/7.86.0-r0/src/tool_cb_see.c /usr/src/debug/curl/7.86.0-r0/lib/curl_md5.h /usr/src/debug/curl/7.86.0-r0/lib/cookie.h /usr/src/debug/curl/7.86.0-r0/lib/http_proxy.h /usr/src/debug/curl/7.86.0-r0/lib/splay.h /usr/src/debug/curl/7.86.0-r0/lib/noproxy.h /usr/src/debug/curl/7.86.0-r0/lib/content_encoding.c /usr/src/debug/curl/7.86.0-r0/lib/strcase.h /usr/src/debug/curl/7.86.0-r0/lib/strerror.c /usr/src/debug/curl/7.86.0-r0/src/tool_cb_prg.c /usr/src/debug/curl/7.86.0-r0/lib/hostip6.c /usr/src/debug/curl/7.86.0-r0/lib/wildcard.c /usr/src/debug/curl/7.86.0-r0/lib/urlapi-int.h /usr/src/debug/curl/7.86.0-r0/lib/conncache.h /usr/src/debug/curl/7.86.0-r0/lib/curl_sha256.h /usr/src/debug/curl/7.86.0-r0/lib/speedcheck.c /usr/src/debug/curl/7.86.0-r0/lib/curl_ntlm_core.c /usr/src/debug/curl/7.86.0-r0/lib/http_chunks.c /usr/src/debug/curl/7.86.0-r0/lib/urlapi.c /usr/src/debug/curl/7.86.0-r0/lib/sha256.c /usr/src/debug/curl/7.86.0-r0/lib/timediff.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_rea.h 
 /usr/src/debug/curl/7.86.0-r0/lib/asyn.h /usr/src/debug/curl/7.86.0-r0/lib/connect.c /usr/src/debug/curl/7.86.0-r0/lib/easy_lock.h /usr/src/debug/curl/7.86.0-r0/lib/url.c /usr/src/debug/curl/7.86.0-r0/src/tool_cfgable.h /usr/src/debug/curl/7.86.0-r0/src/tool_sleep.h /usr/src/debug/curl/7.86.0-r0/lib/asyn-thread.c /usr/src/debug/curl/7.86.0-r0/lib/easy.c /usr/src/debug/curl/7.86.0-r0/lib/http_chunks.h /usr/src/debug/curl/7.86.0-r0/src/tool_help.c /usr/src/debug/curl/7.86.0-r0/lib/dynbuf.h /usr/src/debug/curl/7.86.0-r0/lib/easyoptions.c /usr/src/debug/curl/7.86.0-r0/lib/formdata.h /usr/src/debug/curl/7.86.0-r0/lib/imap.h /usr/src/debug/curl/7.86.0-r0/lib/socks.c /usr/src/debug/curl/7.86.0-r0/lib/cookie.c /usr/src/debug/curl/7.86.0-r0/include/curl/easy.h /usr/src/debug/curl/7.86.0-r0/src/tool_getpass.c /usr/src/debug/curl/7.86.0-r0/src/tool_formparse.c /usr/src/debug/curl/7.86.0-r0/lib/select.c /usr/src/debug/curl/7.86.0-r0/src/tool_msgs.h /usr/src/debug/curl/7.86.0-r0/lib/http_proxy.c
  /usr/src/debug/curl/7.86.0-r0/lib/rename.c /usr/src/debug/curl/7.86.0-r0/lib/http_ntlm.h /usr/src/debug/curl/7.86.0-r0/src/tool_xattr.h /usr/src/debug/curl/7.86.0-r0/lib/curl_memory.h /usr/src/debug/curl/7.86.0-r0/lib/slist.c /usr/src/debug/curl/7.86.0-r0/src/tool_dirhie.c /usr/src/debug/curl/7.86.0-r0/lib/if2ip.h /usr/src/debug/curl/7.86.0-r0/lib/smtp.h /usr/src/debug/curl/7.86.0-r0/src/tool_parsecfg.c /usr/src/debug/curl/7.86.0-r0/lib/version.c /usr/src/debug/curl/7.86.0-r0/lib/hmac.c /usr/src/debug/curl/7.86.0-r0/lib/strcase.c /usr/src/debug/curl/7.86.0-r0/src/tool_xattr.c /usr/src/debug/curl/7.86.0-r0/include/curl/urlapi.h /usr/src/debug/curl/7.86.0-r0/lib/timeval.h /usr/src/debug/curl/7.86.0-r0/lib/curl_get_line.h /usr/src/debug/curl/7.86.0-r0/lib/ftp.c /usr/src/debug/curl/7.86.0-r0/lib/http.h /usr/src/debug/curl/7.86.0-r0/src/tool_parsecfg.h /usr/src/debug/curl/7.86.0-r0/lib/curl_base64.h /usr/src/debug/curl/7.86.0-r0/lib/urldata.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_pr
 g.h /usr/src/debug/curl/7.86.0-r0/lib/conncache.c /usr/src/debug/curl/7.86.0-r0/lib/multihandle.h /usr/src/debug/curl/7.86.0-r0/lib/headers.h /usr/src/debug/curl/7.86.0-r0/lib/llist.c /usr/src/debug/curl/7.86.0-r0/lib/content_encoding.h /usr/src/debug/curl/7.86.0-r0/lib/progress.c /usr/src/debug/curl/7.86.0-r0/lib/sigpipe.h /usr/src/debug/curl/7.86.0-r0/src/tool_help.h /usr/src/debug/curl/7.86.0-r0/lib/hash.c /usr/src/debug/curl/7.86.0-r0/include/curl/options.h /usr/src/debug/curl/7.86.0-r0/lib/fopen.h /usr/src/debug/curl/7.86.0-r0/src/tool_progress.h /usr/src/debug/curl/7.86.0-r0/src/tool_cb_dbg.h /usr/src/debug/curl/7.86.0-r0/lib/curl_endian.h /usr/src/debug/curl/7.86.0-r0/lib/curl_gethostname.c /usr/src/debug/curl/7.86.0-r0/lib/easyoptions.h /usr/src/debug/curl/7.86.0-r0/lib/formdata.c /usr/src/debug/curl/7.86.0-r0/lib/hsts.c /usr/src/debug/curl/7.86.0-r0/lib/getinfo.h /usr/src/debug/curl/7.86.0-r0/lib/rename.h /usr/src/debug/curl/7.86.0-r0/lib/connect.h /usr/src/debug/curl/7.86.
 0-r0/src/tool_operate.h /usr/src/debug/curl/7.86.0-r0/lib/rtsp.h /usr/src/debug/curl/7.86.0-r0/lib/strerror.h /usr/src/debug/curl/7.86.0-r0/src/tool_sleep.c /usr/src/debug/curl/7.86.0-r0/lib/multi.c /usr/src/debug/curl/7.86.0-r0/lib/hsts.h"
packages/core2-32-poky-linux/curl/curl-src: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl-staticdev: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl-staticdev: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/curl: PKGSIZE changed from 185776 to 185800 (+0%)
packages/core2-32-poky-linux/curl/curl: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/curl: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl: SRC_URI changed from "https://curl.se/download/curl-7.85.0.tar.xz file://run-ptest file://disable-tests" to "https://curl.se/download/curl-7.86.0.tar.xz file://run-ptest file://disable-tests"
packages/core2-32-poky-linux/curl: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl: PV changed from "7.85.0" to "7.86.0"
packages/core2-32-poky-linux/curl/libcurl: PKGSIZE changed from 579996 to 584124 (+1%)
packages/core2-32-poky-linux/curl/libcurl: PKGV changed from 7.85.0 [default] to 7.86.0 [default]
packages/core2-32-poky-linux/curl/libcurl: PV changed from "7.85.0" to "7.86.0"
Changes to packages/core2-32-poky-linux/curl (sysroot):
  /usr/include/curl/websockets.h was added
Changes to packages/x86_64-linux/curl-native (sysroot):
  /usr/include/curl/websockets.h was added

--===============1558101286531935522==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-7.85.0-7.86.0.patch"

RnJvbSA4ZjIwODJmMjM5MWY2Y2M2MDE4NzIzNjkyYmNjOWU3ZGUwMzA4NTg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAyMzowMjoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cmw6IHVwZ3JhZGUgNy44NS4wIC0+IDcuODYuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL3tjdXJsXzcuODUuMC5iYiA9PiBjdXJsXzcuODYuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9jdXJsL3tjdXJsXzcuODUuMC5iYiA9PiBjdXJsXzcuODYuMC5iYn0gKDk4JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy44NS4wLmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuODYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy44NS4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy44Ni4wLmJiCmluZGV4IGFk
NmE1MTc1YmMuLmVjOGNlOWZkMjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1
cmwvY3VybF83Ljg1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcu
ODYuMC5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiBcCiAgICAgZmlsZTovL3J1bi1w
dGVzdCBcCiAgICAgZmlsZTovL2Rpc2FibGUtdGVzdHMgXAogIgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjg4YjU0YTZkNGI5YTQ4Y2I0ZDg3M2M3MDU2ZGNiYTk5N2RkZDViN2JlNWEyZDUzN2E0YWNi
NTVjMjBiMDRiZTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmQ2MTExNmU1ZjQ4NTU4MWY2ZDU5
ODY1Mzc3ZGY0NDYzZjJlNzg4Njc3YWM0MzIyMmI0OTZkNGU0OWZiNjI3YiIKIAogIyBDdXJsIGhh
cyB1c2VkIG1hbnkgbmFtZXMgb3ZlciB0aGUgeWVhcnMuLi4KIENWRV9QUk9EVUNUID0gImhheHg6
Y3VybCBoYXh4OmxpYmN1cmwgY3VybDpjdXJsIGN1cmw6bGliY3VybCBsaWJjdXJsOmxpYmN1cmwg
ZGFuaWVsX3N0ZW5iZXJnOmN1cmwiCi0tIAoyLjMxLjEKCg==

--===============1558101286531935522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/curl/curl-dev: FILELIST: added "/usr/include/curl/websockets.h"
packages/core2-32-poky-linux/curl/curl-doc: FILELIST: added "/usr/share/man/man3/CURLOPT_WS_OPTIONS.3 /usr/share/man/man3/curl_ws_meta.3 /usr/share/man/man3/curl_ws_send.3 /usr/share/man/man3/curl_ws_recv.3"
packages/core2-32-poky-linux/curl/curl-ptest: FILELIST: removed "/usr/lib/curl/ptest/tests/server/disabled.o", added "/usr/lib/curl/ptest/tests/libtest/lib1948.c /usr/lib/curl/ptest/tests/data/test495 /usr/lib/curl/ptest/tests/data/test2302 /usr/lib/curl/ptest/tests/data/test1275 /usr/lib/curl/ptest/tests/data/test2300 /usr/lib/curl/ptest/tests/libtest/lib1947.c /usr/lib/curl/ptest/tests/data/test1955 /usr/lib/curl/ptest/tests/data/test496 /usr/lib/curl/ptest/tests/data/test2303 /usr/lib/curl/ptest/tests/data/test2301 /usr/lib/curl/ptest/tests/data/test415 /usr/lib/curl/ptest/tests/libtest/lib2302.c /usr/lib/curl/ptest/tests/unit/unit1614.c /usr/lib/curl/ptest/tests/markdown-uppercase.pl /usr/lib/curl/ptest/tests/libtest/lib2301.c /usr/lib/curl/ptest/tests/data/test445 /usr/lib/curl/ptest/tests/data/test1948 /usr/lib/curl/ptest/tests/data/test3027 /usr/lib/curl/ptest/tests/data/test1947 /usr/lib/curl/ptest/tests/server/disabled-disabled.o /usr/lib/curl/ptest/tests/data/test644 /usr/l
 ib/curl/ptest/tests/libtest/lib3027.c /usr/lib/curl/ptest/tests/libtest/lib1955.c /usr/lib/curl/ptest/tests/data/test1614"
packages/core2-32-poky-linux/curl/curl-src: PKGSIZE changed from 4103272 to 3503460 (-15%)
Changes to packages/core2-32-poky-linux/curl (sysroot):
  /usr/include/curl/websockets.h was added
Changes to packages/x86_64-linux/curl-native (sysroot):
  /usr/include/curl/websockets.h was added

--===============1558101286531935522==--

