Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82836C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 15:00:05 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.5556.1665154803117490286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 08:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=pjXpnmZ6;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665154804;
  x=1696690804;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D7mCavDfO+qaBsbdNdyf2lNb15QNZ07i6BQhEY9uPlM=;
  b=pjXpnmZ63WslfRXV0kKq8HVOI5Lgxnfl2JN1s9EgotPZcap7za5gdXQl
   WfEljEitsMO3UKwTjYvEjFd74xx+nfDzUAmfTk+wLAUZstNmY2RIwh8EA
   NOKcxUIxuH0/2wF+FQl0FIMAxNDg+1D56YprNa3FDB5h4SUlcOu/FfOK4
   96HsglWW4s85RwSUU+/HrnvdU1VdvE6MOWMeYifroxOiIKUKylcadKuFf
   An8fT7cSUxhB3YlwgDm0WA9QUBoU3RdgSJJ1hsIUvxojcTUyIs8TAXG2e
   RRC6VRZSUtWfCC3VlIy70Gb0vmj70fHqzWoe6W5WsjhrLP9Kz2rZPhv1v
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Ross Burton
	<Ross.Burton@arm.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Topic: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Index: 
 AQHY2Ba0pZ/Mnm+e6EOezaBaMJzA9K4BG/EAgAAThgCAAAmvAIAABJoAgAADxICAAAUWgIABtt3g
