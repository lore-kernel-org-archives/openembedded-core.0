Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169A7C54EFD
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.11735.1650052689721790416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=wQwXLdOX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101802ecdecef-48e5e982-4372-41f6-b038-fb6441f56186-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5ffzccxPiDTREsLJEZImOy4Zk2kfZwj1cY9s/VZ3aTs=;
	b=wQwXLdOXe3kuAh3aRB7pPiPNJr6buyJWOWUi3nIA1xSHEzC8aLDcG3qKuao8NNFc
	whqXsqFWdlpA7PPKGHB2ijfPHJg76MrX+k5EVK83uyPgz0EP8VS3CtEVXyOOKKQloRG
	3/91ZmuSAfwbCm3P4VX6JmWZpU2VUFk1kgbYcmZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5ffzccxPiDTREsLJEZImOy4Zk2kfZwj1cY9s/VZ3aTs=;
	b=krTzMmcpyJEbQ67kxVNx5DCYExGg/MR8Rigueql1IY/DaZ+0gJrizU3PS2WFKGAB
	qoME5vqliZQ7LyJs3occXX6p5FknKDW7/CbmzVDMCEbQ/5Xfag83t4Hls8CXFNcEPvg
	0I+Z5rGa2W57PcBqAHeZY5rO904WQSxhVGlilheE=
Content-Type: multipart/mixed; boundary="===============4130591098143401625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.79.0 SUCCEEDED
Message-ID: 
 <010101802ecdecef-48e5e982-4372-41f6-b038-fb6441f56186-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:09 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164512

--===============4130591098143401625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.79.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-upgrade-1.78.0-1.79.0.patch
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
--===============4130591098143401625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.78.0", added "/usr/lib/libboost_atomic.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.78.0 to libboost-atomic1.79.0
packages/core2-32-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.78.0", added "/usr/lib/libboost_chrono.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.78.0 to libboost-chrono1.79.0
packages/core2-32-poky-linux/boost/boost-chrono: PKGSIZE changed from 38328 to 42424 (+11%)
packages/core2-32-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.78.0", added "/usr/lib/libboost_container.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-container: PKG changed from libboost-container1.78.0 to libboost-container1.79.0
packages/core2-32-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.78.0", added "/usr/lib/libboost_context.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-context: PKG changed from libboost-context1.78.0 to libboost-context1.79.0
packages/core2-32-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.78.0", added "/usr/lib/libboost_contract.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.78.0 to libboost-contract1.79.0
packages/core2-32-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.78.0", added "/usr/lib/libboost_coroutine.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.78.0 to libboost-coroutine1.79.0
packages/core2-32-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.78.0", added "/usr/lib/libboost_date_time.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.78.0 to libboost-date-time1.79.0
packages/core2-32-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_fiber-1.78.0 -> /usr/lib/cmake/boost_fiber-1.79.0, directory renamed /usr/lib/cmake/boost_wserialization-1.78.0 -> /usr/lib/cmake/boost_wserialization-1.79.0, directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.78.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.79.0, directory renamed /usr/lib/cmake/boost_iostreams-1.78.0 -> /usr/lib/cmake/boost_iostreams-1.79.0, directory renamed /usr/lib/cmake/boost_json-1.78.0 -> /usr/lib/cmake/boost_json-1.79.0, directory renamed /usr/lib/cmake/boost_container-1.78.0 -> /usr/lib/cmake/boost_container-1.79.0, directory renamed /usr/lib/cmake/boost_contract-1.78.0 -> /usr/lib/cmake/boost_contract-1.79.0, directory renamed /usr/lib/cmake/boost_python-1.78.0 -> /usr/lib/cmake/boost_python-1.79.0, directory renamed /usr/lib/cmake/boost_wave-1.78.0 -> /usr/lib/cmake/boost_wave-1.79.0, directory renamed /usr/lib/cmake/boost_log_setup-1.78.0 -> /usr/lib/cmak
 e/boost_log_setup-1.79.0, directory renamed /usr/lib/cmake/boost_date_time-1.78.0 -> /usr/lib/cmake/boost_date_time-1.79.0, directory renamed /usr/lib/cmake/boost_context-1.78.0 -> /usr/lib/cmake/boost_context-1.79.0, directory renamed /usr/lib/cmake/boost_exception-1.78.0 -> /usr/lib/cmake/boost_exception-1.79.0, directory renamed /usr/lib/cmake/boost_locale-1.78.0 -> /usr/lib/cmake/boost_locale-1.79.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.78.0 -> /usr/lib/cmake/boost_math_tr1f-1.79.0, directory renamed /usr/lib/cmake/boost_atomic-1.78.0 -> /usr/lib/cmake/boost_atomic-1.79.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.78.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.79.0, directory renamed /usr/lib/cmake/boost_headers-1.78.0 -> /usr/lib/cmake/boost_headers-1.79.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.78.0 -> /usr/lib/cmake/boost_unit_test_framework-1.79.0, directory renamed /usr/lib/cmake/boost_math_c99f-1.78.0 -> /usr/lib/cmake
 /boost_math_c99f-1.79.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.78.0 -> /usr/lib/cmake/boost_math_tr1l-1.79.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.78.0 -> /usr/lib/cmake/boost_math_tr1-1.79.0, directory renamed /usr/lib/cmake/boost_chrono-1.78.0 -> /usr/lib/cmake/boost_chrono-1.79.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.78.0 -> /usr/lib/cmake/boost_math_c99l-1.79.0, directory renamed /usr/lib/cmake/boost_graph-1.78.0 -> /usr/lib/cmake/boost_graph-1.79.0, directory renamed /usr/lib/cmake/boost_system-1.78.0 -> /usr/lib/cmake/boost_system-1.79.0, directory renamed /usr/lib/cmake/boost_random-1.78.0 -> /usr/lib/cmake/boost_random-1.79.0, directory renamed /usr/lib/cmake/boost_regex-1.78.0 -> /usr/lib/cmake/boost_regex-1.79.0, directory renamed /usr/lib/cmake/boost_program_options-1.78.0 -> /usr/lib/cmake/boost_program_options-1.79.0, directory renamed /usr/lib/cmake/boost_thread-1.78.0 -> /usr/lib/cmake/boost_thread-1.79.0, directory renamed /usr
 /lib/cmake/boost_log-1.78.0 -> /usr/lib/cmake/boost_log-1.79.0, directory renamed /usr/lib/cmake/boost_timer-1.78.0 -> /usr/lib/cmake/boost_timer-1.79.0, directory renamed /usr/lib/cmake/boost_serialization-1.78.0 -> /usr/lib/cmake/boost_serialization-1.79.0, directory renamed /usr/lib/cmake/boost_math_c99-1.78.0 -> /usr/lib/cmake/boost_math_c99-1.79.0, directory renamed /usr/lib/cmake/Boost-1.78.0 -> /usr/lib/cmake/Boost-1.79.0, directory renamed /usr/lib/cmake/boost_filesystem-1.78.0 -> /usr/lib/cmake/boost_filesystem-1.79.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.78.0 -> /usr/lib/cmake/boost_type_erasure-1.79.0, directory renamed /usr/lib/cmake/boost_coroutine-1.78.0 -> /usr/lib/cmake/boost_coroutine-1.79.0, removed "/usr/include/boost/leaf/detail/config.hpp /usr/lib/cmake/BoostDetectToolset-1.78.0.cmake /usr/include/boost/geometry/algorithms/detail/check_iterator_range.hpp /usr/include/boost/json/detail/index_sequence.hpp /usr/include/boost/asio/detail/reactor_fwd
 .hpp /usr/include/boost/math/tools/lexical_cast.hpp", added "/usr/include/boost/geometry/strategy/cartesian/envelope_boxes.hpp /usr/include/boost/geometry/strategy/spherical/envelope_boxes.hpp /usr/include/boost/math/ccmath/fmin.hpp /usr/lib/cmake/BoostDetectToolset-1.79.0.cmake /usr/include/boost/leaf/to_variant.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/implementation.hpp /usr/include/boost/functional/identity.hpp /usr/include/boost/multiprecision/traits/is_convertible_arithmetic.hpp /usr/include/boost/asio/bind_allocator.hpp /usr/include/boost/geometry/strategy/cartesian/envelope_range.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/interface.hpp /usr/include/boost/math/special_functions/logsumexp.hpp /usr/include/boost/math/ccmath/fdim.hpp /usr/include/boost/leaf/config/tls.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/linear_to_linear.hpp /usr/lib/libboost_fiber.so /usr/include/boost/geometry/strategies/cartesian/closest
 _points_pt_seg.hpp /usr/include/boost/multiprecision/detail/float128_functions.hpp /usr/include/boost/asio/recycling_allocator.hpp /usr/include/boost/container/detail/is_pair.hpp /usr/include/boost/leaf/config/tls_globals.hpp /usr/include/boost/io/nullstream.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/multipoint_to_geometry.hpp /usr/include/boost/math/ccmath/isless.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/linear_or_areal_to_areal.hpp /usr/include/boost/leaf/config.hpp /usr/include/boost/core/verbose_terminate_handler.hpp /usr/include/boost/geometry/strategy/spherical/envelope_range.hpp /usr/include/boost/leaf/config/tls_array.hpp /usr/include/boost/leaf/config/tls_freertos.hpp /usr/include/boost/math/special_functions/logaddexp.hpp /usr/include/boost/multiprecision/detail/uniform_int_distribution.hpp /usr/include/boost/move/detail/force_ptr.hpp /usr/include/boost/math/tools/color_maps.hpp /usr/include/boost/geometry/algorithms/closest_poi
 nts.hpp /usr/include/boost/geometry/strategies/closest_points/services.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/range_to_geometry_rtree.hpp /usr/include/boost/multiprecision/detail/no_exceptions_support.hpp /usr/include/boost/geometry/algorithms/dispatch/closest_points.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/segment_to_segment.hpp /usr/include/boost/math/tools/concepts.hpp /usr/include/boost/math/ccmath/isgreaterequal.hpp /usr/include/boost/move/detail/addressof.hpp /usr/include/boost/geometry/strategies/closest_points/geographic.hpp /usr/include/boost/math/ccmath/isunordered.hpp /usr/include/boost/math/tools/quartic_roots.hpp /usr/include/boost/geometry/strategies/closest_points/cartesian.hpp /usr/include/boost/math/ccmath/fmax.hpp /usr/lib/libboost_fiber-mt.so /usr/include/boost/math/ccmath/hypot.hpp /usr/include/boost/geometry/strategies/closest_points/spherical.hpp /usr/include/boost/any/unique_any.hpp /usr/include/boost/math/ccma
 th/islessequal.hpp /usr/include/boost/core/allocator_traits.hpp /usr/include/boost/geometry/strategies/geographic/closest_points_pt_seg.hpp /usr/include/boost/log/utility/manipulators/invoke.hpp /usr/include/boost/geometry/strategies/spherical/closest_points_pt_seg.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/point_to_geometry.hpp /usr/include/boost/multiprecision/detail/fpclassify.hpp /usr/include/boost/geometry/strategy/geographic/envelope_range.hpp /usr/include/boost/qvm/is_scalar.hpp /usr/include/boost/leaf/config/tls_cpp11.hpp /usr/include/boost/multiprecision/detail/functions/trunc.hpp /usr/include/boost/json/impl/pointer.ipp /usr/include/boost/system/detail/system_category_message.hpp /usr/include/boost/math/ccmath/isgreater.hpp /usr/include/boost/predef/architecture/loongarch.h /usr/include/boost/math/ccmath/detail/swap.hpp /usr/include/boost/multiprecision/detail/empty_value.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/utilities.hpp"
