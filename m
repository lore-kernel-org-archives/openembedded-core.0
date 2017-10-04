Return-Path: <Peter.Marko@siemens.com>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Oct 2017 18:38:41 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 75FFA77EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 18:38:41 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v94IVLIo004323
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 4 Oct 2017 20:31:21 +0200
Received: from ATVIES991UHMSX.ww300.siemens.net
	(atvies991uhmsx.ww300.siemens.net [158.226.163.38])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTPS id v94IVLPN009974
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 Oct 2017 20:31:21 +0200
Received: from ATVIES991UAMSX.ww300.siemens.net ([169.254.1.234]) by
	ATVIES991UHMSX.ww300.siemens.net ([158.226.163.38]) with mapi id
	14.03.0361.001; Wed, 4 Oct 2017 20:31:20 +0200
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Burton, Ross" <ross.burton@intel.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] busybox updating
Thread-Index: AQHTPF3Eesp8fKrDc0KUQ3TxpB/98KLSTA4AgADLV4CAAEG1AIAAHE2AgABH4YCAAEb4UA==
Date: Wed, 4 Oct 2017 18:31:20 +0000
Message-ID: <6D4566C9E07A8D4DAB6F935696920A842450D831@ATVIES991UAMSX.ww300.siemens.net>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
	<bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
	<CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
	<ba1bbc29-6515-e99f-be98-921ccd96c614@siemens.com>
	<CAJTo0LaHrM7r1S4=Qp5AXZMwrH5Qd4Vcn2O5Z2QnDW9Q24wPrw@mail.gmail.com>
In-Reply-To: <CAJTo0LaHrM7r1S4=Qp5AXZMwrH5Qd4Vcn2O5Z2QnDW9Q24wPrw@mail.gmail.com>
Accept-Language: sk-SK, de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.11]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 18:38:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2FuIGJlIHRoYXQgWW91J3JlIHVzaW5nIG9sZCBkZWZjb25maWcgZnJvbSBkaWZmZXJlbnQgbGF5
ZXIgKGUuZy4gbWV0YS1wb2t5KSB2aWEgYmJhcHBlbmQ/DQpQZXRlcg0KDQpPbiAxMC8wNC8yMDE3
IDA2OjEzIFBNLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+IE9uIDQgT2N0b2JlciAyMDE3IGF0IDEy
OjU2LCBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbSANCj4gPG1haWx0bzph
bmRyZWoudmFsZWtAc2llbWVucy5jb20+PiB3cm90ZToNCj4gDQo+ICAgICBJIGhhdmUgdW5wYWNr
ZWQgdGhlIHJwbSBwYWNrYWdlIG92ZXIgY29tbWFuZCAicnBtIC1xcCAtLXNjcmlwdHMNCj4gICAg
IGJ1c3lib3gtMS4yNy4yLXIwLmk1ODYucnBtIiBhbmQgbGlua3MgdG8gL2Jpbi9zaCBsb29rcyBn
b29kIGZvciBtZS4NCj4gDQo+ICAgICB1cGRhdGUtYWx0ZXJuYXRpdmVzIC0taW5zdGFsbCAvYmlu
L3NoIHNoIC9iaW4vYnVzeWJveC5ub3N1aWQgNTANCj4gDQo+IA0KPiBJIHdpcGVkIHRtcCBhbmQg
cmVidWlsZCBidXN5Ym94IGFuZCBpdCdzIHN0aWxsIGxpbmtpbmcgdG8gYnVzeWJveC5zdWlkIGhl
cmUuICANCj4gQW5ub3lpbmdseSBJIGFza2VkIEpvc2h1YSB0byByZXBsaWNhdGUgYW5kIGhlIGNv
bmZpcm1lZCB5b3VyIGJ1c3lib3gubm9zdWlkIGxpbmsuDQo+IA0KPiBBcmdoISA6KA0KPiANCj4g
Um9zcw0KDQo=

