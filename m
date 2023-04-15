Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7745C77B7C
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13797.1681581684288546984
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c0jXqmGT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187861440ea-fe17b2d4-c384-42ed-9645-7a5df0e6b3f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dyUQQFHSEnCABmBdwiuXhbqDDtfAZv4DfP8gdOxkgxM=;
	b=c0jXqmGTIG1v7BVxhBG0QZLV/14YG/zZBiFxAM/I5jaJL1pRq3vDcpNSySgQIqXJ
	C2icRi5Th78W8297FV8dsVEjlfbSdemCfRhu/WfMU/k8Xcc+gFErSntbRba9nwwGygW
	ru469pawLJeXWCjfKGfF58zmlPm5aA76p1c21eso=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dyUQQFHSEnCABmBdwiuXhbqDDtfAZv4DfP8gdOxkgxM=;
	b=Hlpj7MjhmbQk+Z8J99QjrUMidPQbJX0qh4Jh1lPGySQuaHSJ6h/DymAqFaVJkOax
	9ipJZcKLiM0W/Z070zEa35Twppbks1dpyJTrZwOW9KroVEE7cVzDPWtwldC75vXz1Cr
	buc8qNjMJwMUdWYincRS854huI6MOlabg0VIsFbM=
Content-Type: multipart/mixed; boundary="===============2658719590074667797=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.82.0 SUCCEEDED
Message-ID: <01010187861440ea-fe17b2d4-c384-42ed-9645-7a5df0e6b3f6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180108

--===============2658719590074667797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.82.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-upgrade-1.81.0-1.82.0.patch
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
--===============2658719590074667797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.81.0 to libboost-atomic1.82.0
packages/core2-32-poky-linux/boost/boost-atomic: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.81.0", added "/usr/lib/libboost_atomic.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-atomic: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.81.0 to libboost-chrono1.82.0
packages/core2-32-poky-linux/boost/boost-chrono: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.81.0", added "/usr/lib/libboost_chrono.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-chrono: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-container: PKG changed from libboost-container1.81.0 to libboost-container1.82.0
packages/core2-32-poky-linux/boost/boost-container: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.81.0", added "/usr/lib/libboost_container.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-container: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-context: PKG changed from libboost-context1.81.0 to libboost-context1.82.0
packages/core2-32-poky-linux/boost/boost-context: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.81.0", added "/usr/lib/libboost_context.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-context: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.81.0 to libboost-contract1.82.0
packages/core2-32-poky-linux/boost/boost-contract: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.81.0", added "/usr/lib/libboost_contract.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-contract: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.81.0 to libboost-coroutine1.82.0
packages/core2-32-poky-linux/boost/boost-coroutine: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.81.0", added "/usr/lib/libboost_coroutine.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.81.0 to libboost-date-time1.82.0
packages/core2-32-poky-linux/boost/boost-date-time: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.81.0", added "/usr/lib/libboost_date_time.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-date-time: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-dbg: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-dbg: FILELIST: removed "/usr/lib/.debug/libboost_program_options.so.1.81.0 /usr/lib/.debug/libboost_container.so.1.81.0 /usr/lib/.debug/libboost_coroutine.so.1.81.0 /usr/lib/.debug/libboost_contract.so.1.81.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.81.0 /usr/lib/.debug/libboost_date_time.so.1.81.0 /usr/lib/.debug/libboost_iostreams.so.1.81.0 /usr/lib/.debug/libboost_unit_test_framework.so.1.81.0 /usr/lib/.debug/libboost_json.so.1.81.0 /usr/lib/.debug/libboost_wave.so.1.81.0 /usr/lib/.debug/libboost_log.so.1.81.0 /usr/lib/.debug/libboost_serialization.so.1.81.0 /usr/lib/.debug/libboost_url.so.1.81.0 /usr/lib/.debug/libboost_filesystem.so.1.81.0 /usr/lib/.debug/libboost_context.so.1.81.0 /usr/lib/.debug/libboost_fiber.so.1.81.0 /usr/lib/.debug/libboost_graph.so.1.81.0 /usr/lib/.debug/libboost_regex.so.1.81.0 /usr/lib/.debug/libboost_timer.so.1.81.0 /usr/lib/.debug/libboost_math_c99.so.1.81.0 /usr/lib/.debug/libboost_math_tr1f.so.1.81.0 /u
 sr/lib/.debug/libboost_math_tr1l.so.1.81.0 /usr/lib/.debug/libboost_python311.so.1.81.0 /usr/lib/.debug/libboost_type_erasure.so.1.81.0 /usr/lib/.debug/libboost_log_setup.so.1.81.0 /usr/lib/.debug/libboost_wserialization.so.1.81.0 /usr/lib/.debug/libboost_math_c99f.so.1.81.0 /usr/lib/.debug/libboost_math_c99l.so.1.81.0 /usr/lib/.debug/libboost_chrono.so.1.81.0 /usr/lib/.debug/libboost_atomic.so.1.81.0 /usr/lib/.debug/libboost_locale.so.1.81.0 /usr/lib/.debug/libboost_random.so.1.81.0 /usr/lib/.debug/libboost_system.so.1.81.0 /usr/lib/.debug/libboost_thread.so.1.81.0 /usr/lib/.debug/libboost_math_tr1.so.1.81.0", added "/usr/lib/.debug/libboost_unit_test_framework.so.1.82.0 /usr/lib/.debug/libboost_container.so.1.82.0 /usr/lib/.debug/libboost_program_options.so.1.82.0 /usr/lib/.debug/libboost_iostreams.so.1.82.0 /usr/lib/.debug/libboost_date_time.so.1.82.0 /usr/lib/.debug/libboost_coroutine.so.1.82.0 /usr/lib/.debug/libboost_math_tr1.so.1.82.0 /usr/lib/.debug/libboost_contract.so.1.82
 .0 /usr/lib/.debug/libboost_json.so.1.82.0 /usr/lib/.debug/libboost_wave.so.1.82.0 /usr/lib/.debug/libboost_log.so.1.82.0 /usr/lib/.debug/libboost_context.so.1.82.0 /usr/lib/.debug/libboost_url.so.1.82.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.82.0 /usr/lib/.debug/libboost_filesystem.so.1.82.0 /usr/lib/.debug/libboost_log_setup.so.1.82.0 /usr/lib/.debug/libboost_serialization.so.1.82.0 /usr/lib/.debug/libboost_math_c99.so.1.82.0 /usr/lib/.debug/libboost_math_c99f.so.1.82.0 /usr/lib/.debug/libboost_math_c99l.so.1.82.0 /usr/lib/.debug/libboost_fiber.so.1.82.0 /usr/lib/.debug/libboost_graph.so.1.82.0 /usr/lib/.debug/libboost_regex.so.1.82.0 /usr/lib/.debug/libboost_timer.so.1.82.0 /usr/lib/.debug/libboost_type_erasure.so.1.82.0 /usr/lib/.debug/libboost_math_tr1f.so.1.82.0 /usr/lib/.debug/libboost_math_tr1l.so.1.82.0 /usr/lib/.debug/libboost_python311.so.1.82.0 /usr/lib/.debug/libboost_wserialization.so.1.82.0 /usr/lib/.debug/libboost_chrono.so.1.82.0 /usr/lib/.debug/libboost_ato
 mic.so.1.82.0 /usr/lib/.debug/libboost_locale.so.1.82.0 /usr/lib/.debug/libboost_random.so.1.82.0 /usr/lib/.debug/libboost_system.so.1.82.0 /usr/lib/.debug/libboost_thread.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-dbg: PKGSIZE changed from 138131776 to 139049472 (+1%)
packages/core2-32-poky-linux/boost/boost-dbg: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-dev: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_date_time-1.81.0 -> /usr/lib/cmake/boost_date_time-1.82.0, directory renamed /usr/lib/cmake/boost_exception-1.81.0 -> /usr/lib/cmake/boost_exception-1.82.0, directory renamed /usr/lib/cmake/boost_log_setup-1.81.0 -> /usr/lib/cmake/boost_log_setup-1.82.0, directory renamed /usr/lib/cmake/boost_system-1.81.0 -> /usr/lib/cmake/boost_system-1.82.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.81.0 -> /usr/lib/cmake/boost_type_erasure-1.82.0, directory renamed /usr/lib/cmake/boost_wave-1.81.0 -> /usr/lib/cmake/boost_wave-1.82.0, directory renamed /usr/lib/cmake/boost_regex-1.81.0 -> /usr/lib/cmake/boost_regex-1.82.0, directory renamed /usr/lib/cmake/boost_filesystem-1.81.0 -> /usr/lib/cmake/boost_filesystem-1.82.0, directory renamed /usr/lib/cmake/boost_log-1.81.0 -> /usr/lib/cmake/boost_log-1.82.0, directory renamed /usr/lib/cmake/boost_url-1.81.0 -> /usr/lib/cmake/boost_url-1.82.0, di
 rectory renamed /usr/lib/cmake/boost_fiber-1.81.0 -> /usr/lib/cmake/boost_fiber-1.82.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.81.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.82.0, directory renamed /usr/lib/cmake/boost_iostreams-1.81.0 -> /usr/lib/cmake/boost_iostreams-1.82.0, directory renamed /usr/lib/cmake/boost_container-1.81.0 -> /usr/lib/cmake/boost_container-1.82.0, directory renamed /usr/lib/cmake/boost_timer-1.81.0 -> /usr/lib/cmake/boost_timer-1.82.0, directory renamed /usr/lib/cmake/boost_coroutine-1.81.0 -> /usr/lib/cmake/boost_coroutine-1.82.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.81.0 -> /usr/lib/cmake/boost_math_c99l-1.82.0, directory renamed /usr/lib/cmake/boost_math_c99f-1.81.0 -> /usr/lib/cmake/boost_math_c99f-1.82.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.81.0 -> /usr/lib/cmake/boost_math_tr1f-1.82.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.81.0 -> /usr/lib/cmake/boost_math_tr1l-1.82.0, directory renamed /
 usr/lib/cmake/boost_headers-1.81.0 -> /usr/lib/cmake/boost_headers-1.82.0, directory renamed /usr/lib/cmake/boost_graph-1.81.0 -> /usr/lib/cmake/boost_graph-1.82.0, directory renamed /usr/lib/cmake/boost_chrono-1.81.0 -> /usr/lib/cmake/boost_chrono-1.82.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.81.0 -> /usr/lib/cmake/boost_unit_test_framework-1.82.0, directory renamed /usr/lib/cmake/boost_serialization-1.81.0 -> /usr/lib/cmake/boost_serialization-1.82.0, directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.81.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.82.0, directory renamed /usr/include/boost/outcome/experimental/status-code/detail -> /usr/include/boost/outcome/experimental/status-code/status-code/detail, directory renamed /usr/lib/cmake/boost_json-1.81.0 -> /usr/lib/cmake/boost_json-1.82.0, directory renamed /usr/lib/cmake/boost_atomic-1.81.0 -> /usr/lib/cmake/boost_atomic-1.82.0, directory renamed /usr/lib/cmake/boost_python-1.81.0 -> /usr/lib/cmake/b
 oost_python-1.82.0, directory renamed /usr/lib/cmake/boost_program_options-1.81.0 -> /usr/lib/cmake/boost_program_options-1.82.0, directory renamed /usr/lib/cmake/boost_math_c99-1.81.0 -> /usr/lib/cmake/boost_math_c99-1.82.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.81.0 -> /usr/lib/cmake/boost_math_tr1-1.82.0, directory renamed /usr/lib/cmake/boost_thread-1.81.0 -> /usr/lib/cmake/boost_thread-1.82.0, directory renamed /usr/lib/cmake/boost_context-1.81.0 -> /usr/lib/cmake/boost_context-1.82.0, directory renamed /usr/lib/cmake/boost_wserialization-1.81.0 -> /usr/lib/cmake/boost_wserialization-1.82.0, directory renamed /usr/lib/cmake/boost_random-1.81.0 -> /usr/lib/cmake/boost_random-1.82.0, directory renamed /usr/lib/cmake/Boost-1.81.0 -> /usr/lib/cmake/Boost-1.82.0, directory renamed /usr/lib/cmake/boost_contract-1.81.0 -> /usr/lib/cmake/boost_contract-1.82.0, directory renamed /usr/lib/cmake/boost_locale-1.81.0 -> /usr/lib/cmake/boost_locale-1.82.0, directory renamed /usr/
 include/boost/outcome/experimental/status-code -> /usr/include/boost/outcome/experimental/status-code/status-code, removed "/usr/include/boost/histogram/detail/span.hpp /usr/include/boost/asio/impl/defer.hpp /usr/include/boost/log/detail/snprintf.hpp /usr/include/boost/url/detail/empty_value.hpp /usr/include/boost/asio/impl/post.hpp /usr/include/boost/container_hash/detail/hash_tuple.hpp /usr/include/boost/asio/impl/dispatch.hpp /usr/include/boost/interprocess/detail/intersegment_ptr.hpp /usr/lib/cmake/BoostDetectToolset-1.81.0.cmake /usr/include/boost/sort/heap_sort/heap_sort.hpp /usr/include/boost/json/detail/align.hpp /usr/include/boost/json/detail/hash_combine.hpp /usr/include/boost/container/detail/hash_table.hpp /usr/include/boost/interprocess/detail/managed_multi_shared_memory.hpp", added "/usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp /usr/include/boost/mysql/detail/auxiliar/static_string.hpp /usr/include/boost/mysql/detail/protocol/query_messages.h
 pp /usr/include/boost/unordered/detail/requires_cxx11.hpp /usr/include/boost/unordered/detail/foa/node_handle.hpp /usr/include/boost/mysql.hpp /usr/include/boost/geometry/algorithms/detail/relate/box_areal.hpp /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp /usr/include/boost/system/detail/requires_cxx11.hpp /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp /usr/include/boost/mysql/detail/auxiliar/valgrind.hpp /usr/include/boost/pfr/detail/possible_reflectable.hpp /usr/include/boost/core/launder.hpp /usr/include/boost/geometry/algorithms/detail/overlay/colocate_clusters.hpp /usr/include/boost/mysql/impl/connection.hpp /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp /usr/include/boost/pfr/config.hpp /usr/include/boost/core/alignof.hpp /usr/include/boost/url/format.hpp /usr/include/boost/asio/detail/initiate_dispatch.hpp /usr/include/boost/geometry/strategies/geographic/buffer_end_round.hpp /usr/include/boost/mysql/detail/network_algorithms/query.
 hpp /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp /usr/include/boost/core/make_span.hpp /usr/include/boost/core/max_align.hpp /usr/include/boost/mysql/mysql_collations.hpp /usr/include/boost/url/detail/format_args.hpp /usr/include/boost/container_hash/detail/mulx.hpp /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp /usr/include/boost/container_hash/detail/hash_tuple_like.hpp /usr/include/boost/mysql/client_errc.hpp /usr/include/boost/mysql/detail/auxiliar/row_base.hpp /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp /usr/include/boost/geometry/strategies/geographic/buffer_join_miter.hpp /usr/include/boost/mysql/detail/auxiliar/datetime.hpp /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp /usr/include/boost/core/serialization.hpp /usr/include/boost/mysql/detail/protocol/deserialize
 _binary_field.hpp /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp /usr/include/boost/mysql/tcp.hpp /usr/include/boost/mysql/impl/diagnostics.hpp /usr/include/boost/mysql/blob_view.hpp /usr/include/boost/mysql/rows_view.hpp /usr/include/boost/mysql/statement.hpp /usr/include/boost/process/v2/ext/impl/cmd.ipp /usr/include/boost/smart_ptr/detail/requires_cxx11.hpp /usr/include/boost/mysql/detail/channel/read_buffer.hpp /usr/include/boost/url/detail/impl/replacement_field_rule.ipp /usr/include/boost/process/v2/ext/cmd.hpp /usr/include/boost/process/v2/ext/cwd.hpp /usr/include/boost/process/v2/ext/env.hpp /usr/include/boost/process/v2/ext/exe.hpp /usr/include/boost/mysql/detail/protocol/common_messages.hpp /usr/include/boost/nowide/quoted.hpp /usr/include/boost/mysql/detail/network_algorithms/connect.hpp /usr/include/boost/pfr/traits.hpp /usr/include/boost/mysql/detail/protocol/serialization.hpp /usr/in
 clude/boost/mysql/detail/network_algorithms/prepare_statement.hpp /usr/include/boost/mysql/impl/error_categories.hpp /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp /usr/include/boost/mysql/impl/statement.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp /usr/include/boost/bind/detail/requires_cxx11.hpp /usr/include/boost/mysql/detail/protocol/constants.hpp /usr/include/boost/chrono/detail/requires_cxx11.hpp /usr/include/boost/mysql/detail/auth/auth_calculator.hpp /usr/include/boost/unordered/detail/mulx.hpp /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp /usr/include/boost/multiprecision/detail/string_helpers.hpp /usr/include/boost/mysql/impl/results.hpp /usr/include/boost/mysql/detail/protocol/impl/serialization.ipp /usr/include/boost/url/detail/replacement_field_rule.hpp /usr/include/boost/multiprecision/fwd.hpp /usr/include/boost/url/detail/impl/pattern.ipp /usr/i
 nclude/boost/mysql/detail/network_algorithms/read_some_rows.hpp /usr/include/boost/type_traits/detail/is_swappable_cxx_11.hpp /usr/include/boost/mysql/detail/auxiliar/stringize.hpp /usr/include/boost/process/v2/ext/impl/cwd.ipp /usr/include/boost/mysql/row.hpp /usr/include/boost/mysql/impl/execution_state.hpp /usr/include/boost/mysql/metadata_collection_view.hpp /usr/include/boost/function/detail/requires_cxx11.hpp /usr/include/boost/process/v2/ext/detail/impl/proc_info.ipp /usr/include/boost/ratio/detail/requires_cxx11.hpp /usr/include/boost/mysql/common_server_errc.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp /usr/include/boost/mysql/ssl_mode.hpp /usr/include/boost/mysql/detail/channel/message_parser.hpp /usr/include/boost/mysql/impl/row_view.hpp /usr/include/boost/url/detail/vformat.hpp /usr/include/boost/mysql/detail/protocol/protocol_types.hpp /usr/include/boost/mysql/impl/field_view.hpp /usr/include/boost/url/detail/impl/pct_format.ipp /usr/include/b
 oost/mysql/detail/network_algorithms/impl/execute_statement.hpp /usr/include/boost/mysql/mariadb_collations.hpp /usr/include/boost/process/v2/ext/impl/env.ipp /usr/include/boost/core/size.hpp /usr/include/boost/asio/bind_immediate_executor.hpp /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp /usr/include/boost/asio/signal_set_base.hpp /usr/include/boost/unordered/detail/narrow_cast.hpp /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp /usr/include/boost/container_hash/detail/requires_cxx11.hpp /usr/include/boost/unordered/unordered_node_map.hpp /usr/include/boost/unordered/unordered_node_set.hpp /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp /usr/include/boost/mysql/impl/rows.hpp /usr/include/boost/bind/detail/is_same.hpp /usr/include/boost/core/detail/is_same.hpp /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp /usr/include/boost/mysql/detail/protocol/i
 mpl/handshake_messages.ipp /usr/include/boost/mysql/date.hpp /usr/include/boost/mysql/days.hpp /usr/include/boost/mysql/rows.hpp /usr/include/boost/pfr/traits_fwd.hpp /usr/include/boost/mysql/time.hpp /usr/include/boost/mysql/blob.hpp /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp /usr/include/boost/mysql/impl/datetime.hpp /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp /usr/include/boost/mysql/impl/metadata.hpp /usr/include/boost/mysql/metadata.hpp /usr/include/boost/mysql/detail/protocol/serialization_context.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp /usr/include/boost/mysql/impl/field.hpp /usr/include/boost/geometry/strategies/geographic/buffer_helper.hpp /usr/include/boost/process/v2/ext/detail/proc_info.hpp /usr/include/boost/mysql/detail/config.hpp /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp /usr/include/boost/url/detail/pct_form
 at.hpp /usr/include/boost/core/detail/lwt_unattended.hpp /usr/include/boost/mysql/impl/date.hpp /usr/include/boost/core/identity.hpp /usr/include/boost/asio/detail/initiate_defer.hpp /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake /usr/include/boost/mysql/metadata_mode.hpp /usr/include/boost/mysql/bad_field_access.hpp /usr/include/boost/mysql/field_view.hpp /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp /usr/include/boost/core/snprintf.hpp /usr/include/boost/mysql/string_view.hpp /usr/include/boost/system/detail/mutex.hpp /usr/include/boost/mysql/field_kind.hpp /usr/include/boost/mysql/throw_on_error.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp /usr/include/boost/mysql/error_with_diagnostics.hpp /usr/include/boost/mysql/column_type.hpp /usr/include/boost/url/detail/pattern.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp /usr/inclu
 de/boost/mysql/detail/network_algorithms/impl/close_connection.hpp /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp /usr/include/boost/mysql/detail/channel/channel.hpp /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp /usr/include/boost/mysql/detail/auxiliar/void_t.hpp /usr/include/boost/typeof/detail/requires_cxx11.hpp /usr/include/boost/function/detail/epilogue.hpp /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp /usr/include/boost/mysql/mysql_server_errc.hpp /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp /usr/include/boost/mysql/error_categories.hpp /usr/include/boost/process/v2/ext/impl/exe.ipp /usr/include/boost/process/v2/ext.hpp /usr/include/boost/core/data.hpp /usr/include/boost/geometry/strategies/geographic/buffer_join_round.hpp /usr/include/boost/locale/ut
 il/locale_data.hpp /usr/include/boost/unordered/detail/foa/element_type.hpp /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp /usr/include/boost/type_traits/is_swappable.hpp /usr/include/boost/mysql/error_code.hpp /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp /usr/include/boost/mysql/detail/network_algorithms/ping.hpp /usr/include/boost/mysql/detail/channel/message_reader.hpp /usr/include/boost/mysql/buffer_params.hpp /usr/include/boost/asio/local/seq_packet_protocol.hpp /usr/include/boost/mysql/impl/rows_view.hpp /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp /usr/include/boost/url/detail/impl/format_args.hpp /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp /usr/include/boost/url/detail/impl/format_args.ipp /usr/include/boost/math/tools/estrin.hpp /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp /usr/include/boost/geometry/util/for_each_with_index.hpp /usr/include/boost/asi
 o/associated_immediate_executor.hpp /usr/include/boost/multi_index/detail/bad_archive_exception.hpp /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp /usr/include/boost/url/detail/string_view.hpp /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp /usr/include/boost/mysql/unix_ssl.hpp /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp /usr/include/boost/mysql/execution_state.hpp /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp /usr/include/boost/mysql/datetime.hpp /usr/include/boost/mysql/detail/channel/message_writer.hpp /usr/include/boost/mysql/detail/protocol/db_flavor.hpp /usr/include/boost/mysql/detail/auth/impl/auth_calcula
 tor.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp /usr/include/boost/container_hash/is_tuple_like.hpp /usr/include/boost/asio/detail/initiate_post.hpp /usr/include/boost/core/memory_resource.hpp /usr/include/boost/mysql/field.hpp /usr/include/boost/mysql/mariadb_server_errc.hpp /usr/include/boost/mysql/connection.hpp /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp /usr/include/boost/mysql/unix.hpp /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp /usr/include/boost/geometry/strategies/geographic/buffer_side_straight.hpp /usr/include/boost/mysql/impl/field_kind.ipp /usr/include/boost/mysql/de
 tail/protocol/capabilities.hpp /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp /usr/include/boost/mysql/row_view.hpp /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp /usr/include/boost/mysql/tcp_ssl.hpp /usr/include/boost/mysql/results.hpp /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp /usr/include/boost/unordered/unordered_node_map_fwd.hpp /usr/include/boost/unordered/unordered_node_set_fwd.hpp /usr/include/boost/endian/detail/requires_cxx11.hpp /usr/include/boost/json/set_pointer_options.hpp /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp /usr/include/boost/mysql/diagnostics.hpp /usr/include/boost/mysql/handshake_params.hpp"
