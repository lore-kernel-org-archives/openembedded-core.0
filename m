Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Oct 2018 05:42:42 UTC
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id E757E76074
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2041; q=dns/txt; s=iport;
	t=1538631764; x=1539841364;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=hLH1uwWOhzzP28J4IeQrP7AabyfflmRfEcnLfRZsvwo=;
	b=dRAHNXMtrCFNPZ5HwmMkd3emBU35BBpggLoi30hIqyAnetCYIjrrZVIP
	zWVjUPPFD7rC8R8bS0h7ClCkZTpQuWwV3a4tjJBmTlGKwgj/SzifJA0Lm
	HlhVhqR5P0fb1811WIBzdde65K25ejHRa1qqGF1HmE620OMIwj06eDub1 c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BTAAAPpbVb/4wNJK1bGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUQQBAQEBAQsBggVmfygKi3+MG4INhEgBkhWBegsBARu?=
	=?us-ascii?q?EUQKEICE0DQ0BAwEBAgEBAm0cDIU5AQEBAQN5EAIBCBUBCyUPIyUCBAENBYM?=
	=?us-ascii?q?iggGlK4oaFIsOF4FBP4ESgxKBQQGDBTeFWAKIS4YNeo17CQKGR4l1F4FLS4c?=
	=?us-ascii?q?ihisslQYCERSBJR04gVVwFYMnCYIoiTaEbW+KQoEugR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.54,338,1534809600"; d="scan'208";a="180759537"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2018 05:33:08 +0000
Received: from XCH-ALN-008.cisco.com (xch-aln-008.cisco.com [173.36.7.18])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id w945X8Lo022454
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 4 Oct 2018 05:33:08 GMT
Received: from xch-aln-009.cisco.com (173.36.7.19) by XCH-ALN-008.cisco.com
	(173.36.7.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 4 Oct 2018 00:33:07 -0500
Received: from xch-aln-009.cisco.com ([173.36.7.19]) by XCH-ALN-009.cisco.com
	([173.36.7.19]) with mapi id 15.00.1395.000;
	Thu, 4 Oct 2018 00:33:07 -0500
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] lib/oe/utils: add eol to format_pkg_list()
Thread-Index: AQHUWZ4MYR40pcr0H0uXLrRP+ZZXYaUN6fYA///c6Q6AAMySMg==
Date: Thu, 4 Oct 2018 05:33:07 +0000
Message-ID: <1538631187756.3952@cisco.com>
References: <20181001154723.32161-1-gtertych@cisco.com>,
	<6cb0ab6264c5d5b65759d18594c116ae01a8d801.camel@linuxfoundation.org>,
	<1538587366618.96980@cisco.com>
In-Reply-To: <1538587366618.96980@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.61.199.244]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.18, xch-aln-008.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Thu, 04 Oct 2018 05:42:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
Sent: Wednesday, October 3, 2018 5:23 PM=0A=
=0A=
gt> Append '\n' to the formatted string before return. If you write it=0A=
gt> to the (manifest) file, it will ensure file ends with a newline.=0A=
gt>=0A=
gt> Many GNU utilities have problems processing the last line of a file=0A=
gt> if it is not '\n' terminated. E.g. if the last line is not terminated=
=0A=
gt> by a newline character, then "read" will read it but return false,=0A=
gt> leaving the broken partial line in the read variable(s).=0A=
gt> It can also break or adversely affect some text processing tools,=0A=
gt> that operate on the file.=0A=
gt>=0A=
gt> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>=0A=
gt> ---=0A=
gt>  meta/lib/oe/utils.py | 2 +-=0A=
gt>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
RP> If you enable buildhistory (INHERIT +=3D 'buildhistory' in local.conf)=
=0A=
RP> and then "bitbake buildtools-tarball", you'll see:=0A=
=0A=
RP> | DEBUG: Python function buildhistory_list_installed_sdk_target finishe=
d=0A=
RP> | NOTE: Executing buildhistory_get_sdk_installed_target ...=0A=
RP> | DEBUG: Executing shell function buildhistory_get_sdk_installed_target=
=0A=
RP> | basename: missing operand=0A=
RP> | Try 'basename --help' for more information.=0A=
RP> | WARNING: /home/pokybuild/yocto-worker/nightly-arm/build/build/tmp/wor=
k/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/temp/run.buildhi=
story_get_sdk_installed_target.13414:1 exit 123 from 'xargs -n1 basename > =
$1/installed-packages.txt'=0A=
RP> | DEBUG: Python function do_populate_sdk finished=0A=
RP> | ERROR: Function failed: buildhistory_get_sdk_installed_target (log fi=
le is located at /home/pokybuild/yocto-worker/nightly-arm/build/build/tmp/w=
ork/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/temp/log.do_po=
pulate_sdk.13414)=0A=
=0A=
RP> which is buildhistory choking on the blank line.=0A=
=0A=
Reworked in v2. Now it is built.=0A=

