Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA6871B31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:49:19 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 08:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,387,1503385200"; 
	d="scan'208,217";a="163215455"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2017 08:48:44 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 16 Oct 2017 08:48:44 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.30]) by
	ORSMSX111.amr.corp.intel.com ([169.254.12.55]) with mapi id
	14.03.0319.002; Mon, 16 Oct 2017 08:48:43 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] nettle-ptest: fix a failing test
Thread-Index: AQHTRFjYVkd5kHN2v0qeVbI85TIBKKLi4A4AgAPBUvA=
Date: Mon, 16 Oct 2017 15:48:43 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611A2BC51@ORSMSX112.amr.corp.intel.com>
References: <1507922643-81187-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sq-CjSGt36V=B5yjg+diaAMFkH8h-N29t4uMuXNV8_qyA@mail.gmail.com>
In-Reply-To: <CAMKF1sq-CjSGt36V=B5yjg+diaAMFkH8h-N29t4uMuXNV8_qyA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH] nettle-ptest: fix a failing test
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
X-List-Received-Date: Mon, 16 Oct 2017 15:49:19 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B611A2BC51ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B611A2BC51ORSMSX112amrcor_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBkb27igJl0IHRoaW5rIHlvdSBjYW4gdXNlIExEX0xJQlJBUllfUEFUSCBkdWUgdG8gdGhlIGhh
cmRjb2RlZCByZWxhdGl2ZSBwYXRoIGluICIuLi9saWJuZXR0bGUuc2/igJ0uDQpJIGNvdWxkLCBo
b3dldmVyLCBjaGFuZ2UgdGhlICBwYXRjaCBmcm9tICIvdXNyL2xpYi9saWJuZXR0bGUuc28iIHRv
ICDigJxsaWJuZXR0bGUuc2/igJ0sIHJlbW92aW5nIGFueSBwYXRocy4NClRoYXQgd2F5IExEX0xJ
QlJBUllfUEFUSCBjYW4gYmUgdXNlZCBpZiBuZWVkZWQuIEJ1dCBpbiB0aGUgZW5kIGl0IHdpbGwg
bG9hZCAgdGhlIGxpYnJhcnkgZnJvbSAvdXNyL2xpYi9uZXR0bGUuc28gYW55d2F5Lg0KDQoNCg0K
SSB0aGluayBpdCB3b3VsZCBiZSBwcmVmZXJyZWQgaWYgeW91IGNvdWxkIHVzZSBMRF9MSUJSQVJZ
X1BBVEggdG8gc2VhcmNoIGZvciBpdA0KDQoNCg==

--_000_6E51916E4A1F32428260031F4C7CD2B611A2BC51ORSMSX112amrcor_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpw
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ291cmllciBO
ZXciOw0KCWNvbG9yOmJsYWNrOw0KCWZvbnQtd2VpZ2h0Om5vcm1hbDsNCglmb250LXN0eWxlOm5v
cm1hbDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7
c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9
IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIx
IiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29y
ZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NvdXJpZXIgTmV3JnF1b3Q7O2NvbG9yOmJsYWNrIj5J
IGRvbuKAmXQgdGhpbmsgeW91IGNhbiB1c2UgTERfTElCUkFSWV9QQVRIPGEgbmFtZT0iX01haWxF
bmRDb21wb3NlIj4gZHVlIHRvIHRoZSBoYXJkY29kZWQgcmVsYXRpdmUgcGF0aCBpbg0KPC9hPjwv
c3Bhbj4mcXVvdDsuLi9saWJuZXR0bGUuc2/igJ0uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5JIGNvdWxkLCBob3dldmVyLCBjaGFuZ2UgdGhlICZuYnNwO3BhdGNoIGZyb20g
JnF1b3Q7L3Vzci9saWIvbGlibmV0dGxlLnNvJnF1b3Q7IHRvICZuYnNwO+KAnGxpYm5ldHRsZS5z
b+KAnSwgcmVtb3ZpbmcgYW55IHBhdGhzLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+VGhhdCB3YXkgTERfTElCUkFSWV9QQVRIIGNhbiBiZSB1c2VkIGlmIG5lZWRlZC4gQnV0
IGluIHRoZSBlbmQgaXQgd2lsbCBsb2FkICZuYnNwO3RoZSBsaWJyYXJ5IGZyb20gL3Vzci9saWIv
bmV0dGxlLnNvIGFueXdheS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q291cmllciBOZXcmcXVvdDs7Y29sb3I6
YmxhY2siPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpu
b25lO2JvcmRlci1sZWZ0OnNvbGlkIGJsdWUgMS41cHQ7cGFkZGluZzowaW4gMGluIDBpbiA0LjBw
dCI+DQo8ZGl2Pg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgdGhpbmsg
aXQgd291bGQgYmUgcHJlZmVycmVkIGlmIHlvdSBjb3VsZCB1c2UgTERfTElCUkFSWV9QQVRIIHRv
IHNlYXJjaCBmb3IgaXQ8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgc3R5bGU9
ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0OnNvbGlkICNDQ0NDQ0MgMS4wcHQ7cGFkZGluZzowaW4g
MGluIDBpbiA2LjBwdDttYXJnaW4tbGVmdDo0LjhwdDttYXJnaW4tcmlnaHQ6MGluIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxicj4NCjxicj4NCjxvOnA+PC9vOnA+PC9wPg0KPC9ibG9ja3F1b3Rl
Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_6E51916E4A1F32428260031F4C7CD2B611A2BC51ORSMSX112amrcor_--
