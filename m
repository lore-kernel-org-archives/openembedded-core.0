Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC997064B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 08:31:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6N8Vm8x008867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:31:48 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.241]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 23 Jul 2014 01:31:48 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libxfont: fix for CVE-2014-0209
	CVE-2014-0210 CVE-2014-0211
Thread-Index: AQHPpk/y/7nQujHbV0uJDg2nE+ssl5utVC/g
Date: Wed, 23 Jul 2014 08:31:48 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCA91A65@ALA-MBB.corp.ad.wrs.com>
References: <1406102685-28553-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LbXfr099Rdb4aaXy__bobFN1oF2FWhF-fDvy6FK8+wkJA@mail.gmail.com>
In-Reply-To: <CAJTo0LbXfr099Rdb4aaXy__bobFN1oF2FWhF-fDvy6FK8+wkJA@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.142]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxfont: fix for CVE-2014-0209 CVE-2014-0210 CVE-2014-0211
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
X-List-Received-Date: Wed, 23 Jul 2014 08:31:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjMs
IDIwMTQgNDoyNyBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogT0UtY29yZQ0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gbGlieGZvbnQ6IGZpeCBmb3IgQ1ZFLTIw
MTQtMDIwOSBDVkUtMjAxNC0wMjEwIENWRS0yMDE0LTAyMTENCj4gDQo+IE9uIDIzIEp1bHkgMjAx
NCAwOTowNCwgIDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gMDAwMS1D
VkUtMjAxNC0wMjA5LWludGVnZXItb3ZlcmZsb3ctb2YtcmVhbGxvYy1zaXplLWluLUZvLnBhdGNo
DQo+ID4gQ1ZFLTIwMTQtMDIwOToNCj4gPiBNdWx0aXBsZSBpbnRlZ2VyIG92ZXJmbG93cyBpbiB0
aGUgKDEpIEZvbnRGaWxlQWRkRW50cnkgYW5kDQo+ID4gKDIpIGxleEFsaWFzIGZ1bmN0aW9ucyBp
biBYLk9yZyBsaWJYZm9udCBiZWZvcmUgMS40LjggYW5kIDEuNC45eA0KPiA+IGJlZm9yZSAxLjQu
OTkuOTAxIG1pZ2h0IGFsbG93IGxvY2FsIHVzZXJzIHRvIGdhaW4gcHJpdmlsZWdlcyBieSBhZGRp
bmcNCj4gPiBhIGRpcmVjdG9yeSB3aXRoIGEgbGFyZ2UgZm9udHMuZGlyIG9yIGZvbnRzLmFsaWFz
IGZpbGUgdG8gdGhlIGZvbnQNCj4gPiBwYXRoLCB3aGljaCB0cmlnZ2VycyBhIGhlYXAtYmFzZWQg
YnVmZmVyIG92ZXJmbG93LCByZWxhdGVkIHRvDQo+ID4gbWV0YWRhdGEuDQo+ID4NCj4gPiBDVkUt
MjAxNC0wMjEwOg0KPiA+IE11bHRpcGxlIGJ1ZmZlciBvdmVyZmxvd3MgaW4gWC5PcmcgbGliWGZv
bnQgYmVmb3JlIDEuNC44IGFuZCAxLjQuOXgNCj4gPiBiZWZvcmUgMS40Ljk5LjkwMSBhbGxvdyBy
ZW1vdGUgZm9udCBzZXJ2ZXJzIHRvIGV4ZWN1dGUgYXJiaXRyYXJ5IGNvZGUNCj4gPiB2aWEgYSBj
cmFmdGVkIHhmcyBwcm90b2NvbCByZXBseSB0byB0aGUNCj4gPiAoMSkgX2ZzX3JlY3ZfY29ubl9z
ZXR1cCwgKDIpIGZzX3JlYWRfb3Blbl9mb250LA0KPiA+ICgzKSBmc19yZWFkX3F1ZXJ5X2luZm8s
ICg0KSBmc19yZWFkX2V4dGVudF9pbmZvLA0KPiA+ICg1KSBmc19yZWFkX2dseXBocywgKDYpIGZz
X3JlYWRfbGlzdCwgb3INCj4gPiAoNykgZnNfcmVhZF9saXN0X2luZm8gZnVuY3Rpb24uDQo+ID4N
Cj4gPiBDVkUtMjAxNC0wMjExOg0KPiA+IE11bHRpcGxlIGludGVnZXIgb3ZlcmZsb3dzIGluIHRo
ZSAoMSkgZnNfZ2V0X3JlcGx5LA0KPiA+ICgyKSBmc19hbGxvY19nbHlwaHMsIGFuZCAoMykgZnNf
cmVhZF9leHRlbnRfaW5mbyBmdW5jdGlvbnMgaW4gWC5PcmcNCj4gPiBsaWJYZm9udCBiZWZvcmUg
MS40LjggYW5kIDEuNC45eCBiZWZvcmUgMS40Ljk5LjkwMSBhbGxvdyByZW1vdGUgZm9udA0KPiA+
IHNlcnZlcnMgdG8gZXhlY3V0ZSBhcmJpdHJhcnkgY29kZSB2aWEgYSBjcmFmdGVkIHhmcyByZXBs
eSwgd2hpY2gNCj4gPiB0cmlnZ2VycyBhIGJ1ZmZlciBvdmVyZmxvdy4NCj4gDQo+IEkgc2VudCBh
biB1cGdyYWRlIHRvIDEuNS4wIHllc3RlcmRheSwgd2hpY2ggaGFzIGFsbCBvZiB0aGVzZSBpbnRl
Z3JhdGVkLg0KDQpPaCwgc29ycnkgSSBkaWRuJ3Qgbm90aWNlIHRoYXQsIHRoYW5rcyBmb3IgcmVt
aW5kaW5nLg0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4gUm9zcw0K