Date: Fri, 7 Oct 2022 15:00:00 +0000
Message-ID: <cdcb6e0a62ca48dab8e2b288f542d956@axis.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
 <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
 <402BFFEF-566A-4A10-B374-E3C3BCFFEC72@arm.com>
 <CADkTA4NsnL2CJ_wRVcwrOwSfWjuWD3gQ4esxrYaieOv1h_Bzrg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NsnL2CJ_wRVcwrOwSfWjuWD3gQ4esxrYaieOv1h_Bzrg@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 15:00:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171527

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEJydWNlIEFzaGZpZWxkDQo+IFNlbnQ6IGRlbiA2IG9r
dG9iZXIgMjAyMiAxNjowMg0KPiBUbzogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+
DQo+IENjOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvM10gcGVyZjogbWFrZSBzY3JpcHRpbmcgZGVwZW5k
IG9uDQo+IHNldHVwdG9vbHMzDQo+IA0KPiBPbiBUaHUsIE9jdCA2LCAyMDIyIGF0IDk6NDMgQU0g
Um9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gNiBP
Y3QgMjAyMiwgYXQgMTQ6MjksIEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5j
b20+IHdyb3RlOg0KPiA+ID4gSSdtIG5vdCBwYXJ0aWN1bGFybHkgY29uY2VybmVkIGlmIHRoZSBl
eHRyYSBSREVQRU5EUyBhcnJpdmVzIHdpdGgNCj4gPiA+IHRoaXMsIHNpbmNlIGlmIGl0IGlzIGFj
Y2VwdGFibGUgZm9yIG90aGVyIHBhY2thZ2VzIGluaGVyaXRpbmcgdGhlDQo+ID4gPiBzZXR1cHRv
b2xzIChJIHRob3VnaHQgaXQgd2FzIGJ1aWxkIHN1cHBvcnQgb25seSEpLCBpdCByZWFsbHkgc2hv
dWxkIGJlDQo+ID4gPiBvayBmb3IgcGVyZiBhcyB3ZWxsLiBJbiBwYXJ0aWN1bGFyIHNpbmNlIHBl
cmYgaXMgZGVidWcvb3B0aW9uYWwuIE9yIGFtDQo+ID4gPiBJIG1pc3Npbmcgc29tZXRoaW5nIHRo
ZXJlID8NCj4gPg0KPiA+IFdpdGggdGhpcyBjaGFuZ2UgdGhlIGJhc2UgcGVyZiBwYWNrYWdlIHdp
bGwgYWx3YXlzIHJ1bnRpbWUtZGVwZW5kIG9uDQo+ID4gcHl0aG9uMywgZXZlbiBpZiBwZXJmLXB5
dGhvbiBpc27igJl0IGluc3RhbGxlZC4gIFRoYXQgc291bmRzIHN1Ym9wdGltYWwuDQo+ID4NCj4g
DQo+IEJ1dCBpcyB0cmlnZ2VyZWQgb24gdGhlICdzY3JpcHRpbmcnIHBhY2thZ2Vjb25maWcsIHdo
aWNoIGRvZXMgbWVhbiB3ZQ0KPiB3YW50IHRoZSBzdXBwb3J0LCBzbyBpdCBpcyBhdCBsZWFzdCBz
b21ld2hhdCBjb25kaXRpb25hbCAuLiBidXQgeWVzLCBJDQo+IGFncmVlIHRoYXQgb25jZSB3ZSd2
ZSBidWlsdCBhbmQgcGFja2FnZWQsIGl0IGRvZXMgbWFrZSBzZW5zZSB0byBrZWVwDQo+IHRoZSBw
eXRob24gZGVwZW5kZW5jaWVzIGluIHRoZSBkZWRpY2F0ZWQgcGFja2FnZS4NCj4gDQo+IExldCBt
ZSByZS13b3JrIHRoaXMgYW5kIGRvIHRoZSByZW1vdmUgb2YgdGhlIFJERVBFTkRTIGFuZCBzZW5k
IGEgdjIuDQo+IA0KPiBCcnVjZQ0KPiANCj4gPiBSb3NzDQoNClRvIG1lIGl0IHNvdW5kcyBhcyB3
aGF0IHNldHVwdG9vbHMzLWJhc2UuYmJjbGFzcyByZWFsbHkgc2hvdWxkIHRvIGlzIA0Kc29tZXRo
aW5nIGxpa2U6DQoNCkZPT0JBUiA/Pz0gIiR7UE59Ig0KUkRFUEVORFM6JHtGT09CQVJ9OmFwcGVu
ZDpjbGFzcy10YXJnZXQgPSAiICR7UFlUSE9OX1BOfS1jb3JlIg0KLi4uDQpGSUxFUzoke0ZPT0JB
Un0gKz0gIiR7bGliZGlyfS8qICR7bGliZGlyfS8ke1BZVEhPTl9ESVJ9LyoiDQoNCnNvIHRoYXQg
dGhlIHR5cGljYWwgUHl0aG9uIG9ubHkgcmVjaXBlcyBjb250aW51ZSB0byBqdXN0IGluaGVyaXQg
DQpzZXR1cHRvb2xzMywgYnV0IHJlY2lwZXMgdGhhdCBwcm9kdWNlIG90aGVyIHBhY2thZ2VzIHRo
YW4gdGhlIA0KUHl0aG9uIHBhY2thZ2UgY2FuIGRvIHNvbWV0aGluZyBsaWtlOg0KDQpGT09CQVIg
PSAiJHtQWVRIT05fUE59LSR7UE59Ig0KDQpVbmZvcnR1bmF0ZWx5IHRoaXMgZG9lcyBub3Qgd29y
ayBhcyBpdCByZXN1bHRzIGluIGEgZ2F6aWxsaW9uIA0Kd2FybmluZ3MgbGlrZToNCg0KV0FSTklO
RzogLi4uL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmlpby9saWJpaW9fZ2l0LmJiOiBWYXJp
YWJsZSBrZXkgRklMRVM6JHtQTn0tJHtQWVRIT05fUE59ICgke1BZVEhPTl9TSVRFUEFDS0FHRVNf
RElSfSkgcmVwbGFjZXMgb3JpZ2luYWwga2V5IEZJTEVTOmxpYmlpby1weXRob24zICggJHtsaWJk
aXJ9LyogJHtsaWJkaXJ9LyR7UFlUSE9OX0RJUn0vKikuDQpXQVJOSU5HOiAuLi4vbWV0YS1vZS9y
ZWNpcGVzLXN1cHBvcnQvbGliaWlvL2xpYmlpb19naXQuYmI6IFZhcmlhYmxlIGtleSBSREVQRU5E
Uzoke1BOfS0ke1BZVEhPTl9QTn0gKCR7UE59ICR7UFlUSE9OX1BOfS1jdHlwZXMgJHtQWVRIT05f
UE59LXN0cmluZ29sZCAke1BZVEhPTl9QTn0tY29yZSkgcmVwbGFjZXMgb3JpZ2luYWwga2V5IFJE
RVBFTkRTOmxpYmlpby1weXRob24zICggJHtQWVRIT05fUE59LWNvcmUpLg0KDQooSSBjaG9zZSBs
aWJpaW8gYXMgaXQgaXMgYW4gZXhhbXBsZSBvZiBhbm90aGVyIHJlY2lwZXMgdGhhdCBjdXJyZW50
bHkgDQpkb2VzIFJERVBFTkRTOiR7UE59OnJlbW92ZSA9ICIke1BZVEhPTl9QTn0tY29yZSIgdG8g
Y291bnRlcmFjdCB3aGF0IA0Kc2V0dXB0b29sczMtYmFzZS5iYmNsYXNzIGRvZXMpLg0KDQo6KA0K
DQovL1BldGVyDQoNCg==