packages/core2-32-poky-linux/boost/boost-dev: PKGSIZE changed from 147408522 to 149589034 (+1%)
packages/core2-32-poky-linux/boost/boost-dev: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-exception: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-exception: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-fiber: PKG changed from libboost-fiber1.81.0 to libboost-fiber1.82.0
packages/core2-32-poky-linux/boost/boost-fiber: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-fiber: FILELIST: removed "/usr/lib/libboost_fiber.so.1.81.0", added "/usr/lib/libboost_fiber.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-fiber: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.81.0 to libboost-filesystem1.82.0
packages/core2-32-poky-linux/boost/boost-filesystem: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.81.0", added "/usr/lib/libboost_filesystem.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKGSIZE changed from 145016 to 149056 (+3%)
packages/core2-32-poky-linux/boost/boost-filesystem: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.81.0 to libboost-graph1.82.0
packages/core2-32-poky-linux/boost/boost-graph: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.81.0", added "/usr/lib/libboost_graph.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-graph: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-headers: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-headers: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.81.0 to libboost-iostreams1.82.0
packages/core2-32-poky-linux/boost/boost-iostreams: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.81.0", added "/usr/lib/libboost_iostreams.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-json: PKG changed from libboost-json1.81.0 to libboost-json1.82.0
packages/core2-32-poky-linux/boost/boost-json: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.81.0", added "/usr/lib/libboost_json.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-json: PKGSIZE changed from 292408 to 296568 (+1%)
packages/core2-32-poky-linux/boost/boost-json: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.81.0 to libboost-locale1.82.0
packages/core2-32-poky-linux/boost/boost-locale: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.81.0", added "/usr/lib/libboost_locale.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-locale: PKGSIZE changed from 952252 to 980924 (+3%)
packages/core2-32-poky-linux/boost/boost-locale: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-log: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log_setup.so.1.81.0 /usr/lib/libboost_log.so.1.81.0", added "/usr/lib/libboost_log.so.1.82.0 /usr/lib/libboost_log_setup.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-log: PKGSIZE changed from 1855568 to 1851472 (-0%)
packages/core2-32-poky-linux/boost/boost-log: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-math: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_tr1.so.1.81.0 /usr/lib/libboost_math_c99.so.1.81.0 /usr/lib/libboost_math_c99f.so.1.81.0 /usr/lib/libboost_math_c99l.so.1.81.0 /usr/lib/libboost_math_tr1f.so.1.81.0 /usr/lib/libboost_math_tr1l.so.1.81.0", added "/usr/lib/libboost_math_tr1f.so.1.82.0 /usr/lib/libboost_math_c99f.so.1.82.0 /usr/lib/libboost_math_c99l.so.1.82.0 /usr/lib/libboost_math_c99.so.1.82.0 /usr/lib/libboost_math_tr1.so.1.82.0 /usr/lib/libboost_math_tr1l.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-math: PKGSIZE changed from 1376540 to 1306908 (-5%)
packages/core2-32-poky-linux/boost/boost-math: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.81.0 to libboost-program-options1.82.0
packages/core2-32-poky-linux/boost/boost-program-options: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.81.0", added "/usr/lib/libboost_program_options.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-program-options: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-python: PKG changed from libboost-python311-1.81.0 to libboost-python311-1.82.0
packages/core2-32-poky-linux/boost/boost-python: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python311.so.1.81.0", added "/usr/lib/libboost_python311.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-python: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-random: PKG changed from libboost-random1.81.0 to libboost-random1.82.0
packages/core2-32-poky-linux/boost/boost-random: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.81.0", added "/usr/lib/libboost_random.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-random: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.81.0 to libboost-regex1.82.0
packages/core2-32-poky-linux/boost/boost-regex: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.81.0", added "/usr/lib/libboost_regex.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-regex: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-serialization: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_wserialization.so.1.81.0 /usr/lib/libboost_serialization.so.1.81.0", added "/usr/lib/libboost_wserialization.so.1.82.0 /usr/lib/libboost_serialization.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-serialization: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-src: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-src: FILELIST: directory renamed /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/std -> /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/std, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/utility/impl/chset -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/utility/impl/chset, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/container/vector/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/vector/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/utility/functional -> /usr/src/debug/boost/1.82.0-r0/boost/log/utility/functional, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/pool/detail -> /usr/src/debug/boost/1.82.0-r0/boost/pool/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/log/src -> /usr/src/debug/boost/1.82.0-r0/libs/log/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/utility/ipc -> /usr/src/debug
 /boost/1.82.0-r0/boost/log/utility/ipc, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/directive -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/directive, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/serialization/src -> /usr/src/debug/boost/1.82.0-r0/libs/serialization/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/contract/detail/inlined/detail -> /usr/src/debug/boost/1.82.0-r0/boost/contract/detail/inlined/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/wave/src -> /usr/src/debug/boost/1.82.0-r0/libs/wave/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/algorithm/query -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/query, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/io -> /usr/src/debug/boost/1.82.0-r0/boost/io, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support, directory renamed /usr/src/debu
 g/boost/1.81.0-r0/boost/variant/detail -> /usr/src/debug/boost/1.82.0-r0/boost/variant/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support/nonterminal -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/nonterminal, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/non_terminal -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/non_terminal, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/random/detail -> /usr/src/debug/boost/1.82.0-r0/boost/random/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/iostreams/detail -> /usr/src/debug/boost/1.82.0-r0/boost/iostreams/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/utility/detail -> /usr/src/debug/boost/1.82.0-r0/boost/utility/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/atomic/detail -> /usr/src/debug/boost/1.82.0-r0/boost/atomic/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/system -> /
 usr/src/debug/boost/1.82.0-r0/boost/system, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url/rfc/impl -> /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/math/policies -> /usr/src/debug/boost/1.82.0-r0/boost/math/policies, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/variant2 -> /usr/src/debug/boost/1.82.0-r0/boost/variant2, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/tuple -> /usr/src/debug/boost/1.82.0-r0/boost/tuple, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/utils/iterator -> /usr/src/debug/boost/1.82.0-r0/boost/test/utils/iterator, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/thread/detail -> /usr/src/debug/boost/1.82.0-r0/boost/thread/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/utility -> /us
 r/src/debug/boost/1.82.0-r0/boost/utility, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/concept/detail -> /usr/src/debug/boost/1.82.0-r0/boost/concept/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/function_types/detail -> /usr/src/debug/boost/1.82.0-r0/boost/function_types/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/ip/detail -> /usr/src/debug/boost/1.82.0-r0/boost/asio/ip/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/iterator -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/iterator, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/lexical_cast -> /usr/src/debug/boost/1.82.0-r0/boost/lexical_cast, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url/rfc/detail/impl -> /usr/src/debug/boost/1.82.0-r0/boost/url/rfc/detail/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/detail/impl -> /usr/src/debug/boost/1.82.0-r0/boost/asio/detail/impl, directory renamed /u
 sr/src/debug/boost/1.81.0-r0/boost/fiber -> /usr/src/debug/boost/1.82.0-r0/boost/fiber, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/timer -> /usr/src/debug/boost/1.82.0-r0/boost/timer, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/filesystem/src -> /usr/src/debug/boost/1.82.0-r0/libs/filesystem/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/attribute -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/attribute, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/contract/detail/inlined -> /usr/src/debug/boost/1.82.0-r0/boost/contract/detail/inlined, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/meta -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/meta, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/sequence -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/sequence, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/exception/src -> /usr/src/debug/boost/1.82.0-r0/l
 ibs/exception/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/program_options -> /usr/src/debug/boost/1.82.0-r0/boost/program_options, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/phoenix -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/phoenix, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/thread/src -> /usr/src/debug/boost/1.82.0-r0/libs/thread/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/detail/static/transforms -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/static/transforms, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/archive -> /usr/src/debug/boost/1.82.0-r0/boost/archive, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/date_time/gregorian -> /usr/src/debug/boost/1.82.0-r0/boost/date_time/gregorian, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/graph -> /usr/src/debug/boost/1.82.0-r0/boost/graph, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mpl/v
 ector/aux_/preprocessed/typeof_based -> /usr/src/debug/boost/1.82.0-r0/boost/mpl/vector/aux_/preprocessed/typeof_based, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/tree -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/tree, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/dynamic -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/dynamic, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/math/tools -> /usr/src/debug/boost/1.82.0-r0/boost/math/tools, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/graph/detail -> /usr/src/debug/boost/1.82.0-r0/boost/graph/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test -> /usr/src/debug/boost/1.82.0-r0/boost/test, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/atomic -> /usr/src/debug/boost/1.82.0-r0/boost/atomic, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/math -> /usr/src/debug/boost/1.82.0-r0/boost/math, directory renamed
  /usr/src/debug/boost/1.81.0-r0/boost/asio -> /usr/src/debug/boost/1.82.0-r0/boost/asio, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/pool -> /usr/src/debug/boost/1.82.0-r0/boost/pool, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/intrusive/detail -> /usr/src/debug/boost/1.82.0-r0/boost/intrusive/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/bind -> /usr/src/debug/boost/1.82.0-r0/boost/bind, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/composite -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/composite, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/utility/manipulators -> /usr/src/debug/boost/1.82.0-r0/boost/log/utility/manipulators, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/move -> /usr/src/debug/boost/1.82.0-r0/boost/move, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/wave -> /usr/src/debug/boost/1.82.0-r0/boost/wave, directory renamed /usr/src/debug/boost/1.8
 1.0-r0/boost/asio/execution -> /usr/src/debug/boost/1.82.0-r0/boost/asio/execution, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/tuple/detail -> /usr/src/debug/boost/1.82.0-r0/boost/tuple/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/context/detail -> /usr/src/debug/boost/1.82.0-r0/boost/context/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost -> /usr/src/debug/boost/1.82.0-r0/boost, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mpl/vector/aux_ -> /usr/src/debug/boost/1.82.0-r0/boost/mpl/vector/aux_, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/sinks -> /usr/src/debug/boost/1.82.0-r0/boost/log/sinks, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mp11 -> /usr/src/debug/boost/1.82.0-r0/boost/mp11, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/detail/utility -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/utility, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/tools -> /usr
 /src/debug/boost/1.82.0-r0/boost/test/tools, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/context/src/posix -> /usr/src/debug/boost/1.82.0-r0/libs/context/src/posix, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/smart_ptr -> /usr/src/debug/boost/1.82.0-r0/boost/smart_ptr, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/impl -> /usr/src/debug/boost/1.82.0-r0/boost/asio/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/detail/core/matcher -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/core/matcher, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/json/detail/ryu/impl -> /usr/src/debug/boost/1.82.0-r0/boost/json/detail/ryu/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/traits -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/traits, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/python/src/object -> /usr/src/debug/boost/1.82.0-r0/libs/python/src/object, directory renamed /usr/src/debug/boo
 st/1.81.0-r0/boost/chrono -> /usr/src/debug/boost/1.82.0-r0/boost/chrono, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/contract/core -> /usr/src/debug/boost/1.82.0-r0/boost/contract/core, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/range/algorithm -> /usr/src/debug/boost/1.82.0-r0/boost/range/algorithm, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/algorithm/string -> /usr/src/debug/boost/1.82.0-r0/boost/algorithm/string, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/sequence/intrinsic -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/sequence/intrinsic, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/tools/detail -> /usr/src/debug/boost/1.82.0-r0/boost/test/tools/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support/iterators/detail -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/iterators/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/math/special_functions/detail -> /us
 r/src/debug/boost/1.82.0-r0/boost/math/special_functions/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support/detail -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proto/functional/fusion -> /usr/src/debug/boost/1.82.0-r0/boost/proto/functional/fusion, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/archive/iterators -> /usr/src/debug/boost/1.82.0-r0/boost/archive/iterators, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/optional/detail -> /usr/src/debug/boost/1.82.0-r0/boost/optional/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/iterator/detail -> /usr/src/debug/boost/1.82.0-r0/boost/iterator/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/iterator -> /usr/src/debug/boost/1.82.0-r0/boost/iterator, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/range/detail -> /usr/src/debug/boost/1.82.0-r0/boost/range/detail, directory rena
 med /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/karma -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/sources -> /usr/src/debug/boost/1.82.0-r0/boost/log/sources, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/algorithm/query/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/query/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/wave/grammars -> /usr/src/debug/boost/1.82.0-r0/boost/wave/grammars, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/karma/numeric/detail -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma/numeric/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/coroutine/src/posix -> /usr/src/debug/boost/1.82.0-r0/libs/coroutine/src/posix, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/container/src -> /usr/src/debug/boost/1.82.0-r0/libs/container/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proper
 ty_tree/detail -> /usr/src/debug/boost/1.82.0-r0/boost/property_tree/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/detail -> /usr/src/debug/boost/1.82.0-r0/boost/test/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mpl/list/aux_ -> /usr/src/debug/boost/1.82.0-r0/boost/mpl/list/aux_, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/output -> /usr/src/debug/boost/1.82.0-r0/boost/test/output, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url -> /usr/src/debug/boost/1.82.0-r0/boost/url, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/filesystem -> /usr/src/debug/boost/1.82.0-r0/boost/filesystem, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/meta/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/meta/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mpl -> /usr/src/debug/boost/1.82.0-r0/boost/mpl, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/random/src -> /usr/s
 rc/debug/boost/1.82.0-r0/libs/random/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/lexical_cast/detail -> /usr/src/debug/boost/1.82.0-r0/boost/lexical_cast/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/container/list -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/list, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/date_time/src/gregorian -> /usr/src/debug/boost/1.82.0-r0/libs/date_time/src/gregorian, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/math/src/tr1 -> /usr/src/debug/boost/1.82.0-r0/libs/math/src/tr1, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/nonterminal -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/nonterminal, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/thread/futures -> /usr/src/debug/boost/1.82.0-r0/boost/thread/futures, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/any -> /usr/src/debug/boost/1.82.0-r0/boost/any, directory renamed /usr/src/debug/boos
 t/1.81.0-r0/libs/atomic/src -> /usr/src/debug/boost/1.82.0-r0/libs/atomic/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/detail/static -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/static, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/dynamic/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/dynamic/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/detail -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/core -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/core, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/bind -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/bind, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/type_index -> /usr/src/debug/boost/1.82.0-r0/boost/type_index, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/interprocess/detail -> /usr/src/debug/boost/1.82.0-r0/b
 oost/interprocess/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/utils/runtime/cla -> /usr/src/debug/boost/1.82.0-r0/boost/test/utils/runtime/cla, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/regex/src -> /usr/src/debug/boost/1.82.0-r0/libs/regex/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/core/detail/cpp03/preprocessed -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/core/detail/cpp03/preprocessed, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mpl/aux_/preprocessed/gcc -> /usr/src/debug/boost/1.82.0-r0/boost/mpl/aux_/preprocessed/gcc, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/actor -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/actor, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/ip/detail/impl -> /usr/src/debug/boost/1.82.0-r0/boost/asio/ip/detail/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/tree -> /usr/src/debug/boost/1.82.0-r0/boost/test
 /tree, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support/iterators -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/iterators, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/primitives/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/primitives/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/describe/detail -> /usr/src/debug/boost/1.82.0-r0/boost/describe/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/core -> /usr/src/debug/boost/1.82.0-r0/boost/log/core, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/container/set -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/set, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/function_types -> /usr/src/debug/boost/1.82.0-r0/boost/function_types, dire
 ctory renamed /usr/src/debug/boost/1.81.0-r0/boost/type_traits -> /usr/src/debug/boost/1.82.0-r0/boost/type_traits, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/numeric/conversion/detail -> /usr/src/debug/boost/1.82.0-r0/boost/numeric/conversion/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/attributes -> /usr/src/debug/boost/1.82.0-r0/boost/log/attributes, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/json/detail/ryu/detail -> /usr/src/debug/boost/1.82.0-r0/boost/json/detail/ryu/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/property_tree -> /usr/src/debug/boost/1.82.0-r0/boost/property_tree, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mpl/aux_ -> /usr/src/debug/boost/1.82.0-r0/boost/mpl/aux_, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/iostreams/src -> /usr/src/debug/boost/1.82.0-r0/libs/iostreams/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/atomic/detail/type_traits -> /usr/src/debug/boost/
 1.82.0-r0/boost/atomic/detail/type_traits, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/detail -> /usr/src/debug/boost/1.82.0-r0/boost/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url/rfc -> /usr/src/debug/boost/1.82.0-r0/boost/url/rfc, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support/char_encoding -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/char_encoding, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/container/vector -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/vector, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/program_options/src -> /usr/src/debug/boost/1.82.0-r0/libs/program_options/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/support -> /usr/src/debug/boost/1.82.0-r0/boost/log/support, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/algorithm/iteration -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/iteration/detail, directory ren
 amed /usr/src/debug/boost/1.81.0-r0/boost/pending -> /usr/src/debug/boost/1.82.0-r0/boost/pending, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/iostreams/device -> /usr/src/debug/boost/1.82.0-r0/boost/iostreams/device, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/contract/detail -> /usr/src/debug/boost/1.82.0-r0/boost/contract/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/describe -> /usr/src/debug/boost/1.82.0-r0/boost/describe, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/type_erasure -> /usr/src/debug/boost/1.82.0-r0/boost/type_erasure, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/non_terminal/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/non_terminal/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/scope -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/scope/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/core/detail -> /usr/src/debu
 g/boost/1.82.0-r0/boost/phoenix/core/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/python/object -> /usr/src/debug/boost/1.82.0-r0/boost/python/object, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/detail -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/tools/old -> /usr/src/debug/boost/1.82.0-r0/boost/test/tools/old, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/container/set/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/container/set/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/coroutine/detail -> /usr/src/debug/boost/1.82.0-r0/boost/coroutine/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/type_erasure/src -> /usr/src/debug/boost/1.82.0-r0/libs/type_erasure/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/iostreams -> /usr/src/debug/boost/1.82.0-r0/boost/iostreams, directory renamed /usr/src/debug/boost/1.81.0-
 r0/boost/math/tools/detail -> /usr/src/debug/boost/1.82.0-r0/boost/math/tools/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/utility -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/utility, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/utility/setup -> /usr/src/debug/boost/1.82.0-r0/boost/log/utility/setup, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/type_traits/detail -> /usr/src/debug/boost/1.82.0-r0/boost/type_traits/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/smart_ptr/detail -> /usr/src/debug/boost/1.82.0-r0/boost/smart_ptr/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/fiber/src/algo -> /usr/src/debug/boost/1.82.0-r0/libs/fiber/src/algo, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/container -> /usr/src/debug/boost/1.82.0-r0/boost/container, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/detail -> /usr/src/debug/boost/1.82.0-r0/boost/url/gramm
 ar/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/wave/util -> /usr/src/debug/boost/1.82.0-r0/boost/wave/util, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/numeric -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/numeric, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/operator -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/operator, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/archive/impl -> /usr/src/debug/boost/1.82.0-r0/boost/archive/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/algorithm/cxx11 -> /usr/src/debug/boost/1.82.0-r0/boost/algorithm/cxx11, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/graph/src -> /usr/src/debug/boost/1.82.0-r0/libs/graph/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/config/detail -> /usr/src/debug/boost/1.82.0-r0/boost/config/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proto/detail/preprocessed -> /usr/src/debug/boost/1.82.
 0-r0/boost/proto/detail/preprocessed, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/coroutine/src -> /usr/src/debug/boost/1.82.0-r0/libs/coroutine/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/optional -> /usr/src/debug/boost/1.82.0-r0/boost/optional, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/detail -> /usr/src/debug/boost/1.82.0-r0/boost/asio/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/function -> /usr/src/debug/boost/1.82.0-r0/boost/function, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/scanner/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/scanner/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/log/src/setup -> /usr/src/debug/boost/1.82.0-r0/libs/log/src/setup, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/regex/v5 -> /usr/src/debug/boost/1.82.0-r0/boost/regex/v5, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/ratio/detail -> /usr/src/d
 ebug/boost/1.82.0-r0/boost/ratio/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/log/src/posix -> /usr/src/debug/boost/1.82.0-r0/libs/log/src/posix, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proto/transform/detail/preprocessed -> /usr/src/debug/boost/1.82.0-r0/boost/proto/transform/detail/preprocessed, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/impl -> /usr/src/debug/boost/1.82.0-r0/boost/test/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/adapted/boost_tuple/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/adapted/boost_tuple/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/thread/src/pthread -> /usr/src/debug/boost/1.82.0-r0/libs/thread/src/pthread, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/scope/detail -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/scope, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/wave/cpplexer/re2clex -> /usr/src/debug/boost/1.82.0-r0/boost/wave/c
 pplexer/re2clex, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/execution/detail -> /usr/src/debug/boost/1.82.0-r0/boost/asio/execution/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/context -> /usr/src/debug/boost/1.82.0-r0/boost/context, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/encoding -> /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/encoding, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/exception/detail -> /usr/src/debug/boost/1.82.0-r0/boost/exception/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/bind/detail -> /usr/src/debug/boost/1.82.0-r0/boost/bind/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/utility/type_dispatch -> /usr/src/debug/boost/1.82.0-r0/boost/log/utility/type_dispatch, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/align -> /usr/src/debug/boost/1.82.0-r0/boost/align, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/preproc
 essor/iteration/detail/limits -> /usr/src/debug/boost/1.82.0-r0/boost/preprocessor/iteration/detail/limits, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/range -> /usr/src/debug/boost/1.82.0-r0/boost/range, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/math/constants -> /usr/src/debug/boost/1.82.0-r0/boost/math/constants, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proto/detail -> /usr/src/debug/boost/1.82.0-r0/boost/proto/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/locale/boundary -> /usr/src/debug/boost/1.82.0-r0/boost/locale/boundary, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proto/transform -> /usr/src/debug/boost/1.82.0-r0/boost/proto/transform, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/support -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/support, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/container/pmr -> /usr/src/debug/boost/1.82.0-r0/boost/container/pmr, directory renamed /usr/src/
 debug/boost/1.81.0-r0/boost/archive/detail -> /usr/src/debug/boost/1.82.0-r0/boost/archive/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/utils/basic_cstring -> /usr/src/debug/boost/1.82.0-r0/boost/test/utils/basic_cstring, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/thread/csbl/memory -> /usr/src/debug/boost/1.82.0-r0/boost/thread/csbl/memory, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/assert -> /usr/src/debug/boost/1.82.0-r0/boost/assert, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/numeric/detail -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/numeric/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/detail/impl -> /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/detail/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/icu 
 -> /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/icu, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/keywords -> /usr/src/debug/boost/1.82.0-r0/boost/log/keywords, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/string -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/string, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/composite/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/composite/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive/detail/core -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive/detail/core, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/coroutine/src/detail -> /usr/src/debug/boost/1.82.0-r0/libs/coroutine/src/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/phoenix/support/preprocessed -> /usr/src/debug/boost/1.82.0-r0/boost/phoenix/support/preprocessed, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/python
 /detail -> /usr/src/debug/boost/1.82.0-r0/boost/python/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/json/detail/impl -> /usr/src/debug/boost/1.82.0-r0/boost/json/detail/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/ratio -> /usr/src/debug/boost/1.82.0-r0/boost/ratio, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fiber/algo -> /usr/src/debug/boost/1.82.0-r0/boost/fiber/algo, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/primitives -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/primitives, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/utility/impl -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/utility/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/chrono/detail -> /usr/src/debug/boost/1.82.0-r0/boost/chrono/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/intrusive -> /usr/src/debug/boost/1.82.0-r0/boost/intrusive, director
 y renamed /usr/src/debug/boost/1.81.0-r0/boost/thread/pthread -> /usr/src/debug/boost/1.82.0-r0/boost/thread/pthread, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/parameter -> /usr/src/debug/boost/1.82.0-r0/boost/parameter, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/system/src -> /usr/src/debug/boost/1.82.0-r0/libs/system/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/date_time/local_time -> /usr/src/debug/boost/1.82.0-r0/boost/date_time/local_time, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/date_time/posix_time -> /usr/src/debug/boost/1.82.0-r0/boost/date_time/posix_time, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/iostreams/filter -> /usr/src/debug/boost/1.82.0-r0/boost/iostreams/filter, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/python -> /usr/src/debug/boost/1.82.0-r0/boost/python, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/filesystem/detail -> /usr/src/debug/boost/1.82.0-r0/boost/filesystem/detail,
  directory renamed /usr/src/debug/boost/1.81.0-r0/boost/property_map -> /usr/src/debug/boost/1.82.0-r0/boost/property_map, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/ip/impl -> /usr/src/debug/boost/1.82.0-r0/boost/asio/ip/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/proto -> /usr/src/debug/boost/1.82.0-r0/boost/proto, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/expressions/predicates -> /usr/src/debug/boost/1.82.0-r0/boost/log/expressions/predicates, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/python/src -> /usr/src/debug/boost/1.82.0-r0/libs/python/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/utils/runtime/env -> /usr/src/debug/boost/1.82.0-r0/boost/test/utils/runtime/env, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/json/detail/ryu -> /usr/src/debug/boost/1.82.0-r0/boost/json/detail/ryu, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/char -> /usr/src/debug/boost/1.82.0-r0
 /boost/spirit/home/qi/char, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/classic/core/scanner -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/classic/core/scanner, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/expressions -> /usr/src/debug/boost/1.82.0-r0/boost/log/expressions, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/algorithm/iteration/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/algorithm/iteration, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/serialization -> /usr/src/debug/boost/1.82.0-r0/boost/serialization, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/karma/numeric -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma/numeric, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/random -> /usr/src/debug/boost/1.82.0-r0/boost/random, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/python/src/converter -> /usr/src/debug/boost/1.82.0-r0/libs/python/src/converter, dire
 ctory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/support/char_set -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/support/char_set, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log/utility -> /usr/src/debug/boost/1.82.0-r0/boost/log/utility, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/locale -> /usr/src/debug/boost/1.82.0-r0/boost/locale, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/exception -> /usr/src/debug/boost/1.82.0-r0/boost/exception, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/support/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/support/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/numeric/conversion -> /usr/src/debug/boost/1.82.0-r0/boost/numeric/conversion, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fiber/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fiber/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/multi_index -> /usr/src/debug/boost/1.82.0-r0/boos
 t/multi_index, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/python/converter -> /usr/src/debug/boost/1.82.0-r0/boost/python/converter, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/type_erasure/detail -> /usr/src/debug/boost/1.82.0-r0/boost/type_erasure/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/interprocess -> /usr/src/debug/boost/1.82.0-r0/boost/interprocess, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/chrono/detail/inlined/posix -> /usr/src/debug/boost/1.82.0-r0/boost/chrono/detail/inlined/posix, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/container_hash -> /usr/src/debug/boost/1.82.0-r0/boost/container_hash, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/fiber/src -> /usr/src/debug/boost/1.82.0-r0/libs/fiber/src, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/timer/src -> /usr/src/debug/boost/1.82.0-r0/libs/timer/src, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/url/rfc/detail -> /usr/src/debug/
 boost/1.82.0-r0/boost/url/rfc/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/contract -> /usr/src/debug/boost/1.82.0-r0/boost/contract, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/log -> /usr/src/debug/boost/1.82.0-r0/boost/log, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/coroutine -> /usr/src/debug/boost/1.82.0-r0/boost/coroutine, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/integer -> /usr/src/debug/boost/1.82.0-r0/boost/integer, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/xpressive -> /usr/src/debug/boost/1.82.0-r0/boost/xpressive, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/traits -> /usr/src/debug/boost/1.82.0-r0/boost/asio/traits, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/algorithm/string/detail -> /usr/src/debug/boost/1.82.0-r0/boost/algorithm/string/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/utils -> /usr/src/debug/boost/1.82.0-r0/boost/test/utils, directory renam
 ed /usr/src/debug/boost/1.81.0-r0/boost/date_time -> /usr/src/debug/boost/1.82.0-r0/boost/date_time, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/mp11/detail -> /usr/src/debug/boost/1.82.0-r0/boost/mp11/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/align/detail -> /usr/src/debug/boost/1.82.0-r0/boost/align/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/contract/detail/inlined/core -> /usr/src/debug/boost/1.82.0-r0/boost/contract/detail/inlined/core, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/karma/detail -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/karma/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/spirit/home/qi/action -> /usr/src/debug/boost/1.82.0-r0/boost/spirit/home/qi/action, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/variant -> /usr/src/debug/boost/1.82.0-r0/boost/variant, directory renamed /usr/src/debug/boost/1.81.0-r0/libs/wave/src/cpplexer/re2clex -> /usr/src/debug/boos
 t/1.82.0-r0/libs/wave/src/cpplexer/re2clex, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/test/utils/runtime -> /usr/src/debug/boost/1.82.0-r0/boost/test/utils/runtime, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/io/detail -> /usr/src/debug/boost/1.82.0-r0/boost/io/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/multi_index/detail -> /usr/src/debug/boost/1.82.0-r0/boost/multi_index/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/program_options/detail -> /usr/src/debug/boost/1.82.0-r0/boost/program_options/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/wave/cpplexer -> /usr/src/debug/boost/1.82.0-r0/boost/wave/cpplexer, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/parameter/aux_ -> /usr/src/debug/boost/1.82.0-r0/boost/parameter/aux_, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/iterator -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/iterator, directory renamed /usr/src/debug/boost/1.81.0-r0/
 boost/thread -> /usr/src/debug/boost/1.82.0-r0/boost/thread, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/ip -> /usr/src/debug/boost/1.82.0-r0/boost/asio/ip, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/asio/execution/impl -> /usr/src/debug/boost/1.82.0-r0/boost/asio/execution/impl, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/fusion/adapted/struct/detail -> /usr/src/debug/boost/1.82.0-r0/boost/fusion/adapted/struct/detail, directory renamed /usr/src/debug/boost/1.81.0-r0/boost/math/special_functions -> /usr/src/debug/boost/1.82.0-r0/boost/math/special_functions, removed "/usr/src/debug/boost/1.81.0-r0/boost/url/impl/static_url.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/segments_iter_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/value_ref.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/format.cpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/converter.cpp /usr/src/debug/boost/1.81.0-r0/boost/
 container/detail/type_traits.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/asio_fwd.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/localization_backend.cpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/digit_chars.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/default_allocator.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/is_character_type.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/detail/string_view.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/light_rw_mutex.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/encode.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/threadsafe_queue.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_base.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/memory_resource.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/static_resource.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/collate.cpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/interop_category.hpp /usr/src/debug/boo
 st/1.81.0-r0/boost/log/detail/snprintf.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/bit.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/ref.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/parse.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/serializer.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/any_params_iter.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/object.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/parser.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/pilfer.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/string.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/fake_mutex.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_encoded_ref.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/handler.hpp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/min_max.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/code_conversion.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/error_condition.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boo
 st/locale/posix/all_generator.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/gregorian.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/attribute_get_value_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_ref.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/null_resource.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/charset.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_ref.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/parse_path.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/object.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/demangle.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/object.ipp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/message.cpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/cleanup_scope_guard.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/value.ipp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/posix_backend.cpp /usr/src/debug/boost/1.81.0-r0/boos
 t/core/typeinfo.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/mo_hash.hpp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/mpl.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/ios_prop.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/value_stack.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/authority_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/core/null_deleter.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/system_error.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/addressof.hpp /usr/src/debug/boost/1.81.0-r0/boost/unordered/detail/prime_fmod.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/stream.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/object.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/config.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/ci_string.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/decode_view.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_ref.hpp /usr/src/debug/boost/1
 .81.0-r0/libs/locale/src/boost/locale/util/default_locale.cpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/decode_view.ipp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/codecvt.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/use_default.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/parts_base.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/value.hpp /usr/src/debug/boost/1.81.0-r0/boost/locale/util/string.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/basic_parser_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/dec_octet_rule.ipp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/pool_resource.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/parse.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_encoded_base.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_base.ipp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/codecvt.cpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/id.hpp /usr/src/debug/
 boost/1.81.0-r0/libs/locale/src/boost/locale/shared/date_time.cpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/light_function.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/parse.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_encoded_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/placement_new.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/timestamp.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/pointer_traits.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/decode.ipp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/snprintf.hpp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/block_slist.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/token_rule.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/numeric.cpp /usr/src/debug/boost/1.81.0-r0/boost/json/kind.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/any_segments_iter.hpp /usr/src/debug/
 boost/1.81.0-r0/boost/url/impl/params_encoded_base.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/posix/posix_backend.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/array.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/error.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/default_attribute_names.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/optional_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/print.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/stream_parser.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_base.ipp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/append_int.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/scheme.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/vchars.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/config.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/config.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/locks.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/i
 mpl/array.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/singleton.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/all_chars.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_encoded_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/dlmalloc.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/throws.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/error_category.hpp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/pointer_element.hpp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/alloc_lib.h /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/ids.cpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/attr_output_terminal.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/url.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/process_id.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/tuple_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/allocator_access.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/encode.
 hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/except.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/system_category_message.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/iconv.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/monotonic_resource.hpp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/block_list.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/alnum_chars.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/alpha_chars.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/numeric.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/std_category.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/path.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/sse2.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/utf8.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_encoded_ref.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/trivial_keyword.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/error_cate
 gory_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/monotonic_resource.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_encoded_ref.ipp /usr/src/debug/boost/1.81.0-r0/boost/core/cmath.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/over_allocator.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/gregorian.cpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/adaptive_mutex.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/embedded_string_type.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/hash_combine.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/error_code.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/system_category.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/delim_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/to_raw_pointer.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/range_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/token_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/gr
 ammar/tuple_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/swap.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/range_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/ipv4_address.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/ipv6_address.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/params_iter_impl.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/mo_lambda.hpp /usr/src/debug/boost/1.81.0-r0/boost/unordered/detail/fwd.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/storage_ptr.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/parser.ipp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/system_category_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/any_params_iter.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/is_same.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/url_impl.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/error.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/error.ipp /usr/src/debug/boost/1.
 81.0-r0/boost/url/impl/segments_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/string_view_base.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/stream_parser.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/date_time_format_parser.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/enable_if.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/generic_category.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_encoded_ref.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/locale_data.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_encoded_base.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/native_typeof.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/string_token.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/delim_rule.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/serializer.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/attachable_sstream_buf.hpp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/meta_ut
 ils_core.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/normalize.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/allocator_traits.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/timezone.hpp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/meta_utils.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/uncaught_exceptions.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/std_category_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/basic_parser.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/url_base.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/default_resource.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_ref.ipp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/errc.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/url_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/literal_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/kind.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/optional_rule.hpp /usr/src
 /debug/boost/1.81.0-r0/boost/url/grammar/variant_rule.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/codecvt_converter.cpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/value_stack.ipp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/singleton.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/digest.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/format.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/buffer.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/string_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/string.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/string.ipp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/addressof.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/align.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/array.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/stack.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/string_view.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/normalize.hpp 
 /usr/src/debug/boost/1.81.0-r0/boost/url/detail/optional_string.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/unary_function_terminal.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/enable_if.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/serialize.ipp /usr/src/debug/boost/1.81.0-r0/boost/core/noncopyable.hpp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/type_traits.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/is_same.hpp /usr/src/debug/boost/1.81.0-r0/boost/unordered/detail/implementation.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/empty_value.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/dec_octet_rule.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/locale_data.cpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/static_resource.ipp /usr/src/debug/boost/1.81.0-r0/boost/core/checked_delete.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/url_impl.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/thread_id.hpp /usr/src/debu
 g/boost/1.81.0-r0/boost/url/grammar/hexdig_chars.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/move_chars.hpp /usr/src/debug/boost/1.81.0-r0/boost/core/ignore_unused.hpp /usr/src/debug/boost/1.81.0-r0/boost/system/detail/generic_category_message.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/parse_options.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/custom_terminal_spec.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/params_iter_impl.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/ci_string.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/pointer.ipp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/error.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/segments_base.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/footer.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/impl/value_ref.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/format.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/pause.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/i
 mpl/segments_iter_impl.ipp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/mo_lambda.cpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/string_view_base.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/params_encoded_base.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/url_view_base.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/pct_string_view.ipp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/event.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/any_segments_iter.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/lut_chars.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/detail/impl/except.ipp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/variant_rule.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/impl/parse_query.ipp /usr/src/debug/boost/1.81.0-r0/boost/core/scoped_enum.hpp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/formatting.cpp /usr/src/debug/boost/1.81.0-r0/boost/json/detail/shared_resource.hpp /usr/src/deb
 ug/boost/1.81.0-r0/libs/locale/src/boost/locale/shared/generator.cpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/thread_specific.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/array.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/error.hpp /usr/src/debug/boost/1.81.0-r0/boost/json/value.hpp /usr/src/debug/boost/1.81.0-r0/boost/container/detail/thread_mutex.hpp /usr/src/debug/boost/1.81.0-r0/boost/log/detail/sfinae_tools.hpp /usr/src/debug/boost/1.81.0-r0/boost/url/grammar/impl/literal_rule.ipp /usr/src/debug/boost/1.81.0-r0/libs/locale/src/boost/locale/util/info.cpp /usr/src/debug/boost/1.81.0-r0/boost/move/detail/unique_ptr_meta_utils.hpp", added "/usr/src/debug/boost/1.82.0-r0/boost/json/detail/default_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/object.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/ci_string.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/object.ipp /usr/src/debug/boost/1.82.0-
 r0/boost/move/detail/unique_ptr_meta_utils.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/dec_octet_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/std_category_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/allocator_access.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/ipv4_address.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/ipv6_address.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_ref.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix/converter.cpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/replacement_field_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/move/detail/addressof.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/enable_if.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/error_category_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/function/detail/epilogue.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/asio_fwd.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/scoped_enum.hpp /usr/src/debug
 /boost/1.82.0-r0/boost/container/detail/alloc_lib.h /usr/src/debug/boost/1.82.0-r0/boost/json/value_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/params_iter_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/visit.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/pattern.hpp /usr/src/debug/boost/1.82.0-r0/boost/container_hash/detail/hash_range.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/delim_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/range_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/pointer.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/charset.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/token_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/tuple_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/pointer_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/empty_value.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/basic_parser.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/hexdig_chars.hpp /usr/src/
 debug/boost/1.82.0-r0/boost/json/impl/parser.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/code_conversion.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/error_category.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/error.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/normalize.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/parse.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/storage_ptr.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/lut_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/system_category_message.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/addressof.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/attr_output_terminal.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/formatting.cpp /usr/src/debug/boost/1.82.0-r0
 /libs/locale/src/boost/locale/posix/collate.cpp /usr/src/debug/boost/1.82.0-r0/boost/core/typeinfo.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/attachable_sstream_buf.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/mutex.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/parse_path.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/delim_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/light_function.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/move/detail/meta_utils_core.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/iconv_codecvt.cpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/unary_function_terminal.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/value.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/iconv.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/encoding.cpp 
 /usr/src/debug/boost/1.82.0-r0/boost/core/default_allocator.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/attribute_get_value_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/digit_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/interop_category.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/threadsafe_queue.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/allocator_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/pool_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url_view_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/stream_parser.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/basic_parser_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/swap.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/iconv_codecvt.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/unsigned_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar
 /optional_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/pause.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/decode.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/string_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/serializer.ipp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/thread_mutex.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/system_error.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/kind.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/error_code.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/replacement_field_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/string_token.hpp /usr/src/debug/boost/1.82.0-r0/boost/move/detail/meta_utils.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/config.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/object.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/stream.hpp /usr/src/debug/boost
 /1.82.0-r0/boost/url/grammar/vchars.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/gregorian.cpp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/mpl.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/footer.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/format.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/singleton.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/light_rw_mutex.hpp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/min_max.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/fake_mutex.hpp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/type_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/pattern.ipp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/generic_category.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/decode_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/pct_string_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/unordered/detail/fwd.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/d
 emangle.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/any_params_iter.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/serializer.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/process_id.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/thread_id.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/cleanup_scope_guard.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/error.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/adaptive_mutex.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/scheme.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/custom_terminal_spec.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/array.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/error.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/value.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/normal
 ize.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/id.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/range_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/detail/is_same.hpp /usr/src/debug/boost/1.82.0-r0/boost/locale/util/locale_data.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/unsigned_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/stream_parser.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/singleton.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/snprintf.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/format_args.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/format.cpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/codecvt_converter.cpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/message.cpp /usr/src/debug/boost/1.82.0-r0/boost/
 system/detail/errc.hpp /usr/src/debug/boost/1.82.0-r0/boost/move/detail/type_traits.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/encode.hpp /usr/src/debug/boost/1.82.0-r0/boost/container_hash/detail/hash_tuple_like.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/parse_query.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/mo_hash.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/system_category.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/checked_delete.hpp /usr/src/debug/boost/1.82.0-r0/boost/move/detail/to_raw_pointer.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/max_align.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/event.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_base.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/share
 d/generator.cpp /usr/src/debug/boost/1.82.0-r0/boost/core/ignore_unused.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/segments_iter_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/uncaught_exceptions.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/static_url.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/url_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/timestamp.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/handler.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/memory_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/static_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/url_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/dec_octet_rule.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/sse2.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/utf8.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/ci_string.ipp /usr/src/debug/boost/1.82.0-r0/boost/url
 /impl/url.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/serialize.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/native_typeof.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/token_rule.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/gregorian.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/any_segments_iter.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/localization_backend.cpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/sfinae_tools.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/cmath.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/all_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/unordered/detail/narrow_cast.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/is_character_type.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/ids.cpp /usr/src/debug/boost/1.82.0-r0/boost/json/object.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/parser.hpp /usr/src/debug/boost/1.82.0-r0/boost/jso
 n/pilfer.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/kind.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/string.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/segments_iter_impl.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/default_attribute_names.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/error_condition.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/date_time.cpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/null_resource.ipp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/block_slist.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix/all_generator.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/detail/string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/parse_options.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/array.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/stack.hpp /usr/src/debug/boost/1.82.0-r0/boost/
 locale/util/string.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/move_chars.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix/numeric.cpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/optional_string.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/system_category_impl.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/alnum_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/alpha_chars.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/optional_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/params_iter_impl.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_ref.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/locale_data.cpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/path.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/segments_encoded_ref.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/trivial_keyword.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/value_ref.ipp /usr
 /src/debug/boost/1.82.0-r0/boost/system/detail/generic_category_message.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/numeric.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/variant_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/value_stack.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/value_stack.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/print.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/authority_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/error.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/literal_rule.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix/codecvt.cpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix/posix_backend.hpp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/workaround.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/info.cpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/mo_lambda.hpp /usr/src/debug/
 boost/1.82.0-r0/boost/url/detail/impl/except.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/string.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/string.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/config.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/config.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/buffer.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/digest.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/format.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/any_segments_iter.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/string_view_base.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/parse.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/posix/posix_backend.cpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/std_category.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/set_pointer_options.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/format_args.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detai
 l/impl/url_impl.ipp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/ios_prop.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/snprintf.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/format_args.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/encode.hpp /usr/src/debug/boost/1.82.0-r0/boost/unordered/detail/implementation.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/shared/mo_lambda.cpp /usr/src/debug/boost/1.82.0-r0/boost/json/monotonic_resource.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/timezone.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/encoding.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/date_time_format_parser.hpp /usr/src/debug/boost/1.82.0-r0/boost/move/detail/workaround.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/monotonic_resource.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/use_default.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/array.hpp /usr/
 src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/literal_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/any_params_iter.ipp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/static_resource.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/string_view.hpp /usr/src/debug/boost/1.82.0-r0/boost/container_hash/detail/hash_mix.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/thread_specific.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/impl/pct_format.ipp /usr/src/debug/boost/1.82.0-r0/boost/core/noncopyable.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_view.ipp /usr/src/debug/boost/1.82.0-r0/boost/container/detail/block_list.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/throws.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/over_allocator.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/parse.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/decode_view.ipp /usr/src/d
 ebug/boost/1.82.0-r0/boost/core/null_deleter.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/detail/shared_resource.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/bit.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/nvp.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/enable_if.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/value.ipp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/embedded_string_type.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/detail/parts_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/append_int.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/string_view_base.hpp /usr/src/debug/boost/1.82.0-r0/boost/url/impl/params_encoded_ref.hpp /usr/src/debug/boost/1.82.0-r0/boost/json/impl/array.ipp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/impl/tuple_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/core/serialization.hpp /usr/src/debug/boost/1.82.0-r0/boost/log/detail/locks.hpp /usr/src/debug/boost/1.82.0-r0/
 boost/container/detail/placement_new.hpp /usr/src/debug/boost/1.82.0-r0/libs/locale/src/boost/locale/util/default_locale.cpp /usr/src/debug/boost/1.82.0-r0/boost/url/grammar/variant_rule.hpp /usr/src/debug/boost/1.82.0-r0/boost/system/detail/is_same.hpp"
