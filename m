Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.5655.1604013946099715501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 16:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=tgNVac5B;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: Hd7sbcSWz5GvIwWXiZ08SdUMbPYunCPBg/pF3A05hRCKUnu7kx0kIlUM5jVil8YS9v264qJque
 q6UdgMjOSqvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="186328595"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="186328595"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 16:25:44 -0700
IronPort-SDR: P83IApkCSreRb1UDf4FzXy+RyWxwMg5ReaO38oa464itsPEuhQET25sLjy8Cio+hf+L/ATd7kE
 vNwdHME8j+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="361666945"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 16:25:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:25:44 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:25:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Oct 2020 16:25:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 29 Oct 2020 16:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPTaQ2Guq2iIY10vy9ZjgPVhEZ5+MIBI7H0NZVdps/mNTXGpqJT6hPZPvfKjdiGbhmfbwTbNiemTF2z9gZDCvZs2ik0RdKu/YR/MYsLMaToXt0727vYUl2ISjP7ruWGoBVdbo3C09MCHYxPUfzavkevfoHzs0Hh0jhROwlfmNnhgVjGYxxv9YQqZ4kFKzEqI8vb4Wa3NcHsaMWbTJTSW2n+P8vG5rqYyZv5doEqIsE6y9wjRVwBxkvznqQfgcl0+jKsX3+XZCHRWdsYkS3vpGlbd23xTKhDsR9c9d/vw7AdQAVaFJdjFKx7jtbPiHaO319sVfwj8ZViFBlqP8UemHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prI6DmysqGvd1jPrNJfzyoihYfbiXzub+Xj/szliyHI=;
 b=ElKlsEbeQSM+tWXmH8EJf+M1JM4Q7pml78cozTgbJchtws4dHfj9q3Mow6e7lWImqmuGsowXbWPXABOeN8NBbOaJklfAspOUmj7R2P7CcS8/Ogb1bgqhJ7TEAgStfKWiMmfad8URtr7M7ybYIy5xpqVgY8rrG9lUDjF382OuazGE0nTKRlYitAR2K2p9TE7HcnMO7Zs2WatNDUhfsEpJ73Tu8brn7mhdaFf5VVTsv4UmVj7ei5gmv0+9L4CRUs5++tajbee9quJZbtJLJab2W35/2ZILnk8O1K51Hnrvqh1uhL0De0aKj1wnD1svoD+/xk27m/ADLJbDQECxiK1s2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prI6DmysqGvd1jPrNJfzyoihYfbiXzub+Xj/szliyHI=;
 b=tgNVac5BYwJzWmVRX0syGULu1eSq+xw00oBuosZBHDWTtBgc6DnA15SMqZCa0WAqPBpH6+J9hZ0kFIW0G/gxqbHqCBC9CNuK5BRe8Kj4AC+MHb5UIexDADfRluwHEsvsL5qiybhwrUuw4G3kmq2XprfxxKfet4a7/mqKRsm8UPg=
