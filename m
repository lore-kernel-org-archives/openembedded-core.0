Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 3551 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jul 2016 19:31:02 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0040.outbound.protection.outlook.com [104.47.2.40])
	by mail.openembedded.org (Postfix) with ESMTP id 1183260116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=j3Go3XRp7dVPEfSH3sRRwbCOuaXzl4pTugSv0WyfVd0=;
	b=lp2+S9iUkWPTmXEMXca4T9IIWiDDkjRNNuaqEmnuCT0t29wVhLYM0wR6WGtJ4xZ/kCj/Ab5m3g1pxfwa1mZwhm8194ZPqsC0796AiWriY1i6srU+g22/eNoXgpwzteN9eXUzCdY58FcJa7hu+NS+ZPSuuaCAIeY5YO8sgSC8gVM=
Received: from DB5PR04MB1638.eurprd04.prod.outlook.com (10.164.38.156) by
	DB5PR04MB1640.eurprd04.prod.outlook.com (10.164.38.158) with Microsoft
	SMTP Server (TLS) id 15.1.539.6; Tue, 5 Jul 2016 08:41:13 +0000
Received: from DB5PR04MB1638.eurprd04.prod.outlook.com ([10.164.38.156]) by
	DB5PR04MB1638.eurprd04.prod.outlook.com ([10.164.38.156]) with mapi id
	15.01.0539.013; Tue, 5 Jul 2016 08:41:13 +0000
From: Yuqing Zhu <carol.zhu@nxp.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [poky][PATCH 1/6] gstreamer1.0-plugins-bad: Enable
	gldeinterlace on OpenGL ES
Thread-Index: AQHR1bep4eVp5UkQ80uWTn6KTobw0KAID2UAgAF2wpA=
Date: Tue, 5 Jul 2016 08:41:13 +0000
Message-ID: <DB5PR04MB16383C943319D6940931869BE9390@DB5PR04MB1638.eurprd04.prod.outlook.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
	<1467611193-31658-2-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LZa0nqhg5ZTcP+4kz_yMAY2h-u3YoLgoeby814UXNmxEA@mail.gmail.com>
