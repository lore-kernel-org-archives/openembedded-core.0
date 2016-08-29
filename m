Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8D117002B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7T2IQUT018327
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:26 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:25 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:18 +0800
Message-ID: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: Review request 0/21: ltp: add libwww-perl-perl to RDEPENDS
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:30 -0000
Content-Type: text/plain

The series add libwww-perl-perl to RDEPENDS for ltp as
STPfailure_report.pl provided by ltp depends
on LWP/Simple.pm which is provided by libwww-perl-perl

Add new recipe libwww-perl-perl as lftp rdepends
on libwww-perl-perl

Add encode-locale-perl recipe as libwww-perl-perl
rdepends on encode-locale-perl

Add new recipe file-listing-perl as libwww-perl-perl
rdepends on file-listing-perl

Add new recipe html-parser-perl as libwww-perl-perl
rdepends on html-parser-perl

Add new recipe http-cookies-perl as libwww-perl-perl
rdepends on http-cookies-perl

Add new recipe http-daemon-perl as libwww-perl-perl
rdepends on http-daemon-perl

Add new recipe http-date-perl as libwww-perl-perl
rdepends on http-date-perl

Add new recipe http-message-perl as libwww-perl-perl
rdepends on http-message-perl

Add new recipe http-negotiate-perl as libwww-perl-perl
rdepends on http-negotiate-perl

Add new recipe lwp-mediatypes-perl as libwww-perl-perl
rdepends on lwp-mediatypes-perl

Add new recipe net-http-perl as libwww-perl-perl
rdepends on net-http-perl

Add new recipe uri-perl as libwww-perl-perl
rdepends on uri-perl

Add new recipe www-robotrules-perl as libwww-perl-perl
rdepends on www-robotrules-perl

Add new recipe io-html-perl as http-message-perl
rdepends on io-html-perl

Add new recipe io-compress-perl as net-http-perl
rdepends on io-compress-perl

Add new recipe io-socket-ssl-perl as net-http-perl
rdepends on io-socket-ssl-perl

Add new recipe html-tagset-perl as html-parser-perl
rdepends on html-tagset-perl

Add new recipe compress-raw-bzip2-perl as io-compress-perl
rdepends on compress-raw-bzip2-perl

Add new recipe compress-raw-zlib-perl as io-compress-perl
rdepends on compress-raw-zlib-perl

Add new recipe net-ssleay-perl as io-socket-ssl-perl
rdepends on net-ssleay-perl

