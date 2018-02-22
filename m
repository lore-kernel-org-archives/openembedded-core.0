Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 50C297870D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 07:51:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 23:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="206057407"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
	by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2018 23:51:02 -0800
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.197]) by
	IRSMSX107.ger.corp.intel.com ([169.254.10.46]) with mapi id
	14.03.0319.002; Thu, 22 Feb 2018 07:51:01 +0000
From: "John, Maxin" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libinput: upgrade to version 1.10.0
Thread-Index: AQHTqk7Kb4ak40D57EOlDLPA8K7dgKOu9A8AgAEZt/A=
Importance: high
X-Priority: 1
Date: Thu, 22 Feb 2018 07:51:00 +0000
Message-ID: <61C0517EAD808B429A1DE2DD9164D4003267ED13@IRSMSX103.ger.corp.intel.com>
References: <1519133494-41293-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LanJ9Jgo+wKt5D_wxUCCpxbtpoMqL4cKbV=WxS_wqoDnA@mail.gmail.com>
In-Reply-To: <CAJTo0LanJ9Jgo+wKt5D_wxUCCpxbtpoMqL4cKbV=WxS_wqoDnA@mail.gmail.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWQxNTI4Y2ItNmJmMS00MDk3LTkyODgtNjNkNGFmMDE5NTliIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJNamRjQmhiN1hYSEpPMFA2OXlcL2tPVGFEUW5WZFUxaVNJM1hKbUtKS3NaanZWejFoTTYxVytOZTdtU1RTNDZoXC8ifQ==
x-ctpclassification: CTP_NT
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libinput: upgrade to version 1.10.0
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
X-List-Received-Date: Thu, 22 Feb 2018 07:51:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KPkZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVs
LmNvbV0gDQo+U2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMSwgMjAxOCA0OjU4IFBNDQo+VG86
IEpvaG4sIE1heGluIDxtYXhpbi5qb2huQGludGVsLmNvbT4NCj5DYzogT0UtY29yZSA8b3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj5TdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gbGliaW5wdXQ6IHVwZ3JhZGUgdG8gdmVyc2lvbiAxLjEwLjANCj4+DQo+Pk9u
IDIwIEZlYnJ1YXJ5IDIwMTggYXQgMTM6MzEsIE1heGluIEIuIEpvaG4gPG1heGluLmpvaG5AaW50
ZWwuY29tPiB3cm90ZToNCj4+DQo+PitSREVQRU5EU18ke1BOfSA9ICJweXRob24zIg0KPg0KPk91
Y2guwqAgQ2FuIHdlIHNwbGl0IHRoaXMgYml0IGludG8gYSBzZXBhcmF0ZSBwYWNrYWdlP8KgIFB1
bGxpbmcgaW4gYWxsIG9mIFB5dGhvbiBmb3IgYSB0b3VjaHBhZCBoZWxwZXIgc2VlbXMgYSBiaXQg
b3ZlcmtpbGwgaWYgdGhlIG1hY2hpbmUgZG9lc24ndCBoYXZlIGEgdG91Y2hwYWQuLi4NCg0KT2ss
IHRoYXQgbWFrZXMgc2Vuc2UuIFdpbGwgcHV0IHRob3NlIHNjcmlwdHMvYmluYXJpZXMgaW50byAi
bGliaW5wdXQtdG9vbHMiIGFuZCBzZW5kIHRoZSB1cGRhdGVkIG9uZS4NCg0KPlJvc3MNCg0KQmVz
dCBSZWdhcmRzLA0KTWF4aW4NCg0KDQrCoA0K