packages/core2-32-poky-linux/boost/boost-dev: RDEPENDS: added "boost-fiber"
packages/core2-32-poky-linux/boost/boost-dev: RRECOMMENDS: added "boost-fiber-dev"
packages/core2-32-poky-linux/boost/boost-fiber: PKG changed from boost-fiber [default] to libboost-fiber1.79.0
packages/core2-32-poky-linux/boost/boost-fiber: RPROVIDES: added "boost-fiber (['= 1.79.0'])"
packages/core2-32-poky-linux/boost/boost-fiber: FILELIST: added "/usr/lib/libboost_fiber.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-fiber: RDEPENDS: added "libstdc++ (['>= 11.2.0']) libgcc (['>= 11.2.0']) glibc (['>= 2.35']) boost-context (['>= 1.79.0'])"
packages/core2-32-poky-linux/boost/boost-fiber: PKGSIZE changed from 0 to 75216 (+100%)
packages/core2-32-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.78.0", added "/usr/lib/libboost_filesystem.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.78.0 to libboost-filesystem1.79.0
packages/core2-32-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.78.0", added "/usr/lib/libboost_graph.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.78.0 to libboost-graph1.79.0
packages/core2-32-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.78.0", added "/usr/lib/libboost_iostreams.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.78.0 to libboost-iostreams1.79.0
packages/core2-32-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.78.0", added "/usr/lib/libboost_json.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-json: PKG changed from libboost-json1.78.0 to libboost-json1.79.0
packages/core2-32-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.78.0", added "/usr/lib/libboost_locale.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.78.0 to libboost-locale1.79.0
packages/core2-32-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log.so.1.78.0 /usr/lib/libboost_log_setup.so.1.78.0", added "/usr/lib/libboost_log.so.1.79.0 /usr/lib/libboost_log_setup.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_tr1.so.1.78.0 /usr/lib/libboost_math_c99.so.1.78.0 /usr/lib/libboost_math_c99l.so.1.78.0 /usr/lib/libboost_math_c99f.so.1.78.0 /usr/lib/libboost_math_tr1f.so.1.78.0 /usr/lib/libboost_math_tr1l.so.1.78.0", added "/usr/lib/libboost_math_c99f.so.1.79.0 /usr/lib/libboost_math_tr1l.so.1.79.0 /usr/lib/libboost_math_c99l.so.1.79.0 /usr/lib/libboost_math_c99.so.1.79.0 /usr/lib/libboost_math_tr1f.so.1.79.0 /usr/lib/libboost_math_tr1.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.78.0", added "/usr/lib/libboost_program_options.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.78.0 to libboost-program-options1.79.0
packages/core2-32-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python310.so.1.78.0", added "/usr/lib/libboost_python310.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-python: PKG changed from libboost-python310-1.78.0 to libboost-python310-1.79.0
packages/core2-32-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.78.0", added "/usr/lib/libboost_random.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-random: PKG changed from libboost-random1.78.0 to libboost-random1.79.0
packages/core2-32-poky-linux/boost/boost-random: PKGSIZE changed from 30136 to 38328 (+27%)
packages/core2-32-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.78.0", added "/usr/lib/libboost_regex.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.78.0 to libboost-regex1.79.0
packages/core2-32-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_serialization.so.1.78.0 /usr/lib/libboost_wserialization.so.1.78.0", added "/usr/lib/libboost_wserialization.so.1.79.0 /usr/lib/libboost_serialization.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-staticdev: FILELIST: added "/usr/lib/libboost_fiber-mt.a /usr/lib/libboost_fiber.a"
packages/core2-32-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.78.0", added "/usr/lib/libboost_system.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-system: PKG changed from libboost-system1.78.0 to libboost-system1.79.0
packages/core2-32-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_prg_exec_monitor.so.1.78.0 /usr/lib/libboost_unit_test_framework.so.1.78.0", added "/usr/lib/libboost_unit_test_framework.so.1.79.0 /usr/lib/libboost_prg_exec_monitor.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.78.0", added "/usr/lib/libboost_thread.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.78.0 to libboost-thread1.79.0
packages/core2-32-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.78.0", added "/usr/lib/libboost_timer.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.78.0 to libboost-timer1.79.0
packages/core2-32-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.78.0", added "/usr/lib/libboost_type_erasure.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.78.0 to libboost-type-erasure1.79.0
packages/core2-32-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.78.0", added "/usr/lib/libboost_wave.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.78.0 to libboost-wave1.79.0
Changes to packages/core2-32-poky-linux/boost (sysroot):
  /usr/include/boost/geometry/algorithms/detail/buffer/buffer_box.hpp changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.78.0 to libboost_atomic.so.1.79.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.78.0 to libboost_chrono.so.1.79.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.78.0 to libboost_container.so.1.79.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.78.0 to libboost_context.so.1.79.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.78.0 to libboost_contract.so.1.79.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.78.0 to libboost_coroutine.so.1.79.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.78.0 to libboost_date_time.so.1.79.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.78.0 to libboost_filesystem.so.1.79.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.78.0 to libboost_graph.so.1.79.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.78.0 to libboost_iostreams.so.1.79.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.78.0 to libboost_json.so.1.79.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.78.0 to libboost_locale.so.1.79.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.78.0 to libboost_log_setup.so.1.79.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.78.0 to libboost_log.so.1.79.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.78.0 to libboost_math_c99f.so.1.79.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.78.0 to libboost_math_c99l.so.1.79.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.78.0 to libboost_math_c99.so.1.79.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.78.0 to libboost_math_tr1f.so.1.79.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.78.0 to libboost_math_tr1l.so.1.79.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.78.0 to libboost_math_tr1.so.1.79.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.78.0 to libboost_prg_exec_monitor.so.1.79.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.78.0 to libboost_program_options.so.1.79.0
  /usr/lib/libboost_python310.so changed symlink target from libboost_python310.so.1.78.0 to libboost_python310.so.1.79.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.78.0 to libboost_random.so.1.79.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.78.0 to libboost_regex.so.1.79.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.78.0 to libboost_serialization.so.1.79.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.78.0 to libboost_system.so.1.79.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.78.0 to libboost_thread.so.1.79.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.78.0 to libboost_timer.so.1.79.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.78.0 to libboost_type_erasure.so.1.79.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.78.0 to libboost_unit_test_framework.so.1.79.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.78.0 to libboost_wave.so.1.79.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.78.0 to libboost_wserialization.so.1.79.0
  /usr/lib/cmake/Boost-1.78.0 moved to /usr/lib/cmake/Boost-1.79.0
  /usr/lib/cmake/boost_atomic-1.78.0 moved to /usr/lib/cmake/boost_atomic-1.79.0
  /usr/lib/cmake/boost_chrono-1.78.0 moved to /usr/lib/cmake/boost_chrono-1.79.0
  /usr/lib/cmake/boost_container-1.78.0 moved to /usr/lib/cmake/boost_container-1.79.0
  /usr/lib/cmake/boost_context-1.78.0 moved to /usr/lib/cmake/boost_context-1.79.0
  /usr/lib/cmake/boost_contract-1.78.0 moved to /usr/lib/cmake/boost_contract-1.79.0
  /usr/lib/cmake/boost_coroutine-1.78.0 moved to /usr/lib/cmake/boost_coroutine-1.79.0
  /usr/lib/cmake/boost_date_time-1.78.0 moved to /usr/lib/cmake/boost_date_time-1.79.0
  /usr/lib/cmake/BoostDetectToolset-1.78.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.79.0.cmake
  /usr/lib/cmake/boost_exception-1.78.0 moved to /usr/lib/cmake/boost_exception-1.79.0
  /usr/lib/cmake/boost_fiber-1.78.0 moved to /usr/lib/cmake/boost_fiber-1.79.0
  /usr/lib/cmake/boost_filesystem-1.78.0 moved to /usr/lib/cmake/boost_filesystem-1.79.0
  /usr/lib/cmake/boost_graph-1.78.0 moved to /usr/lib/cmake/boost_graph-1.79.0
  /usr/lib/cmake/boost_headers-1.78.0 moved to /usr/lib/cmake/boost_headers-1.79.0
  /usr/lib/cmake/boost_iostreams-1.78.0 moved to /usr/lib/cmake/boost_iostreams-1.79.0
  /usr/lib/cmake/boost_json-1.78.0 moved to /usr/lib/cmake/boost_json-1.79.0
  /usr/lib/cmake/boost_locale-1.78.0 moved to /usr/lib/cmake/boost_locale-1.79.0
  /usr/lib/cmake/boost_log-1.78.0 moved to /usr/lib/cmake/boost_log-1.79.0
  /usr/lib/cmake/boost_log_setup-1.78.0 moved to /usr/lib/cmake/boost_log_setup-1.79.0
  /usr/lib/cmake/boost_math_c99-1.78.0 moved to /usr/lib/cmake/boost_math_c99-1.79.0
  /usr/lib/cmake/boost_math_c99f-1.78.0 moved to /usr/lib/cmake/boost_math_c99f-1.79.0
  /usr/lib/cmake/boost_math_c99l-1.78.0 moved to /usr/lib/cmake/boost_math_c99l-1.79.0
  /usr/lib/cmake/boost_math_tr1-1.78.0 moved to /usr/lib/cmake/boost_math_tr1-1.79.0
  /usr/lib/cmake/boost_math_tr1f-1.78.0 moved to /usr/lib/cmake/boost_math_tr1f-1.79.0
  /usr/lib/cmake/boost_math_tr1l-1.78.0 moved to /usr/lib/cmake/boost_math_tr1l-1.79.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.78.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.79.0
  /usr/lib/cmake/boost_program_options-1.78.0 moved to /usr/lib/cmake/boost_program_options-1.79.0
  /usr/lib/cmake/boost_python-1.78.0 moved to /usr/lib/cmake/boost_python-1.79.0
  /usr/lib/cmake/boost_random-1.78.0 moved to /usr/lib/cmake/boost_random-1.79.0
  /usr/lib/cmake/boost_regex-1.78.0 moved to /usr/lib/cmake/boost_regex-1.79.0
  /usr/lib/cmake/boost_serialization-1.78.0 moved to /usr/lib/cmake/boost_serialization-1.79.0
  /usr/lib/cmake/boost_system-1.78.0 moved to /usr/lib/cmake/boost_system-1.79.0
  /usr/lib/cmake/boost_test_exec_monitor-1.78.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.79.0
  /usr/lib/cmake/boost_thread-1.78.0 moved to /usr/lib/cmake/boost_thread-1.79.0
  /usr/lib/cmake/boost_timer-1.78.0 moved to /usr/lib/cmake/boost_timer-1.79.0
  /usr/lib/cmake/boost_type_erasure-1.78.0 moved to /usr/lib/cmake/boost_type_erasure-1.79.0
  /usr/lib/cmake/boost_unit_test_framework-1.78.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.79.0
  /usr/lib/cmake/boost_wave-1.78.0 moved to /usr/lib/cmake/boost_wave-1.79.0
  /usr/lib/cmake/boost_wserialization-1.78.0 moved to /usr/lib/cmake/boost_wserialization-1.79.0
  /usr/lib/libboost_atomic.so.1.78.0 moved to /usr/lib/libboost_atomic.so.1.79.0
  /usr/lib/libboost_chrono.so.1.78.0 moved to /usr/lib/libboost_chrono.so.1.79.0
  /usr/lib/libboost_container.so.1.78.0 moved to /usr/lib/libboost_container.so.1.79.0
  /usr/lib/libboost_context.so.1.78.0 moved to /usr/lib/libboost_context.so.1.79.0
  /usr/lib/libboost_contract.so.1.78.0 moved to /usr/lib/libboost_contract.so.1.79.0
  /usr/lib/libboost_coroutine.so.1.78.0 moved to /usr/lib/libboost_coroutine.so.1.79.0
  /usr/lib/libboost_date_time.so.1.78.0 moved to /usr/lib/libboost_date_time.so.1.79.0
  /usr/lib/libboost_filesystem.so.1.78.0 moved to /usr/lib/libboost_filesystem.so.1.79.0
  /usr/lib/libboost_graph.so.1.78.0 moved to /usr/lib/libboost_graph.so.1.79.0
  /usr/lib/libboost_iostreams.so.1.78.0 moved to /usr/lib/libboost_iostreams.so.1.79.0
  /usr/lib/libboost_json.so.1.78.0 moved to /usr/lib/libboost_json.so.1.79.0
  /usr/lib/libboost_locale.so.1.78.0 moved to /usr/lib/libboost_locale.so.1.79.0
  /usr/lib/libboost_log_setup.so.1.78.0 moved to /usr/lib/libboost_log_setup.so.1.79.0
  /usr/lib/libboost_log.so.1.78.0 moved to /usr/lib/libboost_log.so.1.79.0
  /usr/lib/libboost_math_c99f.so.1.78.0 moved to /usr/lib/libboost_math_c99f.so.1.79.0
  /usr/lib/libboost_math_c99l.so.1.78.0 moved to /usr/lib/libboost_math_c99l.so.1.79.0
  /usr/lib/libboost_math_c99.so.1.78.0 moved to /usr/lib/libboost_math_c99.so.1.79.0
  /usr/lib/libboost_math_tr1f.so.1.78.0 moved to /usr/lib/libboost_math_tr1f.so.1.79.0
  /usr/lib/libboost_math_tr1l.so.1.78.0 moved to /usr/lib/libboost_math_tr1l.so.1.79.0
  /usr/lib/libboost_math_tr1.so.1.78.0 moved to /usr/lib/libboost_math_tr1.so.1.79.0
  /usr/lib/libboost_prg_exec_monitor.so.1.78.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.79.0
  /usr/lib/libboost_program_options.so.1.78.0 moved to /usr/lib/libboost_program_options.so.1.79.0
  /usr/lib/libboost_python310.so.1.78.0 moved to /usr/lib/libboost_python310.so.1.79.0
  /usr/lib/libboost_random.so.1.78.0 moved to /usr/lib/libboost_random.so.1.79.0
  /usr/lib/libboost_regex.so.1.78.0 moved to /usr/lib/libboost_regex.so.1.79.0
  /usr/lib/libboost_serialization.so.1.78.0 moved to /usr/lib/libboost_serialization.so.1.79.0
  /usr/lib/libboost_system.so.1.78.0 moved to /usr/lib/libboost_system.so.1.79.0
  /usr/lib/libboost_thread.so.1.78.0 moved to /usr/lib/libboost_thread.so.1.79.0
  /usr/lib/libboost_timer.so.1.78.0 moved to /usr/lib/libboost_timer.so.1.79.0
  /usr/lib/libboost_type_erasure.so.1.78.0 moved to /usr/lib/libboost_type_erasure.so.1.79.0
  /usr/lib/libboost_unit_test_framework.so.1.78.0 moved to /usr/lib/libboost_unit_test_framework.so.1.79.0
  /usr/lib/libboost_wave.so.1.78.0 moved to /usr/lib/libboost_wave.so.1.79.0
  /usr/lib/libboost_wserialization.so.1.78.0 moved to /usr/lib/libboost_wserialization.so.1.79.0
  /usr/include/boost/any/unique_any.hpp was added
  /usr/include/boost/asio/bind_allocator.hpp was added
  /usr/include/boost/asio/recycling_allocator.hpp was added
  /usr/include/boost/container/detail/is_pair.hpp was added
  /usr/include/boost/core/allocator_traits.hpp was added
  /usr/include/boost/core/verbose_terminate_handler.hpp was added
  /usr/include/boost/functional/identity.hpp was added
  /usr/include/boost/geometry/algorithms/closest_points.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/implementation.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/interface.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/linear_or_areal_to_areal.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/linear_to_linear.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/multipoint_to_geometry.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/point_to_geometry.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/range_to_geometry_rtree.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/segment_to_segment.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/utilities.hpp was added
  /usr/include/boost/geometry/algorithms/dispatch/closest_points.hpp was added
  /usr/include/boost/geometry/strategies/cartesian/closest_points_pt_seg.hpp was added
  /usr/include/boost/geometry/strategies/closest_points was added
  /usr/include/boost/geometry/strategies/closest_points/cartesian.hpp was added
  /usr/include/boost/geometry/strategies/closest_points/geographic.hpp was added
  /usr/include/boost/geometry/strategies/closest_points/services.hpp was added
  /usr/include/boost/geometry/strategies/closest_points/spherical.hpp was added
  /usr/include/boost/geometry/strategies/geographic/closest_points_pt_seg.hpp was added
  /usr/include/boost/geometry/strategies/spherical/closest_points_pt_seg.hpp was added
  /usr/include/boost/geometry/strategy/cartesian/envelope_boxes.hpp was added
  /usr/include/boost/geometry/strategy/cartesian/envelope_range.hpp was added
  /usr/include/boost/geometry/strategy/geographic/envelope_range.hpp was added
  /usr/include/boost/geometry/strategy/spherical/envelope_boxes.hpp was added
  /usr/include/boost/geometry/strategy/spherical/envelope_range.hpp was added
  /usr/include/boost/io/nullstream.hpp was added
  /usr/include/boost/json/impl/pointer.ipp was added
  /usr/include/boost/leaf/config was added
  /usr/include/boost/leaf/config.hpp was added
  /usr/include/boost/leaf/config/tls_array.hpp was added
  /usr/include/boost/leaf/config/tls_cpp11.hpp was added
  /usr/include/boost/leaf/config/tls_freertos.hpp was added
  /usr/include/boost/leaf/config/tls_globals.hpp was added
  /usr/include/boost/leaf/config/tls.hpp was added
  /usr/include/boost/leaf/to_variant.hpp was added
  /usr/include/boost/log/utility/manipulators/invoke.hpp was added
  /usr/include/boost/math/ccmath/detail was added
  /usr/include/boost/math/ccmath/detail/swap.hpp was added
  /usr/include/boost/math/ccmath/fdim.hpp was added
  /usr/include/boost/math/ccmath/fmax.hpp was added
  /usr/include/boost/math/ccmath/fmin.hpp was added
  /usr/include/boost/math/ccmath/hypot.hpp was added
  /usr/include/boost/math/ccmath/isgreaterequal.hpp was added
  /usr/include/boost/math/ccmath/isgreater.hpp was added
  /usr/include/boost/math/ccmath/islessequal.hpp was added
  /usr/include/boost/math/ccmath/isless.hpp was added
  /usr/include/boost/math/ccmath/isunordered.hpp was added
  /usr/include/boost/math/special_functions/logaddexp.hpp was added
  /usr/include/boost/math/special_functions/logsumexp.hpp was added
  /usr/include/boost/math/tools/color_maps.hpp was added
  /usr/include/boost/math/tools/concepts.hpp was added
  /usr/include/boost/math/tools/quartic_roots.hpp was added
  /usr/include/boost/move/detail/addressof.hpp was added
  /usr/include/boost/move/detail/force_ptr.hpp was added
  /usr/include/boost/multiprecision/detail/empty_value.hpp was added
  /usr/include/boost/multiprecision/detail/float128_functions.hpp was added
  /usr/include/boost/multiprecision/detail/fpclassify.hpp was added
  /usr/include/boost/multiprecision/detail/functions/trunc.hpp was added
  /usr/include/boost/multiprecision/detail/no_exceptions_support.hpp was added
  /usr/include/boost/multiprecision/detail/uniform_int_distribution.hpp was added
  /usr/include/boost/multiprecision/traits/is_convertible_arithmetic.hpp was added
  /usr/include/boost/predef/architecture/loongarch.h was added
  /usr/include/boost/qvm/is_scalar.hpp was added
  /usr/include/boost/system/detail/system_category_message.hpp was added
  /usr/lib/libboost_fiber.a was added
  /usr/lib/libboost_fiber-mt.a was added
  /usr/lib/libboost_fiber-mt.so was added
  /usr/lib/libboost_fiber.so.1.79.0 was added
  /usr/lib/libboost_fiber.so was added
  /usr/include/boost/asio/detail/reactor_fwd.hpp was removed
  /usr/include/boost/geometry/algorithms/detail/check_iterator_range.hpp was removed
  /usr/include/boost/json/detail/index_sequence.hpp was removed
  /usr/include/boost/leaf/detail/config.hpp was removed
  /usr/include/boost/math/tools/lexical_cast.hpp was removed