Received: from BN6PR11MB1474.namprd11.prod.outlook.com (2603:10b6:405:c::17)
 by BN6PR1101MB2308.namprd11.prod.outlook.com (2603:10b6:405:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Thu, 29 Oct
 2020 23:25:20 +0000
Received: from BN6PR11MB1474.namprd11.prod.outlook.com
 ([fe80::25da:aa60:5875:71fe]) by BN6PR11MB1474.namprd11.prod.outlook.com
 ([fe80::25da:aa60:5875:71fe%12]) with mapi id 15.20.3477.028; Thu, 29 Oct
 2020 23:25:20 +0000
From: jay.shen.teoh@intel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/manual/bsp-hw.json : removal of click_terminal_icon_on_X_desktop manual test because of automated
Thread-Topic: [OE-core] [PATCH 1/2] oeqa/manual/bsp-hw.json : removal of
 click_terminal_icon_on_X_desktop manual test because of automated
Thread-Index: AQHWrS/VMTjzuK35GE6XLdm5j0hCUamvOtXA
Date: Thu, 29 Oct 2020 23:25:20 +0000
Message-ID: <BN6PR11MB1474BDA612C31D1C916136FFBB140@BN6PR11MB1474.namprd11.prod.outlook.com>
References: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>
 <517b18e0bd1cafb1d567eb9ec498bbfbbc7930d5.camel@linuxfoundation.org>
In-Reply-To: <517b18e0bd1cafb1d567eb9ec498bbfbbc7930d5.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.132.139.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8587ecab-759a-44fa-23cf-08d87c61e746
x-ms-traffictypediagnostic: BN6PR1101MB2308:
x-microsoft-antispam-prvs: <BN6PR1101MB23085462CB2E8A78BED73685BB140@BN6PR1101MB2308.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7uwNZSwOKmBE8a6ySWcmmoJaSSsxfie8zC5tQgYmtaZVHZJAdXE6JrFSZRnDp57Z23unTUKl4iKhFmWCoiDr4Dz2h+poz9l0psg2N/s8HuSY4/q6H6ntZmySrU7y6R8ngI4iMudIaaVOUrvWN7fGjERpna279eIdgWXUgmHMKQahE2dNAO+GSuaLu840Hs3nneynM1EPWkHhEoAOBmpts8VJCln0FDDHEssFhw3cbnCd1L4fHrotYxso4DNH2LpU5P6nAcwCFv8Nm7Hl1CI+6vFUt146MsDofZgcUX2gDz/j+YO9Rd5hyOIQrqdwvX0xHzAbbyzihTLrTwWuOqqBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(76116006)(26005)(8936002)(52536014)(110136005)(66946007)(83380400001)(2906002)(66556008)(478600001)(7696005)(86362001)(71200400001)(4001150100001)(53546011)(66446008)(5660300002)(316002)(64756008)(33656002)(186003)(9686003)(66476007)(8676002)(6506007)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: FQ5y5FCOyKbsf4WUentjO9Dr0YJKtm9ch9ywNak47IkxwnCQMBO6XlpR30o+5QbnN7jbTN0T3CNElrgyf3W9M9imVbq8ff1MIvjN/yNqNGbpYsGMcQCMgP+NtHzFqkYXK6VWI6G3gJ0uA9xu2/YA+HRTLow4sLdGzDvy7ESx9AHLm7faOL3i0Shu4pHdWBUFZhH3qsB5kbgDG8N8IgFmnmmw6pgS/ufsIy9nDmUA7d5I91Ir23vDw2zYHNid2X1MEwk1SbT+8zeQcMRTaBSRzg+ruO2/5uoOqPTdkbYeuAYwRTS1vG8S7bMEa3gGOJHH70uxmo8vLG+qJJraSfWJcNRgLzakT9Q7O3uP1EcfxHvJTWib3IcekEQO8y01ju9wHV01k74qsR4Y2FfVpwi0TvhmKjKhoNCbn+GRmdaHGfmvIz0WMZfKSt5aMSKBuvSlfokEI5jyEiurF5bns1+dT1mOyobrvgXkHG1qE1oKrYPcncEgtk+KRVRYWwyxYwZq6BoQZUAv6aUjQiE5PM4c2tpE5ZvHrDzipqTVcSP1NVMHAEfYrug8h0q/m8uYfIYL5Y4U8i/OX3ZslDnL33Er+5x9DekNG7E2vwN+jm5otiZyqPPdGKNBu9o1TZBNIK+M2rma5SoGvZNTCT2eyRuw0g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8587ecab-759a-44fa-23cf-08d87c61e746
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 23:25:20.5311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4moEzpACweVmARmU5QDz6gq+PC51bHuHKRppSOgUYKS22XCZNPVhuTjAxR/bT6AM12glS0JT2iwFBjmZGheM5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2308
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KTm90ZWQgd2l0aCB0aGFua3MuIEkgd2lsbCByZXdvcmsgb24gdGhlIHRl
c3QgY2FzZS4NCg0KVGhhbmtzLA0KVGVvaCBKYXkgU2hlbg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+IA0KU2VudDogV2VkbmVzZGF5LCAyOCBPY3RvYmVyLCAyMDIwIDk6NDAgUE0NClRv
OiBUZW9oLCBKYXkgU2hlbiA8amF5LnNoZW4udGVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCAxLzJdIG9lcWEvbWFudWFsL2JzcC1ody5qc29uIDogcmVtb3ZhbCBvZiBjbGlja190ZXJtaW5h
bF9pY29uX29uX1hfZGVza3RvcCBtYW51YWwgdGVzdCBiZWNhdXNlIG9mIGF1dG9tYXRlZA0KDQpP
biBXZWQsIDIwMjAtMTAtMjggYXQgMTE6NDAgKzA4MDAsIGpheS5zaGVuLnRlb2hAaW50ZWwuY29t
IHdyb3RlOg0KPiBGcm9tOiBUZW9oIEpheSBTaGVuIDxqYXkuc2hlbi50ZW9oQGludGVsLmNvbT4N
Cj4gDQo+IHJlbW92aW5nIGNsaWNrX3Rlcm1pbmFsX2ljb25fb25fWF9kZXNrdG9wIG1hbnVhbCB0
ZXN0IGFzIHRoaXMgZnVuY3Rpb24gaXMgbm93IHRlc3RlZCBieSB0ZXJtaW5hbC5weSBhdXRvbWF0
ZWQgcnVudGltZSB0ZXN0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUZW9oIEpheSBTaGVuIDxqYXku
c2hlbi50ZW9oQGludGVsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL2xpYi9vZXFhL21hbnVhbC9ic3At
aHcuanNvbiB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL21hbnVhbC9i
c3AtaHcuanNvbiBiL21ldGEvbGliL29lcWEvbWFudWFsL2JzcC1ody5qc29uDQo+IGluZGV4IDc1
Yjg5NzUuLjc5MGMwYzAgMTAwNjQ0DQo+IC0tLSBhL21ldGEvbGliL29lcWEvbWFudWFsL2JzcC1o
dy5qc29uDQo+ICsrKyBiL21ldGEvbGliL29lcWEvbWFudWFsL2JzcC1ody5qc29uDQo+IEBAIC0z
NjUsMjggKzM2NSw2IEBADQo+ICAgICAgfSwNCj4gICAgICB7DQo+ICAgICAgICAgICJ0ZXN0Ijog
ew0KPiAtICAgICAgICAgICAgIkBhbGlhcyI6ICJic3BzLWh3LmJzcHMtaHcuY2xpY2tfdGVybWlu
YWxfaWNvbl9vbl9YX2Rlc2t0b3AiLA0KPiAtICAgICAgICAgICAgImF1dGhvciI6IFsNCj4gLSAg
ICAgICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICAgICAgICAgICJlbWFpbCI6ICJhbGV4YW5k
cnUuYy5nZW9yZ2VzY3VAaW50ZWwuY29tIiwNCj4gLSAgICAgICAgICAgICAgICAgICAgIm5hbWUi
OiAiYWxleGFuZHJ1LmMuZ2Vvcmdlc2N1QGludGVsLmNvbSINCj4gLSAgICAgICAgICAgICAgICB9
DQo+IC0gICAgICAgICAgICBdLA0KPiAtICAgICAgICAgICAgImV4ZWN1dGlvbiI6IHsNCj4gLSAg
ICAgICAgICAgICAgICAiMSI6IHsNCj4gLSAgICAgICAgICAgICAgICAgICAgImFjdGlvbiI6ICJB
ZnRlciBzeXN0ZW0gbGF1bmNoIGFuZCBYIHN0YXJ0IHVwLCBjbGljayB0ZXJtaW5hbCBpY29uIG9u
IGRlc2t0b3AiLA0KPiAtICAgICAgICAgICAgICAgICAgICAiZXhwZWN0ZWRfcmVzdWx0cyI6ICIi
DQo+IC0gICAgICAgICAgICAgICAgfSwNCj4gLSAgICAgICAgICAgICAgICAiMiI6IHsNCj4gLSAg
ICAgICAgICAgICAgICAgICAgImFjdGlvbiI6ICJDaGVjayBpZiBvbmx5IG9uZSB0ZXJtaW5hbCB3
aW5kb3cgbGF1bmNoZWQgYW5kIG5vIG90aGVyIHByb2JsZW0gbWV0IiwNCj4gLSAgICAgICAgICAg
ICAgICAgICAgImV4cGVjdGVkX3Jlc3VsdHMiOiAiVGhlcmUgc2hvdWxkIGJlIG5vIHByb2JsZW0g
YWZ0ZXIgbGF1bmNoaW5nIHRlcm1pbmFsIC4gIg0KPiAtICAgICAgICAgICAgICAgIH0NCj4gLSAg
ICAgICAgICAgIH0sDQo+IC0gICAgICAgICAgICAic3VtbWFyeSI6ICJjbGlja190ZXJtaW5hbF9p
Y29uX29uX1hfZGVza3RvcCINCj4gLSAgICAgICAgfQ0KPiAtICAgIH0sDQo+IC0gICAgew0KPiAt
ICAgICAgICAidGVzdCI6IHsNCg0KSSdtIGFmcmFpZCB0aGlzIHRlc3RjYXNlIGRvZXMgbm90IG1h
dGNoIHdoYXQgdGVybWluYWwucHkgaXMgdGVzdGluZy4NClRoZSB0ZXN0IGhlcmUgaXMgdG86DQoN
CmEpIGNoZWNrIGl0IGxhdW5jaGVzDQpiKSBjaGVjayB0aGVyZSBpcyBvbmx5IG9uZSB0ZXJtaW5h
bA0KDQphbmQgdGhlIHRlc3QgaW4gdGVybWluYWwucHkgZG9lcyBuZWl0aGVyIG9mIHRoZXNlIHRo
aW5ncy4NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0K
