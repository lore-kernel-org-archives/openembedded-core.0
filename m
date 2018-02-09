Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A8C2678766
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 07:14:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 23:14:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,482,1511856000"; d="scan'208";a="16695514"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2018 23:14:30 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.31]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.52]) with mapi id
	14.03.0319.002; Fri, 9 Feb 2018 15:14:29 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] bmap-tools: change SRC_URI to use
	tarball instead
Thread-Index: AQHToXNmHf06lwLit0OSHH1Vgl6DJ6ObpiEw
Date: Fri, 9 Feb 2018 07:14:28 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D1F208698@PGSMSX103.gar.corp.intel.com>
References: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<754a5028-97a1-79a3-fe48-232cea8d3a6d@linux.intel.com>
In-Reply-To: <754a5028-97a1-79a3-fe48-232cea8d3a6d@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTIwMGVjOGMtOGNjMC00MmNhLWEwZTEtMjI5Y2M4NTYxZmU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJTMWpYbmJXOXNXeVRCRXdXOWJsTDZxQWNhKzgyUUVEK0xDR3VCSzJYZllmR2RwR09va1R6WHN5WThaRWFTR3IwIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] bmap-tools: change SRC_URI to use tarball instead
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
X-List-Received-Date: Fri, 09 Feb 2018 07:14:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiBbbWFpbHRvOmFsZXhhbmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbV0NCj4g
U2VudDogRnJpZGF5LCBGZWJydWFyeSA5LCAyMDE4IDI6NTIgUE0NCj4gVG86IENoYW5nLCBSZWJl
Y2NhIFN3ZWUgRnVuIDxyZWJlY2NhLnN3ZWUuZnVuLmNoYW5nQGludGVsLmNvbT47DQo+IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggMS8yXSBibWFwLXRvb2xzOiBjaGFuZ2UgU1JDX1VSSSB0byB1c2UgdGFyYmFs
bA0KPiBpbnN0ZWFkDQo+IA0KPiBPbiAwMi8wOS8yMDE4IDA2OjI1IEFNLCBDaGFuZyBSZWJlY2Nh
IFN3ZWUgRnVuIHdyb3RlOg0KPiA+IC1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaW50ZWwv
Ym1hcC10b29scy5naXQiDQo+ID4gLVNSQ1JFViA9ICI5ZGFkNzI0MTA0ZGYyNjU0NDIyMjY5NzJh
MWUzMTA4MTNmOWZmY2JhIg0KPiA+ICtTUkNfVVJJID0NCj4gImh0dHBzOi8vZ2l0aHViLmNvbS9p
bnRlbC8ke0JQTn0vcmVsZWFzZXMvZG93bmxvYWQvdiR7UFZ9LyR7QlBOfS0ke1BWfS50Z3oiDQo+
IA0KPiBXaGVuIHlvdSBzd2l0Y2ggdGhlIHVwc3RyZWFtIHNvdXJjZSBsb2NhdGlvbiBsaWtlIHRo
aXMsIHlvdSBuZWVkIHRvIHZlcmlmeSB0aGF0DQo+IHVwc3RyZWFtIHZlcnNpb24gY2hlY2sgc3Rp
bGwgd29ya3M6DQo+IA0KPiBiaXRiYWtlIC1jIGNoZWNrcGtnIGJtYXAtdG9vbHMNCj4NCj4gYW5k
IGluc3BlY3QgdG1wL2xvZy9jaGVja3BrZy5jc3YgdG8gc2VlIHRoZSBvdXRjb21lLiBJZiBiaXRi
YWtlIGNhbiBubyBsb25nZXINCj4gZGV0ZXJtaW5lIHRoZSBsYXRlc3QgdmVyc2lvbiwgc2V0IFVQ
U1RSRUFNX0NIRUNLX1VSSSB0byB0aGUgd2VicGFnZSB3aGVyZQ0KPiBhbGwgdGhlIHRhcmJhbGxz
IGFyZSBsaW5rZWQgZnJvbSAoSSB0aGluayBpdCB3b3VsZCBiZQ0KPiBodHRwczovL2dpdGh1Yi5j
b20vaW50ZWwvJHtCUE59L3JlbGVhc2VzLykuIFRoZXJlJ3MgcGxlbnR5IG9mIHJlY2lwZXMgaW4g
b2UtY29yZQ0KPiB3aXRoIHNpbWlsYXIgYWRqdXN0bWVudHMsIGlmIHlvdSBuZWVkIGZ1cnRoZXIg
ZXhhbXBsZXMuDQo+IA0KVGhhbmtzIGZvciB5b3VyIGlucHV0ISBJIHdpbGwgZG91YmxlIGNoZWNr
IGFuZCBzZW5kIGEgbmV3IHJldmlzaW9uLg0KDQpSZWJlY2NhDQo=