packages/core2-32-poky-linux/boost/boost-src: PKGSIZE changed from 19556012 to 19835639 (+1%)
packages/core2-32-poky-linux/boost/boost-src: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-staticdev: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-staticdev: PKGSIZE changed from 128222705 to 129201389 (+1%)
packages/core2-32-poky-linux/boost/boost-staticdev: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-system: PKG changed from libboost-system1.81.0 to libboost-system1.82.0
packages/core2-32-poky-linux/boost/boost-system: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.81.0", added "/usr/lib/libboost_system.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-system: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-test: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_prg_exec_monitor.so.1.81.0 /usr/lib/libboost_unit_test_framework.so.1.81.0", added "/usr/lib/libboost_prg_exec_monitor.so.1.82.0 /usr/lib/libboost_unit_test_framework.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-test: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.81.0 to libboost-thread1.82.0
packages/core2-32-poky-linux/boost/boost-thread: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.81.0", added "/usr/lib/libboost_thread.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-thread: PKGSIZE changed from 99856 to 132624 (+33%)
packages/core2-32-poky-linux/boost/boost-thread: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.81.0 to libboost-timer1.82.0
packages/core2-32-poky-linux/boost/boost-timer: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.81.0", added "/usr/lib/libboost_timer.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-timer: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.81.0 to libboost-type-erasure1.82.0
packages/core2-32-poky-linux/boost/boost-type-erasure: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.81.0", added "/usr/lib/libboost_type_erasure.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-url: PKG changed from libboost-url1.81.0 to libboost-url1.82.0
packages/core2-32-poky-linux/boost/boost-url: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-url: FILELIST: removed "/usr/lib/libboost_url.so.1.81.0", added "/usr/lib/libboost_url.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-url: PKGSIZE changed from 316944 to 353872 (+12%)
packages/core2-32-poky-linux/boost/boost-url: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.81.0 to libboost-wave1.82.0
packages/core2-32-poky-linux/boost/boost-wave: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.81.0", added "/usr/lib/libboost_wave.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-wave: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost/boost: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost/boost: PV changed from "1.81.0" to "1.82.0"
packages/core2-32-poky-linux/boost: SRC_URI changed from "https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.bz2 file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch" to "https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.bz2 file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch"
packages/core2-32-poky-linux/boost: PKGV changed from 1.81.0 [default] to 1.82.0 [default]
packages/core2-32-poky-linux/boost: PV changed from "1.81.0" to "1.82.0"
Changes to packages/core2-32-poky-linux/boost (sysroot):
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.81.0 to libboost_atomic.so.1.82.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.81.0 to libboost_chrono.so.1.82.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.81.0 to libboost_container.so.1.82.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.81.0 to libboost_context.so.1.82.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.81.0 to libboost_contract.so.1.82.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.81.0 to libboost_coroutine.so.1.82.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.81.0 to libboost_date_time.so.1.82.0
  /usr/lib/libboost_fiber.so changed symlink target from libboost_fiber.so.1.81.0 to libboost_fiber.so.1.82.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.81.0 to libboost_filesystem.so.1.82.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.81.0 to libboost_graph.so.1.82.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.81.0 to libboost_iostreams.so.1.82.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.81.0 to libboost_json.so.1.82.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.81.0 to libboost_locale.so.1.82.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.81.0 to libboost_log_setup.so.1.82.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.81.0 to libboost_log.so.1.82.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.81.0 to libboost_math_c99f.so.1.82.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.81.0 to libboost_math_c99l.so.1.82.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.81.0 to libboost_math_c99.so.1.82.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.81.0 to libboost_math_tr1f.so.1.82.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.81.0 to libboost_math_tr1l.so.1.82.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.81.0 to libboost_math_tr1.so.1.82.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.81.0 to libboost_prg_exec_monitor.so.1.82.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.81.0 to libboost_program_options.so.1.82.0
  /usr/lib/libboost_python311.so changed symlink target from libboost_python311.so.1.81.0 to libboost_python311.so.1.82.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.81.0 to libboost_random.so.1.82.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.81.0 to libboost_regex.so.1.82.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.81.0 to libboost_serialization.so.1.82.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.81.0 to libboost_system.so.1.82.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.81.0 to libboost_thread.so.1.82.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.81.0 to libboost_timer.so.1.82.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.81.0 to libboost_type_erasure.so.1.82.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.81.0 to libboost_unit_test_framework.so.1.82.0
  /usr/lib/libboost_url.so changed symlink target from libboost_url.so.1.81.0 to libboost_url.so.1.82.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.81.0 to libboost_wave.so.1.82.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.81.0 to libboost_wserialization.so.1.82.0
  /usr/lib/cmake/Boost-1.81.0 moved to /usr/lib/cmake/Boost-1.82.0
  /usr/lib/cmake/boost_atomic-1.81.0 moved to /usr/lib/cmake/boost_atomic-1.82.0
  /usr/lib/cmake/boost_chrono-1.81.0 moved to /usr/lib/cmake/boost_chrono-1.82.0
  /usr/lib/cmake/boost_container-1.81.0 moved to /usr/lib/cmake/boost_container-1.82.0
  /usr/lib/cmake/boost_context-1.81.0 moved to /usr/lib/cmake/boost_context-1.82.0
  /usr/lib/cmake/boost_contract-1.81.0 moved to /usr/lib/cmake/boost_contract-1.82.0
  /usr/lib/cmake/boost_coroutine-1.81.0 moved to /usr/lib/cmake/boost_coroutine-1.82.0
  /usr/lib/cmake/boost_date_time-1.81.0 moved to /usr/lib/cmake/boost_date_time-1.82.0
  /usr/lib/cmake/BoostDetectToolset-1.81.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake
  /usr/lib/cmake/boost_exception-1.81.0 moved to /usr/lib/cmake/boost_exception-1.82.0
  /usr/lib/cmake/boost_fiber-1.81.0 moved to /usr/lib/cmake/boost_fiber-1.82.0
  /usr/lib/cmake/boost_filesystem-1.81.0 moved to /usr/lib/cmake/boost_filesystem-1.82.0
  /usr/lib/cmake/boost_graph-1.81.0 moved to /usr/lib/cmake/boost_graph-1.82.0
  /usr/lib/cmake/boost_headers-1.81.0 moved to /usr/lib/cmake/boost_headers-1.82.0
  /usr/lib/cmake/boost_iostreams-1.81.0 moved to /usr/lib/cmake/boost_iostreams-1.82.0
  /usr/lib/cmake/boost_json-1.81.0 moved to /usr/lib/cmake/boost_json-1.82.0
  /usr/lib/cmake/boost_locale-1.81.0 moved to /usr/lib/cmake/boost_locale-1.82.0
  /usr/lib/cmake/boost_log-1.81.0 moved to /usr/lib/cmake/boost_log-1.82.0
  /usr/lib/cmake/boost_log_setup-1.81.0 moved to /usr/lib/cmake/boost_log_setup-1.82.0
  /usr/lib/cmake/boost_math_c99-1.81.0 moved to /usr/lib/cmake/boost_math_c99-1.82.0
  /usr/lib/cmake/boost_math_c99f-1.81.0 moved to /usr/lib/cmake/boost_math_c99f-1.82.0
  /usr/lib/cmake/boost_math_c99l-1.81.0 moved to /usr/lib/cmake/boost_math_c99l-1.82.0
  /usr/lib/cmake/boost_math_tr1-1.81.0 moved to /usr/lib/cmake/boost_math_tr1-1.82.0
  /usr/lib/cmake/boost_math_tr1f-1.81.0 moved to /usr/lib/cmake/boost_math_tr1f-1.82.0
  /usr/lib/cmake/boost_math_tr1l-1.81.0 moved to /usr/lib/cmake/boost_math_tr1l-1.82.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.81.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.82.0
  /usr/lib/cmake/boost_program_options-1.81.0 moved to /usr/lib/cmake/boost_program_options-1.82.0
  /usr/lib/cmake/boost_python-1.81.0 moved to /usr/lib/cmake/boost_python-1.82.0
  /usr/lib/cmake/boost_random-1.81.0 moved to /usr/lib/cmake/boost_random-1.82.0
  /usr/lib/cmake/boost_regex-1.81.0 moved to /usr/lib/cmake/boost_regex-1.82.0
  /usr/lib/cmake/boost_serialization-1.81.0 moved to /usr/lib/cmake/boost_serialization-1.82.0
  /usr/lib/cmake/boost_system-1.81.0 moved to /usr/lib/cmake/boost_system-1.82.0
  /usr/lib/cmake/boost_test_exec_monitor-1.81.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.82.0
  /usr/lib/cmake/boost_thread-1.81.0 moved to /usr/lib/cmake/boost_thread-1.82.0
  /usr/lib/cmake/boost_timer-1.81.0 moved to /usr/lib/cmake/boost_timer-1.82.0
  /usr/lib/cmake/boost_type_erasure-1.81.0 moved to /usr/lib/cmake/boost_type_erasure-1.82.0
  /usr/lib/cmake/boost_unit_test_framework-1.81.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.82.0
  /usr/lib/cmake/boost_url-1.81.0 moved to /usr/lib/cmake/boost_url-1.82.0
  /usr/lib/cmake/boost_wave-1.81.0 moved to /usr/lib/cmake/boost_wave-1.82.0
  /usr/lib/cmake/boost_wserialization-1.81.0 moved to /usr/lib/cmake/boost_wserialization-1.82.0
  /usr/lib/libboost_atomic.so.1.81.0 moved to /usr/lib/libboost_atomic.so.1.82.0
  /usr/lib/libboost_chrono.so.1.81.0 moved to /usr/lib/libboost_chrono.so.1.82.0
  /usr/lib/libboost_container.so.1.81.0 moved to /usr/lib/libboost_container.so.1.82.0
  /usr/lib/libboost_context.so.1.81.0 moved to /usr/lib/libboost_context.so.1.82.0
  /usr/lib/libboost_contract.so.1.81.0 moved to /usr/lib/libboost_contract.so.1.82.0
  /usr/lib/libboost_coroutine.so.1.81.0 moved to /usr/lib/libboost_coroutine.so.1.82.0
  /usr/lib/libboost_date_time.so.1.81.0 moved to /usr/lib/libboost_date_time.so.1.82.0
  /usr/lib/libboost_fiber.so.1.81.0 moved to /usr/lib/libboost_fiber.so.1.82.0
  /usr/lib/libboost_filesystem.so.1.81.0 moved to /usr/lib/libboost_filesystem.so.1.82.0
  /usr/lib/libboost_graph.so.1.81.0 moved to /usr/lib/libboost_graph.so.1.82.0
  /usr/lib/libboost_iostreams.so.1.81.0 moved to /usr/lib/libboost_iostreams.so.1.82.0
  /usr/lib/libboost_json.so.1.81.0 moved to /usr/lib/libboost_json.so.1.82.0
  /usr/lib/libboost_locale.so.1.81.0 moved to /usr/lib/libboost_locale.so.1.82.0
  /usr/lib/libboost_log_setup.so.1.81.0 moved to /usr/lib/libboost_log_setup.so.1.82.0
  /usr/lib/libboost_log.so.1.81.0 moved to /usr/lib/libboost_log.so.1.82.0
  /usr/lib/libboost_math_c99f.so.1.81.0 moved to /usr/lib/libboost_math_c99f.so.1.82.0
  /usr/lib/libboost_math_c99l.so.1.81.0 moved to /usr/lib/libboost_math_c99l.so.1.82.0
  /usr/lib/libboost_math_c99.so.1.81.0 moved to /usr/lib/libboost_math_c99.so.1.82.0
  /usr/lib/libboost_math_tr1f.so.1.81.0 moved to /usr/lib/libboost_math_tr1f.so.1.82.0
  /usr/lib/libboost_math_tr1l.so.1.81.0 moved to /usr/lib/libboost_math_tr1l.so.1.82.0
  /usr/lib/libboost_math_tr1.so.1.81.0 moved to /usr/lib/libboost_math_tr1.so.1.82.0
  /usr/lib/libboost_prg_exec_monitor.so.1.81.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.82.0
  /usr/lib/libboost_program_options.so.1.81.0 moved to /usr/lib/libboost_program_options.so.1.82.0
  /usr/lib/libboost_python311.so.1.81.0 moved to /usr/lib/libboost_python311.so.1.82.0
  /usr/lib/libboost_random.so.1.81.0 moved to /usr/lib/libboost_random.so.1.82.0
  /usr/lib/libboost_regex.so.1.81.0 moved to /usr/lib/libboost_regex.so.1.82.0
  /usr/lib/libboost_serialization.so.1.81.0 moved to /usr/lib/libboost_serialization.so.1.82.0
  /usr/lib/libboost_system.so.1.81.0 moved to /usr/lib/libboost_system.so.1.82.0
  /usr/lib/libboost_thread.so.1.81.0 moved to /usr/lib/libboost_thread.so.1.82.0
  /usr/lib/libboost_timer.so.1.81.0 moved to /usr/lib/libboost_timer.so.1.82.0
  /usr/lib/libboost_type_erasure.so.1.81.0 moved to /usr/lib/libboost_type_erasure.so.1.82.0
  /usr/lib/libboost_unit_test_framework.so.1.81.0 moved to /usr/lib/libboost_unit_test_framework.so.1.82.0
  /usr/lib/libboost_url.so.1.81.0 moved to /usr/lib/libboost_url.so.1.82.0
  /usr/lib/libboost_wave.so.1.81.0 moved to /usr/lib/libboost_wave.so.1.82.0
  /usr/lib/libboost_wserialization.so.1.81.0 moved to /usr/lib/libboost_wserialization.so.1.82.0
  /usr/include/boost/asio/associated_immediate_executor.hpp was added
  /usr/include/boost/asio/bind_immediate_executor.hpp was added
  /usr/include/boost/asio/detail/initiate_defer.hpp was added
  /usr/include/boost/asio/detail/initiate_dispatch.hpp was added
  /usr/include/boost/asio/detail/initiate_post.hpp was added
  /usr/include/boost/asio/local/seq_packet_protocol.hpp was added
  /usr/include/boost/asio/signal_set_base.hpp was added
  /usr/include/boost/bind/detail/is_same.hpp was added
  /usr/include/boost/bind/detail/requires_cxx11.hpp was added
  /usr/include/boost/chrono/detail/requires_cxx11.hpp was added
  /usr/include/boost/container_hash/detail/hash_tuple_like.hpp was added
  /usr/include/boost/container_hash/detail/mulx.hpp was added
  /usr/include/boost/container_hash/detail/requires_cxx11.hpp was added
  /usr/include/boost/container_hash/is_tuple_like.hpp was added
  /usr/include/boost/core/alignof.hpp was added
  /usr/include/boost/core/data.hpp was added
  /usr/include/boost/core/detail/is_same.hpp was added
  /usr/include/boost/core/detail/lwt_unattended.hpp was added
  /usr/include/boost/core/identity.hpp was added
  /usr/include/boost/core/launder.hpp was added
  /usr/include/boost/core/make_span.hpp was added
  /usr/include/boost/core/max_align.hpp was added
  /usr/include/boost/core/memory_resource.hpp was added
  /usr/include/boost/core/serialization.hpp was added
  /usr/include/boost/core/size.hpp was added
  /usr/include/boost/core/snprintf.hpp was added
  /usr/include/boost/endian/detail/requires_cxx11.hpp was added
  /usr/include/boost/function/detail/epilogue.hpp was added
  /usr/include/boost/function/detail/requires_cxx11.hpp was added
  /usr/include/boost/geometry/algorithms/detail/overlay/colocate_clusters.hpp was added
  /usr/include/boost/geometry/algorithms/detail/relate/box_areal.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_end_round.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_helper.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_join_miter.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_join_round.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_side_straight.hpp was added
  /usr/include/boost/geometry/util/for_each_with_index.hpp was added
  /usr/include/boost/json/set_pointer_options.hpp was added
  /usr/include/boost/locale/util/locale_data.hpp was added
  /usr/include/boost/math/tools/estrin.hpp was added
  /usr/include/boost/multi_index/detail/bad_archive_exception.hpp was added
  /usr/include/boost/multiprecision/detail/string_helpers.hpp was added
  /usr/include/boost/multiprecision/fwd.hpp was added
  /usr/include/boost/mysql was added
  /usr/include/boost/mysql/bad_field_access.hpp was added
  /usr/include/boost/mysql/blob.hpp was added
  /usr/include/boost/mysql/blob_view.hpp was added
  /usr/include/boost/mysql/buffer_params.hpp was added
  /usr/include/boost/mysql/client_errc.hpp was added
  /usr/include/boost/mysql/column_type.hpp was added
  /usr/include/boost/mysql/common_server_errc.hpp was added
  /usr/include/boost/mysql/connection.hpp was added
  /usr/include/boost/mysql/date.hpp was added
  /usr/include/boost/mysql/datetime.hpp was added
  /usr/include/boost/mysql/days.hpp was added
  /usr/include/boost/mysql/detail was added
  /usr/include/boost/mysql/detail/auth was added
  /usr/include/boost/mysql/detail/auth/auth_calculator.hpp was added
  /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp was added
  /usr/include/boost/mysql/detail/auth/impl was added
  /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp was added
  /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp was added
  /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp was added
  /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp was added
  /usr/include/boost/mysql/detail/auxiliar was added
  /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/datetime.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/impl was added
  /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp was added
  /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/row_base.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/static_string.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/stringize.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/valgrind.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/void_t.hpp was added
  /usr/include/boost/mysql/detail/channel was added
  /usr/include/boost/mysql/detail/channel/channel.hpp was added
  /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp was added
  /usr/include/boost/mysql/detail/channel/impl was added
  /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp was added
  /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp was added
  /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp was added
  /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp was added
  /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp was added
  /usr/include/boost/mysql/detail/channel/message_parser.hpp was added
  /usr/include/boost/mysql/detail/channel/message_reader.hpp was added
  /usr/include/boost/mysql/detail/channel/message_writer.hpp was added
  /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp was added
  /usr/include/boost/mysql/detail/channel/read_buffer.hpp was added
  /usr/include/boost/mysql/detail/config.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms was added
  /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/connect.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/ping.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp was added
  /usr/include/boost/mysql/detail/protocol was added
  /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp was added
  /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp was added
  /usr/include/boost/mysql/detail/protocol/capabilities.hpp was added
  /usr/include/boost/mysql/detail/protocol/common_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/constants.hpp was added
  /usr/include/boost/mysql/detail/protocol/db_flavor.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp was added
  /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/impl was added
  /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp was added
  /usr/include/boost/mysql/detail/protocol/impl/serialization.ipp was added
  /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp was added
  /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp was added
  /usr/include/boost/mysql/detail/protocol/protocol_types.hpp was added
  /usr/include/boost/mysql/detail/protocol/query_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp was added
  /usr/include/boost/mysql/detail/protocol/serialization_context.hpp was added
  /usr/include/boost/mysql/detail/protocol/serialization.hpp was added
  /usr/include/boost/mysql/diagnostics.hpp was added
  /usr/include/boost/mysql/error_categories.hpp was added
  /usr/include/boost/mysql/error_code.hpp was added
  /usr/include/boost/mysql/error_with_diagnostics.hpp was added
  /usr/include/boost/mysql/execution_state.hpp was added
  /usr/include/boost/mysql/field.hpp was added
  /usr/include/boost/mysql/field_kind.hpp was added
  /usr/include/boost/mysql/field_view.hpp was added
  /usr/include/boost/mysql/handshake_params.hpp was added
  /usr/include/boost/mysql.hpp was added
  /usr/include/boost/mysql/impl was added
  /usr/include/boost/mysql/impl/connection.hpp was added
  /usr/include/boost/mysql/impl/date.hpp was added
  /usr/include/boost/mysql/impl/datetime.hpp was added
  /usr/include/boost/mysql/impl/diagnostics.hpp was added
  /usr/include/boost/mysql/impl/error_categories.hpp was added
  /usr/include/boost/mysql/impl/execution_state.hpp was added
  /usr/include/boost/mysql/impl/field.hpp was added
  /usr/include/boost/mysql/impl/field_kind.ipp was added
  /usr/include/boost/mysql/impl/field_view.hpp was added
  /usr/include/boost/mysql/impl/metadata.hpp was added
  /usr/include/boost/mysql/impl/results.hpp was added
  /usr/include/boost/mysql/impl/rows.hpp was added
  /usr/include/boost/mysql/impl/rows_view.hpp was added
  /usr/include/boost/mysql/impl/row_view.hpp was added
  /usr/include/boost/mysql/impl/statement.hpp was added
  /usr/include/boost/mysql/mariadb_collations.hpp was added
  /usr/include/boost/mysql/mariadb_server_errc.hpp was added
  /usr/include/boost/mysql/metadata_collection_view.hpp was added
  /usr/include/boost/mysql/metadata.hpp was added
  /usr/include/boost/mysql/metadata_mode.hpp was added
  /usr/include/boost/mysql/mysql_collations.hpp was added
  /usr/include/boost/mysql/mysql_server_errc.hpp was added
  /usr/include/boost/mysql/results.hpp was added
  /usr/include/boost/mysql/row.hpp was added
  /usr/include/boost/mysql/rows.hpp was added
  /usr/include/boost/mysql/rows_view.hpp was added
  /usr/include/boost/mysql/row_view.hpp was added
  /usr/include/boost/mysql/ssl_mode.hpp was added
  /usr/include/boost/mysql/statement.hpp was added
  /usr/include/boost/mysql/string_view.hpp was added
  /usr/include/boost/mysql/tcp.hpp was added
  /usr/include/boost/mysql/tcp_ssl.hpp was added
  /usr/include/boost/mysql/throw_on_error.hpp was added
  /usr/include/boost/mysql/time.hpp was added
  /usr/include/boost/mysql/unix.hpp was added
  /usr/include/boost/mysql/unix_ssl.hpp was added
  /usr/include/boost/nowide/quoted.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code was added
  /usr/include/boost/outcome/experimental/status-code/status-code/boost_error_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/com_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/config.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail/nt_code_to_generic_code.ipp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail/nt_code_to_win32_code.ipp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail/win32_code_to_generic_code.ipp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/errored_status_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/error.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/generic_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/getaddrinfo_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/http_status_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/iostream_support.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/nt_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/posix_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/quick_status_code_from_enum.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/result.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code_domain.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code_ptr.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_error.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/std_error_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/system_code_from_exception.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/system_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/system_error2.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/win32_code.hpp was added
  /usr/include/boost/pfr/config.hpp was added
  /usr/include/boost/pfr/detail/possible_reflectable.hpp was added
  /usr/include/boost/pfr/traits_fwd.hpp was added
  /usr/include/boost/pfr/traits.hpp was added
  /usr/include/boost/process/v2/ext was added
  /usr/include/boost/process/v2/ext/cmd.hpp was added
  /usr/include/boost/process/v2/ext/cwd.hpp was added
  /usr/include/boost/process/v2/ext/detail was added
  /usr/include/boost/process/v2/ext/detail/impl was added
  /usr/include/boost/process/v2/ext/detail/impl/proc_info.ipp was added
  /usr/include/boost/process/v2/ext/detail/proc_info.hpp was added
  /usr/include/boost/process/v2/ext/env.hpp was added
  /usr/include/boost/process/v2/ext/exe.hpp was added
  /usr/include/boost/process/v2/ext.hpp was added
  /usr/include/boost/process/v2/ext/impl was added
  /usr/include/boost/process/v2/ext/impl/cmd.ipp was added
  /usr/include/boost/process/v2/ext/impl/cwd.ipp was added
  /usr/include/boost/process/v2/ext/impl/env.ipp was added
  /usr/include/boost/process/v2/ext/impl/exe.ipp was added
  /usr/include/boost/ratio/detail/requires_cxx11.hpp was added
  /usr/include/boost/smart_ptr/detail/requires_cxx11.hpp was added
  /usr/include/boost/system/detail/mutex.hpp was added
  /usr/include/boost/system/detail/requires_cxx11.hpp was added
  /usr/include/boost/typeof/detail was added
  /usr/include/boost/typeof/detail/requires_cxx11.hpp was added
  /usr/include/boost/type_traits/detail/is_swappable_cxx_11.hpp was added
  /usr/include/boost/type_traits/is_swappable.hpp was added
  /usr/include/boost/unordered/detail/foa was added
  /usr/include/boost/unordered/detail/foa/element_type.hpp was added
  /usr/include/boost/unordered/detail/foa/node_handle.hpp was added
  /usr/include/boost/unordered/detail/mulx.hpp was added
  /usr/include/boost/unordered/detail/narrow_cast.hpp was added
  /usr/include/boost/unordered/detail/requires_cxx11.hpp was added
  /usr/include/boost/unordered/unordered_node_map_fwd.hpp was added
  /usr/include/boost/unordered/unordered_node_map.hpp was added
  /usr/include/boost/unordered/unordered_node_set_fwd.hpp was added
  /usr/include/boost/unordered/unordered_node_set.hpp was added
  /usr/include/boost/url/detail/format_args.hpp was added
  /usr/include/boost/url/detail/impl/format_args.hpp was added
  /usr/include/boost/url/detail/impl/format_args.ipp was added
  /usr/include/boost/url/detail/impl/pattern.ipp was added
  /usr/include/boost/url/detail/impl/pct_format.ipp was added
  /usr/include/boost/url/detail/impl/replacement_field_rule.ipp was added
  /usr/include/boost/url/detail/pattern.hpp was added
  /usr/include/boost/url/detail/pct_format.hpp was added
  /usr/include/boost/url/detail/replacement_field_rule.hpp was added
  /usr/include/boost/url/detail/string_view.hpp was added
  /usr/include/boost/url/detail/vformat.hpp was added
  /usr/include/boost/url/format.hpp was added
  /usr/include/boost/asio/impl/defer.hpp was removed
  /usr/include/boost/asio/impl/dispatch.hpp was removed
  /usr/include/boost/asio/impl/post.hpp was removed
  /usr/include/boost/container/detail/hash_table.hpp was removed
  /usr/include/boost/container_hash/detail/hash_tuple.hpp was removed
  /usr/include/boost/histogram/detail/span.hpp was removed
  /usr/include/boost/interprocess/detail/intersegment_ptr.hpp was removed
  /usr/include/boost/interprocess/detail/managed_multi_shared_memory.hpp was removed
  /usr/include/boost/json/detail/align.hpp was removed
  /usr/include/boost/json/detail/hash_combine.hpp was removed
  /usr/include/boost/log/detail/snprintf.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/boost_error_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/com_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/config.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/detail was removed
  /usr/include/boost/outcome/experimental/status-code/detail/nt_code_to_generic_code.ipp was removed
  /usr/include/boost/outcome/experimental/status-code/detail/nt_code_to_win32_code.ipp was removed
  /usr/include/boost/outcome/experimental/status-code/detail/win32_code_to_generic_code.ipp was removed
  /usr/include/boost/outcome/experimental/status-code/errored_status_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/error.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/generic_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/getaddrinfo_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/http_status_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/iostream_support.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/nt_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/posix_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/quick_status_code_from_enum.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/result.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_code_domain.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_code_ptr.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_error.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/std_error_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/system_code_from_exception.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/system_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/system_error2.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/win32_code.hpp was removed
  /usr/include/boost/sort/heap_sort was removed
  /usr/include/boost/sort/heap_sort/heap_sort.hpp was removed
  /usr/include/boost/url/detail/empty_value.hpp was removed

