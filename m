Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0111.outbound.protection.outlook.com [157.56.110.111])
	by mail.openembedded.org (Postfix) with ESMTP id 22DAB60444
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 09:14:55 +0000 (UTC)
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) by
	BN3PR0301MB1170.namprd03.prod.outlook.com (10.160.156.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 31 Jul 2015 09:14:53 +0000
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) by
	BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) with
	mapi id 15.01.0225.018; Fri, 31 Jul 2015 09:14:53 +0000
From: Zhu Carol <B54851@freescale.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Thread-Topic: [OE-core] [poky][PATCH v5] pulseaudio: Revert "launch: Avoid
	specifically starting PA and rely on autospawn/socket activation"
Thread-Index: AQHQyrfHD6AsIPMT4EigqX6tEarY0p30FgwAgAEy6uA=
Date: Fri, 31 Jul 2015 09:14:52 +0000
Message-ID: <BN3PR0301MB117286CB1CCE90576BA12E4D868A0@BN3PR0301MB1172.namprd03.prod.outlook.com>
References: <1438283162-12897-1-git-send-email-b54851@freescale.com>
	<1438283162-12897-2-git-send-email-b54851@freescale.com>
	<1438267256.10150.43.camel@tkkaskin-mobl3.ger.corp.intel.com>
In-Reply-To: <1438267256.10150.43.camel@tkkaskin-mobl3.ger.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [192.158.241.86]
x-microsoft-exchange-diagnostics: 1; BN3PR0301MB1170;
	5:QJWQb+26uCp47F+/pTmAKwD0jH4UXiJbpRGpE5qS+1bz92ixIrdpCXthmS8ZJ2jw6aGWFm3yd1fVkx0T7l7QZXcxZ8kcS8F/7IwbWUQuLRn4MTSO5yiTk3nTjetAF+jKD/enfdq9YfvURTwQDPq31Q==;
	24:qAzPmLuBA/Kdugy6Fk5/Mc81nkEe22z+FjeT5R2qjnhmDdjekXM+sCwtUYgeI3CLg1mk0maxl19LDH/PpsE+Sc2XnSPWevHciyegOytBkFg=;
	20:RMKhUTzBdDPJQ5zEiSiXSbYVG5O+WNM2P0EY8e126b158wc+WfMqVz7iA3jxLZdv8tQzhU43gLAjQRVlooEVDw==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1170;
