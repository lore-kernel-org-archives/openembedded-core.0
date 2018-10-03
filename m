Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Oct 2018 17:32:22 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id C220979357
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2131; q=dns/txt; s=iport;
	t=1538587944; x=1539797544;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=pDeOh+9h66gEQFJKReeXGPEmI7uXXtoMgTTGF3NC3B8=;
	b=Iynd5MyNpg8V9XWZ9OP+sVyi0EBcaJJfnOfGwhucTRqCgfD/X/FtAlCR
	RzBZowaLmFkqtHvITgwbpfBmnR1uYz5R0ztNJwDBj+szC32Dwo+6ybiUp
	hYPodS7oRaxG3ni7CDC3pvYHdK592K9Nv6SBMSZLyJ2Zf6zIPX1S8MDfU Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AGAAAL+rRb/5RdJa1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUYIOZn8oCot/jiiER5IVgXoLG4RRAoQgITQYAQMBAQI?=
	=?us-ascii?q?BAQJtHAyFOAEBAQEDeRACAQgVAQslDyMlAgQBDQWDIoIBpn+KERSLDReBQT+?=
	=?us-ascii?q?BEoMSgUEBgwU3hVgCiDEahg16jXsJAoZHiXUXgUpLhyKGKyyUfgIRFIElHTi?=
	=?us-ascii?q?BVXAVgycJgiiJNoRtb4tIgS6BHwEB?=
X-IronPort-AV: E=Sophos;i="5.54,336,1534809600"; d="scan'208";a="461080859"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2018 17:22:47 +0000
Received: from XCH-RCD-010.cisco.com (xch-rcd-010.cisco.com [173.37.102.20])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id w93HMl8D029963
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Oct 2018 17:22:47 GMT
Received: from xch-aln-009.cisco.com (173.36.7.19) by XCH-RCD-010.cisco.com
	(173.37.102.20) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Wed, 3 Oct 2018 12:22:46 -0500
Received: from xch-aln-009.cisco.com ([173.36.7.19]) by XCH-ALN-009.cisco.com
	([173.36.7.19]) with mapi id 15.00.1395.000;
	Wed, 3 Oct 2018 12:22:46 -0500
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] lib/oe/utils: add eol to format_pkg_list()
Thread-Index: AQHUWZ4MYR40pcr0H0uXLrRP+ZZXYaUN6fYA///c6Q4=
Date: Wed, 3 Oct 2018 17:22:46 +0000
Message-ID: <1538587366618.96980@cisco.com>
References: <20181001154723.32161-1-gtertych@cisco.com>,
	<6cb0ab6264c5d5b65759d18594c116ae01a8d801.camel@linuxfoundation.org>
In-Reply-To: <6cb0ab6264c5d5b65759d18594c116ae01a8d801.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.61.167.90]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.20, xch-rcd-010.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
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
X-List-Received-Date: Wed, 03 Oct 2018 17:32:23 -0000
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
chances are that we need to revert 98230d2d049c742c349f35b256b13afbc3d26235=
=0A=
to avoid empty lines=0A=
let me check=0A=

