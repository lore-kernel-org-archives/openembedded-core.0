Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 573657D419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:30:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6VY7020869 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=6XnKorLyshy2T4+/OA6GwwbKKevFPKKuJ9iPxDFFle8=;
	b=YQueolxiKc2BbyH5P2vZo/D/7psKRQ+uhiBEGZB3udB2cUM7+C0isnr9JL+JsNS5w5l/
	doeAdyRIkfnz3qzbFZmMIYDyykBqeok2o06/vYfHqFiGFh2Ncza2Ps9pxsbmQyJSBUdZ
	XfZgEE7gKkTdGEtjspmmAAUuYmC+QK0/5uREAAuYjI1EdivNXLMawfpTW+DiqEV9RnPO
	sFQyLVj6faUM92f6V0aSagnXjKpyDZYoRRqiKU2Oa1xZwaPzp5et7mhtK9bQxkRt3tt6
	R0m6mpIPUynilIlobL54Uapyw9Ee3PKjb0pUkdAZNuzUTMLjU6RL1nSovBBccAzTICaE
	aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vej2p2fce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B15E910002A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A16FB2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:34 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:34 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:34 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 00/23] Update BSD license
Thread-Index: AQHVfRBS4asz+suJbkydQNNNXHIZuw==
Date: Mon, 7 Oct 2019 13:08:34 +0000
Message-ID: <cover.1570452710.git.christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [PATCH 00/23] Update BSD license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:30:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Some recipes use BSD as license while SPDX license reference : BSD-0-Clause=
,
BSD-1-Clause, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause.
The goal of this request are to indicate the SPDX license euqivalent for re=
cipes
which indicate "BSD" as license.

The following changes since commit 108ce1447ca5dcb838ef67ef6b9a9d25e993da1d=
:

  meson: update patch status (2019-10-04 09:06:31 +0100)

are available in the Git repository at:

  git://github.com/cpriouzeau/openembedded-core oe-license
  https://github.com/cpriouzeau/openembedded-core/tree/oe-license

Christophe Priouzeau (23):
  libpcap: update license
  wpa-supplicant: update license
  ovmf: update license
  cmake: update license
  file: update license
  flex: update license
  python-async: update license
  python-smmap: update license
  libarchive: update license
  libtirpc: update license
  lighttpd: update license
  pbzip2: update license
  rpcbind: update license
  tcp-wrappers: update license
  libxpm: update license
  libogg: update license
  libtheora: update license
  libvorbis: update license
  speex: update license
  speexdsp: update license
  libwebp: update license
  libpcre: update license
  p11-kit: update license

 meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb             | 2 +-
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                             | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                          | 2 +-
 meta/recipes-devtools/file/file_5.37.bb                        | 2 +-
 meta/recipes-devtools/flex/flex_2.6.0.bb                       | 2 +-
 meta/recipes-devtools/python/python-async.inc                  | 2 +-
 meta/recipes-devtools/python/python-smmap.inc                  | 2 +-
 meta/recipes-extended/libarchive/libarchive_3.4.0.bb           | 2 +-
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb               | 2 +-
 meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb              | 2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb                  | 2 +-
 meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb                 | 2 +-
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb         | 2 +-
 meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb                | 2 +-
 meta/recipes-multimedia/libogg/libogg_1.3.4.bb                 | 2 +-
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb           | 2 +-
 meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb           | 2 +-
 meta/recipes-multimedia/speex/speex_1.2.0.bb                   | 2 +-
 meta/recipes-multimedia/speex/speexdsp_1.2rc3.bb               | 2 +-
 meta/recipes-multimedia/webp/libwebp_1.0.3.bb                  | 2 +-
 meta/recipes-support/libpcre/libpcre2_10.33.bb                 | 2 +-
 meta/recipes-support/libpcre/libpcre_8.43.bb                   | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb              | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

--=20
2.17.1

