Return-Path: <william.c.randle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE8E6212F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 17:40:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2016 10:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,480,1455004800"; d="scan'208";a="84529350"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2016 10:40:19 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX109.amr.corp.intel.com ([169.254.11.210]) with mapi id
	14.03.0248.002; Wed, 13 Apr 2016 10:40:19 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "denis@denix.org" <denis@denix.org>, "danismostlikely@gmail.com"
	<danismostlikely@gmail.com>
Thread-Topic: [OE-core] [PATCH] package.bbclass: handle links in sorted order
Thread-Index: AQHRlM8hQTgHBy6iIEyzQEJqAYBXwZ+HAseAgAGdMgCAAALZgA==
Date: Wed, 13 Apr 2016 17:40:19 +0000
Message-ID: <1460569219.21923.2.camel@intel.com>
References: <1460474541-3625-1-git-send-email-william.c.randle@intel.com>
	<20160412165115.GY16135@denix.org>
	<CACS+7ZTTJOohmfe_iY3Y5Hc_FpLVh8Jvbpx9tdBAbifS4COWaQ@mail.gmail.com>
In-Reply-To: <CACS+7ZTTJOohmfe_iY3Y5Hc_FpLVh8Jvbpx9tdBAbifS4COWaQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.4.174]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: handle links in sorted order
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
X-List-Received-Date: Wed, 13 Apr 2016 17:40:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AFC7047D58DE14CBEA31235391FD14C@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA0LTEzIGF0IDExOjMwIC0wNjAwLCBEYW4gTWNHcmVnb3Igd3JvdGU6DQoN
Ck9uIDEyIEFwcmlsIDIwMTYgYXQgMTA6NTEsIERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5p
eC5vcmc8bWFpbHRvOmRlbmlzQGRlbml4Lm9yZz4+IHdyb3RlOg0KDQoNCk9uIFR1ZSwgQXByIDEy
LCAyMDE2IGF0IDA4OjIyOjIxQU0gLTA3MDAsIEJpbGwgUmFuZGxlIHdyb3RlOg0KDQoNCldoZW4g
cHJvY2Vzc2luZyBsaW5rcywgdGhlIGRpcmVjdG9yaWVzIGFyZSBwcm9jZXNzZWQgaW4gdW5zb3J0
ZWQgb3JkZXINCndoaWNoIGNhbiByZXN1bHQgaW4gY2FzZXMgbGlrZSAvdmFyL2xvY2sgLT4gL3J1
bi9sb2NrIGhhbmRsZWQgYmVmb3JlDQovdmFyL3J1biAtPiAvcnVuIHRocm93aW5nIGFuIGVycm9y
IGZvciAvdmFyL3J1biBiZWNhdXNlIC9ydW4gYWxyZWFkeSBleGlzdHMuDQpDaGFuZ2UgdGhlIGxp
bmsgcHJvY2Vzc2luZyB0byBlbnN1cmUgbGlua3MgYXJlIHByb2Nlc3NlZCBpbiBzb3J0ZWQgb3Jk
ZXIgb2YNCnRoZSBkZXN0aW5hdGlvbi4NCg0KDQoNClNlZW1zIHRvIHJlc29sdmUgdGhlIGlzc3Vl
IGZvciBtZS4NCg0KDQoNCg0KDQpGb3IgbWUgaXQgaW50cm9kdWNlcyBhIG5ldyBpc3N1ZS4gSSB1
c2UgdHdvIHBlcm0gZmlsZXMsIHRoZSBPRSBkZWZhdWx0DQpvbmUsIGFuZCBvbmUgdGhhdCBjaGFu
Z2VzIHR3byBsaW5rcyB0byByZWFsIGRpcmVjdG9yaWVzLiBUaGUgbmV3DQpwYWNrYWdpbmcgY29k
ZSBjb21wbGFpbnMgdGhhdCBhIGxpbmsgdGFyZ2V0IGV4aXN0cyBhcyBhIGRpcmVjdG9yeSwNCmV2
ZW4gdGhvdWdoIGEgc3Vic2VxdWVudCBydWxlIHNldHMgaXQgdXAgYXMgYSBkaXJlY3RvcnkuDQoN
CkkgdGhpbmsgZHVyaW5nIHBhcnNpbmcgaXQgc2hvdWxkIHJlbW92ZSBsaW5rcyBhcyBpdCBmaW5k
cyBkaXJlY3Rvcmllcw0Kd2l0aCB0aGUgc2FtZSBwYXRoLCBhbmQgcmVtb3ZlIGRpcmVjdG9yaWVz
IHdpdGggdGhlIHNhbWUgcGF0aCBpbiB0aGUNCm9yZGVyIGl0IHNlZXMgdGhlbSwgdGhhdCB3YXkg
d2hlbiBpdCBkb2VzIHRoZSBpbiBvcmRlciBwcm9jZXNzaW5nIGl0DQp1c2VzIHRoZSBsYXN0IGRl
ZmluaXRpb24gaW4gdGhlIHBlcm1pc3Npb25zIHRhYmxlLg0KDQoNCg0KRGFuLCBjYW4geW91IHBy
b3ZpZGUgYW4gZXhhbXBsZSBwZXJtaXNzaW9ucyBmaWxlIHRoYXQgaWxsdXN0cmF0ZXMgdGhpcz8g
UHJlZmVyYWJseSB2aWEgdGhlIEJ1Z3ppbGxhIGVudHJ5LCBvciBpZiBub3QgY29udmVuaWVudCwg
dGhlbiBoZXJlPw0KDQoNCg0KDQoNCg0KDQpbWU9DVE8gIzk0MzBdDQoNClNpZ25lZC1vZmYtYnk6
IEJpbGwgUmFuZGxlIDx3aWxsaWFtLmMucmFuZGxlQGludGVsLmNvbTxtYWlsdG86d2lsbGlhbS5j
LnJhbmRsZUBpbnRlbC5jb20+Pg0KDQoNCg0KUmVwb3J0ZWQtYnk6IERlbnlzIERteXRyaXllbmtv
IDxkZW55c0B0aS5jb208bWFpbHRvOmRlbnlzQHRpLmNvbT4+DQpUZXN0ZWQtYnk6IERlbnlzIERt
eXRyaXllbmtvIDxkZW55c0B0aS5jb208bWFpbHRvOmRlbnlzQHRpLmNvbT4+DQoNCg0K

