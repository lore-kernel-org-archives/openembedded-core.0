Return-Path: <vedang.patel@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF7A6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490225638; x=1521761638;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=ko6ZbrsnrYlXzIn0KbkFXCaYnIq/QszAY1XCfW3kHN8=;
	b=fw+S6IUEOOYNMqy2r2oM5KUaUHEyS2hIRoloJlEUyogn46BF53Rc95VW
	6F5juuSijSzVPzsvavHQnPmI82DgcQ==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 16:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,206,1486454400"; d="scan'208";a="1125979817"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2017 16:33:55 -0700
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 22 Mar 2017 16:33:55 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.227]) by
	ORSMSX162.amr.corp.intel.com ([169.254.3.101]) with mapi id
	14.03.0319.002; Wed, 22 Mar 2017 16:33:55 -0700
From: "Patel, Vedang" <vedang.patel@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libxslt: Add PACKAGECONFIG support
Thread-Index: AQHSodp9JloWuTDi4kKOdqEqso0XOKGfbi+AgAJWBYCAAADGgIAAIIIAgAAAwQCAABTwAA==
Date: Wed, 22 Mar 2017 23:33:54 +0000
Message-ID: <1490225634.15509.40.camel@intel.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
	<CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
	<1490213829.15509.26.camel@intel.com>
	<CAJTo0LZd1JgF+Zz_-yS5p-HeA1jxrmbxg-G9oP1maVO3rfzfVA@mail.gmail.com>
	<1490220976.15509.34.camel@intel.com>
	<CAJTo0Lasv1GdwKF-R9HfaY=gvuxmENpgavWidVtEQmorX7QMdQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lasv1GdwKF-R9HfaY=gvuxmENpgavWidVtEQmorX7QMdQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.159.64]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Wed, 22 Mar 2017 23:33:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6023E9AC49F7AD409B1E960975EF31FB@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTAzLTIyIGF0IDIyOjE4ICswMDAwLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+
IA0KPiBPbiAyMiBNYXJjaCAyMDE3IGF0IDIyOjE2LCBQYXRlbCwgVmVkYW5nIDx2ZWRhbmcucGF0
ZWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBJIGdvdCBteSBtaXN0YWtlLiBTZXR0aW5nIFBB
Q0tBR0VDT05GSUcgZW5hYmxlZCBhbGwgdGhlIGZlYXR1cmVzIGJ5DQo+ID4gZGVmYXVsdC4gQWxz
bywgc2hvdWxkIEkgYmUgaW5jbHVkaW5nIHB5dGhvbiBhcyBydW50aW1lIGRlcGVuZGVuY3kNCj4g
PiB3aGVuDQo+ID4gLS13aXRoLXB5dGhvbiBpcyB1c2VkPw0KPiA+IA0KPiBObywgdGhlIHJkZXBl
bmRzIHdpbGwgaGFwcGVuIG1hZ2ljYWxseS7CoCBZb3UgbWlnaHQgd2FudCB0byBwYWNrYWdlDQo+
IHRoZSBweXRob24gbW9kdWxlIHNlcGFyYXRlbHkgdGhvdWdoLg0KVGhhbmtzIFJvc3MgZm9yIHRo
ZSBpbnB1dHMuIEkgd2lsbCBzdWJtaXQgYSBuZXcgcGF0Y2ggc29vbi4NCg0KQWxzbywgSSBhbSBw
bGFubmluZyB0byBkcm9wIHRoZSBvdGhlciAzIGZlYXR1cmVzIChkZWJ1ZywgbWVtLWRlYnVnIGFu
ZA0KY3J5cHRvKSBhcyBJIGhhdmUgbm90IHJlYWxseSB0ZXN0ZWQgdGhlbS4NCg0KVGhhbmtzLA0K
VmVkYW5nDQo+IA0KPiBSb3Nz