--===============2658719590074667797==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-upgrade-1.81.0-1.82.0.patch"

RnJvbSAyNmVmNzYyODYxMmI3M2U1MTg1MWUzMjljNTJkNzE3YTIyMzc2ZGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTc6NDY6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdDogdXBncmFkZSAxLjgxLjAgLT4gMS44Mi4wCgotLS0KIC4uLi9ib29zdC97Ym9vc3QtMS44
MS4wLmluYyA9PiBib29zdC0xLjgyLjAuaW5jfSAgICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3tib29zdF8xLjgxLjAuYmIgPT4gYm9vc3RfMS44Mi4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC97Ym9vc3QtMS44MS4wLmluYyA9PiBib29z
dC0xLjgyLjAuaW5jfSAoOTAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3ti
b29zdF8xLjgxLjAuYmIgPT4gYm9vc3RfMS44Mi4wLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjgxLjAuaW5jIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYm9vc3QvYm9vc3QtMS44Mi4wLmluYwpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjgxLjAuaW5jCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjgyLjAuaW5jCmluZGV4IDI5
MTc5NmM3MzYuLjM5ZDNjOWNlNWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jv
b3N0L2Jvb3N0LTEuODEuMC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9v
c3QtMS44Mi4wLmluYwpAQCAtMTIsNyArMTIsNyBAQCBCT09TVF9NQUogPSAiJHtAIl8iLmpvaW4o
ZC5nZXRWYXIoIlBWIikuc3BsaXQoIi4iKVswOjJdKX0iCiBCT09TVF9QID0gImJvb3N0XyR7Qk9P
U1RfVkVSfSIKIAogU1JDX1VSSSA9ICJodHRwczovL2Jvb3N0b3JnLmpmcm9nLmlvL2FydGlmYWN0
b3J5L21haW4vcmVsZWFzZS8ke1BWfS9zb3VyY2UvJHtCT09TVF9QfS50YXIuYnoyIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjcxZmVlZWQ5MDBmYmNjY2EwNGEzYjRmMmY4NGE3YzIxNzE4NmYyOGE5
NDBlZDhiN2VkNDcyNTk4NmJhZjk5ZmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTZlMWFiOWIw
ODYwZTZhMjg4MWRkN2IyMWZlOWY3MzdhMDk1ZTVmMzNhM2E4NzRhZmM2YTM0NTIyODU5N2VlNiIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly93d3cuYm9vc3Qub3JnL3VzZXJzL2Rvd25s
b2FkLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2UvKD9QPHB2ZXI+LiopL3NvdXJj
ZS8iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdF8xLjgxLjAu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdF8xLjgyLjAuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0
XzEuODEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3RfMS44
Mi4wLmJiCi0tIAoyLjM5LjIKCg==

