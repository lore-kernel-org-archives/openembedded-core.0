Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S56A5-0005Nw-NX
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 02:59:29 +0100
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([fe80::2c09:98d1:4a87:91f6%18]) with mapi id
	14.01.0289.001; Tue, 6 Mar 2012 20:49:49 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] gdk-pixbuf: Pick up ${NM} from the
	environment.
Thread-Index: AQHM+0AkTW11mng2W02Sur0vozU7MZZdWPAAgAC4H6A=
Date: Wed, 7 Mar 2012 01:49:48 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF338079F4@MBX20.4emm.local>
References: <1331000623-10956-1-git-send-email-james@digitalmatter.com.au>
	<1331027106.6166.7.camel@mattotaupa>
In-Reply-To: <1331027106.6166.7.camel@mattotaupa>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH v2] gdk-pixbuf: Pick up ${NM} from the environment.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 01:59:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1lbnplbCBbbWFpbHRv
OnBhdWxlcGFudGVyQHVzZXJzLnNvdXJjZWZvcmdlLm5ldF0NCj4gU2VudDogVHVlc2RheSwgNiBN
YXJjaCAyMDEyIDU6NDUgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gQ2M6IEphbWVzIExpbWJvdXJpcw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCB2Ml0gZ2RrLXBpeGJ1ZjogUGljayB1cCAke05NfSBmcm9tIHRoZQ0KPiBlbnZpcm9u
bWVudC4NCj4gDQo+IERlYXIgSmFtZXMsDQo+IA0KPiANCj4gdGhhbmsgeW91IGZvciBzZW5kaW5n
IGFuIGltcHJvdmVkIHZlcnNpb24gb2YgdGhlIHBhdGNoLg0KPiANCi4uLg0KPiANCj4gYXMgS2hl
bSBhbmQgeW91IGRpc2N1c3NlZCwgaXQgc2hvdWxkIGJlIHVzZWZ1bCBmb3IgdXBzdHJlYW0gWzFd
LiBNYXliZQ0KPiB5b3UgY2FuIGFkZCBtb3JlIGNvbnRleHQgWzJdWzNdLCBzbyB1cHN0cmVhbSBj
YW4gYmV0dGVyIGp1ZGdlIGlmIHRoZXkNCj4gd2FudCBpdC4NCj4gDQouLi4NCj4gDQo+IFRoYW5r
cywNCj4gDQo+IFBhdWwNCj4gDQo+IA0KPiBbMV0gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcv
cGlwZXJtYWlsL29wZW5lbWJlZGRlZC1jb3JlLzIwMTItDQo+IE1hcmNoLzAxODU1NC5odG1sDQo+
IFsyXSBodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b2NvbmYvbWFudWFsL2F1dG9jb25m
LQ0KPiAyLjY3L2h0bWxfbm9kZS9HZW5lcmljLVByb2dyYW1zLmh0bWwNCj4gWzNdIGh0dHA6Ly9s
aXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9idWctbmN1cnNlcy8yMDExLTExL21zZzAwMDExLmh0
bWwNCg0KSGksDQoNClRoaXMgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiBwYXRjaGVkIGZvciBndGsr
LCBhbmQgaXMgbWFya2VkIFVwc3RyZWFtOiBpbmFwcHJvcHJpYXRlIHRoZXJlLg0KSG93ZXZlciwg
SSBjb3VsZG4ndCBmaW5kIGFueSBtZW50aW9uIG9mIEFDX0NIRUNLX1RPT0xTIGluIHRoZSBHbm9t
ZSBidWd6aWxsYSwgc28gSSBoYXZlIHN1Ym1pdHRlZCBidWcgcmVwb3J0cyBmb3IgYm90aCBnZGst
cGl4YnVmIGFuZCBndGsrLg0KDQpodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9NjcxNTE1DQpodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
NjcxNTE2DQoNClJlZ2FyZHMsDQpKYW1lcw0KDQo=


