Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3168365C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:54:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98376856"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jul 2015 15:58:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6D7qj5o007693;
	Mon, 13 Jul 2015 15:52:45 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Mon, 13 Jul 2015 15:54:29 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Thread-Topic: [OE-core] [PATCH v2] lighttpd: Fix mod_cgi to avoid it buffers
	data without bound.
Thread-Index: AQHQvT4sKq88Z76cikm1Ux850BcZiJ3ZBCMw
Date: Mon, 13 Jul 2015 07:54:29 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390D7D3@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <CAJTo0LYZttp-EUKvzTr9eysyqVyo2X+aPd7bDya8D-q9Gqk57Q@mail.gmail.com>
	<1436765669-1629-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CAHiDW_FZL13XiintSje+9feoLcnqFoC+RkeuYWJ06EHh_qrcZA@mail.gmail.com>
In-Reply-To: <CAHiDW_FZL13XiintSje+9feoLcnqFoC+RkeuYWJ06EHh_qrcZA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lighttpd: Fix mod_cgi to avoid it buffers data without bound.
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
X-List-Received-Date: Mon, 13 Jul 2015 07:54:31 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gPiArRnJvbTogTGkgeGluIDxsaXhpbi5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+ICtE
YXRlOiBUdWUsIDE2IEp1biAyMDE1IDE5OjAyOjM4ICswOTAwDQo+ID4gK1N1YmplY3Q6IFtQQVRD
SF0gbW9kX2NnaSBidWZmZXJzIGRhdGEgd2l0aG91dCBib3VuZCBzbyBmaXggaXQNCj4gPiArDQo+
ID4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gPiAraXQgd2lsbCBiZSBmaXhlZCBpbiB2
ZXJzaW9uIDEuNS4wDQo+IA0KPiBJcyB0aGlzIHJlYWxseSBpbiBhbiB1cHN0cmVhbSBicmFuY2gg
c29tZXdoZXJlPyBJdCdzIG5vdCBjbGVhciBmcm9tIHRoZSBidWcgdGhhdCBpdA0KPiBpcyAobGFz
dCB1cGRhdGVkIDggeWVhcnMgYWdvLCBubyBjb21tZW50cyBmcm9tIGxpZ2h0dHBkIGRldmVsb3Bl
cnMpLiBJZiB0aGUgcGF0Y2ggaXMNCj4ganVzdCB0YWtlbiBmcm9tIHRoZSBidWcgcmVwb3J0IHRo
ZW4gYSAiVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQNCj4gW2h0dHA6Ly9yZWRtaW5lLmxpZ2h0
dHBkLm5ldC9pc3N1ZXMvMTI2NF0iIHdvdWxkIGJlIG1vcmUgZmFjdHVhbC4NCg0KVGhhbmtzIGZv
ciB5b3VyIHJlcGxheS4NCg0KWWVzLCB0aGlzIHBhdGNoIGlzIHRha2VuIGZyb20gYnVnIHJlcG9y
dCwgc28gaXQgaXMgbm90IGFwcHJvcHJpYXRlIHRvIHNldCBhcyBCYWNrcG9ydC4NCg0KSSB3aWxs
IHNlbmQgcGF0Y2ggdjMuDQoNClRoYW5rcyBhZ2FpbiA6KQ0KDQpSZWdhcmRzLA0KDQpMaSANCg0K

