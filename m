Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U0ZLv-0002Nl-9n
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 16:13:32 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Wed, 30 Jan 2013 09:57:36 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Wed, 30 Jan 2013 09:57:44 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	boddingtons.devonintlgroup.com ([10.0.2.7]) with mapi; Wed, 30 Jan 2013
	09:57:44 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jan 2013 09:57:43 -0500
Thread-Topic: [OE-core] [PATCH 17/17] directfb: Explictly disable mesa
Thread-Index: Ac3++YQtqHp/cNjfTQ+sDtRPrMJB8QAAGepg
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045DD8@SOUTHSIDE.devonintlgroup.com>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
	<c9683f65462fdbe2c0f3034f1740fd6bad721bf4.1359554291.git.richard.purdie@linuxfoundation.org>
	<B57A220D1EE1644685BA9AD5C790D20526BE045DD5@SOUTHSIDE.devonintlgroup.com>
	<CAJTo0LbHAy3KDLjAL4hxKhPxm--q20R4KS12e_0YKTAykve1MA@mail.gmail.com>
In-Reply-To: <CAJTo0LbHAy3KDLjAL4hxKhPxm--q20R4KS12e_0YKTAykve1MA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D17EB624CW1009319-01-01
Subject: Re: [PATCH 17/17] directfb: Explictly disable mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 15:13:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAzMCwg
MjAxMyA5OjUzIEFNDQo+IFRvOiBJYW4gR2Vpc2VyDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDE3
LzE3XSBkaXJlY3RmYjogRXhwbGljdGx5IGRpc2FibGUgbWVzYQ0KPiANCj4gT24gMzAgSmFudWFy
eSAyMDEzIDE0OjQzLCBJYW4gR2Vpc2VyIDxpZ2Vpc2VyQGRldm9uaXQuY29tPiB3cm90ZToNCj4g
Pj4gV2l0aG91dCB0aGlzLCBkaXJlY3RmYiBtaWdodCBidWlsZCB3aXRoIG1lc2EgZW5hYmxlZCBp
ZiBwcmVzZW50Lg0KPiA+Pg0KPiA+IElzIGl0IHBvc3NpYmxlIHRvIG1ha2UgdGhpcyB0dW5hYmxl
PyAgV2UgdXNlIGRpcmVjdGZiIHdpdGggdGhlIG1lc2ENCj4gZHJpIGRyaXZlcnMgZm9yIG9wZW5n
bC4gIE1heWJlIGVuYWJsZSBpdCBvbmx5IGlmIHRoZSBkaXN0cm8gZmVhdHVyZXMNCj4gY29udGFp
bnMgb3BlbmdsPw0KPiANCj4gSSB3YXMganVzdCBzYXlpbmcgdG8gUmljaGFyZCB0aGF0IGlmIHNv
bWVvbmUgd2FudHMgaXQsIHdlIGNhbiBlbmFibGUNCj4gaXQuDQo+IA0KPiBCYXNpbmcgb24gdGhl
ICJvcGVuZ2wiIGRpc3RybyBmZWF0dXJlIG1ha2VzIHNvbWUgc2Vuc2UsIGFzIGxvbmcgYXMNCj4g
cGVvcGxlIGFyZSBhd2FyZSBvZiB0aGUgaW50ZXJhY3Rpb24gYmV0d2VlbiBkaXJlY3RmYiBhbmQg
b3BlbmdsLA0KPiBlc3BlY2lhbGx5IG9uIHBsYXRmb3JtcyB3aGVyZSBNZXNhIG1heSBub3QgYmUg
dGhlIEdMIGltcGxlbWVudGF0aW9uLg0KPiANCj4gQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8g
bWFrZSBpdCBhIG5vbi1kZWZhdWx0IFBBQ0tBR0VDT05GSUcgb3B0aW9uLA0KPiBzbyB5b3UgY2Fu
IGVuYWJsZSBpdCBiZWNhdXNlIHlvdSBrbm93IHRoYXQgeW91IGhhdmUgTWVzYSBhcyB5b3VyIEdM
DQo+IHByb3ZpZGVyLg0KDQpOb3cgdGhhdCB5b3Ugc3VnZ2VzdCBpdCBJIGxpa2UgdGhlIFBBQ0tB
R0VDT05GSUcgb3B0aW9uIGJlY2F1c2UgaXRzIHRyaXZpYWwgdG8gd29yayB3aXRoIGZyb20gdGhl
IGRpc3RybyB3aXRob3V0IGltcGFjdGluZyBvdGhlciB0aGluZ3MuICBJdCBhbHNvIHN0cmVhbWxp
bmVzIHRoZSBkZXBlbmRlbmNpZXMgYW5kIGNvbmZpZ3VyZSBvcHRpb25zLiAgVGhhbmtzIQ0KDQo=