In-Reply-To: <CAJTo0LZa0nqhg5ZTcP+4kz_yMAY2h-u3YoLgoeby814UXNmxEA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=carol.zhu@nxp.com; 
x-originating-ip: [192.158.241.86]
x-ms-office365-filtering-correlation-id: 9e7caec5-12b4-4bee-1a90-08d3a4b01f53
x-microsoft-exchange-diagnostics: 1; DB5PR04MB1640;
	6:P/Yjzhy3yp67EysDZJYu2QRHewn6xr7j05YH2JRJ7dhiPiXfO9gp+uLUAJ4RFHvEvL+r5z9rI9fTD7+RFo2xwtJBL3+4pYOLeEkbH6NEEcnLllpGmZYuyR/8sOsUwpO95pCxcoyk0xdteHD1km6SS7Fd7+njh7e9MccrsokzKsT1MzS3ni38DLcV4groDQLU0zVV8fYdDmEDJdE732vDI/AJzcAkKMo6Z5deK9bU45I2rIUXBMAe2v6P79bVO+w/MMUSrXshqaawiVL3NJNetz/q+9/jgdc1XvI4ZueZBF3FyYyaA4VQntQ9bt1ervv70hQCyQ7MH/X7ENB4nbDcUA==;
	5:I9Gm8zXtk20nszyFz8yt0tz2ODvVYQIaOidgu0lCdZlK5XR7lSU2OI6bZXV8lJld7VaMXtZ6tanL1xc2HPR+DcrnEG5TRxSv361vznltY3coVphEkTDcXqvF1krLN3QUpGjylTgpWpSr7v4SYt4GmQ==;
	24:MeXX5Wuz0Zt4nyx6AK6DtFezU+uTN+0x2AKvsuSGBLG2lqiwUZB6gITBHqbQROa44ivjH2T1cykqJGGj3C/LYcGGS96jzLU5ScarLMTGI6o=;
	7:rNaHaAbMo4vVOMWuFTtAcXeyFU2OzLqonJFpq+BfjGZwdc3mksaSEwaj4VcKUn2qcIF36dWlSZ0BovPXykcL9yCl2zOcK8HTQlNF88R0QOnjGszsCqseLgxbwMTC5wvYCQlLvhuaaxwLTPNrLmNZrQxOmhOiapZTFpFagR0c2yCUImW6pacC54s4GZFyfH/Jzk3LrSthANwhLTfgEvRADv5GvRgGQKn+lNIY9iwJoFGPh8oWNZJUgNhyO0wvlNFH
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR04MB1640;
x-microsoft-antispam-prvs: <DB5PR04MB1640D1EFB533C77837A5C025E9390@DB5PR04MB1640.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(21748063052155)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:DB5PR04MB1640; BCL:0; PCL:0; RULEID:; SRVR:DB5PR04MB1640; 
x-forefront-prvs: 0994F5E0C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(7916002)(377454003)(24454002)(189002)(199003)(86362001)(3660700001)(19580405001)(3280700002)(9326002)(19300405004)(50986999)(19580395003)(54356999)(8936002)(9686002)(76576001)(68736007)(74316002)(76176999)(87936001)(7906003)(19609705001)(7696003)(7736002)(5003600100003)(7846002)(586003)(105586002)(106116001)(106356001)(3846002)(19617315012)(790700001)(6116002)(102836003)(15975445007)(77096005)(92566002)(230783001)(97736004)(122556002)(4326007)(2906002)(81156014)(8676002)(189998001)(110136002)(81166006)(16236675004)(19625215002)(2950100001)(66066001)(2900100001)(5002640100001)(101416001)(11100500001)(33656002)(10400500002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR04MB1640;
	H:DB5PR04MB1638.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2016 08:41:13.4850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB1640
X-Microsoft-Exchange-Diagnostics: 1; DB5PR04MB1640;
	23:o+lXuh7YkSurXT0dp+mp37/ttLQTTna5FZo0WH7+bsw9rvkHkv1UHE+w5FBqG5o84GGVjP0e8OyNp6b4y9bQV5u0sqKaqbFPf4TDEslR6tK0tnHJAgoZ7Vx0KIurM9P3k5p/+XoSLwPqFES1qPIQ6cp7tb/UO1bxy0oQIUvsy6+H91yueAyiS2sETEUFb1Ce
X-OriginatorOrg: nxp.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 1/6] gstreamer1.0-plugins-bad: Enable gldeinterlace on OpenGL ES
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
X-List-Received-Date: Tue, 05 Jul 2016 19:31:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB5PR04MB16383C943319D6940931869BE9390DB5PR04MB1638eurp_"

--_000_DB5PR04MB16383C943319D6940931869BE9390DB5PR04MB1638eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KICAgICAgVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KICAgICAgIFllcywg
aXQgaXMgYmFja3BvcnRlZCBmcm9tIDEuOS4xLCBJIHdpbGwgdXBkYXRlICB0aGUgVXBzdHJlYW0t
U3RhdHVzIGFuZCByZXNlbmQgdGhlIHBhdGNoLg0KDQoNCkIuUi4NCkNhcm9sDQoNCkZyb206IEJ1
cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NClNlbnQ6IE1vbmRheSwg
SnVseSAwNCwgMjAxNiA2OjE5IFBNDQpUbzogWXVxaW5nIFpodSA8Y2Fyb2wuemh1QG54cC5jb20+
DQpDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4N
ClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3Bva3ldW1BBVENIIDEvNl0gZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFkOiBFbmFibGUgZ2xkZWludGVybGFjZSBvbiBPcGVuR0wgRVMNCg0KDQpPbiA0IEp1
bHkgMjAxNiBhdCAwNjo0NiwgWXVxaW5nIFpodSA8Y2Fyb2wuemh1QG54cC5jb208bWFpbHRvOmNh
cm9sLnpodUBueHAuY29tPj4gd3JvdGU6DQorVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQorDQor
aHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcvc2hvd19idWcuY2dpP2lkPTc2NDg3Mw0KDQpVLVMg
c2F5cyBQZW5kaW5nLCBidWcgc2F5cyBmaXhlZC4NCg0KSXMgdGhpcyBhIGJhY2twb3J0IG9mIGEg
Y2hhbmdlIHRoYXQgYWN0dWFsbHkgbGFuZGVkIHVwc3RyZWFtPyAgSSBkb24ndCByZWFsbHkgYWdy
ZWUgd2l0aCBPRS1Db3JlIGNhcnJ5aW5nIG5ldyBBUEkgYW5kIGZlYXR1cmVzIGluIGEgY29yZSBj
b21wb25lbnQgbGlrZSBHU3RyZWFtZXIgdGhhdCBhcmUgbm90IGJhY2twb3J0ZWQuDQoNClJvc3MN
Cg==