bn3pr0301mb1170: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR0301MB117001043B651FA5C8A6CC00868A0@BN3PR0301MB1170.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1170; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1170; 
x-forefront-prvs: 0654257CF5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(377424004)(13464003)(76176999)(66066001)(87936001)(92566002)(50986999)(2656002)(54356999)(5002640100001)(40100003)(74316001)(110136002)(122556002)(77156002)(99286002)(2950100001)(46102003)(106116001)(189998001)(62966003)(77096005)(102836002)(5001960100002)(19580405001)(86362001)(76576001)(5003600100002)(2900100001)(33656002)(5890100001)(19580395003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1170;
	H:BN3PR0301MB1172.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2015 09:14:52.9079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1170
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v5] pulseaudio: Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
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
X-List-Received-Date: Fri, 31 Jul 2015 09:14:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGFudSwNCiAgIFdlIGhhZCBhIHRyeSBhYm91dCB5b3VyIHN1Z2dlc3Rpb24gIiBlbmFibGUg
YXV0b3NwYXduaW5nIGZvciByb290IGJ5IGFkZGluZyAiYWxsb3ctYXV0b3NwYXduLWZvci1yb290
ID0geWVzIiB0byBjbGllbnQuY29uZi4NCiAgIEl0IHNlZW1zIGFuIHVua25vd24gdmFsdWUuDQog
ICBUaGUgbG9nIGlzIGF0dGFjaGVkOg0KICAgVzogW3B1bHNlYXVkaW9dIG1haW4uYzogVGhpcyBw
cm9ncmFtIGlzIG5vdCBpbnRlbmRlZCB0byBiZSBydW4gYXMgcm9vdCAodW5sZXNzIC0tc3lzdGVt
IGlzIHNwZWNpZmllZCkuDQogICBFOiBbcHVsc2VhdWRpb10gY29uZi1wYXJzZXIuYzogWy9ldGMv
cHVsc2UvY2xpZW50LmNvbmY6MzVdIFVua25vd24gbHZhbHVlICdhbGxvdy1hdXRvc3Bhd24tZm9y
LXJvb3QnIGluIHNlY3Rpb24gJ24vYScuDQogICBFOiBbYXV0b3NwYXduXSBjb3JlLXV0aWwuYzog
SG9tZSBkaXJlY3Rvcnkgbm90IGFjY2Vzc2libGU6IFBlcm1pc3Npb24gZGVuaWVkDQogICBXOiBb
YXV0b3NwYXduXSBsb2NrLWF1dG9zcGF3bi5jOiBDYW5ub3QgYWNjZXNzIGF1dG9zcGF3biBsb2Nr
Lg0KICAgRTogW3B1bHNlYXVkaW9dIG1haW4uYzogRmFpbGVkIHRvIGFjcXVpcmUgYXV0b3NwYXdu
IGxvY2sNCiAgIA0KDQpCLlIuDQpZdXFpbmcgWmh1DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBUYW51IEthc2tpbmVuIFttYWlsdG86dGFudS5rYXNraW5lbkBsaW51eC5pbnRl
bC5jb21dIA0KU2VudDogVGh1cnNkYXksIEp1bHkgMzAsIDIwMTUgMTA6NDEgUE0NClRvOiBaaHUg
WXVxaW5nLUI1NDg1MQ0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3Bva3ldW1BBVENIIHY1XSBwdWxzZWF1ZGlvOiBS
ZXZlcnQgImxhdW5jaDogQXZvaWQgc3BlY2lmaWNhbGx5IHN0YXJ0aW5nIFBBIGFuZCByZWx5IG9u
IGF1dG9zcGF3bi9zb2NrZXQgYWN0aXZhdGlvbiINCg0KT24gRnJpLCAyMDE1LTA3LTMxIGF0IDAz
OjA2ICswODAwLCBZdXFpbmcgWmh1IHdyb3RlOg0KPiBQdWxzZWF1ZGlvIGlzIGFsd2F5cyBzdGFy
dGVkIGJ5IGF1dG9zcGF3biwgd2hpY2ggaXMgdGhlcmUgaXMgZGVmYXVsdCANCj4gcHJvY2VzcyBp
biBzeXN0ZW0sIGl0IHdpbGwgc3RhcnQgdGhlIHB1bHNlYXVkaW8gZGFlbW9uIGFuZCB0aGUgc2Vz
c2lvbiBpcyBhbHdheXMgZXhpc3QsIHNvIHB1bHNlYXVkaW8gZGFlbW9uIHdpbGwgYmUgY2xvc2Vk
Lg0KPiANCj4gQnV0IGluIHlvY3RvLCBwdWxzZWF1ZGlvIG9ubHkgY2FuIGJlIHN0YXJ0ZWQgYnkg
Ym9vdCB1cCBzY3JpcHQsIHRoZXJlIGlzIG5vIHByb2Nlc3MgdG8gc3RhcnQgdGhlIHB1bHNlYXVk
aW8gZGFlbW9uLg0KPiBCdXQgdGhpcyBwYXRjaCByZW1vdmUgdGhlIHN0YXJ0aW5nIFBBIGluIHNj
cmlwdCwgdGhlbiBwdWxzZWF1ZGlvIHdpbGwgYmUgc3RhcnRlZCBpbiB5b2N0by4NCg0KU29ycnks
IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gc2F5IGluIHRoZSBjb21t
aXQgbWVzc2FnZS4NCg0KVGhlIHBhdGNoIGluZGljYXRlcyB0aGF0IHlvdSdyZSBoYXZpbmcgdHJv
dWJsZSB3aXRoIHN0YXJ0aW5nIFB1bHNlQXVkaW8uDQpJdCBsb29rcyBsaWtlIGF1dG9zcGF3bmlu
ZyBpc24ndCB3b3JraW5nIGluIHlvdXIgc2V0dXAuIFRoZSBsaWtlbHkgZXhwbGFuYXRpb25zIGZv
ciB0aGF0IGFyZSB0aGF0IGVpdGhlciB5b3UgaGF2ZSBkaXNhYmxlZCBhdXRvc3Bhd25pbmcsIG9y
IHlvdSdyZSB0cnlpbmcgdG8gYWNjZXNzIFB1bHNlQXVkaW8gYXMgcm9vdC4NCg0KSWYgeW91IGhh
dmUgZGlzYWJsZWQgYXV0b3NwYXduaW5nLCB0aGVuIHRvIGJlIGFibGUgdG8gb2ZmZXIgYWR2aWNl
LCBJJ2QgbmVlZCB0byBrbm93IHdoeSB5b3UgaGF2ZSBkaXNhYmxlZCBpdC4NCg0KSWYgeW91J3Jl
IHRyeWluZyB0byBhY2Nlc3MgUHVsc2VBdWRpbyBhcyByb290LCB0aGVuIEkgc3VwcG9zZSB5b3Un
cmUgcnVubmluZyBhIGdyYXBoaWNhbCBzZXNzaW9uIGFzIHJvb3QgKHN0YXJ0LXB1bHNlYXVkaW8t
eDExIGlzIHJlbGV2YW50IGZvciBncmFwaGljYWwgc2Vzc2lvbnMgb25seSkuIFRoYXQgZG9lc24n
dCB3b3JrIG91dCBvZiB0aGUgYm94LCBiZWNhdXNlIGluIG11bHRpLXVzZXIgZW52aXJvbm1lbnRz
IHJ1bm5pbmcgUHVsc2VBdWRpbyBhcyByb290IGNhbiBlYXNpbHkgY2F1c2UgdHJvdWJsZSBmb3Ig
b3RoZXIgdXNlcnMsIHNvIGF1dG9zcGF3bmluZyBpcyBub3QgYWxsb3dlZCBmb3Igcm9vdC4gSWYg
dGhlcmUgYXJlIG5vIHJlZ3VsYXIgdXNlcnMgaW4gdGhlIHN5c3RlbSwgaG93ZXZlciwgeW91IGNh
biBlbmFibGUgYXV0b3NwYXduaW5nIGZvciByb290IGJ5IGFkZGluZyAiYWxsb3ctYXV0b3NwYXdu
LWZvci1yb290ID0geWVzIiB0byBjbGllbnQuY29uZi4gVGhlIHNhdG8gaW1hZ2VzIHVzZSB0aGF0
IG9wdGlvbiwgc2VlIHB1bHNlYXVkaW8tY2xpZW50LWNvbmYtc2F0by5iYi4NCg0KLS0NClRhbnUN
Cg0K

