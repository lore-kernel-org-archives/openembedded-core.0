Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5971C6B389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 08:53:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 Jan 2014 00:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,705,1384329600"; d="scan'208";a="463370921"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2014 00:49:10 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.215]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.135]) with mapi id
	14.03.0123.003; Thu, 23 Jan 2014 08:49:08 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "sipke.vriend@xilinx.com" <sipke.vriend@xilinx.com>
Thread-Topic: [OE-core] [PATCH] lib/oeqa: sshcontrol: Allow alternate port
	for SSHControl
Thread-Index: AQHPGBf6Y1tKXq2Mck6/+t+TX3+U9w==
Date: Thu, 23 Jan 2014 08:49:08 +0000
Message-ID: <1390467018.1197.11.camel@firebird.rb.intel.com>
References: <1f48d283-f35c-4b83-8a25-a914fdb9a8e3@CO1EHSMHS020.ehs.local>
In-Reply-To: <1f48d283-f35c-4b83-8a25-a914fdb9a8e3@CO1EHSMHS020.ehs.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.156]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa: sshcontrol: Allow alternate port for SSHControl
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
X-List-Received-Date: Thu, 23 Jan 2014 08:53:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8349927CF66A8C45B53874F417B52673@intel.com>
Content-Transfer-Encoding: base64

DQoNCg0KT24gVGh1LCAyMDE0LTAxLTIzIGF0IDEwOjM1ICsxMDAwLCBTaXBrZSBWcmllbmQgd3Jv
dGU6DQo+IEFkZCBhbiBvcHRpb25hbCBwYXJhbWV0ZXIgdG8gU1NIQ29udHJvbCBzbyB0aGUgdXNl
ciBjYW4gc3BlY2lmeQ0KPiBhbmQgYWx0ZXJuYXRlIHBvcnQgdG8gdGhlIGRlZmF1bHQgKDIyKS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNpcGtlIFZyaWVuZCA8c2lwa2UudnJpZW5kQHhpbGlueC5j
b20+DQo+IC0tLQ0KPiAgbWV0YS9saWIvb2VxYS91dGlscy9zc2hjb250cm9sLnB5IHwgICAgNCAr
KystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2VxYS91dGlscy9zc2hjb250cm9sLnB5IGIvbWV0
YS9saWIvb2VxYS91dGlscy9zc2hjb250cm9sLnB5DQo+IGluZGV4IGEwZGNmMDIuLjdiZGYyZTcg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvbGliL29lcWEvdXRpbHMvc3NoY29udHJvbC5weQ0KPiArKysg
Yi9tZXRhL2xpYi9vZXFhL3V0aWxzL3NzaGNvbnRyb2wucHkNCj4gQEAgLTEzLDcgKzEzLDcgQEAg
aW1wb3J0IHNlbGVjdA0KPiAgDQo+ICBjbGFzcyBTU0hDb250cm9sKG9iamVjdCk6DQo+ICANCj4g
LSAgICBkZWYgX19pbml0X18oc2VsZiwgaXA9Tm9uZSwgdGltZW91dD0zMDAsIGxvZ2ZpbGU9Tm9u
ZSk6DQo+ICsgICAgZGVmIF9faW5pdF9fKHNlbGYsIGlwPU5vbmUsIHRpbWVvdXQ9MzAwLCBsb2dm
aWxlPU5vbmUsIHBvcnQ9Tm9uZSk6DQo+ICAgICAgICAgIHNlbGYuaXAgPSBpcA0KPiAgICAgICAg
ICBzZWxmLnRpbWVvdXQgPSB0aW1lb3V0DQo+ICAgICAgICAgIHNlbGYuX3N0YXJ0dGltZSA9IE5v
bmUNCj4gQEAgLTI2LDYgKzI2LDggQEAgY2xhc3MgU1NIQ29udHJvbChvYmplY3QpOg0KPiAgICAg
ICAgICAgICAgICAgICctbycsICdMb2dMZXZlbD1FUlJPUicNCj4gICAgICAgICAgICAgICAgICBd
DQo+ICAgICAgICAgIHNlbGYuc3NoID0gWydzc2gnLCAnLWwnLCAncm9vdCddICsgc2VsZi5zc2hf
b3B0aW9ucw0KPiArICAgICAgICBpZiBwb3J0IGlzIG5vdCBOb25lOg0KDQpOaXRwaWNraW5nIHJl
YWxseSwgYnV0ICdpZiBwb3J0Oicgd291bGQgaGF2ZSBiZWVuIG5pY2VyIDstKQ0KDQpDaGVlcnMs
DQpTdGVmYW4NCg0KPiArICAgICAgICAgICAgc2VsZi5zc2ggPSBzZWxmLnNzaCArIFsnLXAnLCBz
dHIocG9ydCldDQo+ICANCj4gICAgICBkZWYgbG9nKHNlbGYsIG1zZyk6DQo+ICAgICAgICAgIGlm
IHNlbGYubG9nZmlsZToNCg0K