--_000_DB5PR04MB16383C943319D6940931869BE9390DB5PR04MB1638eurp_
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
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOWui+S9kyI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJUaW1lcyBOZXcgUm9tYW4iLHNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7
bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJs
aW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5
Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOiMxRjQ5N0Q7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41
aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjI1aW4gMS4waW4gMS4yNWluO30NCmRpdi5Xb3Jk
U2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBt
c28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYi
IC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBl
bGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0K
PC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0i
RU4tVVMiIGxpbms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rp
b24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdE
Ij5IaSBSb3NzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVv
dDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250
LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7
Y29sb3I6IzFGNDk3RCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFllcywg
aXQgaXMgYmFja3BvcnRlZCBmcm9tIDEuOS4xLCBJIHdpbGwgdXBkYXRlICZuYnNwO3RoZSBVcHN0
cmVhbS1TdGF0dXMgYW5kIHJlc2VuZCB0aGUgcGF0Y2guPG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZjtjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTom
cXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+Qi5SLjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xv
cjojMUY0OTdEIj5DYXJvbDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGli
cmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9z
cGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRv
bkBpbnRlbC5jb21dDQo8YnI+DQo8Yj5TZW50OjwvYj4gTW9uZGF5LCBKdWx5IDA0LCAyMDE2IDY6
MTkgUE08YnI+DQo8Yj5Ubzo8L2I+IFl1cWluZyBaaHUgJmx0O2Nhcm9sLnpodUBueHAuY29tJmd0
Ozxicj4NCjxiPkNjOjwvYj4gT0UtY29yZSAmbHQ7b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbcG9r
eV1bUEFUQ0ggMS82XSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQ6IEVuYWJsZSBnbGRlaW50ZXJs
YWNlIG9uIE9wZW5HTCBFUzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5P
biA0IEp1bHkgMjAxNiBhdCAwNjo0NiwgWXVxaW5nIFpodSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNh
cm9sLnpodUBueHAuY29tIiB0YXJnZXQ9Il9ibGFuayI+Y2Fyb2wuemh1QG54cC5jb208L2E+Jmd0
OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTti
b3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7
bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8ZGl2IGlkPSI6Zm5kIj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPiYjNDM7VXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nPGJyPg0KJiM0
Mzs8YnI+DQomIzQzOzxhIGhyZWY9Imh0dHBzOi8vYnVnemlsbGEuZ25vbWUub3JnL3Nob3dfYnVn
LmNnaT9pZD03NjQ4NzMiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2J1Z3ppbGxhLmdub21lLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9NzY0ODczPC9hPjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Js
b2NrcXVvdGU+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxicj4NClUtUyBzYXlzIFBl
bmRpbmcsIGJ1ZyBzYXlzIGZpeGVkLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5JcyB0aGlzIGEgYmFja3BvcnQgb2YgYSBjaGFuZ2UgdGhhdCBh
Y3R1YWxseSBsYW5kZWQgdXBzdHJlYW0/Jm5ic3A7IEkgZG9uJ3QgcmVhbGx5IGFncmVlIHdpdGgg
T0UtQ29yZSBjYXJyeWluZyBuZXcgQVBJIGFuZCBmZWF0dXJlcyBpbiBhIGNvcmUgY29tcG9uZW50
IGxpa2UgR1N0cmVhbWVyIHRoYXQgYXJlIG5vdCBiYWNrcG9ydGVkLjxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Sb3NzPG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_DB5PR04MB16383C943319D6940931869BE9390DB5PR04MB1638eurp_--