--===============2658719590074667797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.81.0", added "/usr/lib/libboost_atomic.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.81.0 to libboost-atomic1.82.0
packages/core2-32-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.81.0", added "/usr/lib/libboost_chrono.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.81.0 to libboost-chrono1.82.0
packages/core2-32-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.81.0", added "/usr/lib/libboost_container.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-container: PKG changed from libboost-container1.81.0 to libboost-container1.82.0
packages/core2-32-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.81.0", added "/usr/lib/libboost_context.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-context: PKG changed from libboost-context1.81.0 to libboost-context1.82.0
packages/core2-32-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.81.0", added "/usr/lib/libboost_contract.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.81.0 to libboost-contract1.82.0
packages/core2-32-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.81.0", added "/usr/lib/libboost_coroutine.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.81.0 to libboost-coroutine1.82.0
packages/core2-32-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.81.0", added "/usr/lib/libboost_date_time.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.81.0 to libboost-date-time1.82.0
packages/core2-32-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.81.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.82.0, directory renamed /usr/lib/cmake/boost_atomic-1.81.0 -> /usr/lib/cmake/boost_atomic-1.82.0, directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.81.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.82.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.81.0 -> /usr/lib/cmake/boost_unit_test_framework-1.82.0, directory renamed /usr/lib/cmake/boost_math_c99-1.81.0 -> /usr/lib/cmake/boost_math_c99-1.82.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.81.0 -> /usr/lib/cmake/boost_math_tr1-1.82.0, directory renamed /usr/include/boost/outcome/experimental/status-code -> /usr/include/boost/outcome/experimental/status-code/status-code, directory renamed /usr/lib/cmake/boost_regex-1.81.0 -> /usr/lib/cmake/boost_regex-1.82.0, directory renamed /usr/lib/cmake/boost_fiber-1.81.0 -> /usr/lib/cmake/boost_fiber-1.82
 .0, directory renamed /usr/lib/cmake/boost_timer-1.81.0 -> /usr/lib/cmake/boost_timer-1.82.0, directory renamed /usr/lib/cmake/boost_chrono-1.81.0 -> /usr/lib/cmake/boost_chrono-1.82.0, directory renamed /usr/lib/cmake/boost_locale-1.81.0 -> /usr/lib/cmake/boost_locale-1.82.0, directory renamed /usr/lib/cmake/boost_python-1.81.0 -> /usr/lib/cmake/boost_python-1.82.0, directory renamed /usr/lib/cmake/boost_thread-1.81.0 -> /usr/lib/cmake/boost_thread-1.82.0, directory renamed /usr/lib/cmake/boost_context-1.81.0 -> /usr/lib/cmake/boost_context-1.82.0, directory renamed /usr/lib/cmake/boost_filesystem-1.81.0 -> /usr/lib/cmake/boost_filesystem-1.82.0, directory renamed /usr/lib/cmake/boost_serialization-1.81.0 -> /usr/lib/cmake/boost_serialization-1.82.0, directory renamed /usr/lib/cmake/boost_exception-1.81.0 -> /usr/lib/cmake/boost_exception-1.82.0, directory renamed /usr/lib/cmake/boost_coroutine-1.81.0 -> /usr/lib/cmake/boost_coroutine-1.82.0, directory renamed /usr/lib/cmake/Boost-
 1.81.0 -> /usr/lib/cmake/Boost-1.82.0, directory renamed /usr/lib/cmake/boost_wave-1.81.0 -> /usr/lib/cmake/boost_wave-1.82.0, directory renamed /usr/lib/cmake/boost_random-1.81.0 -> /usr/lib/cmake/boost_random-1.82.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.81.0 -> /usr/lib/cmake/boost_type_erasure-1.82.0, directory renamed /usr/lib/cmake/boost_log_setup-1.81.0 -> /usr/lib/cmake/boost_log_setup-1.82.0, directory renamed /usr/include/boost/outcome/experimental/status-code/detail -> /usr/include/boost/outcome/experimental/status-code/status-code/detail, directory renamed /usr/lib/cmake/boost_system-1.81.0 -> /usr/lib/cmake/boost_system-1.82.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.81.0 -> /usr/lib/cmake/boost_math_c99l-1.82.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.81.0 -> /usr/lib/cmake/boost_math_tr1f-1.82.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.81.0 -> /usr/lib/cmake/boost_math_tr1l-1.82.0, directory renamed /usr/lib/cmake/boost
 _math_c99f-1.81.0 -> /usr/lib/cmake/boost_math_c99f-1.82.0, directory renamed /usr/lib/cmake/boost_headers-1.81.0 -> /usr/lib/cmake/boost_headers-1.82.0, directory renamed /usr/lib/cmake/boost_json-1.81.0 -> /usr/lib/cmake/boost_json-1.82.0, directory renamed /usr/lib/cmake/boost_contract-1.81.0 -> /usr/lib/cmake/boost_contract-1.82.0, directory renamed /usr/lib/cmake/boost_wserialization-1.81.0 -> /usr/lib/cmake/boost_wserialization-1.82.0, directory renamed /usr/lib/cmake/boost_log-1.81.0 -> /usr/lib/cmake/boost_log-1.82.0, directory renamed /usr/lib/cmake/boost_url-1.81.0 -> /usr/lib/cmake/boost_url-1.82.0, directory renamed /usr/lib/cmake/boost_iostreams-1.81.0 -> /usr/lib/cmake/boost_iostreams-1.82.0, directory renamed /usr/lib/cmake/boost_container-1.81.0 -> /usr/lib/cmake/boost_container-1.82.0, directory renamed /usr/lib/cmake/boost_graph-1.81.0 -> /usr/lib/cmake/boost_graph-1.82.0, directory renamed /usr/lib/cmake/boost_program_options-1.81.0 -> /usr/lib/cmake/boost_program
 _options-1.82.0, directory renamed /usr/lib/cmake/boost_date_time-1.81.0 -> /usr/lib/cmake/boost_date_time-1.82.0, removed "/usr/include/boost/log/detail/snprintf.hpp /usr/include/boost/sort/heap_sort/heap_sort.hpp /usr/include/boost/asio/impl/dispatch.hpp /usr/include/boost/asio/impl/defer.hpp /usr/include/boost/container_hash/detail/hash_tuple.hpp /usr/include/boost/json/detail/align.hpp /usr/include/boost/json/detail/hash_combine.hpp /usr/include/boost/url/detail/empty_value.hpp /usr/include/boost/interprocess/detail/intersegment_ptr.hpp /usr/lib/cmake/BoostDetectToolset-1.81.0.cmake /usr/include/boost/asio/impl/post.hpp /usr/include/boost/interprocess/detail/managed_multi_shared_memory.hpp /usr/include/boost/histogram/detail/span.hpp /usr/include/boost/container/detail/hash_table.hpp", added "/usr/include/boost/mysql/impl/field_view.hpp /usr/include/boost/system/detail/requires_cxx11.hpp /usr/include/boost/mysql/ssl_mode.hpp /usr/include/boost/mysql/metadata_mode.hpp /usr/includ
 e/boost/core/serialization.hpp /usr/include/boost/mysql/detail/protocol/serialization_context.hpp /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp /usr/include/boost/mysql/handshake_params.hpp /usr/include/boost/unordered/detail/foa/element_type.hpp /usr/include/boost/mysql/column_type.hpp /usr/include/boost/mysql/impl/error_categories.hpp /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp /usr/include/boost/geometry/strategies/geographic/buffer_side_straight.hpp /usr/include/boost/mysql/detail/config.hpp /usr/include/boost/url/detail/impl/format_args.hpp /usr/include/boost/url/detail/impl/format_args.ipp /usr/include/boost/mysql/impl/rows.hpp /usr/include/boost/function/detail/requires_cxx11.hpp /usr/include/boost/locale/util/locale_data.hpp /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp /usr/include/boost/mysql/diagnostics.hpp /usr/include/boost/mysql/bad_field_access.hpp /usr/include/boost/mysql/client_errc.hpp /usr/include/boost
 /ratio/detail/requires_cxx11.hpp /usr/include/boost/mysql/impl/diagnostics.hpp /usr/include/boost/unordered/detail/narrow_cast.hpp /usr/include/boost/mysql/error_with_diagnostics.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp /usr/include/boost/geometry/strategies/geographic/buffer_join_round.hpp /usr/include/boost/geometry/strategies/geographic/buffer_join_miter.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp /usr/include/boost/endian/detail/requires_cxx11.hpp /usr/include/boost/mysql/statement.hpp /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp /usr/include/boost/mysql/detail/channel/message_parser.hpp /usr/include/boost/mysql/detail/channel/channel.hpp /usr/include/boost/mysql/detail/network_algorithms/connect.hpp /usr/include/boost/mysql/row.hpp /usr/include/boost/typeof/detail/requires_cxx11.hpp /usr/include/boost/unordered/unordered_node_map.hpp /usr/include/boost/mysql/row_view.hpp /usr/include/boost
 /unordered/unordered_node_set.hpp /usr/include/boost/json/set_pointer_options.hpp /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp /usr/include/boost/mysql/common_server_errc.hpp /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp /usr/include/boost/mysql/results.hpp /usr/include/boost/mysql/tcp_ssl.hpp /usr/include/boost/geometry/util/for_each_with_index.hpp /usr/include/boost/mysql/detail/auxiliar/stringize.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp /usr/include/boost/geometry/algorithms/detail/relate/box_areal.hpp /usr/include/boost/mysql/metadata_collection_view.hpp /usr/include/boost/container_hash/detail/hash_tuple_like.hpp /usr/include/boost/type_traits/is_swappable.hpp /usr/include/boost/process/v2/ext/impl/exe.ipp /usr/include/boost/asio/detail/initiate_dispatch.hpp /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp /usr/include/boost/mysql/impl/execution_state.hpp /usr/include/boost/mysq
 l/error_code.hpp /usr/include/boost/mysql/detail/channel/message_reader.hpp /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp /usr/include/boost/mysql/field.hpp /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp /usr/include/boost/core/alignof.hpp /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp /usr/include/boost/url/detail/vformat.hpp /usr/include/boost/process/v2/ext/impl/env.ipp /usr/include/boost/url/format.hpp /usr/include/boost/container_hash/is_tuple_like.hpp /usr/include/boost/bind/detail/requires_cxx11.hpp /usr/include/boost/pfr/config.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp /usr/include/boost/mysql/field_view.hpp /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp /usr/include/boost/smar
 t_ptr/detail/requires_cxx11.hpp /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp /usr/include/boost/geometry/strategies/geographic/buffer_end_round.hpp /usr/include/boost/mysql/detail/channel/message_writer.hpp /usr/include/boost/mysql/execution_state.hpp /usr/include/boost/url/detail/impl/pattern.ipp /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp /usr/include/boost/mysql/throw_on_error.hpp /usr/include/boost/mysql/unix_ssl.hpp /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp /usr/include/boost/url/detail/impl/replacement_field_rule.ipp /usr/include/boost/mysql/impl/date.hpp /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp /usr/include/boost/mysql.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp /usr/include/boost/container_hash/detail/requires_cxx11.hpp /usr/in
 clude/boost/mysql/detail/protocol/constants.hpp /usr/include/boost/unordered/unordered_node_map_fwd.hpp /usr/include/boost/unordered/unordered_node_set_fwd.hpp /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp /usr/include/boost/multiprecision/detail/string_helpers.hpp /usr/include/boost/mysql/field_kind.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp /usr/include/boost/mysql/tcp.hpp /usr/include/boost/asio/bind_immediate_executor.hpp /usr/include/boost/mysql/unix.hpp /usr/include/boost/core/launder.hpp /usr/include/boost/mysql/detail/protocol/query_messages.hpp /usr/include/boost/mysql/buffer_params.hpp /usr/include/boost/core/size.hpp /usr/include/boost/mysql/detail/network_
 algorithms/impl/close_connection.hpp /usr/include/boost/core/identity.hpp /usr/include/boost/core/make_span.hpp /usr/include/boost/core/max_align.hpp /usr/include/boost/asio/signal_set_base.hpp /usr/include/boost/mysql/detail/network_algorithms/ping.hpp /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp /usr/include/boost/multi_index/detail/bad_archive_exception.hpp /usr/include/boost/mysql/datetime.hpp /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp /usr/include/boost/mysql/mysql_collations.hpp /usr/include/boost/mysql/detail/channel/read_buffer.hpp /usr/include/boost/url/detail/pct_format.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp /usr/include/boost/function/detail/epilogue.hpp /usr/include/boost/mysql/detail/protocol/capabilities.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp /usr/include/boost/mysql/detail
 /protocol/impl/deserialize_binary_field.ipp /usr/include/boost/mysql/impl/field.hpp /usr/include/boost/mysql/mariadb_server_errc.hpp /usr/include/boost/mysql/metadata.hpp /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp /usr/include/boost/asio/associated_immediate_executor.hpp /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp /usr/include/boost/mysql/connection.hpp /usr/include/boost/mysql/error_categories.hpp /usr/include/boost/url/detail/pattern.hpp /usr/include/boost/container_hash/detail/mulx.hpp /usr/include/boost/unordered/detail/foa/node_handle.hpp /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp /usr/include/boost/mysql/mariadb_collations.hpp /usr/include/boost/process/v2/ext/impl/cwd.ipp /usr/include/boost/mysql/det
 ail/network_algorithms/read_all_rows.hpp /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp /usr/include/boost/mysql/detail/auxiliar/void_t.hpp /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp /usr/include/boost/system/detail/mutex.hpp /usr/include/boost/url/detail/replacement_field_rule.hpp /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp /usr/include/boost/geometry/algorithms/detail/overlay/colocate_clusters.hpp /usr/include/boost/unordered/detail/mulx.hpp /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp /usr/include/boost/pfr/traits_fwd.hpp /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp /usr/include/boost/url/detail/string_view.hpp /usr/include/boost/core/data.hpp /usr/include/boost/core/memory_resource.hpp /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp /usr/include/boost/process/v2/ext/detail/impl/proc_info.ipp /usr/inc
 lude/boost/url/detail/impl/pct_format.ipp /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp /usr/include/boost/mysql/detail/protocol/common_messages.hpp /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp /usr/include/boost/pfr/traits.hpp /usr/include/boost/mysql/detail/network_algorithms/query.hpp /usr/include/boost/mysql/impl/connection.hpp /usr/include/boost/mysql/detail/protocol/protocol_types.hpp /usr/include/boost/mysql/impl/field_kind.ipp /usr/include/boost/mysql/detail/auxiliar/static_string.hpp /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp /usr/include/boost/geometry/strategies/geographic/buffer_helper.hpp /usr/include/boost/mysql/string_view.hpp /usr/include/boost/asio/detail/initiate_defer.hpp /usr/include/boost/unordered/detail/requires_cxx11.hpp /usr/lib/cmake/BoostDetectToolset-
 1.82.0.cmake /usr/include/boost/mysql/detail/protocol/db_flavor.hpp /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp /usr/include/boost/process/v2/ext/cmd.hpp /usr/include/boost/process/v2/ext/cwd.hpp /usr/include/boost/process/v2/ext/env.hpp /usr/include/boost/process/v2/ext/exe.hpp /usr/include/boost/asio/detail/initiate_post.hpp /usr/include/boost/mysql/impl/statement.hpp /usr/include/boost/url/detail/format_args.hpp /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp /usr/include/boost/core/snprintf.hpp /usr/include/boost/mysql/detail/auxiliar/row_base.hpp /usr/include/boost/mysql/detail/auxiliar/datetime.hpp /usr/include/boost/process/v2/ext.hpp /usr/include/boost/mysql/impl/metadata.hpp /usr/include/boost/mysql/impl/datetime.hpp /usr/include/boost/chrono/detail/requires_cxx11.hpp /usr/include/boost/mysql/detail/protocol/impl/serialization.ipp /usr/include/boost/mysql/detail/auxil
 iar/rebind_executor.hpp /usr/include/boost/type_traits/detail/is_swappable_cxx_11.hpp /usr/include/boost/nowide/quoted.hpp /usr/include/boost/process/v2/ext/impl/cmd.ipp /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp /usr/include/boost/bind/detail/is_same.hpp /usr/include/boost/core/detail/is_same.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp /usr/include/boost/pfr/detail/possible_reflectable.hpp /usr/include/boost/mysql/impl/rows_view.hpp /usr/include/boost/mysql/blob_view.hpp /usr/include/boost/mysql/rows_view.hpp /usr/include/boost/asio/local/seq_packet_protocol.hpp /usr/include/boost/multiprecision/fwd.hpp /usr/include/boost/mysql/impl/results.hpp /usr/include/boost/mysql/mysql_server_errc.hpp /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp /usr/include/boost/mysql/detail/a
 uxiliar/valgrind.hpp /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp /usr/include/boost/mysql/blob.hpp /usr/include/boost/mysql/date.hpp /usr/include/boost/mysql/days.hpp /usr/include/boost/math/tools/estrin.hpp /usr/include/boost/mysql/time.hpp /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp /usr/include/boost/mysql/rows.hpp /usr/include/boost/core/detail/lwt_unattended.hpp /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp /usr/include/boost/mysql/impl/row_view.hpp /usr/include/boost/process/v2/ext/detail/proc_info.hpp /usr/include/boost/mysql/detail/protocol/serialization.hpp /usr/include/boost/mysql/detail/auth/auth_calculator.hpp"
