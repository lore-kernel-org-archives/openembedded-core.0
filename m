Return-Path: <pabisr@cisco.com>
X-Greylist: delayed 578 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Aug 2018 18:30:25 UTC
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by mail.openembedded.org (Postfix) with ESMTP id 69E4978BD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5882; q=dns/txt; s=iport;
	t=1533148227; x=1534357827;
	h=from:to:subject:date:message-id:mime-version;
	bh=Huz2OhLL0d6YXhQDQY74umMbFiussw3P2W0csuJaAbE=;
	b=mchqdpb/PwzzYbuA2/7RjaGscJFLio+s83dF2te2+uzTqws51GwlJnPl
	IBXnQ+VZf0ByMvCL9ctcKIwRJne29gkPWQUjQY5ZjHuiwQF9CjexldzOL
	JJhzih3WakVJzJrCo1dVNz0x6cmEgrPvdqjBBjHnmqEZGEOtrA9wZTAgS 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AYAQD7+GFb/40NJK1bGwEBAQEDAQE?=
	=?us-ascii?q?BCQEBAYJXd2N/KAqDdIgGjiiQY4UagXoLG4RqgywhNBgBAgEBAgEBAm0cAQu?=
	=?us-ascii?q?FYGgBSgIEMCcEgzMBgRtkr3cRgSGBLoRehXqJCBeCAIE5DBOKSzGCJAKaHgk?=
	=?us-ascii?q?CgUOEVIkjgUhFg1mIK5IbAhEUgSQdOIFScBVlAYI+CYxpg2FvjxKBGwEB?=
X-IronPort-AV: E=Sophos;i="5.51,432,1526342400"; 
	d="scan'208,217";a="214183025"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 18:20:48 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id w71IKmfA025093
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 18:20:48 GMT
Received: from xch-rcd-001.cisco.com (173.37.102.11) by XCH-RCD-003.cisco.com
	(173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Wed, 1 Aug 2018 13:20:47 -0500
Received: from xch-rcd-001.cisco.com ([173.37.102.11]) by
	XCH-RCD-001.cisco.com ([173.37.102.11]) with mapi id 15.00.1320.000;
	Wed, 1 Aug 2018 13:20:47 -0500
From: "Ryan Pabis (pabisr)" <pabisr@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Why does Openssl 1.0.2n use libcrypto.so.1.0.2 and not
	libcrypto.so.1.0.0?
Thread-Index: AQHUKcRepg5gj4E+e0SrPrA4l6U+vQ==
Date: Wed, 1 Aug 2018 18:20:47 +0000
Message-ID: <884A0584-E44B-4810-8F02-194B625F24D7@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.e.1.180613
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.116.192.245]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
Subject: Why does Openssl 1.0.2n use libcrypto.so.1.0.2 and not libcrypto.so.1.0.0?
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
X-List-Received-Date: Wed, 01 Aug 2018 18:30:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_884A0584E44B48108F02194B625F24D7ciscocom_"

--_000_884A0584E44B48108F02194B625F24D7ciscocom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLA0KDQpJIGhhdmUgYSBsaWJyYXJ5IHRoYXQgdXNlcyBsaWJjcnlwdG8uc28uMS4wLjAgZnJv
bSBvcGVuc3NsIDEuMC4ybiwgd2hpY2ggaXMgdGhlIGxpYmNyeXB0by5zbyB2ZXJzaW9uIGlmIHlv
dSBkb3dubG9hZCB0aGUgc291cmNlIGNvZGUgdG8gdWJ1bnR1IDE2LjA0IGZyb20gb3BlbnNzbCBh
bmQgY29tcGlsZS4gIEhvd2V2ZXIsIFlvY3RvIFJvY2tvIHVzZXMgdGhlIHNhbWUgb3BlbnNzbCAx
LjAuMm4gdmVyc2lvbiBidXQgaXQgdXNlcyBsaWJjcnlwdG8uc28uMS4wLjIgYW5kIHNldHMgdGhl
IEZJTEVSREVQRU5EU18gdG8gdGhlIHNhbWUuICBUaGlzIGNhdXNlcyBhIGZpbGVfcmRlcHMgaXNz
dWUgZm9yIG1lIGJlY2F1c2UgaXQgc2F5cyBsaWJjcnlwdG8uc28uMS4wLjAoKSg2NGJpdCkgaXMg
bm90IHByb3ZpZGVkLg0KDQpJ4oCZdmUgdHJpZWQgYWRkaW5nLCBERVBFTkRTICs9IOKAnG9wZW5z
c2zigJ0gYW5kIFJQREVQRU5EU19jb25mZCArPSDigJxvcGVuc3Ns4oCdLCB3aXRoIG5vIGx1Y2su
ICBUaGUgb25seSB3YXkgSSBjYW4gZ2V0IGl0IHRvIGNvbXBpbGUgaXMgaWYgSSBtYW51YWxseSBo
YWNrIG15IGxpYnJhcnkgYW5kIGNoYW5nZSBmcm9tIGxpYmNyeXB0by5zby4xLjAuMCB0byBsaWJj
cnlwdG8uc28uMS4wLjIgKGV2ZW4gdGhvdWdoIGl0IHdhcyByZWFsbHkgY29tcGlsZWQgd2l0aCBs
aWJjcnlwdG8uc28uMS4wLjAgYW5kIHRoYXTigJlzIHRoZSBsaWJjcnlwdG8gdmVyc2lvbiBvZiBv
cGVuc3NsIDEuMC4ybikuDQoNCkNhbiBzb21lb25lIHBsZWFzZSBhZHZpc2U/DQoNClJlZ2FyZHMs
DQpSeWFuDQoNCg0KDQo=

