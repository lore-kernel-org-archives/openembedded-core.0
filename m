Return-Path: <sipke.vriend@xilinx.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe005.messaging.microsoft.com [216.32.180.188])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDEE60EE1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 03:09:54 +0000 (UTC)
Received: from mail67-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE028.bigfish.com (10.243.66.91) with Microsoft SMTP Server id
	14.1.225.22; Tue, 7 Jan 2014 03:09:54 +0000
Received: from mail67-co1 (localhost [127.0.0.1])	by mail67-co1-R.bigfish.com
	(Postfix) with ESMTP id BE3253C0160;
	Tue,  7 Jan 2014 03:09:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 0
X-BigFish: VPS0(zzdb82h936eIzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz8275bh8275dh1de097h186068hz2fh95h109h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h906i1155h)
Received-SPF: pass (mail67-co1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail67-co1 (localhost.localdomain [127.0.0.1]) by mail67-co1
	(MessageSwitch) id 1389064192433824_2652;
	Tue,  7 Jan 2014 03:09:52 +0000 (UTC)
Received: from CO1EHSMHS004.bigfish.com (unknown [10.243.78.244])	by
	mail67-co1.bigfish.com (Postfix) with ESMTP id 5C2E4840047;
	Tue,  7 Jan 2014 03:09:52 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO1EHSMHS004.bigfish.com
	(10.243.66.14) with Microsoft SMTP Server id 14.16.227.3;
	Tue, 7 Jan 2014 03:09:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W0N39-0003vJ-TK; Mon, 06 Jan 2014 19:09:51 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"ross.burton@intel.com" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC OE-core/meta/lib] BSP Specific Qemurunner