packages/core2-32-poky-linux/boost/boost-fiber: pkg_postinst added:
  @@ -0,0 +1,5 @@
  +#!/bin/sh
  +set -e
  +if [ x"$D" = "x" ]; then
  +	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  +fi
  --

--===============4130591098143401625==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-boost-upgrade-1.78.0-1.79.0.patch"

From d73cce6ab5efd48f802467ca2f2da65cd19f930f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 18:57:41 +0000
Subject: [PATCH] boost: upgrade 1.78.0 -> 1.79.0

---
 .../{boost-1.78.0.inc => boost-1.79.0.inc}    |  2 +-
 ...on-32-bit-architectures-using-64-bit.patch | 36 -------------------
 ...7e01635306085488290ea83de541ec393f8b.patch | 30 ----------------
 .../{boost_1.78.0.bb => boost_1.79.0.bb}      |  2 --
 4 files changed, 1 insertion(+), 69 deletions(-)
 rename meta/recipes-support/boost/{boost-1.78.0.inc => boost-1.79.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
 delete mode 100644 meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
 rename meta/recipes-support/boost/{boost_1.78.0.bb => boost_1.79.0.bb} (67%)

diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipes-support/boost/boost-1.79.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.78.0.inc
rename to meta/recipes-support/boost/boost-1.79.0.inc
index 729a47b54f..f90c463931 100644
--- a/meta/recipes-support/boost/boost-1.78.0.inc
+++ b/meta/recipes-support/boost/boost-1.79.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
+SRC_URI[sha256sum] = "475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch b/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
deleted file mode 100644
index 20dc3ca54e..0000000000
--- a/meta/recipes-support/boost/boost/0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b15d8d0754bb545ba10d0cfba8bbfdfb22a62c38 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Feb 2022 22:03:14 -0800
-Subject: [PATCH] futex: fix build on 32-bit architectures using 64-bit time_t
-
-Fix the following build failure on 32-bit architectures using 64-bit
-time_t (e.g. riscv32):
-| ./boost/fiber/detail/futex.hpp:31:23: error: use of undeclared identifier 'SYS_futex'
-|     return ::syscall( SYS_futex, addr, op, x, nullptr, nullptr, 0);
-|                       ^
-| 1 error generated.
-
-Upstream-Status: Submitted [https://github.com/boostorg/fiber/pull/292]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- boost/fiber/detail/futex.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.hpp
-index e64bd5990..d0353e9e5 100644
---- a/boost/fiber/detail/futex.hpp
-+++ b/boost/fiber/detail/futex.hpp
-@@ -12,6 +12,10 @@
- 
- #include <boost/fiber/detail/config.hpp>
- 
-+#ifndef SYS_futex
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- #if BOOST_OS_LINUX
- extern "C" {
- #include <linux/futex.h>
--- 
-2.35.1
-
diff --git a/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
deleted file mode 100644
index 867ec03ba6..0000000000
--- a/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
-From: Leonardo Neumann <leonardo@neumann.dev.br>
-Date: Mon, 13 Dec 2021 01:07:20 -0300
-Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
-
-Boost 1.78.0 fails to build on musl-based systems because musl does
-not include sys/stat.h by default.
-
-Fixes #161 ("Boost compiler error")
-Upstream-Status: Submitted [https://github.com/boostorg/interprocess/pull/162]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- include/boost/interprocess/permissions.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
-index ab55411e..0b21a685 100644
---- a/boost/interprocess/permissions.hpp
-+++ b/boost/interprocess/permissions.hpp
-@@ -29,6 +29,10 @@
- 
- #include <boost/interprocess/detail/win32_api.hpp>
- 
-+#else
-+
-+#include <sys/stat.h>
-+
- #endif
- 
- #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.79.0.bb
similarity index 67%
rename from meta/recipes-support/boost/boost_1.78.0.bb
rename to meta/recipes-support/boost/boost_1.79.0.bb
index 58be9dcf12..dd5d6eadd6 100644
--- a/meta/recipes-support/boost/boost_1.78.0.bb
+++ b/meta/recipes-support/boost/boost_1.79.0.bb
@@ -5,6 +5,4 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
-           file://de657e01635306085488290ea83de541ec393f8b.patch \
-           file://0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch \
            "
-- 
2.27.0


--===============4130591098143401625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.78.0", added "/usr/lib/libboost_atomic.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-atomic: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-atomic: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.78.0 to libboost-atomic1.79.0
packages/core2-32-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.78.0", added "/usr/lib/libboost_chrono.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-chrono: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.78.0 to libboost-chrono1.79.0
packages/core2-32-poky-linux/boost/boost-chrono: PKGSIZE changed from 38328 to 42424 (+11%)
packages/core2-32-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.78.0", added "/usr/lib/libboost_container.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-container: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-container: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-container: PKG changed from libboost-container1.78.0 to libboost-container1.79.0
packages/core2-32-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.78.0", added "/usr/lib/libboost_context.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-context: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-context: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-context: PKG changed from libboost-context1.78.0 to libboost-context1.79.0
packages/core2-32-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.78.0", added "/usr/lib/libboost_contract.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-contract: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-contract: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.78.0 to libboost-contract1.79.0
packages/core2-32-poky-linux/boost/boost-contract: PKGSIZE changed from 107972 to 107956 (-0%)
packages/core2-32-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.78.0", added "/usr/lib/libboost_coroutine.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-coroutine: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.78.0 to libboost-coroutine1.79.0
packages/core2-32-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.78.0", added "/usr/lib/libboost_date_time.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-date-time: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.78.0 to libboost-date-time1.79.0
packages/core2-32-poky-linux/boost/boost-dbg: FILELIST: removed "/usr/lib/.debug/libboost_math_tr1f.so.1.78.0 /usr/lib/.debug/libboost_thread.so.1.78.0 /usr/lib/.debug/libboost_graph.so.1.78.0 /usr/lib/.debug/libboost_coroutine.so.1.78.0 /usr/lib/.debug/libboost_regex.so.1.78.0 /usr/lib/.debug/libboost_log_setup.so.1.78.0 /usr/lib/.debug/libboost_locale.so.1.78.0 /usr/lib/.debug/libboost_python310.so.1.78.0 /usr/lib/.debug/libboost_unit_test_framework.so.1.78.0 /usr/lib/.debug/libboost_date_time.so.1.78.0 /usr/lib/.debug/libboost_wave.so.1.78.0 /usr/lib/.debug/libboost_math_c99f.so.1.78.0 /usr/lib/.debug/libboost_program_options.so.1.78.0 /usr/lib/.debug/libboost_chrono.so.1.78.0 /usr/lib/.debug/libboost_json.so.1.78.0 /usr/lib/.debug/libboost_log.so.1.78.0 /usr/lib/.debug/libboost_atomic.so.1.78.0 /usr/lib/.debug/libboost_iostreams.so.1.78.0 /usr/lib/.debug/libboost_timer.so.1.78.0 /usr/lib/.debug/libboost_context.so.1.78.0 /usr/lib/.debug/libboost_math_tr1.so.1.78.0 /usr/lib/.debug
 /libboost_container.so.1.78.0 /usr/lib/.debug/libboost_math_c99.so.1.78.0 /usr/lib/.debug/libboost_type_erasure.so.1.78.0 /usr/lib/.debug/libboost_wserialization.so.1.78.0 /usr/lib/.debug/libboost_random.so.1.78.0 /usr/lib/.debug/libboost_math_c99l.so.1.78.0 /usr/lib/.debug/libboost_filesystem.so.1.78.0 /usr/lib/.debug/libboost_serialization.so.1.78.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.78.0 /usr/lib/.debug/libboost_math_tr1l.so.1.78.0 /usr/lib/.debug/libboost_contract.so.1.78.0 /usr/lib/.debug/libboost_system.so.1.78.0", added "/usr/lib/.debug/libboost_filesystem.so.1.79.0 /usr/lib/.debug/libboost_contract.so.1.79.0 /usr/lib/.debug/libboost_regex.so.1.79.0 /usr/lib/.debug/libboost_math_tr1f.so.1.79.0 /usr/lib/.debug/libboost_locale.so.1.79.0 /usr/lib/.debug/libboost_context.so.1.79.0 /usr/lib/.debug/libboost_log_setup.so.1.79.0 /usr/lib/.debug/libboost_coroutine.so.1.79.0 /usr/lib/.debug/libboost_math_tr1.so.1.79.0 /usr/lib/.debug/libboost_system.so.1.79.0 /usr/lib/.debu
 g/libboost_wserialization.so.1.79.0 /usr/lib/.debug/libboost_timer.so.1.79.0 /usr/lib/.debug/libboost_serialization.so.1.79.0 /usr/lib/.debug/libboost_log.so.1.79.0 /usr/lib/.debug/libboost_python310.so.1.79.0 /usr/lib/.debug/libboost_program_options.so.1.79.0 /usr/lib/.debug/libboost_wave.so.1.79.0 /usr/lib/.debug/libboost_random.so.1.79.0 /usr/lib/.debug/libboost_atomic.so.1.79.0 /usr/lib/.debug/libboost_fiber.so.1.79.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.79.0 /usr/lib/.debug/libboost_iostreams.so.1.79.0 /usr/lib/.debug/libboost_date_time.so.1.79.0 /usr/lib/.debug/libboost_json.so.1.79.0 /usr/lib/.debug/libboost_thread.so.1.79.0 /usr/lib/.debug/libboost_graph.so.1.79.0 /usr/lib/.debug/libboost_chrono.so.1.79.0 /usr/lib/.debug/libboost_math_tr1l.so.1.79.0 /usr/lib/.debug/libboost_type_erasure.so.1.79.0 /usr/lib/.debug/libboost_math_c99f.so.1.79.0 /usr/lib/.debug/libboost_math_c99.so.1.79.0 /usr/lib/.debug/libboost_math_c99l.so.1.79.0 /usr/lib/.debug/libboost_unit_test_fr
 amework.so.1.79.0 /usr/lib/.debug/libboost_container.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-dbg: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-dbg: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-dbg: PKGSIZE changed from 134394856 to 137065572 (+2%)
packages/core2-32-poky-linux/boost/boost-dev: RDEPENDS: added "boost-fiber"
packages/core2-32-poky-linux/boost/boost-dev: RRECOMMENDS: added "boost-fiber-dev"
packages/core2-32-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_contract-1.78.0 -> /usr/lib/cmake/boost_contract-1.79.0, directory renamed /usr/lib/cmake/boost_fiber-1.78.0 -> /usr/lib/cmake/boost_fiber-1.79.0, directory renamed /usr/lib/cmake/boost_filesystem-1.78.0 -> /usr/lib/cmake/boost_filesystem-1.79.0, directory renamed /usr/lib/cmake/boost_graph-1.78.0 -> /usr/lib/cmake/boost_graph-1.79.0, directory renamed /usr/lib/cmake/Boost-1.78.0 -> /usr/lib/cmake/Boost-1.79.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.78.0 -> /usr/lib/cmake/boost_math_tr1-1.79.0, directory renamed /usr/lib/cmake/boost_json-1.78.0 -> /usr/lib/cmake/boost_json-1.79.0, directory renamed /usr/lib/cmake/boost_log_setup-1.78.0 -> /usr/lib/cmake/boost_log_setup-1.79.0, directory renamed /usr/lib/cmake/boost_iostreams-1.78.0 -> /usr/lib/cmake/boost_iostreams-1.79.0, directory renamed /usr/lib/cmake/boost_program_options-1.78.0 -> /usr/lib/cmake/boost_program_options-1.79.0
 , directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.78.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.79.0, directory renamed /usr/lib/cmake/boost_chrono-1.78.0 -> /usr/lib/cmake/boost_chrono-1.79.0, directory renamed /usr/lib/cmake/boost_coroutine-1.78.0 -> /usr/lib/cmake/boost_coroutine-1.79.0, directory renamed /usr/lib/cmake/boost_headers-1.78.0 -> /usr/lib/cmake/boost_headers-1.79.0, directory renamed /usr/lib/cmake/boost_serialization-1.78.0 -> /usr/lib/cmake/boost_serialization-1.79.0, directory renamed /usr/lib/cmake/boost_exception-1.78.0 -> /usr/lib/cmake/boost_exception-1.79.0, directory renamed /usr/lib/cmake/boost_python-1.78.0 -> /usr/lib/cmake/boost_python-1.79.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.78.0 -> /usr/lib/cmake/boost_unit_test_framework-1.79.0, directory renamed /usr/lib/cmake/boost_system-1.78.0 -> /usr/lib/cmake/boost_system-1.79.0, directory renamed /usr/lib/cmake/boost_locale-1.78.0 -> /usr/lib/cmake/boost_locale-1.79.0, d
 irectory renamed /usr/lib/cmake/boost_math_tr1f-1.78.0 -> /usr/lib/cmake/boost_math_tr1f-1.79.0, directory renamed /usr/lib/cmake/boost_math_c99-1.78.0 -> /usr/lib/cmake/boost_math_c99-1.79.0, directory renamed /usr/lib/cmake/boost_context-1.78.0 -> /usr/lib/cmake/boost_context-1.79.0, directory renamed /usr/lib/cmake/boost_atomic-1.78.0 -> /usr/lib/cmake/boost_atomic-1.79.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.78.0 -> /usr/lib/cmake/boost_math_tr1l-1.79.0, directory renamed /usr/lib/cmake/boost_thread-1.78.0 -> /usr/lib/cmake/boost_thread-1.79.0, directory renamed /usr/lib/cmake/boost_wserialization-1.78.0 -> /usr/lib/cmake/boost_wserialization-1.79.0, directory renamed /usr/lib/cmake/boost_timer-1.78.0 -> /usr/lib/cmake/boost_timer-1.79.0, directory renamed /usr/lib/cmake/boost_container-1.78.0 -> /usr/lib/cmake/boost_container-1.79.0, directory renamed /usr/lib/cmake/boost_date_time-1.78.0 -> /usr/lib/cmake/boost_date_time-1.79.0, directory renamed /usr/lib/cmake/b
 oost_math_c99f-1.78.0 -> /usr/lib/cmake/boost_math_c99f-1.79.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.78.0 -> /usr/lib/cmake/boost_math_c99l-1.79.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.78.0 -> /usr/lib/cmake/boost_type_erasure-1.79.0, directory renamed /usr/lib/cmake/boost_wave-1.78.0 -> /usr/lib/cmake/boost_wave-1.79.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.78.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.79.0, directory renamed /usr/lib/cmake/boost_log-1.78.0 -> /usr/lib/cmake/boost_log-1.79.0, directory renamed /usr/lib/cmake/boost_regex-1.78.0 -> /usr/lib/cmake/boost_regex-1.79.0, directory renamed /usr/lib/cmake/boost_random-1.78.0 -> /usr/lib/cmake/boost_random-1.79.0, removed "/usr/include/boost/math/tools/lexical_cast.hpp /usr/lib/cmake/BoostDetectToolset-1.78.0.cmake /usr/include/boost/json/detail/index_sequence.hpp /usr/include/boost/leaf/detail/config.hpp /usr/include/boost/geometry/algorithms/detail/check_iterator_range
 .hpp /usr/include/boost/asio/detail/reactor_fwd.hpp", added "/usr/include/boost/multiprecision/detail/float128_functions.hpp /usr/include/boost/qvm/is_scalar.hpp /usr/include/boost/math/ccmath/fmin.hpp /usr/lib/libboost_fiber-mt.so /usr/include/boost/core/verbose_terminate_handler.hpp /usr/include/boost/json/impl/pointer.ipp /usr/include/boost/container/detail/is_pair.hpp /usr/include/boost/geometry/strategy/spherical/envelope_range.hpp /usr/include/boost/math/ccmath/isgreaterequal.hpp /usr/include/boost/geometry/strategies/cartesian/closest_points_pt_seg.hpp /usr/include/boost/leaf/config/tls.hpp /usr/include/boost/multiprecision/traits/is_convertible_arithmetic.hpp /usr/include/boost/leaf/config/tls_globals.hpp /usr/include/boost/move/detail/force_ptr.hpp /usr/include/boost/multiprecision/detail/functions/trunc.hpp /usr/include/boost/io/nullstream.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/linear_to_linear.hpp /usr/include/boost/geometry/algorithms/detail/clo
 sest_points/segment_to_segment.hpp /usr/include/boost/multiprecision/detail/fpclassify.hpp /usr/include/boost/core/allocator_traits.hpp /usr/include/boost/math/special_functions/logaddexp.hpp /usr/include/boost/multiprecision/detail/uniform_int_distribution.hpp /usr/include/boost/geometry/strategies/closest_points/geographic.hpp /usr/include/boost/geometry/strategies/closest_points/services.hpp /usr/include/boost/math/ccmath/fdim.hpp /usr/include/boost/geometry/strategy/cartesian/envelope_boxes.hpp /usr/include/boost/geometry/strategy/geographic/envelope_range.hpp /usr/include/boost/geometry/strategies/spherical/closest_points_pt_seg.hpp /usr/include/boost/multiprecision/detail/no_exceptions_support.hpp /usr/include/boost/math/special_functions/logsumexp.hpp /usr/include/boost/geometry/strategy/cartesian/envelope_range.hpp /usr/include/boost/geometry/algorithms/closest_points.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/implementation.hpp /usr/include/boost/math/
 ccmath/hypot.hpp /usr/include/boost/math/ccmath/isunordered.hpp /usr/include/boost/geometry/strategy/spherical/envelope_boxes.hpp /usr/lib/libboost_fiber.so /usr/include/boost/asio/bind_allocator.hpp /usr/include/boost/multiprecision/detail/empty_value.hpp /usr/include/boost/math/tools/concepts.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/interface.hpp /usr/include/boost/predef/architecture/loongarch.h /usr/include/boost/geometry/algorithms/detail/closest_points/range_to_geometry_rtree.hpp /usr/include/boost/math/ccmath/isgreater.hpp /usr/lib/cmake/BoostDetectToolset-1.79.0.cmake /usr/include/boost/leaf/to_variant.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/linear_or_areal_to_areal.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/multipoint_to_geometry.hpp /usr/include/boost/geometry/strategies/closest_points/spherical.hpp /usr/include/boost/geometry/strategies/geographic/closest_points_pt_seg.hpp /usr/include/boost/geometry/s
 trategies/closest_points/cartesian.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/point_to_geometry.hpp /usr/include/boost/math/ccmath/detail/swap.hpp /usr/include/boost/any/unique_any.hpp /usr/include/boost/math/tools/quartic_roots.hpp /usr/include/boost/asio/recycling_allocator.hpp /usr/include/boost/geometry/algorithms/dispatch/closest_points.hpp /usr/include/boost/leaf/config.hpp /usr/include/boost/math/tools/color_maps.hpp /usr/include/boost/geometry/algorithms/detail/closest_points/utilities.hpp /usr/include/boost/math/ccmath/islessequal.hpp /usr/include/boost/leaf/config/tls_cpp11.hpp /usr/include/boost/leaf/config/tls_array.hpp /usr/include/boost/functional/identity.hpp /usr/include/boost/math/ccmath/fmax.hpp /usr/include/boost/leaf/config/tls_freertos.hpp /usr/include/boost/log/utility/manipulators/invoke.hpp /usr/include/boost/math/ccmath/isless.hpp /usr/include/boost/system/detail/system_category_message.hpp /usr/include/boost/move/detail/addressof.hpp"
packages/core2-32-poky-linux/boost/boost-dev: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-dev: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-dev: PKGSIZE changed from 143641746 to 144214198 (+0%)
packages/core2-32-poky-linux/boost/boost-exception: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-exception: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-fiber: RDEPENDS: added "glibc (['>= 2.35']) boost-context (['>= 1.79.0']) libstdc++ (['>= 11.2.0']) libgcc (['>= 11.2.0'])"
packages/core2-32-poky-linux/boost/boost-fiber: RPROVIDES: added "boost-fiber (['= 1.79.0'])"
packages/core2-32-poky-linux/boost/boost-fiber: FILELIST: added "/usr/lib/libboost_fiber.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-fiber: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-fiber: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-fiber: PKG changed from boost-fiber [default] to libboost-fiber1.79.0
packages/core2-32-poky-linux/boost/boost-fiber: PKGSIZE changed from 0 to 75216 (+100%)
packages/core2-32-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.78.0", added "/usr/lib/libboost_filesystem.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-filesystem: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.78.0 to libboost-filesystem1.79.0
packages/core2-32-poky-linux/boost/boost-filesystem: PKGSIZE changed from 144856 to 148968 (+3%)
packages/core2-32-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.78.0", added "/usr/lib/libboost_graph.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-graph: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-graph: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.78.0 to libboost-graph1.79.0
packages/core2-32-poky-linux/boost/boost-headers: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-headers: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.78.0", added "/usr/lib/libboost_iostreams.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-iostreams: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.78.0 to libboost-iostreams1.79.0
packages/core2-32-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.78.0", added "/usr/lib/libboost_json.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-json: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-json: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-json: PKG changed from libboost-json1.78.0 to libboost-json1.79.0
packages/core2-32-poky-linux/boost/boost-json: PKGSIZE changed from 275936 to 292304 (+6%)
packages/core2-32-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.78.0", added "/usr/lib/libboost_locale.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-locale: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-locale: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.78.0 to libboost-locale1.79.0
packages/core2-32-poky-linux/boost/boost-locale: PKGSIZE changed from 886480 to 890544 (+0%)
packages/core2-32-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log_setup.so.1.78.0 /usr/lib/libboost_log.so.1.78.0", added "/usr/lib/libboost_log_setup.so.1.79.0 /usr/lib/libboost_log.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-log: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-log: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-log: PKGSIZE changed from 1888176 to 1892272 (+0%)
packages/core2-32-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_tr1l.so.1.78.0 /usr/lib/libboost_math_c99.so.1.78.0 /usr/lib/libboost_math_tr1.so.1.78.0 /usr/lib/libboost_math_c99f.so.1.78.0 /usr/lib/libboost_math_c99l.so.1.78.0 /usr/lib/libboost_math_tr1f.so.1.78.0", added "/usr/lib/libboost_math_tr1l.so.1.79.0 /usr/lib/libboost_math_tr1f.so.1.79.0 /usr/lib/libboost_math_c99f.so.1.79.0 /usr/lib/libboost_math_c99.so.1.79.0 /usr/lib/libboost_math_tr1.so.1.79.0 /usr/lib/libboost_math_c99l.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-math: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-math: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-math: PKGSIZE changed from 1265948 to 1294620 (+2%)
packages/core2-32-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.78.0", added "/usr/lib/libboost_program_options.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-program-options: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.78.0 to libboost-program-options1.79.0
packages/core2-32-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python310.so.1.78.0", added "/usr/lib/libboost_python310.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-python: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-python: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-python: PKG changed from libboost-python310-1.78.0 to libboost-python310-1.79.0
packages/core2-32-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.78.0", added "/usr/lib/libboost_random.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-random: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-random: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-random: PKG changed from libboost-random1.78.0 to libboost-random1.79.0
packages/core2-32-poky-linux/boost/boost-random: PKGSIZE changed from 30136 to 38328 (+27%)
packages/core2-32-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.78.0", added "/usr/lib/libboost_regex.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-regex: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-regex: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.78.0 to libboost-regex1.79.0
packages/core2-32-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_serialization.so.1.78.0 /usr/lib/libboost_wserialization.so.1.78.0", added "/usr/lib/libboost_serialization.so.1.79.0 /usr/lib/libboost_wserialization.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-serialization: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-serialization: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-src: FILELIST: directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/range/algorithm -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/range/algorithm, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/wave/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/wave/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/pool/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/pool/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/non_terminal -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/non_terminal, director
 y renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/wave -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/wave, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mp11 -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mp11, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/utils/iterator -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/utils/iterator, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/filesystem/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/filesystem/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/python/src/converter -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/python/src/converter, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/locale -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/locale, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive/detail/static/transforms -> /usr/src/debug/boost/1.79
 .0-r0/boost_1_79_0/boost/xpressive/detail/static/transforms, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/utility/impl/chset -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/utility/impl/chset, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/karma/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/karma/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/numeric/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/numeric/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive/traits -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive/traits, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/expressi
 ons -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/expressions, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/iterator -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/iterator, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/locale/src/shared -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/locale/src/shared, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/container/vector -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/container/vector, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/detail/ryu -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/detail/ryu, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/thread/futures -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/thread/futures, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/container/list -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/c
 ontainer/list, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/align/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/align/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/karma -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/karma, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/chrono/detail/inlined/posix -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/chrono/detail/inlined/posix, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/function_types -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/function_types, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/random/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/random/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/execution -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/execution, directory renamed /usr/src/debug/boost/1.78.
 0-r0/boost_1_78_0/boost/asio/traits -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/traits, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/math/policies -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/math/policies, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/nonterminal -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/nonterminal, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/date_time/local_time -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/date_time/local_time, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/proto/detail -> /usr/src/debug/boost/1.
 79.0-r0/boost_1_79_0/boost/proto/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/type_traits -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/type_traits, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/exception/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/exception/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/python/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/python/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/algorithm/string/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/algorithm/string/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/math/constants -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/math/constants, directory renamed /usr/src/debug/b
 oost/1.78.0-r0/boost_1_78_0/boost/iostreams/filter -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/iostreams/filter, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/support -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/support, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/timer/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/timer/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/core -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/core, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/property_tree/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/property_tree/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container_hash/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container_hash/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/primitives -> /usr
 /src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/primitives, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive/detail/core/matcher -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive/detail/core/matcher, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/core/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/core/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/python/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/python/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/attribute -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/attribute, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system -> /usr/src/debug/boost/1.79.0-r0/b
 oost_1_79_0/boost/system, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/tuple/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/tuple/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/smart_ptr -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/smart_ptr, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/non_terminal/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/non_terminal/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/wave/cpplexer/re2clex -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/wave/cpplexer/re2clex, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/phoenix -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/phoenix, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/math/special_functions/detail -> /usr/src/debug/boost/1.79.0-
 r0/boost_1_79_0/boost/math/special_functions/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/chrono -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/chrono, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/archive/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/archive/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/ratio/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/ratio/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/contract/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/contract/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/utils/basic_cstring -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/utils/basic_cstring, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mpl/vector/aux_/preprocessed/typeof_based -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mpl/vector/aux_/preproc
 essed/typeof_based, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/serialization -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/serialization, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/core/detail/cpp03/preprocessed -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/core/detail/cpp03/preprocessed, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/proto/transform/detail/preprocessed -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/proto/transform/detail/preprocessed, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/python/src/object -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/python/src/object, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/pending -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/pending, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/utility -> /usr/src/debug/boost/1.79.0-r0/boost_1_7
 9_0/boost/spirit/home/classic/utility, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/algorithm/iteration -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/algorithm/iteration, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/detail/ryu/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/detail/ryu/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/utils/runtime/cla -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/utils/runtime/cla, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support/nonterminal -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support/nonterminal, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/primitives/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/primitives/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1
 _78_0/boost/archive -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/archive, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/numeric -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/numeric, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/proto/detail/preprocessed -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/proto/detail/preprocessed, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/wave/src/cpplexer/re2clex -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/wave/src/cpplexer/re2clex, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/algorithm/cxx11 -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/algorithm/cxx11, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/meta/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/meta/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boo
 st/locale/boundary -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/locale/boundary, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/python/converter -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/python/converter, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/action -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/action, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/tools/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/tools/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/math/src/tr1 -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/math/src/tr1, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mpl/list/aux_ -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mpl/list/aux_, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/wave/grammars -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boo
 st/wave/grammars, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/iterator -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/iterator, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/optional/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/optional/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/utility/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/utility/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/timer -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/timer, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mpl/aux_ -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mpl/aux_, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/algorithm/query -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/algorithm/query, directory renamed /usr/src/debug/boost/1.
 78.0-r0/boost_1_78_0/boost/fusion/support -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/support, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/iostreams/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/iostreams/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/thread/pthread -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/thread/pthread, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/dynamic -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/dynamic, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/output -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/output, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/log/src -> 
 /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/log/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/math/special_functions -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/math/special_functions, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive/detail/utility -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive/detail/utility, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/tools/old -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/tools/old, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/preprocessor/iteration/detail/limits -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/preprocessor/iteration/detail/limits, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/pmr -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/pmr, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/adapted/struct/detail -> /
 usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/adapted/struct/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/scanner -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/scanner, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/graph/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/graph/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/unordered -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/unordered, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/function_types/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/function_types/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/any -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/b
 oost/any, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/thread -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/thread, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/variant -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/variant, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/atomic/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/atomic/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/python -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/python, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/type_erasure -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/type_erasure, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio -> /usr/src/debug/boost/
 1.79.0-r0/boost_1_79_0/boost/asio, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/utility/type_dispatch -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/utility/type_dispatch, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/program_options -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/program_options, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/tree -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/tree, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/date_time/posix_time -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/date_time/posix_time, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/attributes -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/attributes, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/type_index -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/type_index, directory renamed /usr/src/debug
 /boost/1.78.0-r0/boost_1_78_0/boost/xpressive/detail/static -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive/detail/static, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/type_erasure/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/type_erasure/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/ratio -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/ratio, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/serialization/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/serialization/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/detail/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/detail/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mp11/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mp11/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/karma/numeric -> /usr/src/debug/b
 oost/1.79.0-r0/boost_1_79_0/boost/spirit/home/karma/numeric, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/tuple -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/tuple, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/utils -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/utils, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/graph -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/graph, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/atomic/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/atomic/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/dynamic/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/dynamic/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/wave/util -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/wave/util, directory renamed /usr/src/debug/boost/1.78.0-r0/boo
 st_1_78_0/libs/coroutine/src/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/coroutine/src/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/scope -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/scope/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/thread/csbl/memory -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/thread/csbl/memory, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/multi_index -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/multi_index, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/system/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/system/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/thread/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/thread/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/concept/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/bo
 ost/concept/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/container/set -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/container/set, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/optional -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/optional, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/archive/iterators -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/archive/iterators, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/tools -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/tools, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/contract/detail/inlined/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/contract/detail/inlined/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/support/preprocessed -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/support/preprocessed, directo
 ry renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/bind -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/bind, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/lexical_cast -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/lexical_cast, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/iostreams/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/iostreams/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/regex/v5 -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/regex/v5, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/archive/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/archive/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/operator -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/operator, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/core -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boos
 t/log/core, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/multi_index/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/multi_index/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/filesystem -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/filesystem, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/container/set/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/container/set/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/detail/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/detail/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/align -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/align, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/python/object -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/python/object, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/b
 oost/coroutine -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/coroutine, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/sinks -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/sinks, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/parameter -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/parameter, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/composite -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/composite, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/function -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/function, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/exception -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/exception, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/actor -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/c
 lassic/actor, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support/char_encoding -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support/char_encoding, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/directive -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/directive, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/utility/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/utility/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/wave/cpplexer -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/wave/cpplexer, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/ip/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/ip/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/proto/functional/fusion -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/proto/functional/fusio
 n, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/coroutine/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/coroutine/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/execution/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/execution/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/utility/ipc -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/utility/ipc, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/locale/src/icu -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/locale/src/icu, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/log/src/posix -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/log/src/posix, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/bind/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/bind/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/utility/ma
 nipulators -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/utility/manipulators, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mpl/vector/aux_ -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mpl/vector/aux_, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/algorithm/iteration/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/algorithm/iteration/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/contract/detail/inlined -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/contract, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/chrono/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/chrono/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/atomic/detail/type_traits -> /usr/src/debug/boos
 t/1.79.0-r0/boost_1_79_0/boost/atomic/detail/type_traits, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/utility -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/utility, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/random/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/random/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/iostreams/device -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/iostreams/device, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/ip/detail/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/ip/detail/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mpl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mpl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/type_erasure/
 detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/type_erasure/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/container/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/container/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/graph/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/graph/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/bind -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/bind, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/utility/setup -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/utility/setup, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/date_time/gregorian -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/date_time/gregorian, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/math/tools/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/math/tools/de
 tail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/numeric/conversion -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/numeric/conversion, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/composite/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/composite/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/assert -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/assert, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/smart_ptr/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/smart_ptr/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/exception/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/exception/detail, directory renamed /usr/src/debug/boost/
 1.78.0-r0/boost_1_78_0/boost/contract/detail/inlined/core -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/contract/detail/inlined/core, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/sequence/intrinsic -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/sequence/intrinsic, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/char -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/char, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/thread/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/thread/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/algorithm/query/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/algorithm/query/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/sources -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/sources, directory renamed /usr/src/debug/boost/1.78.0-r0/b
 oost_1_78_0/boost/math -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/math, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/parameter/aux_ -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/parameter/aux_, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/pool -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/pool, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core/scanner/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core/scanner/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/ip/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/ip/impl,
  directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/proto/transform -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/proto/transform, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/utility/functional -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/utility/functional, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/utils/runtime -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/utils/runtime, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/thread/src/pthread -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/thread/src/pthread, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/interprocess/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/interprocess/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/locale/src/encoding -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/locale/src/encoding, directory renamed /usr/src/debug/b
 oost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/meta -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/meta, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/log/src/setup -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/log/src/setup, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/regex/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/regex/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/container/vector/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/container/vector/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support/iterators/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support/iterators/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support/iterators -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support/iterators, directory
  renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/variant/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/variant/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/program_options/src -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/program_options/src, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/support/char_set -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/support/char_set, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/phoenix/scope/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/phoenix/scope, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/interprocess -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/interprocess, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/contract -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/contract/detail/inlined, directory renamed /usr/src/debug/boost/1.78.0-r0/boost
 _1_78_0/boost/spirit/home/classic/tree -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/tree, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/locale/src/posix -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/locale/src/posix, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/atomic -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/atomic, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/date_time -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/date_time, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/math/tools -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/math/tools, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/property_tree -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/property_tree, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/adapted/boost_tuple/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boos
 t/fusion/adapted/boost_tuple/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/integer -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/integer, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/detail/ryu/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/detail/ryu/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/date_time/src/gregorian -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/date_time/src/gregorian, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/locale/src/util -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/locale/src/util, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/iterator/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/iterator/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/move -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move, directory renamed /usr/src/debug/boost/1.78.0-r0/boo
 st_1_78_0/boost/test/utils/runtime/env -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/utils/runtime/env, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/property_map -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/property_map, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/iostreams -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/iostreams, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/random -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/random, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/qi/string -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/qi/string, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/proto -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/proto, directory renamed /usr/sr
 c/debug/boost/1.78.0-r0/boost_1_78_0/boost/test -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/expressions/predicates -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/expressions/predicates, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/mpl/aux_/preprocessed/gcc -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/mpl/aux_/preprocessed/gcc, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/coroutine/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/coroutine/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/sequence -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fusion/sequence, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/iterator -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/iterator, directory renamed /usr/src/debug/boost/1.78.0-r0/b
 oost_1_78_0/libs/context/src/posix -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/context/src/posix, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/log/keywords -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/log/keywords, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/range -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/range, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/lexical_cast/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/lexical_cast/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/algorithm/string -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/algorithm/string, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/fusion/support/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fu
 sion/support/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/program_options/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/program_options/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/contract/core -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/contract/core, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/karma/numeric/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/karma/numeric/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/locale/src/std -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/locale/src/std, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/execution/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/execution/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/numeric/conversion/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/numeric/con
 version/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/asio/ip -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/asio/ip, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/test/impl -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/test/impl, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/type_traits/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/type_traits/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/unordered/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/unordered/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/range/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/range/detail, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/xpressive/detail/core -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/xpressive/detail/core, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/libs/coro
 utine/src/posix -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/coroutine/src/posix, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/spirit/home/classic/core -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/spirit/home/classic/core, directory renamed /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/config/detail -> /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/config/detail, removed "/usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/value_stack.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/hook_traits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/move/detail/meta_utils_core.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/error_category_impl.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/alloc_lib.h /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/throws.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/dlmalloc.hpp /usr/src/debug
 /boost/1.78.0-r0/boost_1_78_0/boost/json/impl/serializer.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/derivation_value_traits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/node_holder.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/singleton.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/generic_category.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/algo_type.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/move/detail/pointer_element.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/checked_delete.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/iterator.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/pool_resource.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/kind.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/error_condition.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/
 boost/system/detail/system_category.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/noncopyable.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/pointer_plus_bits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/circular_list_algorithms.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/generic_category_message.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/snprintf.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/set.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/ref.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/errc.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/utility/in_place_factory.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/addressof.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/is_same.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/append_int.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boo
 st/json/impl/value.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/move/detail/type_traits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/bstree_algorithms.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/utility/base_from_member.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/default_allocator.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/block_list.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/demangle.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/enable_if.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/bstree.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/utility/string_view.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/default_header_holder.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/io/detail/buffer_fill.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/list_hook.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/i
 ntrusive/rbtree_algorithms.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/object.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/system_category_impl.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/serialize.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/swap.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/link_mode.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/block_slist.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/allocator_access.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/thread_mutex.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/bstree_algorithms_base.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/array.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/typeinfo.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/pair.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0
 /boost/intrusive/detail/size_holder.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/min_max.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/mpl.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/null_deleter.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/static_resource.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/io/ios_state.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/enable_if.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/string.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/rbtree_node.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/node_cloner_disposer.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/error.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/generic_hook.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/context/stack_traits.hpp /usr/src/debug/boost/1.78.0-r0/
 boost_1_78_0/boost/move/detail/meta_utils.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/error_code.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/use_default.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/io/detail/ostream_guard.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/list.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/pointer_traits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/type_traits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/simple_disposers.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/context/detail/config.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/iiterator.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/list_iterator.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/is_same.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/stream_parser.ipp /usr/src/debu
 g/boost/1.78.0-r0/boost_1_78_0/boost/core/uncaught_exceptions.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/tree_iterator.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/tree_value_compare.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/pointer_traits.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/scoped_enum.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/ebo_functor_holder.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/error_category.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/has_member_function_callable_with.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/pointer_rebind.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/io/ostream_put.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/common_slist_algorithms.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/cmath.hpp /usr/src/debug/boost
 /1.78.0-r0/boost_1_78_0/boost/json/impl/null_resource.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/list_node.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/uncast.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/set_hook.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/parser.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/parse.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/system/detail/interop_category.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/options.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/intrusive_fwd.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/key_nodeptr_comp.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/value_ref.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/string.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/array.ipp /usr/src/debug/boost/1.78.0-
 r0/boost_1_78_0/boost/system/detail/std_category.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/object.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/container/detail/placement_new.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/move/detail/unique_ptr_meta_utils.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/json/impl/monotonic_resource.ipp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/linear_slist_algorithms.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/function_detector.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/bit.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/context/detail/fcontext.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/core/ignore_unused.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/mpl.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/utility/value_init.hpp /usr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/intrusive/detail/math.hpp /u
 sr/src/debug/boost/1.78.0-r0/boost_1_78_0/boost/utility/string_view_fwd.hpp", added "/usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/rbtree_algorithms.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/fiber_fcontext.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/system_category.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/set_hook.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/addressof.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/system_category_message.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/tree_value_compare.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/exceptions.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/meta_utils.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/pointer_element.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/serialize.ipp /usr/src/debug/boost/1.79.0-r0/boo
 st_1_79_0/boost/intrusive/detail/list_iterator.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/parent_from_member.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/utility/value_init.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/slist.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/stack_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/context_spinlock_queue.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/type_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/circular_slist_algorithms.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/bstree.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/ref.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/stream_parser.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/enable_if.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/cpu_relax.hpp /usr/src/debu
 g/boost/1.79.0-r0/boost_1_79_0/boost/core/default_allocator.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/uncast.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/hook_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/default_header_holder.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/alloc_lib.h /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/throws.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/ebo_functor_holder.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/parser.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/value.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/fixedsize_stack.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/thread_barrier.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/barrier.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/context.hpp 
 /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/object.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/swap.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/array.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/derivation_value_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/system_category_impl.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/iiterator.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/interop_category.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/slist_node.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/linear_slist_algorithms.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/enable_if.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/unique_ptr_meta_utils.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/recursive_timed_mutex.cpp /usr/src/debug/boost/1.79.0-r0/boost_
 1_79_0/boost/container/detail/block_list.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/value_stack.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/generic_category.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/mutex.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/node_holder.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/string.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/io/ios_state.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/parse.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/demangle.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/slist_iterator.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/tree_iterator.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/pool_resource.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/errc.hpp /usr/src/debug/boost/1.79.0-r0/boo
 st_1_79_0/boost/fiber/timed_mutex.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/use_default.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/io/detail/buffer_fill.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/serializer.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/fss.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/static_resource.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/barrier.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/recursive_mutex.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/utility/base_from_member.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/cmath.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/block_slist.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/algo_type.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/typeinfo.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/
 bstree_algorithms.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/pointer_plus_bits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/generic_category_message.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/circular_list_algorithms.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/detail/string_view.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/ignore_unused.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/context.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/rbtree_node.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/condition_variable.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/snprintf.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/scoped_enum.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/generic_hook.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/detail/disable_overload.hpp /usr/src/
 debug/boost/1.79.0-r0/boost_1_79_0/boost/context/detail/prefetch.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/intrusive_fwd.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/slist_hook.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/detail/exception.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/link_mode.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/policy.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/disable_overload.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/size_holder.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/bstree_algorithms_base.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/algo/shared_work.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/thread_mutex.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/algo/algorithm.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber
 /recursive_timed_mutex.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/mutex.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/std_category.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/algo/round_robin.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/waker.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/simple_disposers.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/properties.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/fixedsize_stack.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/timed_mutex.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/condition_variable.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/spinlock_ttas.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/preallocated.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/scheduler.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fibe
 r/algo/work_stealing.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/mpl.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/iterator.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/list_hook.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/append_int.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/min_max.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/type.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/string.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/object.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/placement_new.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/error_category.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/flags.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/pointer_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/det
 ail/function_detector.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/list_node.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/detail/config.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/is_same.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/algo/shared_work.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/algo/round_robin.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/error_code.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/allocator_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/key_nodeptr_comp.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/uncaught_exceptions.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/set.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/dlmalloc.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/is_same.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/
 boost/intrusive/detail/equal_to_value.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/noncopyable.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/mpl.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/addressof.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/properties.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/pointer_rebind.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/allocator_access.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/stack_context.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/pointer_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/spinlock_status.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/algo/algorithm.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/scheduler.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/context/detail/fcontext.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/js
 on/impl/pointer.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/singleton.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/detail/spinlock.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/meta_utils_core.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/waker.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/recursive_mutex.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/kind.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/null_resource.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/error.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/monotonic_resource.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/move/detail/to_raw_pointer.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/fiber.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/checked_delete.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/options.hpp 
 /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/null_deleter.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/utility/in_place_factory.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/algo/work_stealing.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/list.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/has_member_function_callable_with.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/container/detail/type_traits.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/core/bit.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/common_slist_algorithms.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl/array.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/error_condition.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/libs/fiber/src/future.cpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/fiber/fiber.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/json/impl
 /value_ref.ipp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/node_cloner_disposer.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/system/detail/error_category_impl.hpp /usr/src/debug/boost/1.79.0-r0/boost_1_79_0/boost/intrusive/detail/math.hpp"
packages/core2-32-poky-linux/boost/boost-src: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-src: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-src: PKGSIZE changed from 18037226 to 18385815 (+2%)
packages/core2-32-poky-linux/boost/boost-staticdev: FILELIST: added "/usr/lib/libboost_fiber-mt.a /usr/lib/libboost_fiber.a"
packages/core2-32-poky-linux/boost/boost-staticdev: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-staticdev: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-staticdev: PKGSIZE changed from 124806757 to 127367383 (+2%)
packages/core2-32-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.78.0", added "/usr/lib/libboost_system.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-system: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-system: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-system: PKG changed from libboost-system1.78.0 to libboost-system1.79.0
packages/core2-32-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_unit_test_framework.so.1.78.0 /usr/lib/libboost_prg_exec_monitor.so.1.78.0", added "/usr/lib/libboost_unit_test_framework.so.1.79.0 /usr/lib/libboost_prg_exec_monitor.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-test: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-test: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.78.0", added "/usr/lib/libboost_thread.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-thread: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-thread: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.78.0 to libboost-thread1.79.0
packages/core2-32-poky-linux/boost/boost-thread: PKGSIZE changed from 107980 to 107964 (-0%)
packages/core2-32-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.78.0", added "/usr/lib/libboost_timer.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-timer: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-timer: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.78.0 to libboost-timer1.79.0
packages/core2-32-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.78.0", added "/usr/lib/libboost_type_erasure.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-type-erasure: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.78.0 to libboost-type-erasure1.79.0
packages/core2-32-poky-linux/boost/boost-type-erasure: PKGSIZE changed from 50620 to 54700 (+8%)
packages/core2-32-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.78.0", added "/usr/lib/libboost_wave.so.1.79.0"
packages/core2-32-poky-linux/boost/boost-wave: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost-wave: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.78.0 to libboost-wave1.79.0
packages/core2-32-poky-linux/boost/boost-wave: PKGSIZE changed from 997368 to 1005544 (+1%)
packages/core2-32-poky-linux/boost/boost: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost/boost: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost: PKGV changed from 1.78.0 [default] to 1.79.0 [default]
packages/core2-32-poky-linux/boost: PV changed from "1.78.0" to "1.79.0"
packages/core2-32-poky-linux/boost: SRC_URI changed from "https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.bz2 file://boost-CVE-2012-2677.patch file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch file://de657e01635306085488290ea83de541ec393f8b.patch file://0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch" to "https://boostorg.jfrog.io/artifactory/main/release/1.79.0/source/boost_1_79_0.tar.bz2 file://boost-CVE-2012-2677.patch file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch"
Changes to packages/core2-32-poky-linux/boost (sysroot):
  /usr/include/boost/geometry/algorithms/detail/buffer/buffer_box.hpp changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.78.0 to libboost_atomic.so.1.79.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.78.0 to libboost_chrono.so.1.79.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.78.0 to libboost_container.so.1.79.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.78.0 to libboost_context.so.1.79.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.78.0 to libboost_contract.so.1.79.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.78.0 to libboost_coroutine.so.1.79.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.78.0 to libboost_date_time.so.1.79.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.78.0 to libboost_filesystem.so.1.79.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.78.0 to libboost_graph.so.1.79.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.78.0 to libboost_iostreams.so.1.79.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.78.0 to libboost_json.so.1.79.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.78.0 to libboost_locale.so.1.79.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.78.0 to libboost_log_setup.so.1.79.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.78.0 to libboost_log.so.1.79.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.78.0 to libboost_math_c99f.so.1.79.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.78.0 to libboost_math_c99l.so.1.79.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.78.0 to libboost_math_c99.so.1.79.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.78.0 to libboost_math_tr1f.so.1.79.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.78.0 to libboost_math_tr1l.so.1.79.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.78.0 to libboost_math_tr1.so.1.79.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.78.0 to libboost_prg_exec_monitor.so.1.79.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.78.0 to libboost_program_options.so.1.79.0
  /usr/lib/libboost_python310.so changed symlink target from libboost_python310.so.1.78.0 to libboost_python310.so.1.79.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.78.0 to libboost_random.so.1.79.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.78.0 to libboost_regex.so.1.79.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.78.0 to libboost_serialization.so.1.79.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.78.0 to libboost_system.so.1.79.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.78.0 to libboost_thread.so.1.79.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.78.0 to libboost_timer.so.1.79.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.78.0 to libboost_type_erasure.so.1.79.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.78.0 to libboost_unit_test_framework.so.1.79.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.78.0 to libboost_wave.so.1.79.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.78.0 to libboost_wserialization.so.1.79.0
  /usr/lib/cmake/Boost-1.78.0 moved to /usr/lib/cmake/Boost-1.79.0
  /usr/lib/cmake/boost_atomic-1.78.0 moved to /usr/lib/cmake/boost_atomic-1.79.0
  /usr/lib/cmake/boost_chrono-1.78.0 moved to /usr/lib/cmake/boost_chrono-1.79.0
  /usr/lib/cmake/boost_container-1.78.0 moved to /usr/lib/cmake/boost_container-1.79.0
  /usr/lib/cmake/boost_context-1.78.0 moved to /usr/lib/cmake/boost_context-1.79.0
  /usr/lib/cmake/boost_contract-1.78.0 moved to /usr/lib/cmake/boost_contract-1.79.0
  /usr/lib/cmake/boost_coroutine-1.78.0 moved to /usr/lib/cmake/boost_coroutine-1.79.0
  /usr/lib/cmake/boost_date_time-1.78.0 moved to /usr/lib/cmake/boost_date_time-1.79.0
  /usr/lib/cmake/BoostDetectToolset-1.78.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.79.0.cmake
  /usr/lib/cmake/boost_exception-1.78.0 moved to /usr/lib/cmake/boost_exception-1.79.0
  /usr/lib/cmake/boost_fiber-1.78.0 moved to /usr/lib/cmake/boost_fiber-1.79.0
  /usr/lib/cmake/boost_filesystem-1.78.0 moved to /usr/lib/cmake/boost_filesystem-1.79.0
  /usr/lib/cmake/boost_graph-1.78.0 moved to /usr/lib/cmake/boost_graph-1.79.0
  /usr/lib/cmake/boost_headers-1.78.0 moved to /usr/lib/cmake/boost_headers-1.79.0
  /usr/lib/cmake/boost_iostreams-1.78.0 moved to /usr/lib/cmake/boost_iostreams-1.79.0
  /usr/lib/cmake/boost_json-1.78.0 moved to /usr/lib/cmake/boost_json-1.79.0
  /usr/lib/cmake/boost_locale-1.78.0 moved to /usr/lib/cmake/boost_locale-1.79.0
  /usr/lib/cmake/boost_log-1.78.0 moved to /usr/lib/cmake/boost_log-1.79.0
  /usr/lib/cmake/boost_log_setup-1.78.0 moved to /usr/lib/cmake/boost_log_setup-1.79.0
  /usr/lib/cmake/boost_math_c99-1.78.0 moved to /usr/lib/cmake/boost_math_c99-1.79.0
  /usr/lib/cmake/boost_math_c99f-1.78.0 moved to /usr/lib/cmake/boost_math_c99f-1.79.0
  /usr/lib/cmake/boost_math_c99l-1.78.0 moved to /usr/lib/cmake/boost_math_c99l-1.79.0
  /usr/lib/cmake/boost_math_tr1-1.78.0 moved to /usr/lib/cmake/boost_math_tr1-1.79.0
  /usr/lib/cmake/boost_math_tr1f-1.78.0 moved to /usr/lib/cmake/boost_math_tr1f-1.79.0
  /usr/lib/cmake/boost_math_tr1l-1.78.0 moved to /usr/lib/cmake/boost_math_tr1l-1.79.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.78.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.79.0
  /usr/lib/cmake/boost_program_options-1.78.0 moved to /usr/lib/cmake/boost_program_options-1.79.0
  /usr/lib/cmake/boost_python-1.78.0 moved to /usr/lib/cmake/boost_python-1.79.0
  /usr/lib/cmake/boost_random-1.78.0 moved to /usr/lib/cmake/boost_random-1.79.0
  /usr/lib/cmake/boost_regex-1.78.0 moved to /usr/lib/cmake/boost_regex-1.79.0
  /usr/lib/cmake/boost_serialization-1.78.0 moved to /usr/lib/cmake/boost_serialization-1.79.0
  /usr/lib/cmake/boost_system-1.78.0 moved to /usr/lib/cmake/boost_system-1.79.0
  /usr/lib/cmake/boost_test_exec_monitor-1.78.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.79.0
  /usr/lib/cmake/boost_thread-1.78.0 moved to /usr/lib/cmake/boost_thread-1.79.0
  /usr/lib/cmake/boost_timer-1.78.0 moved to /usr/lib/cmake/boost_timer-1.79.0
  /usr/lib/cmake/boost_type_erasure-1.78.0 moved to /usr/lib/cmake/boost_type_erasure-1.79.0
  /usr/lib/cmake/boost_unit_test_framework-1.78.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.79.0
  /usr/lib/cmake/boost_wave-1.78.0 moved to /usr/lib/cmake/boost_wave-1.79.0
  /usr/lib/cmake/boost_wserialization-1.78.0 moved to /usr/lib/cmake/boost_wserialization-1.79.0
  /usr/lib/libboost_atomic.so.1.78.0 moved to /usr/lib/libboost_atomic.so.1.79.0
  /usr/lib/libboost_chrono.so.1.78.0 moved to /usr/lib/libboost_chrono.so.1.79.0
  /usr/lib/libboost_container.so.1.78.0 moved to /usr/lib/libboost_container.so.1.79.0
  /usr/lib/libboost_context.so.1.78.0 moved to /usr/lib/libboost_context.so.1.79.0
  /usr/lib/libboost_contract.so.1.78.0 moved to /usr/lib/libboost_contract.so.1.79.0
  /usr/lib/libboost_coroutine.so.1.78.0 moved to /usr/lib/libboost_coroutine.so.1.79.0
  /usr/lib/libboost_date_time.so.1.78.0 moved to /usr/lib/libboost_date_time.so.1.79.0
  /usr/lib/libboost_filesystem.so.1.78.0 moved to /usr/lib/libboost_filesystem.so.1.79.0
  /usr/lib/libboost_graph.so.1.78.0 moved to /usr/lib/libboost_graph.so.1.79.0
  /usr/lib/libboost_iostreams.so.1.78.0 moved to /usr/lib/libboost_iostreams.so.1.79.0
  /usr/lib/libboost_json.so.1.78.0 moved to /usr/lib/libboost_json.so.1.79.0
  /usr/lib/libboost_locale.so.1.78.0 moved to /usr/lib/libboost_locale.so.1.79.0
  /usr/lib/libboost_log_setup.so.1.78.0 moved to /usr/lib/libboost_log_setup.so.1.79.0
  /usr/lib/libboost_log.so.1.78.0 moved to /usr/lib/libboost_log.so.1.79.0
  /usr/lib/libboost_math_c99f.so.1.78.0 moved to /usr/lib/libboost_math_c99f.so.1.79.0
  /usr/lib/libboost_math_c99l.so.1.78.0 moved to /usr/lib/libboost_math_c99l.so.1.79.0
  /usr/lib/libboost_math_c99.so.1.78.0 moved to /usr/lib/libboost_math_c99.so.1.79.0
  /usr/lib/libboost_math_tr1f.so.1.78.0 moved to /usr/lib/libboost_math_tr1f.so.1.79.0
  /usr/lib/libboost_math_tr1l.so.1.78.0 moved to /usr/lib/libboost_math_tr1l.so.1.79.0
  /usr/lib/libboost_math_tr1.so.1.78.0 moved to /usr/lib/libboost_math_tr1.so.1.79.0
  /usr/lib/libboost_prg_exec_monitor.so.1.78.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.79.0
  /usr/lib/libboost_program_options.so.1.78.0 moved to /usr/lib/libboost_program_options.so.1.79.0
  /usr/lib/libboost_python310.so.1.78.0 moved to /usr/lib/libboost_python310.so.1.79.0
  /usr/lib/libboost_random.so.1.78.0 moved to /usr/lib/libboost_random.so.1.79.0
  /usr/lib/libboost_regex.so.1.78.0 moved to /usr/lib/libboost_regex.so.1.79.0
  /usr/lib/libboost_serialization.so.1.78.0 moved to /usr/lib/libboost_serialization.so.1.79.0
  /usr/lib/libboost_system.so.1.78.0 moved to /usr/lib/libboost_system.so.1.79.0
  /usr/lib/libboost_thread.so.1.78.0 moved to /usr/lib/libboost_thread.so.1.79.0
  /usr/lib/libboost_timer.so.1.78.0 moved to /usr/lib/libboost_timer.so.1.79.0
  /usr/lib/libboost_type_erasure.so.1.78.0 moved to /usr/lib/libboost_type_erasure.so.1.79.0
  /usr/lib/libboost_unit_test_framework.so.1.78.0 moved to /usr/lib/libboost_unit_test_framework.so.1.79.0
  /usr/lib/libboost_wave.so.1.78.0 moved to /usr/lib/libboost_wave.so.1.79.0
  /usr/lib/libboost_wserialization.so.1.78.0 moved to /usr/lib/libboost_wserialization.so.1.79.0
  /usr/include/boost/any/unique_any.hpp was added
  /usr/include/boost/asio/bind_allocator.hpp was added
  /usr/include/boost/asio/recycling_allocator.hpp was added
  /usr/include/boost/container/detail/is_pair.hpp was added
  /usr/include/boost/core/allocator_traits.hpp was added
  /usr/include/boost/core/verbose_terminate_handler.hpp was added
  /usr/include/boost/functional/identity.hpp was added
  /usr/include/boost/geometry/algorithms/closest_points.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/implementation.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/interface.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/linear_or_areal_to_areal.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/linear_to_linear.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/multipoint_to_geometry.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/point_to_geometry.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/range_to_geometry_rtree.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/segment_to_segment.hpp was added
  /usr/include/boost/geometry/algorithms/detail/closest_points/utilities.hpp was added
  /usr/include/boost/geometry/algorithms/dispatch/closest_points.hpp was added
  /usr/include/boost/geometry/strategies/cartesian/closest_points_pt_seg.hpp was added
  /usr/include/boost/geometry/strategies/closest_points was added
  /usr/include/boost/geometry/strategies/closest_points/cartesian.hpp was added
  /usr/include/boost/geometry/strategies/closest_points/geographic.hpp was added
  /usr/include/boost/geometry/strategies/closest_points/services.hpp was added
  /usr/include/boost/geometry/strategies/closest_points/spherical.hpp was added
  /usr/include/boost/geometry/strategies/geographic/closest_points_pt_seg.hpp was added
  /usr/include/boost/geometry/strategies/spherical/closest_points_pt_seg.hpp was added
  /usr/include/boost/geometry/strategy/cartesian/envelope_boxes.hpp was added
  /usr/include/boost/geometry/strategy/cartesian/envelope_range.hpp was added
  /usr/include/boost/geometry/strategy/geographic/envelope_range.hpp was added
  /usr/include/boost/geometry/strategy/spherical/envelope_boxes.hpp was added
  /usr/include/boost/geometry/strategy/spherical/envelope_range.hpp was added
  /usr/include/boost/io/nullstream.hpp was added
  /usr/include/boost/json/impl/pointer.ipp was added
  /usr/include/boost/leaf/config was added
  /usr/include/boost/leaf/config.hpp was added
  /usr/include/boost/leaf/config/tls_array.hpp was added
  /usr/include/boost/leaf/config/tls_cpp11.hpp was added
  /usr/include/boost/leaf/config/tls_freertos.hpp was added
  /usr/include/boost/leaf/config/tls_globals.hpp was added
  /usr/include/boost/leaf/config/tls.hpp was added
  /usr/include/boost/leaf/to_variant.hpp was added
  /usr/include/boost/log/utility/manipulators/invoke.hpp was added
  /usr/include/boost/math/ccmath/detail was added
  /usr/include/boost/math/ccmath/detail/swap.hpp was added
  /usr/include/boost/math/ccmath/fdim.hpp was added
  /usr/include/boost/math/ccmath/fmax.hpp was added
  /usr/include/boost/math/ccmath/fmin.hpp was added
  /usr/include/boost/math/ccmath/hypot.hpp was added
  /usr/include/boost/math/ccmath/isgreaterequal.hpp was added
  /usr/include/boost/math/ccmath/isgreater.hpp was added
  /usr/include/boost/math/ccmath/islessequal.hpp was added
  /usr/include/boost/math/ccmath/isless.hpp was added
  /usr/include/boost/math/ccmath/isunordered.hpp was added
  /usr/include/boost/math/special_functions/logaddexp.hpp was added
  /usr/include/boost/math/special_functions/logsumexp.hpp was added
  /usr/include/boost/math/tools/color_maps.hpp was added
  /usr/include/boost/math/tools/concepts.hpp was added
  /usr/include/boost/math/tools/quartic_roots.hpp was added
  /usr/include/boost/move/detail/addressof.hpp was added
  /usr/include/boost/move/detail/force_ptr.hpp was added
  /usr/include/boost/multiprecision/detail/empty_value.hpp was added
  /usr/include/boost/multiprecision/detail/float128_functions.hpp was added
  /usr/include/boost/multiprecision/detail/fpclassify.hpp was added
  /usr/include/boost/multiprecision/detail/functions/trunc.hpp was added
  /usr/include/boost/multiprecision/detail/no_exceptions_support.hpp was added
  /usr/include/boost/multiprecision/detail/uniform_int_distribution.hpp was added
  /usr/include/boost/multiprecision/traits/is_convertible_arithmetic.hpp was added
  /usr/include/boost/predef/architecture/loongarch.h was added
  /usr/include/boost/qvm/is_scalar.hpp was added
  /usr/include/boost/system/detail/system_category_message.hpp was added
  /usr/lib/libboost_fiber.a was added
  /usr/lib/libboost_fiber-mt.a was added
  /usr/lib/libboost_fiber-mt.so was added
  /usr/lib/libboost_fiber.so.1.79.0 was added
  /usr/lib/libboost_fiber.so was added
  /usr/include/boost/asio/detail/reactor_fwd.hpp was removed
  /usr/include/boost/geometry/algorithms/detail/check_iterator_range.hpp was removed
  /usr/include/boost/json/detail/index_sequence.hpp was removed
  /usr/include/boost/leaf/detail/config.hpp was removed
  /usr/include/boost/math/tools/lexical_cast.hpp was removed
packages/core2-32-poky-linux/boost/boost-fiber: pkg_postinst added:
  @@ -0,0 +1,5 @@
  +#!/bin/sh
  +set -e
  +if [ x"$D" = "x" ]; then
  +	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  +fi
  --

--===============4130591098143401625==--