--_000_884A0584E44B48108F02194B625F24D7ciscocom_
Content-Type: text/html; charset="utf-8"
Content-ID: <5A07F7EEF168F74787CEAF1E508A2EEE@emea.cisco.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5BbGwsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5JIGhhdmUgYSBsaWJyYXJ5IHRoYXQgdXNlcyBsaWJjcnlwdG8uc28uMS4wLjAgZnJvbSBvcGVu
c3NsIDEuMC4ybiwgd2hpY2ggaXMgdGhlIGxpYmNyeXB0by5zbyB2ZXJzaW9uIGlmIHlvdSBkb3du
bG9hZCB0aGUgc291cmNlIGNvZGUgdG8gdWJ1bnR1IDE2LjA0IGZyb20gb3BlbnNzbCBhbmQgY29t
cGlsZS4mbmJzcDsgSG93ZXZlciwgWW9jdG8gUm9ja28gdXNlcyB0aGUNCiBzYW1lIG9wZW5zc2wg
MS4wLjJuIHZlcnNpb24gYnV0IGl0IHVzZXMgbGliY3J5cHRvLnNvLjEuMC4yIGFuZCBzZXRzIHRo
ZSBGSUxFUkRFUEVORFNfIHRvIHRoZSBzYW1lLiZuYnNwOyBUaGlzIGNhdXNlcyBhIGZpbGVfcmRl
cHMgaXNzdWUgZm9yIG1lIGJlY2F1c2UgaXQgc2F5cyBsaWJjcnlwdG8uc28uMS4wLjAoKSg2NGJp
dCkgaXMgbm90IHByb3ZpZGVkLiZuYnNwOw0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5J4oCZdmUgdHJpZWQgYWRkaW5nLCBERVBFTkRTICYjNDM7PSDigJxvcGVu
c3Ns4oCdIGFuZCBSUERFUEVORFNfY29uZmQgJiM0Mzs9IOKAnG9wZW5zc2zigJ0sIHdpdGggbm8g
bHVjay4mbmJzcDsgVGhlIG9ubHkgd2F5IEkgY2FuIGdldCBpdCB0byBjb21waWxlIGlzIGlmIEkg
bWFudWFsbHkgaGFjayBteSBsaWJyYXJ5IGFuZCBjaGFuZ2UgZnJvbSBsaWJjcnlwdG8uc28uMS4w
LjAgdG8gbGliY3J5cHRvLnNvLjEuMC4yDQogKGV2ZW4gdGhvdWdoIGl0IHdhcyByZWFsbHkgY29t
cGlsZWQgd2l0aCBsaWJjcnlwdG8uc28uMS4wLjAgYW5kIHRoYXTigJlzIHRoZSBsaWJjcnlwdG8g
dmVyc2lvbiBvZiBvcGVuc3NsIDEuMC4ybikuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5DYW4gc29tZW9uZSBwbGVhc2UgYWR2aXNlPzxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Unlh
biA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_884A0584E44B48108F02194B625F24D7ciscocom_--