Thread-Index: Ac8LTyM0cuP22wbdSB+YsK2jQLLpIwABYWyw
Date: Tue, 7 Jan 2014 03:09:50 +0000
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.27]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [RFC OE-core/meta/lib] BSP Specific Qemurunner
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
X-List-Received-Date: Tue, 07 Jan 2014 03:09:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClRoaXMgUkZDIGlzIGEgcHJvcG9zYWwgdG8gYWxsb3cgQlNQIGxheWVycyB0byBzZXR1
cCBxZW11IHdpdGggdGhlaXIgc3BlY2lmaWMNCnJlcXVpcmVtZW50cyBmb3IgdGhlIHRlc3RpbWFn
ZSBvZS1jb3JlIGZ1bmN0aW9uYWxpdHkuDQpUaGUgc3VnZ2VzdGVkIGNoYW5nZXMgd2lsbCBiZSBl
eGVyY2lzZWQgYnkgdGhlIA0KYml0YmFrZSAtYyB0ZXN0aW1hZ2UgPGltYWdlPiANCmNvbW1hbmQu
DQpTaW1pbGFybHkgdG8gdGhlIG9lcWEgdGVzdCBjYXNlcyB0aGlzIHByb3Bvc2FsIGV4dGVuZHMg
dGhlIG1ldGEvbGliL29lcWEgDQpweXRob24gbW9kdWxlcyB0byBhbGxvdyBpbmNsdXNpb24gb2Yg
cHl0aG9uIHV0aWxpdHkgc2NyaXB0cyBpbiB0aGUgQlNQIA0KbGF5ZXJzLg0KQW55IEJTUCBsYXll
ciB3aXNoaW5nIHRvIHN1cHBseSB0aGVpciBvd24gcWVtdSBzZXR1cCB3b3VsZCBuZWVkIHRvIGNy
ZWF0ZQ0KYW4gYXBwcm9wcmlhdGUgbWV0YS1ic3BsYXllci9saWIvb2VxYS91dGlscy88bWFjaGlu
ZT5zdGFydGVyLnB5DQpUaGUgZWZmZWN0IGlzIHRoYXQgdGhlIGxpYi9vZXFhL3V0aWxzL3FlbXVy
dW5uZXIgd2lsbCBlaXRoZXIgYWxsb3cgdGhlIA0KYnNwIGxheWVyIHByb3ZpZGVkIDxtYWNoaW5l
PnN0YXJ0ZXIgdG8gc3Bhd24gcWVtdSBvciBpZiBub3QgcHJvdmlkZWQsIA0Kc3Bhd24gcWVtdSB2
aWEgcnVucWVtdSBhcyBjdXJyZW50bHkuDQpBbiBleGFtcGxlIGJzcCBsYXllciBpcyBhdmFpbGFi
bGUgaGVyZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9zaXBrZS9tZXRhLXhpbGlueC90cmVlL3NpcGtl
L3FlbXVydW5uZXINCndpdGggYWxsIHJlcXVpcmVkIGFkZGl0aW9ucyBpbiB0aGUgbWV0YS14aWxp
bngvbGliIGRpcmVjdG9yeS4NCg0KVGhpcyBSRkMgaXMgdHJpZ2dlcmVkIGJ5IGFuZCBpbmRpcmVj
dGx5IHJlbGF0ZWQgdG8NCkJ1Z3ppbGxhIHJlcG9ydCAicnVucWVtdSBzaG91bGRuJ3QgaGFyZC1j
b2RlIG1hY2hpbmUga25vd2xlZGdlIg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3Jn
L3Nob3dfYnVnLmNnaT9pZD00ODI3DQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgY2Q5NGRkM2Q5YmJhMzJjM2ZkNTU5NTk1ODYxMjhiMjM2ZDFkNGUzNDoNCg0KICBzZWN1cml0
eV9mbGFnczogbW9yZSByZWxvY2F0aW9uIGlzc3VlcyAoMjAxMy0xMi0xOCAxNzoyMzo1NSArMDAw
MCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6
Ly9naXRodWIuY29tL3NpcGtlL29lLWNvcmUvdHJlZS9zaXBrZS9xZW11cnVubmVyDQoNClNpcGtl
IFZyaWVuZCAoNik6DQogIG1ldGE6bGliOm9lcWE6dXRpbHMgQWxsb3cgb3RoZXIgbGF5ZXJzIHRv
IGhhdmUgdXRpbHMgaW4gc2FtZSBuYW1lZA0KICAgIGRpcmVjdG9yeQ0KICBtZXRhOmxpYjpvZXFh
OnV0aWxzOnNzaGNvbnRyb2wgQWxsb3cgYSBub24gcm9vdCB1c2VyIGZvciBzc2ggY29udHJvbA0K
ICBtZXRhOmxpYjpvZXFhOnV0aWxzOnRhcmdldGNvbnRyb2wgQWxsb3cgZm9yIGEgVEVTVF9VU0VS
IHZhcmlhYmxlDQogIG1ldGE6bGliOm9lcWE6dXRpbHM6c3NoY29udHJvbCBBbGxvdyBkaWZmZXJl
bnQgcG9ydCBmb3Igc3NoIGNvbnRyb2wNCiAgbWV0YTpsaWI6b2VxYTp1dGlsczpxZW11cnVubmVy
IE1vdmUgcnVucWVtdSBjb2RlIGludG8gbWV0aG9kDQogIG1ldGE6bGliOm9lcWE6dXRpbHM6cWVt
dXJ1bm5lciBBZGQgYWJpbGl0eSB0byBsYXVuY2ggcWVtdSBmcm9tIHB5dGhvbg0KICAgIHNjcmlw
dA0KDQogbWV0YS9saWIvb2VxYS90YXJnZXRjb250cm9sLnB5ICAgIHwgICAxMSArKystDQogbWV0
YS9saWIvb2VxYS91dGlscy9fX2luaXRfXy5weSAgIHwgICAgMyArDQogbWV0YS9saWIvb2VxYS91
dGlscy9xZW11cnVubmVyLnB5IHwgIDEyMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tDQogbWV0YS9saWIvb2VxYS91dGlscy9zc2hjb250cm9sLnB5IHwgICAgOCArKy0NCiA0
IGZpbGVzIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkNCg0KQ2hl
ZXJzDQpTaXBrZQ0KCgo=



