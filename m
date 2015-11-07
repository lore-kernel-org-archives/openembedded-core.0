Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 811767653B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 17:13:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Nov 2015 09:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,257,1444719600"; 
	d="scan'208,217";a="814223492"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2015 09:13:11 -0800
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Sat, 7 Nov 2015 09:13:11 -0800
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.225]) by
	ORSMSX112.amr.corp.intel.com ([169.254.12.72]) with mapi id
	14.03.0248.002; Sat, 7 Nov 2015 09:13:10 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
Thread-Index: AQHRCoMKmbfTF3/+JEurzOjY1MI62p6N0aOwgAC7nYCAAlywcA==
Date: Sat, 7 Nov 2015 17:13:09 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B610D4B8C6@ORSMSX110.amr.corp.intel.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
	<CAJTo0Lapy65UBQuf7bUXUtkw64bJ0wq8keT6wd+rwUqWnJ43LA@mail.gmail.com>
In-Reply-To: <CAJTo0Lapy65UBQuf7bUXUtkw64bJ0wq8keT6wd+rwUqWnJ43LA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Sat, 07 Nov 2015 17:13:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B610D4B8C6ORSMSX110amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B610D4B8C6ORSMSX110amrcor_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBJIHdpbGwgZG8gdGhhdCBzaG9ydGx5Lg0KDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNSwgMjAx
NSAxOjA4IFBNDQpUbzogQnlzdHJpY2t5LCBKdXJvDQpDYzogSGF0bGUsIE1hcmsgRyAoV2luZCBS
aXZlcik7IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBGaXggR0NDIDUuMiAiX0ZPUl9CVUlMRCIgYW5kIHJlbGF0
ZWQgdmFyaWFibGVzDQoNCg0KT24gNSBOb3ZlbWJlciAyMDE1IGF0IDE4OjEzLCBCeXN0cmlja3ks
IEp1cm8gPGp1cm8uYnlzdHJpY2t5QGludGVsLmNvbTxtYWlsdG86anVyby5ieXN0cmlja3lAaW50
ZWwuY29tPj4gd3JvdGU6DQpUaGUgcGF0Y2ggd29ya3MgdW5tb2RpZmllZCAgKGFuZCBzb2x2ZXMg
bWluZ3cgYnVpbGQgcHJvYmxlbXMpIGZvciBnY2MgNC45LiBhcyB3ZWxsLA0KcHJvdmlkaW5nIGdj
Yy00LjkuaW5jIGlzICBwYXRjaGVkIHRoZSBzYW1lIHdheSBhcyBnY2MtNS4yLmluYw0KDQpDYW4g
eW91IHNlbmQgYSBwcm9wZXIgcGF0Y2ggZm9yIHRoYXQ/DQoNCkNoZWVycywNClJvc3MNCg==

--_000_6E51916E4A1F32428260031F4C7CD2B610D4B8C6ORSMSX110amrcor_
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
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4g
MS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0
cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1b
aWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRt
YXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5k
aWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1
cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZx
dW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPlllcywgSSB3aWxsIGRvIHRoYXQgc2hvcnRs
eS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBz
dHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBp
biAwaW4gMGluIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7
LHNhbnMtc2VyaWYiPiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21d
DQo8YnI+DQo8Yj5TZW50OjwvYj4gVGh1cnNkYXksIE5vdmVtYmVyIDUsIDIwMTUgMTowOCBQTTxi
cj4NCjxiPlRvOjwvYj4gQnlzdHJpY2t5LCBKdXJvPGJyPg0KPGI+Q2M6PC9iPiBIYXRsZSwgTWFy
ayBHIChXaW5kIFJpdmVyKTsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zzxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdIFtQQVRDSF0gRml4IEdDQyA1LjIg
JnF1b3Q7X0ZPUl9CVUlMRCZxdW90OyBhbmQgcmVsYXRlZCB2YXJpYWJsZXM8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDUgTm92ZW1iZXIg
MjAxNSBhdCAxODoxMywgQnlzdHJpY2t5LCBKdXJvICZsdDs8YSBocmVmPSJtYWlsdG86anVyby5i
eXN0cmlja3lAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+anVyby5ieXN0cmlja3lAaW50ZWwu
Y29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9y
ZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBpbiAwaW4g
MGluIDYuMHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowaW4iPg0KPGRpdiBpZD0i
OnF6Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoZSBwYXRjaCB3b3JrcyB1bm1vZGlmaWVkJm5i
c3A7IChhbmQgc29sdmVzIG1pbmd3IGJ1aWxkIHByb2JsZW1zKSBmb3IgZ2NjIDQuOS4gYXMgd2Vs
bCw8YnI+DQpwcm92aWRpbmcgZ2NjLTQuOS5pbmMgaXMmbmJzcDsgcGF0Y2hlZCB0aGUgc2FtZSB3
YXkgYXMgZ2NjLTUuMi5pbmM8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0K
PC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YnI+DQpDYW4geW91IHNlbmQgYSBwcm9wZXIg
cGF0Y2ggZm9yIHRoYXQ/PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPkNoZWVycyw8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPlJvc3M8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rp
dj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_6E51916E4A1F32428260031F4C7CD2B610D4B8C6ORSMSX110amrcor_--
