Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EDB7B77BC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490367845; x=1521903845;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:mime-version;
	bh=h6ewCMEvmFGvAkD16yNveK1VaqnyBJjD288mJBiC6vE=;
	b=DfToTmny/o7edpw1fq8gxzcQesgiKfmTkfkXiE5BswrgDYwyqF6QMT70
	ZJc7vUeiWBlnuDhLY3T+xxJJGUhjvw==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 08:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208,217";a="80253045"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2017 08:04:03 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
	IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 24 Mar 2017 15:04:02 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.8]) by
	irsmsx111.ger.corp.intel.com ([169.254.2.242]) with mapi id
	14.03.0248.002; Fri, 24 Mar 2017 15:04:02 +0000
From: "John, Maxin" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 0/2] fix valgrind ptest
Thread-Index: AQHSpK5vI0ObpqRmQ02Ioma6kYUC/aGkE7GAgAACgeA=
Date: Fri, 24 Mar 2017 15:04:01 +0000
Message-ID: <61C0517EAD808B429A1DE2DD9164D40030F749B6@IRSMSX103.ger.corp.intel.com>
References: <1490367165-27529-1-git-send-email-maxin.john@intel.com>
	<CAJTo0Lb0u3QukoSwpko+byoxkoik6FTdW+kuwKusBWqMz7E5ag@mail.gmail.com>
In-Reply-To: <CAJTo0Lb0u3QukoSwpko+byoxkoik6FTdW+kuwKusBWqMz7E5ag@mail.gmail.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] fix valgrind ptest
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
X-List-Received-Date: Fri, 24 Mar 2017 15:04:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_61C0517EAD808B429A1DE2DD9164D40030F749B6IRSMSX103gercor_"

--_000_61C0517EAD808B429A1DE2DD9164D40030F749B6IRSMSX103gercor_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KV2lsbCB1cGRhdGUgYW5kIHNlbmQgaXQgc29vbi4NCg0KUmVnYXJkcywNCk1h
eGluDQoNCkZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0N
ClNlbnQ6IEZyaWRheSwgTWFyY2ggMjQsIDIwMTcgNDo1NCBQTQ0KVG86IEpvaG4sIE1heGluIDxt
YXhpbi5qb2huQGludGVsLmNvbT4NCkNjOiBPRS1jb3JlIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMC8yXSBm
aXggdmFsZ3JpbmQgcHRlc3QNCg0KDQpPbiAyNCBNYXJjaCAyMDE3IGF0IDE0OjUyLCBNYXhpbiBC
LiBKb2huIDxtYXhpbi5qb2huQGludGVsLmNvbTxtYWlsdG86bWF4aW4uam9obkBpbnRlbC5jb20+
PiB3cm90ZToNCk1heGluIEIuIEpvaG4gKDIpOg0KICB2Z19yZWd0ZXN0LmluPGh0dHA6Ly92Z19y
ZWd0ZXN0LmluPiA6IGZpeCBwZXJsIHNjcmlwdA0KICBkb19kaWZmczogY29ycmVjdCB0aGUgY29t
cGFyaXNvbiBsb2dpYw0KDQpCb3RoIHBhdGNoZXMgbWlzc2luZyB0aGUgdmFsZ3JpbmQ6IHByZWZp
eC4NCg0KUm9zcw0K

--_000_61C0517EAD808B429A1DE2DD9164D40030F749B6IRSMSX103gercor_
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
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpw
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzIu
MHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3Jk
U2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBl
ZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0t
LT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4N
CjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1s
PjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUiIHZs
aW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0Nh
bGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj5IaSBSb3NzLDxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjoj
MUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJp
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+V2lsbCB1cGRhdGUgYW5kIHNlbmQgaXQg
c29vbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNh
bnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1p
bHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPlJlZ2FyZHMs
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmO2NvbG9yOiMxRjQ5N0QiPk1heGluPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PGEgbmFtZT0iX01haWxFbmRDb21wb3NlIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29s
b3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9hPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZx
dW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZiI+IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NCjxicj4N
CjxiPlNlbnQ6PC9iPiBGcmlkYXksIE1hcmNoIDI0LCAyMDE3IDQ6NTQgUE08YnI+DQo8Yj5Ubzo8
L2I+IEpvaG4sIE1heGluICZsdDttYXhpbi5qb2huQGludGVsLmNvbSZndDs8YnI+DQo8Yj5DYzo8
L2I+IE9FLWNvcmUgJmx0O29wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcm
Z3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvMl0gZml4IHZh
bGdyaW5kIHB0ZXN0PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDI0
IE1hcmNoIDIwMTcgYXQgMTQ6NTIsIE1heGluIEIuIEpvaG4gJmx0OzxhIGhyZWY9Im1haWx0bzpt
YXhpbi5qb2huQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1heGluLmpvaG5AaW50ZWwuY29t
PC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVy
Om5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBjbSAwY20gMGNt
IDYuMHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowY20iPg0KPGRpdiBpZD0iOnZs
Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk1heGluIEIuIEpvaG4gKDIpOjxicj4NCiZuYnNwOyA8
YSBocmVmPSJodHRwOi8vdmdfcmVndGVzdC5pbiIgdGFyZ2V0PSJfYmxhbmsiPnZnX3JlZ3Rlc3Qu
aW48L2E+IDogZml4IHBlcmwgc2NyaXB0PGJyPg0KJm5ic3A7IGRvX2RpZmZzOiBjb3JyZWN0IHRo
ZSBjb21wYXJpc29uIGxvZ2ljPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4N
CjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KQm90aCBwYXRjaGVzIG1pc3Npbmcg
dGhlIHZhbGdyaW5kOiBwcmVmaXguPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPlJvc3M8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_61C0517EAD808B429A1DE2DD9164D40030F749B6IRSMSX103gercor_--