packages/core2-32-poky-linux/boost/boost-fiber: FILELIST: removed "/usr/lib/libboost_fiber.so.1.81.0", added "/usr/lib/libboost_fiber.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-fiber: PKG changed from libboost-fiber1.81.0 to libboost-fiber1.82.0
packages/core2-32-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.81.0", added "/usr/lib/libboost_filesystem.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.81.0 to libboost-filesystem1.82.0
packages/core2-32-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.81.0", added "/usr/lib/libboost_graph.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.81.0 to libboost-graph1.82.0
packages/core2-32-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.81.0", added "/usr/lib/libboost_iostreams.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.81.0 to libboost-iostreams1.82.0
packages/core2-32-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.81.0", added "/usr/lib/libboost_json.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-json: PKG changed from libboost-json1.81.0 to libboost-json1.82.0
packages/core2-32-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.81.0", added "/usr/lib/libboost_locale.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.81.0 to libboost-locale1.82.0
packages/core2-32-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log_setup.so.1.81.0 /usr/lib/libboost_log.so.1.81.0", added "/usr/lib/libboost_log.so.1.82.0 /usr/lib/libboost_log_setup.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_c99f.so.1.81.0 /usr/lib/libboost_math_c99l.so.1.81.0 /usr/lib/libboost_math_c99.so.1.81.0 /usr/lib/libboost_math_tr1.so.1.81.0 /usr/lib/libboost_math_tr1f.so.1.81.0 /usr/lib/libboost_math_tr1l.so.1.81.0", added "/usr/lib/libboost_math_tr1.so.1.82.0 /usr/lib/libboost_math_c99.so.1.82.0 /usr/lib/libboost_math_tr1f.so.1.82.0 /usr/lib/libboost_math_tr1l.so.1.82.0 /usr/lib/libboost_math_c99f.so.1.82.0 /usr/lib/libboost_math_c99l.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.81.0", added "/usr/lib/libboost_program_options.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.81.0 to libboost-program-options1.82.0
packages/core2-32-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python311.so.1.81.0", added "/usr/lib/libboost_python311.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-python: PKG changed from libboost-python311-1.81.0 to libboost-python311-1.82.0
packages/core2-32-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.81.0", added "/usr/lib/libboost_random.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-random: PKG changed from libboost-random1.81.0 to libboost-random1.82.0
packages/core2-32-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.81.0", added "/usr/lib/libboost_regex.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.81.0 to libboost-regex1.82.0
packages/core2-32-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_serialization.so.1.81.0 /usr/lib/libboost_wserialization.so.1.81.0", added "/usr/lib/libboost_serialization.so.1.82.0 /usr/lib/libboost_wserialization.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.81.0", added "/usr/lib/libboost_system.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-system: PKG changed from libboost-system1.81.0 to libboost-system1.82.0
packages/core2-32-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_unit_test_framework.so.1.81.0 /usr/lib/libboost_prg_exec_monitor.so.1.81.0", added "/usr/lib/libboost_prg_exec_monitor.so.1.82.0 /usr/lib/libboost_unit_test_framework.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-thread: PKGSIZE changed from 99856 to 132624 (+33%)
packages/core2-32-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.81.0", added "/usr/lib/libboost_thread.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.81.0 to libboost-thread1.82.0
packages/core2-32-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.81.0", added "/usr/lib/libboost_timer.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.81.0 to libboost-timer1.82.0
packages/core2-32-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.81.0", added "/usr/lib/libboost_type_erasure.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.81.0 to libboost-type-erasure1.82.0
packages/core2-32-poky-linux/boost/boost-url: PKGSIZE changed from 316944 to 353872 (+12%)
packages/core2-32-poky-linux/boost/boost-url: FILELIST: removed "/usr/lib/libboost_url.so.1.81.0", added "/usr/lib/libboost_url.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-url: PKG changed from libboost-url1.81.0 to libboost-url1.82.0
packages/core2-32-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.81.0", added "/usr/lib/libboost_wave.so.1.82.0"
packages/core2-32-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.81.0 to libboost-wave1.82.0
Changes to packages/core2-32-poky-linux/boost (sysroot):
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.81.0 to libboost_atomic.so.1.82.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.81.0 to libboost_chrono.so.1.82.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.81.0 to libboost_container.so.1.82.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.81.0 to libboost_context.so.1.82.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.81.0 to libboost_contract.so.1.82.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.81.0 to libboost_coroutine.so.1.82.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.81.0 to libboost_date_time.so.1.82.0
  /usr/lib/libboost_fiber.so changed symlink target from libboost_fiber.so.1.81.0 to libboost_fiber.so.1.82.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.81.0 to libboost_filesystem.so.1.82.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.81.0 to libboost_graph.so.1.82.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.81.0 to libboost_iostreams.so.1.82.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.81.0 to libboost_json.so.1.82.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.81.0 to libboost_locale.so.1.82.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.81.0 to libboost_log_setup.so.1.82.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.81.0 to libboost_log.so.1.82.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.81.0 to libboost_math_c99f.so.1.82.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.81.0 to libboost_math_c99l.so.1.82.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.81.0 to libboost_math_c99.so.1.82.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.81.0 to libboost_math_tr1f.so.1.82.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.81.0 to libboost_math_tr1l.so.1.82.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.81.0 to libboost_math_tr1.so.1.82.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.81.0 to libboost_prg_exec_monitor.so.1.82.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.81.0 to libboost_program_options.so.1.82.0
  /usr/lib/libboost_python311.so changed symlink target from libboost_python311.so.1.81.0 to libboost_python311.so.1.82.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.81.0 to libboost_random.so.1.82.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.81.0 to libboost_regex.so.1.82.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.81.0 to libboost_serialization.so.1.82.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.81.0 to libboost_system.so.1.82.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.81.0 to libboost_thread.so.1.82.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.81.0 to libboost_timer.so.1.82.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.81.0 to libboost_type_erasure.so.1.82.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.81.0 to libboost_unit_test_framework.so.1.82.0
  /usr/lib/libboost_url.so changed symlink target from libboost_url.so.1.81.0 to libboost_url.so.1.82.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.81.0 to libboost_wave.so.1.82.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.81.0 to libboost_wserialization.so.1.82.0
  /usr/lib/cmake/Boost-1.81.0 moved to /usr/lib/cmake/Boost-1.82.0
  /usr/lib/cmake/boost_atomic-1.81.0 moved to /usr/lib/cmake/boost_atomic-1.82.0
  /usr/lib/cmake/boost_chrono-1.81.0 moved to /usr/lib/cmake/boost_chrono-1.82.0
  /usr/lib/cmake/boost_container-1.81.0 moved to /usr/lib/cmake/boost_container-1.82.0
  /usr/lib/cmake/boost_context-1.81.0 moved to /usr/lib/cmake/boost_context-1.82.0
  /usr/lib/cmake/boost_contract-1.81.0 moved to /usr/lib/cmake/boost_contract-1.82.0
  /usr/lib/cmake/boost_coroutine-1.81.0 moved to /usr/lib/cmake/boost_coroutine-1.82.0
  /usr/lib/cmake/boost_date_time-1.81.0 moved to /usr/lib/cmake/boost_date_time-1.82.0
  /usr/lib/cmake/BoostDetectToolset-1.81.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.82.0.cmake
  /usr/lib/cmake/boost_exception-1.81.0 moved to /usr/lib/cmake/boost_exception-1.82.0
  /usr/lib/cmake/boost_fiber-1.81.0 moved to /usr/lib/cmake/boost_fiber-1.82.0
  /usr/lib/cmake/boost_filesystem-1.81.0 moved to /usr/lib/cmake/boost_filesystem-1.82.0
  /usr/lib/cmake/boost_graph-1.81.0 moved to /usr/lib/cmake/boost_graph-1.82.0
  /usr/lib/cmake/boost_headers-1.81.0 moved to /usr/lib/cmake/boost_headers-1.82.0
  /usr/lib/cmake/boost_iostreams-1.81.0 moved to /usr/lib/cmake/boost_iostreams-1.82.0
  /usr/lib/cmake/boost_json-1.81.0 moved to /usr/lib/cmake/boost_json-1.82.0
  /usr/lib/cmake/boost_locale-1.81.0 moved to /usr/lib/cmake/boost_locale-1.82.0
  /usr/lib/cmake/boost_log-1.81.0 moved to /usr/lib/cmake/boost_log-1.82.0
  /usr/lib/cmake/boost_log_setup-1.81.0 moved to /usr/lib/cmake/boost_log_setup-1.82.0
  /usr/lib/cmake/boost_math_c99-1.81.0 moved to /usr/lib/cmake/boost_math_c99-1.82.0
  /usr/lib/cmake/boost_math_c99f-1.81.0 moved to /usr/lib/cmake/boost_math_c99f-1.82.0
  /usr/lib/cmake/boost_math_c99l-1.81.0 moved to /usr/lib/cmake/boost_math_c99l-1.82.0
  /usr/lib/cmake/boost_math_tr1-1.81.0 moved to /usr/lib/cmake/boost_math_tr1-1.82.0
  /usr/lib/cmake/boost_math_tr1f-1.81.0 moved to /usr/lib/cmake/boost_math_tr1f-1.82.0
  /usr/lib/cmake/boost_math_tr1l-1.81.0 moved to /usr/lib/cmake/boost_math_tr1l-1.82.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.81.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.82.0
  /usr/lib/cmake/boost_program_options-1.81.0 moved to /usr/lib/cmake/boost_program_options-1.82.0
  /usr/lib/cmake/boost_python-1.81.0 moved to /usr/lib/cmake/boost_python-1.82.0
  /usr/lib/cmake/boost_random-1.81.0 moved to /usr/lib/cmake/boost_random-1.82.0
  /usr/lib/cmake/boost_regex-1.81.0 moved to /usr/lib/cmake/boost_regex-1.82.0
  /usr/lib/cmake/boost_serialization-1.81.0 moved to /usr/lib/cmake/boost_serialization-1.82.0
  /usr/lib/cmake/boost_system-1.81.0 moved to /usr/lib/cmake/boost_system-1.82.0
  /usr/lib/cmake/boost_test_exec_monitor-1.81.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.82.0
  /usr/lib/cmake/boost_thread-1.81.0 moved to /usr/lib/cmake/boost_thread-1.82.0
  /usr/lib/cmake/boost_timer-1.81.0 moved to /usr/lib/cmake/boost_timer-1.82.0
  /usr/lib/cmake/boost_type_erasure-1.81.0 moved to /usr/lib/cmake/boost_type_erasure-1.82.0
  /usr/lib/cmake/boost_unit_test_framework-1.81.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.82.0
  /usr/lib/cmake/boost_url-1.81.0 moved to /usr/lib/cmake/boost_url-1.82.0
  /usr/lib/cmake/boost_wave-1.81.0 moved to /usr/lib/cmake/boost_wave-1.82.0
  /usr/lib/cmake/boost_wserialization-1.81.0 moved to /usr/lib/cmake/boost_wserialization-1.82.0
  /usr/lib/libboost_atomic.so.1.81.0 moved to /usr/lib/libboost_atomic.so.1.82.0
  /usr/lib/libboost_chrono.so.1.81.0 moved to /usr/lib/libboost_chrono.so.1.82.0
  /usr/lib/libboost_container.so.1.81.0 moved to /usr/lib/libboost_container.so.1.82.0
  /usr/lib/libboost_context.so.1.81.0 moved to /usr/lib/libboost_context.so.1.82.0
  /usr/lib/libboost_contract.so.1.81.0 moved to /usr/lib/libboost_contract.so.1.82.0
  /usr/lib/libboost_coroutine.so.1.81.0 moved to /usr/lib/libboost_coroutine.so.1.82.0
  /usr/lib/libboost_date_time.so.1.81.0 moved to /usr/lib/libboost_date_time.so.1.82.0
  /usr/lib/libboost_fiber.so.1.81.0 moved to /usr/lib/libboost_fiber.so.1.82.0
  /usr/lib/libboost_filesystem.so.1.81.0 moved to /usr/lib/libboost_filesystem.so.1.82.0
  /usr/lib/libboost_graph.so.1.81.0 moved to /usr/lib/libboost_graph.so.1.82.0
  /usr/lib/libboost_iostreams.so.1.81.0 moved to /usr/lib/libboost_iostreams.so.1.82.0
  /usr/lib/libboost_json.so.1.81.0 moved to /usr/lib/libboost_json.so.1.82.0
  /usr/lib/libboost_locale.so.1.81.0 moved to /usr/lib/libboost_locale.so.1.82.0
  /usr/lib/libboost_log_setup.so.1.81.0 moved to /usr/lib/libboost_log_setup.so.1.82.0
  /usr/lib/libboost_log.so.1.81.0 moved to /usr/lib/libboost_log.so.1.82.0
  /usr/lib/libboost_math_c99f.so.1.81.0 moved to /usr/lib/libboost_math_c99f.so.1.82.0
  /usr/lib/libboost_math_c99l.so.1.81.0 moved to /usr/lib/libboost_math_c99l.so.1.82.0
  /usr/lib/libboost_math_c99.so.1.81.0 moved to /usr/lib/libboost_math_c99.so.1.82.0
  /usr/lib/libboost_math_tr1f.so.1.81.0 moved to /usr/lib/libboost_math_tr1f.so.1.82.0
  /usr/lib/libboost_math_tr1l.so.1.81.0 moved to /usr/lib/libboost_math_tr1l.so.1.82.0
  /usr/lib/libboost_math_tr1.so.1.81.0 moved to /usr/lib/libboost_math_tr1.so.1.82.0
  /usr/lib/libboost_prg_exec_monitor.so.1.81.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.82.0
  /usr/lib/libboost_program_options.so.1.81.0 moved to /usr/lib/libboost_program_options.so.1.82.0
  /usr/lib/libboost_python311.so.1.81.0 moved to /usr/lib/libboost_python311.so.1.82.0
  /usr/lib/libboost_random.so.1.81.0 moved to /usr/lib/libboost_random.so.1.82.0
  /usr/lib/libboost_regex.so.1.81.0 moved to /usr/lib/libboost_regex.so.1.82.0
  /usr/lib/libboost_serialization.so.1.81.0 moved to /usr/lib/libboost_serialization.so.1.82.0
  /usr/lib/libboost_system.so.1.81.0 moved to /usr/lib/libboost_system.so.1.82.0
  /usr/lib/libboost_thread.so.1.81.0 moved to /usr/lib/libboost_thread.so.1.82.0
  /usr/lib/libboost_timer.so.1.81.0 moved to /usr/lib/libboost_timer.so.1.82.0
  /usr/lib/libboost_type_erasure.so.1.81.0 moved to /usr/lib/libboost_type_erasure.so.1.82.0
  /usr/lib/libboost_unit_test_framework.so.1.81.0 moved to /usr/lib/libboost_unit_test_framework.so.1.82.0
  /usr/lib/libboost_url.so.1.81.0 moved to /usr/lib/libboost_url.so.1.82.0
  /usr/lib/libboost_wave.so.1.81.0 moved to /usr/lib/libboost_wave.so.1.82.0
  /usr/lib/libboost_wserialization.so.1.81.0 moved to /usr/lib/libboost_wserialization.so.1.82.0
  /usr/include/boost/asio/associated_immediate_executor.hpp was added
  /usr/include/boost/asio/bind_immediate_executor.hpp was added
  /usr/include/boost/asio/detail/initiate_defer.hpp was added
  /usr/include/boost/asio/detail/initiate_dispatch.hpp was added
  /usr/include/boost/asio/detail/initiate_post.hpp was added
  /usr/include/boost/asio/local/seq_packet_protocol.hpp was added
  /usr/include/boost/asio/signal_set_base.hpp was added
  /usr/include/boost/bind/detail/is_same.hpp was added
  /usr/include/boost/bind/detail/requires_cxx11.hpp was added
  /usr/include/boost/chrono/detail/requires_cxx11.hpp was added
  /usr/include/boost/container_hash/detail/hash_tuple_like.hpp was added
  /usr/include/boost/container_hash/detail/mulx.hpp was added
  /usr/include/boost/container_hash/detail/requires_cxx11.hpp was added
  /usr/include/boost/container_hash/is_tuple_like.hpp was added
  /usr/include/boost/core/alignof.hpp was added
  /usr/include/boost/core/data.hpp was added
  /usr/include/boost/core/detail/is_same.hpp was added
  /usr/include/boost/core/detail/lwt_unattended.hpp was added
  /usr/include/boost/core/identity.hpp was added
  /usr/include/boost/core/launder.hpp was added
  /usr/include/boost/core/make_span.hpp was added
  /usr/include/boost/core/max_align.hpp was added
  /usr/include/boost/core/memory_resource.hpp was added
  /usr/include/boost/core/serialization.hpp was added
  /usr/include/boost/core/size.hpp was added
  /usr/include/boost/core/snprintf.hpp was added
  /usr/include/boost/endian/detail/requires_cxx11.hpp was added
  /usr/include/boost/function/detail/epilogue.hpp was added
  /usr/include/boost/function/detail/requires_cxx11.hpp was added
  /usr/include/boost/geometry/algorithms/detail/overlay/colocate_clusters.hpp was added
  /usr/include/boost/geometry/algorithms/detail/relate/box_areal.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_end_round.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_helper.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_join_miter.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_join_round.hpp was added
  /usr/include/boost/geometry/strategies/geographic/buffer_side_straight.hpp was added
  /usr/include/boost/geometry/util/for_each_with_index.hpp was added
  /usr/include/boost/json/set_pointer_options.hpp was added
  /usr/include/boost/locale/util/locale_data.hpp was added
  /usr/include/boost/math/tools/estrin.hpp was added
  /usr/include/boost/multi_index/detail/bad_archive_exception.hpp was added
  /usr/include/boost/multiprecision/detail/string_helpers.hpp was added
  /usr/include/boost/multiprecision/fwd.hpp was added
  /usr/include/boost/mysql was added
  /usr/include/boost/mysql/bad_field_access.hpp was added
  /usr/include/boost/mysql/blob.hpp was added
  /usr/include/boost/mysql/blob_view.hpp was added
  /usr/include/boost/mysql/buffer_params.hpp was added
  /usr/include/boost/mysql/client_errc.hpp was added
  /usr/include/boost/mysql/column_type.hpp was added
  /usr/include/boost/mysql/common_server_errc.hpp was added
  /usr/include/boost/mysql/connection.hpp was added
  /usr/include/boost/mysql/date.hpp was added
  /usr/include/boost/mysql/datetime.hpp was added
  /usr/include/boost/mysql/days.hpp was added
  /usr/include/boost/mysql/detail was added
  /usr/include/boost/mysql/detail/auth was added
  /usr/include/boost/mysql/detail/auth/auth_calculator.hpp was added
  /usr/include/boost/mysql/detail/auth/caching_sha2_password.hpp was added
  /usr/include/boost/mysql/detail/auth/impl was added
  /usr/include/boost/mysql/detail/auth/impl/auth_calculator.ipp was added
  /usr/include/boost/mysql/detail/auth/impl/caching_sha2_password.ipp was added
  /usr/include/boost/mysql/detail/auth/impl/mysql_native_password.ipp was added
  /usr/include/boost/mysql/detail/auth/mysql_native_password.hpp was added
  /usr/include/boost/mysql/detail/auxiliar was added
  /usr/include/boost/mysql/detail/auxiliar/access_fwd.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/bytestring.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/datetime.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/error_helpers.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/field_impl.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/field_type_traits.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/impl was added
  /usr/include/boost/mysql/detail/auxiliar/impl/datetime.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/impl/row_base.ipp was added
  /usr/include/boost/mysql/detail/auxiliar/make_string_view.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/rebind_executor.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/row_base.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/rows_iterator.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/server_errc_strings.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/static_string.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/stringize.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/string_view_offset.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/valgrind.hpp was added
  /usr/include/boost/mysql/detail/auxiliar/void_t.hpp was added
  /usr/include/boost/mysql/detail/channel was added
  /usr/include/boost/mysql/detail/channel/channel.hpp was added
  /usr/include/boost/mysql/detail/channel/disableable_ssl_stream.hpp was added
  /usr/include/boost/mysql/detail/channel/impl was added
  /usr/include/boost/mysql/detail/channel/impl/disableable_ssl_stream.hpp was added
  /usr/include/boost/mysql/detail/channel/impl/message_parser.ipp was added
  /usr/include/boost/mysql/detail/channel/impl/message_reader.hpp was added
  /usr/include/boost/mysql/detail/channel/impl/message_writer.hpp was added
  /usr/include/boost/mysql/detail/channel/impl/read_buffer.ipp was added
  /usr/include/boost/mysql/detail/channel/message_parser.hpp was added
  /usr/include/boost/mysql/detail/channel/message_reader.hpp was added
  /usr/include/boost/mysql/detail/channel/message_writer.hpp was added
  /usr/include/boost/mysql/detail/channel/message_writer_processor.hpp was added
  /usr/include/boost/mysql/detail/channel/read_buffer.hpp was added
  /usr/include/boost/mysql/detail/config.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms was added
  /usr/include/boost/mysql/detail/network_algorithms/close_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/close_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/connect.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/execute_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/handshake.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/close_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/connect.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/execute_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/handshake.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/ping.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/prepare_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/quit_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_all_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/read_some_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_execution_generic.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/impl/start_statement_execution.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/ping.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/prepare_statement.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/quit_connection.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/read_all_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/read_some_rows.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/start_execution_generic.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/start_query.hpp was added
  /usr/include/boost/mysql/detail/network_algorithms/start_statement_execution.hpp was added
  /usr/include/boost/mysql/detail/protocol was added
  /usr/include/boost/mysql/detail/protocol/binary_serialization.hpp was added
  /usr/include/boost/mysql/detail/protocol/bit_deserialization.hpp was added
  /usr/include/boost/mysql/detail/protocol/capabilities.hpp was added
  /usr/include/boost/mysql/detail/protocol/common_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/constants.hpp was added
  /usr/include/boost/mysql/detail/protocol/db_flavor.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialization_context.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_binary_field.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_errc.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_row.hpp was added
  /usr/include/boost/mysql/detail/protocol/deserialize_text_field.hpp was added
  /usr/include/boost/mysql/detail/protocol/handshake_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/impl was added
  /usr/include/boost/mysql/detail/protocol/impl/binary_serialization.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/common_messages.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_binary_field.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_row.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/deserialize_text_field.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/handshake_messages.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/prepared_statement_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/impl/process_error_packet.ipp was added
  /usr/include/boost/mysql/detail/protocol/impl/serialization.hpp was added
  /usr/include/boost/mysql/detail/protocol/impl/serialization.ipp was added
  /usr/include/boost/mysql/detail/protocol/null_bitmap_traits.hpp was added
  /usr/include/boost/mysql/detail/protocol/prepared_statement_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/process_error_packet.hpp was added
  /usr/include/boost/mysql/detail/protocol/protocol_types.hpp was added
  /usr/include/boost/mysql/detail/protocol/query_messages.hpp was added
  /usr/include/boost/mysql/detail/protocol/resultset_encoding.hpp was added
  /usr/include/boost/mysql/detail/protocol/serialization_context.hpp was added
  /usr/include/boost/mysql/detail/protocol/serialization.hpp was added
  /usr/include/boost/mysql/diagnostics.hpp was added
  /usr/include/boost/mysql/error_categories.hpp was added
  /usr/include/boost/mysql/error_code.hpp was added
  /usr/include/boost/mysql/error_with_diagnostics.hpp was added
  /usr/include/boost/mysql/execution_state.hpp was added
  /usr/include/boost/mysql/field.hpp was added
  /usr/include/boost/mysql/field_kind.hpp was added
  /usr/include/boost/mysql/field_view.hpp was added
  /usr/include/boost/mysql/handshake_params.hpp was added
  /usr/include/boost/mysql.hpp was added
  /usr/include/boost/mysql/impl was added
  /usr/include/boost/mysql/impl/connection.hpp was added
  /usr/include/boost/mysql/impl/date.hpp was added
  /usr/include/boost/mysql/impl/datetime.hpp was added
  /usr/include/boost/mysql/impl/diagnostics.hpp was added
  /usr/include/boost/mysql/impl/error_categories.hpp was added
  /usr/include/boost/mysql/impl/execution_state.hpp was added
  /usr/include/boost/mysql/impl/field.hpp was added
  /usr/include/boost/mysql/impl/field_kind.ipp was added
  /usr/include/boost/mysql/impl/field_view.hpp was added
  /usr/include/boost/mysql/impl/metadata.hpp was added
  /usr/include/boost/mysql/impl/results.hpp was added
  /usr/include/boost/mysql/impl/rows.hpp was added
  /usr/include/boost/mysql/impl/rows_view.hpp was added
  /usr/include/boost/mysql/impl/row_view.hpp was added
  /usr/include/boost/mysql/impl/statement.hpp was added
  /usr/include/boost/mysql/mariadb_collations.hpp was added
  /usr/include/boost/mysql/mariadb_server_errc.hpp was added
  /usr/include/boost/mysql/metadata_collection_view.hpp was added
  /usr/include/boost/mysql/metadata.hpp was added
  /usr/include/boost/mysql/metadata_mode.hpp was added
  /usr/include/boost/mysql/mysql_collations.hpp was added
  /usr/include/boost/mysql/mysql_server_errc.hpp was added
  /usr/include/boost/mysql/results.hpp was added
  /usr/include/boost/mysql/row.hpp was added
  /usr/include/boost/mysql/rows.hpp was added
  /usr/include/boost/mysql/rows_view.hpp was added
  /usr/include/boost/mysql/row_view.hpp was added
  /usr/include/boost/mysql/ssl_mode.hpp was added
  /usr/include/boost/mysql/statement.hpp was added
  /usr/include/boost/mysql/string_view.hpp was added
  /usr/include/boost/mysql/tcp.hpp was added
  /usr/include/boost/mysql/tcp_ssl.hpp was added
  /usr/include/boost/mysql/throw_on_error.hpp was added
  /usr/include/boost/mysql/time.hpp was added
  /usr/include/boost/mysql/unix.hpp was added
  /usr/include/boost/mysql/unix_ssl.hpp was added
  /usr/include/boost/nowide/quoted.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code was added
  /usr/include/boost/outcome/experimental/status-code/status-code/boost_error_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/com_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/config.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail/nt_code_to_generic_code.ipp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail/nt_code_to_win32_code.ipp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/detail/win32_code_to_generic_code.ipp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/errored_status_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/error.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/generic_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/getaddrinfo_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/http_status_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/iostream_support.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/nt_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/posix_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/quick_status_code_from_enum.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/result.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code_domain.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_code_ptr.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/status_error.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/std_error_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/system_code_from_exception.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/system_code.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/system_error2.hpp was added
  /usr/include/boost/outcome/experimental/status-code/status-code/win32_code.hpp was added
  /usr/include/boost/pfr/config.hpp was added
  /usr/include/boost/pfr/detail/possible_reflectable.hpp was added
  /usr/include/boost/pfr/traits_fwd.hpp was added
  /usr/include/boost/pfr/traits.hpp was added
  /usr/include/boost/process/v2/ext was added
  /usr/include/boost/process/v2/ext/cmd.hpp was added
  /usr/include/boost/process/v2/ext/cwd.hpp was added
  /usr/include/boost/process/v2/ext/detail was added
  /usr/include/boost/process/v2/ext/detail/impl was added
  /usr/include/boost/process/v2/ext/detail/impl/proc_info.ipp was added
  /usr/include/boost/process/v2/ext/detail/proc_info.hpp was added
  /usr/include/boost/process/v2/ext/env.hpp was added
  /usr/include/boost/process/v2/ext/exe.hpp was added
  /usr/include/boost/process/v2/ext.hpp was added
  /usr/include/boost/process/v2/ext/impl was added
  /usr/include/boost/process/v2/ext/impl/cmd.ipp was added
  /usr/include/boost/process/v2/ext/impl/cwd.ipp was added
  /usr/include/boost/process/v2/ext/impl/env.ipp was added
  /usr/include/boost/process/v2/ext/impl/exe.ipp was added
  /usr/include/boost/ratio/detail/requires_cxx11.hpp was added
  /usr/include/boost/smart_ptr/detail/requires_cxx11.hpp was added
  /usr/include/boost/system/detail/mutex.hpp was added
  /usr/include/boost/system/detail/requires_cxx11.hpp was added
  /usr/include/boost/typeof/detail was added
  /usr/include/boost/typeof/detail/requires_cxx11.hpp was added
  /usr/include/boost/type_traits/detail/is_swappable_cxx_11.hpp was added
  /usr/include/boost/type_traits/is_swappable.hpp was added
  /usr/include/boost/unordered/detail/foa was added
  /usr/include/boost/unordered/detail/foa/element_type.hpp was added
  /usr/include/boost/unordered/detail/foa/node_handle.hpp was added
  /usr/include/boost/unordered/detail/mulx.hpp was added
  /usr/include/boost/unordered/detail/narrow_cast.hpp was added
  /usr/include/boost/unordered/detail/requires_cxx11.hpp was added
  /usr/include/boost/unordered/unordered_node_map_fwd.hpp was added
  /usr/include/boost/unordered/unordered_node_map.hpp was added
  /usr/include/boost/unordered/unordered_node_set_fwd.hpp was added
  /usr/include/boost/unordered/unordered_node_set.hpp was added
  /usr/include/boost/url/detail/format_args.hpp was added
  /usr/include/boost/url/detail/impl/format_args.hpp was added
  /usr/include/boost/url/detail/impl/format_args.ipp was added
  /usr/include/boost/url/detail/impl/pattern.ipp was added
  /usr/include/boost/url/detail/impl/pct_format.ipp was added
  /usr/include/boost/url/detail/impl/replacement_field_rule.ipp was added
  /usr/include/boost/url/detail/pattern.hpp was added
  /usr/include/boost/url/detail/pct_format.hpp was added
  /usr/include/boost/url/detail/replacement_field_rule.hpp was added
  /usr/include/boost/url/detail/string_view.hpp was added
  /usr/include/boost/url/detail/vformat.hpp was added
  /usr/include/boost/url/format.hpp was added
  /usr/include/boost/asio/impl/defer.hpp was removed
  /usr/include/boost/asio/impl/dispatch.hpp was removed
  /usr/include/boost/asio/impl/post.hpp was removed
  /usr/include/boost/container/detail/hash_table.hpp was removed
  /usr/include/boost/container_hash/detail/hash_tuple.hpp was removed
  /usr/include/boost/histogram/detail/span.hpp was removed
  /usr/include/boost/interprocess/detail/intersegment_ptr.hpp was removed
  /usr/include/boost/interprocess/detail/managed_multi_shared_memory.hpp was removed
  /usr/include/boost/json/detail/align.hpp was removed
  /usr/include/boost/json/detail/hash_combine.hpp was removed
  /usr/include/boost/log/detail/snprintf.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/boost_error_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/com_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/config.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/detail was removed
  /usr/include/boost/outcome/experimental/status-code/detail/nt_code_to_generic_code.ipp was removed
  /usr/include/boost/outcome/experimental/status-code/detail/nt_code_to_win32_code.ipp was removed
  /usr/include/boost/outcome/experimental/status-code/detail/win32_code_to_generic_code.ipp was removed
  /usr/include/boost/outcome/experimental/status-code/errored_status_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/error.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/generic_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/getaddrinfo_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/http_status_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/iostream_support.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/nt_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/posix_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/quick_status_code_from_enum.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/result.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_code_domain.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_code_ptr.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/status_error.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/std_error_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/system_code_from_exception.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/system_code.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/system_error2.hpp was removed
  /usr/include/boost/outcome/experimental/status-code/win32_code.hpp was removed
  /usr/include/boost/sort/heap_sort was removed
  /usr/include/boost/sort/heap_sort/heap_sort.hpp was removed
  /usr/include/boost/url/detail/empty_value.hpp was removed

--===============2658719590074667797==--

