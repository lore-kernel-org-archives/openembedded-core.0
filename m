Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03E6C60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 10:25:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9GAPrD1002512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 03:25:53 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Thu, 16 Oct 2014 03:25:53 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] mtools: fix broken /usr/bin/lz
Thread-Index: AQHP6GKIrKduLkNDKEC5oHD673Ol7Zwyg63g
Date: Thu, 16 Oct 2014 10:25:52 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD523670@ALA-MBB.corp.ad.wrs.com>
References: <1413365334-374-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LaFVVtrZfnY82BK=VBqeqX=r+3y+MxGUnw6emL+gmO_dg@mail.gmail.com>
In-Reply-To: <CAJTo0LaFVVtrZfnY82BK=VBqeqX=r+3y+MxGUnw6emL+gmO_dg@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtools: fix broken /usr/bin/lz
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
X-List-Received-Date: Thu, 16 Oct 2014 10:25:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIg
MTUsIDIwMTQgNjoyNiBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKQ0KPiBDYzogT0UtY29y
ZQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gbXRvb2xzOiBmaXggYnJva2VuIC91
c3IvYmluL2x6DQo+IA0KPiBPbiAxNSBPY3RvYmVyIDIwMTQgMTA6MjgsICA8amFja2llLmh1YW5n
QHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+ICstICAgICAgICAgICAgICAkKElOU1RBTExfU0NS
SVBUKSAkKHNyY2Rpcikvc2NyaXB0cy8kaiAke0RFU1RESVJ9JChiaW5kaXIpLyRqIDsgXA0KPiA+
ICsrICAgICAgICAgICAgICAkKElOU1RBTExfUFJPR1JBTSkgJChzcmNkaXIpL3NjcmlwdHMvJGoN
Cj4gPiArKyAke0RFU1RESVJ9JChiaW5kaXIpLyRqIDsgXA0KPiANCj4gTWF5YmUgeW91IG1lYW50
IHRvIGluc3RhbGwgYm90aCBzY3JpcHRzIGFuZCBwcm9ncmFtczoNCg0KWWVzLCB0aGFua3MgZm9y
IHBvaW50aW5nIG91dCwgdGhlIGV4cGVjdGVkIHJlc3VsdHMgc2hvdWxkIGJlOg0KDQokIGJ1aWxk
aGlzdG9yeS1kaWZmIA0KcGFja2FnZXMvY29yZTItNjQtcG9reS1saW51eC9tdG9vbHMvbXRvb2xz
OiBGSUxFTElTVDogYWRkZWQgIi91c3IvYmluL21jb21wIC91c3IvYmluL21jaGVjayAvdXNyL2Jp
bi9teHRhciAvdXNyL2Jpbi91eiAvdXNyL2Jpbi90Z3oiDQoNCkkgd2lsbCBzZW5kIHYyIGZvciB0
aGlzLg0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4gJCBidWlsZGhpc3RvcnktZGlmZg0KPiBw
YWNrYWdlcy9jb3JlaTctNjQtcG9reS1saW51eC9tdG9vbHMvbXRvb2xzOiBGSUxFTElTVDogcmVt
b3ZlZCAiL3Vzci9iaW4vdGd6LnRneiIgYWRkZWQNCj4gIi91c3IvYmluL21jb21wIC91c3IvYmlu
L21jaGVjayAvdXNyL2Jpbi9teHRhciAvdXNyL2Jpbi91eiAvdXNyL2Jpbi90Z3oiDQo+IHBhY2th
Z2VzL2NvcmVpNy02NC1wb2t5LWxpbnV4L210b29scy9tdG9vbHM6IFBLR1IgY2hhbmdlZCBmcm9t
IHI2LjAgdG8gcjYuMQ0KPiBwYWNrYWdlcy9jb3JlaTctNjQtcG9reS1saW51eC9tdG9vbHMvbXRv
b2xzOiBQS0dTSVpFIGNoYW5nZWQgZnJvbQ0KPiA5NTQ1ODggdG8gMTgwMzAyICgtODElKQ0KPiAg
ICogRklMRUxJU1Q6IHJlbW92ZWQgIi91c3IvYmluL3Rnei50Z3oiIGFkZGVkICIvdXNyL2Jpbi9t
Y29tcCAvdXNyL2Jpbi9tY2hlY2sgL3Vzci9iaW4vbXh0YXINCj4gL3Vzci9iaW4vdXogL3Vzci9i
aW4vdGd6Ig0KPiANCj4gVGhpcyBwYXRjaCBtZWFucyAvdXNyL2Jpbi90Z3oudGd6IGlzbid0IHNo
aXBwZWQgYW55bW9yZS4NCj4gDQo+IFJvc3MNCg==

