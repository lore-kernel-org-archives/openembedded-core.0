Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id A4699745AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:53:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2018 01:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,393,1531810800"; d="scan'208";a="81621952"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2018 01:53:37 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 19 Sep 2018 16:53:36 +0800
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.29]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.194]) with mapi id
	14.03.0319.002; Wed, 19 Sep 2018 16:53:36 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] test-result-log: testcase management tool to
	store test result
Thread-Index: AQHUSeFmm41iiixcvUupj0GTg9X3LqT3VwZA
Date: Wed, 19 Sep 2018 08:53:35 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335EAACFD@PGSMSX109.gar.corp.intel.com>
References: <1535526306-26126-1-git-send-email-ee.peng.yeoh@intel.com>
	<87f876151d5929e1fd83be41d255d594dd3694f6.camel@linuxfoundation.org>
In-Reply-To: <87f876151d5929e1fd83be41d255d594dd3694f6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2NhZWU0ZDMtZjQ2YS00MDdkLThjYzItOWI5MjQyMTY0N2FiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMHVFVmxcLzgwa0h1NStjZGw3THhlaVNSVm05WnVNMUNuZ0YwOHl1bG1NUU5hQzVvVXlPbzZhOWsrajYrdFozV1kifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH] test-result-log: testcase management tool to store test result
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
X-List-Received-Date: Wed, 19 Sep 2018 08:53:38 -0000
X-Groupsio-MsgNum: 116441
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_003_9DDD2658D1FE414E99172D2DB1E4D04335EAACFDPGSMSX109garcor_"

--_003_9DDD2658D1FE414E99172D2DB1E4D04335EAACFDPGSMSX109garcor_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVG8gYWRkcmVzcyB0aGUgbWFpbnRhaW5hYmxlIGNvbmNlcm4sIEkgaGFk
IHJlc3RydWN0dXJlZCB0aGUgY29kZXMgaW4gb3JkZXIgdG8gZW5hYmxlIG9lcWEgZnJhbWV3b3Jr
IHRvIHdyaXRlIG91dCBhIGpzb24gZmlsZSBkaXJlY3RseSBmb3IgdGVzdHJlc3VsdC4gIA0KDQpB
dHRhY2hlZCB3ZXJlIHRoZSBwYXRjaGVzIHRvIGVuYmxlIG9lcWEgZnJhbWV3b3JrIHRvIHdyaXRl
IHRlc3RyZXN1bHQgaW50byBqc29uIGZpbGVzLCB3aGVyZSB0aGVzZSBmaWxlcyB3aWxsIGxhdGVy
IGJlIHVzZWQgYnkgdGhlIGZ1dHVyZSBRQSB0ZXN0IGNhc2UgbWFuYWdlbWVudCB0b29scyAoZWcu
IHN0b3JlIHRlc3RyZXN1bHQsIHRlc3QgcmVwb3J0aW5nLCBleGVjdXRlIG1hbnVhbCB0ZXN0IGNh
c2UgYW5kIHdyaXRlIHRlc3RyZXN1bHQgdG8ganNvbikuIA0KDQpUaGlzIHBhdGNoIGluY2x1ZGUg
ZW5hYmxlIG9lLXNlbGZ0ZXN0IHRvIHdyaXRlIGpzb24gdGVzdHJlc3VsdC4gSSBoYWQgdGVzdGVk
IHRoZXNlIHBhdGNoZXMgb24gb3VyIGxvY2FsIHNlcnZlciB3aGVyZSBpdCB3aWxsIHdyaXRlIG91
dCBqc29uIGZpbGVzIGZvciB0ZXN0cmVzdWx0IGFzIGV4cGVjdGVkLg0KDQpQbGVhc2UgbGV0IG1l
IGtub3cgaWYgeW91IGhhdmUgYW55IG1vcmUgZmVlZGJhY2suIFRoYW5rIHlvdSB2ZXJ5IG11Y2gh
DQoNCkJlc3QgcmVnYXJkcywNClllb2ggRWUgUGVuZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZyBbbWFpbHRvOnJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogVHVlc2RheSwgU2VwdGVt
YmVyIDExLCAyMDE4IDExOjA5IFBNDQpUbzogWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGlu
dGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSB0ZXN0LXJlc3VsdC1sb2c6IHRlc3RjYXNlIG1hbmFn
ZW1lbnQgdG9vbCB0byBzdG9yZSB0ZXN0IHJlc3VsdA0KDQpIaSBFZSBQZW5nLA0KDQpJJ3ZlIGJl
ZW4gaGF2aW5nIGEgbG9vayBhdCB0aGlzIGNvZGUgYW5kIHdoaWxzdCBzb21lIG9mIGl0IGlzIGdv
b2QsIEkgYWxzbyBoYXZlIHNvbWUgY29uY2VybnMuIFdpdGggaXQgY29taW5nIGluIHNvIGxhdGUg
aW4gdGhlIGN5Y2xlLCBpdHMgbWFkZSBpdCBoYXJkIHRvIGhhdmUgdGltZSB0byByZXZpZXcgaXQg
YW5kIGFsbG93IHRpbWUgdG8gZ2V0IGl0IHJpZ2h0Lg0KV2l0aCBzb21ldGhpbmcgYXMgaW1wb3J0
YW50IGFzIHRoaXMgdG8gdGhlIHdheSB0aGUgZnV0dXJlIFFBIHdvcmsgaXMgZG9uZSwgd2UgZG8g
bmVlZCB0byBlbnN1cmUgd2UgdXNlIHRoZSByaWdodCBhcHByb2FjaCBhbmQgdGhhdCBpdHMgbWFp
bnRhaW5hYmxlLg0KDQpUaGUgcGF0Y2hlcyBhcmUgb2sgYXMgYSBmaXJzdCBhdHRlbXB0IGF0IHRo
aXMuIE15IGJpZ2dlc3QgY29uY2VybiBpcyB0aGF0IGl0cyBjdXJyZW50bHkgcGFyc2luZyBsb2cg
ZmlsZXMgd2hpY2ggd2UgY29udHJvbCBhbmQgZ2VuZXJhdGUgd2l0aGluIG91dCBvd24gY29kZWJh
c2UgYW5kIHRoYXQgcGFyc2luZyBpcyBsaWtlbHkgdG8gYnJlYWsuIEluIHBhcnRpY3VsYXIsIHRo
ZXNlIGxpbmVzIHdvcnJ5IG1lIGZyb20gdGhlIHFhbG9ncGFyc2VyOg0KDQpyZWdleCA9ICIuKlJF
U1VMVFMgLSAoP1A8Y2FzZV9uYW1lPi4qKSAtIFRlc3RjYXNlIC4qOiAoP1A8c3RhdHVzPlBBU1NF
RHxGQUlMRUR8U0tJUFBFRHxFUlJPUnxVTktOT1dOKS4qJCINCnJlZ2V4ID0gImNvcmUtaW1hZ2Uu
KigpLipSYW4uKnRlc3RzIGluIC4qcyINCnJlZ2V4ID0gIkRFQlVHOiBsYXVuY2hjbWQ9cnVucWVt
dSoNCnFlbXVfbGlzdCA9IFsncWVtdWFybScsICdxZW11YXJtNjQnLCAncWVtdW1pcHMnLCAncWVt
dW1pcHM2NCcsICdxZW11cHBjJywgJ3FlbXV4ODYnLCAncWVtdXg4Ni02NCddDQoNCnNpbmNlIGhl
cmUgd2UncmUgaGFyZGNvZGluZyB0aGUgbGlzdCBvZiBxZW11J3Mgd2Ugc3VwcG9ydCwgd2UncmUg
YWxzbyBvbmx5IGFsbG93aW5nIGNvcmUtaW1hZ2UtKiBhbmQgd2UncmUgcmVseWluZyB1cG9uIHRo
ZSByZXN1bHRzIGZvcm1hdCBub3QgY2hhbmdpbmcuIFRoYXQgbWFrZXMgaXQgaGFyZCBmb3IgYW55
b25lIHRvIGV4dGVuZC9yZXVzZSB0aGlzIG9yIHRvIHVzZSBpdCB3aXRoIHJlYWwgaGFyZHdhcmU/
DQoNCkZvciBleGFtcGxlIHRoZSByZWNlbnQgb2Utc2VsZnRlc3QgcGFyYWxsZWxpc2F0aW9uIGNv
ZGUgZGlkIGNoYW5nZSB0aGUgb3V0cHV0IG9mIHRoZSB0ZXN0cyBzbGlnaHRseS4gSSdtIG5vdCBz
dXJlIGlmIHRoaXMgYnJva2UgdGhlIHBhcnNpbmcgb3Igbm90IGJ1dCBpdCBpcyBhbiBleGFtcGxl
IG9mIHRoZSBraW5kIG9mIGZyYWdpbGl0eSB0aGlzIGNvZGUgaGFzLg0KDQpXaGF0IHdvdWxkIHBy
b2JhYmx5IHdvcmsgYmV0dGVyIGZvciB1cyBpcyBpZiB0aGUgb2VxYSBmcmFtZXdvcmsgd3JvdGUg
b3V0IGEganNvbiBmaWxlIGRpcmVjdGx5IGNvbnRhaW5pbmcgdGhlIGluZm9ybWF0aW9uIHdlIG5l
ZWQgaW4gaXQsIHRoZW4gdGhpcyBjb2RlIHdvdWxkIGp1c3QgbmVlZCB0byBjb2xsZWN0IHVwIHRo
ZSBqc29uIGZpbGVzLg0KDQpJJ20gYWxzbyBhIGxpdHRsZSBjb25jZXJuZWQgYXQgdGhlIHdheSB1
bml0dGVzdCBkaXNjb3ZlcnkgaXMgYmVpbmcgZG9uZSwgZ3JlcHBpbmcgZm9yICoucHkgZmlsZXMg
YXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBpdC4gV2Ugc2hvdWxkIHByb2JhYmx5IHVzZSB0aGUgbGlz
dCBvcHRpb25zIHRvIHRoZSB2YXJpb3VzIGN1cnJlbnQgdGVzdCBwaWVjZXM/IEFsc28sIHRoaXMg
aXMgc29tZXRoaW5nIHdlIHByb2JhYmx5IG9ubHkgZXZlciBuZWVkIHRvIGRvIG9uY2UgdG8gc2Vl
ZCB0aGUgUUEgcmVzdWx0cyBzdG9yZT8NCg0KRmluYWxseSwgbXVjaCBvZiB0aGUgY29kZSBpcyB1
c2luZyAiaW50ZXJuYWwiIG1ldGhvZHMgcHJlZml4ZWQgd2l0aCAiXyIuIEkgY2FuIHVuZGVyc3Rh
bmQgd2h5IGJ1dCBpdCBzZWVtcyB0aGUgY29kZSBkb2Vzbid0IGhhdmUgYSBnb29kIHdlbGwgc3Ry
dWN0dXJlZCBwdWJsaWMgQVBJIGFzIGEgcmVzdWx0Lg0KDQpBcyBzdWNoIHRoZXJlIG1heSBtZSBh
IGxpdHRsZSB0b28gbXVjaCB3b3JrIG5lZWRlZCBvbiB0aGlzIHRvIGdldCBpdCBpbiBmb3IgMi42
IDooDQoNCkNoZWVycywNCg0KUmljaGFyZA0K

--_003_9DDD2658D1FE414E99172D2DB1E4D04335EAACFDPGSMSX109garcor_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 19 Sep 2018 08:53:35 GMT";
	modification-date="Wed, 19 Sep 2018 08:53:35 GMT"

Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
 PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 19 Sep 2018 16:46:51 +0800
Received: from fmsmga006.fm.intel.com (10.253.24.20) by
 orsmsx101-2.jf.intel.com (10.22.225.134) with Microsoft SMTP Server id
 14.3.319.2; Wed, 19 Sep 2018 01:46:39 -0700
Received: from andromeda02.png.intel.com ([10.221.183.11])  by
 fmsmga006.fm.intel.com with ESMTP; 19 Sep 2018 01:46:21 -0700
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] oeqa/selftest/context: enable selftest to write json
 testresult
Thread-Topic: [PATCH 2/2] oeqa/selftest/context: enable selftest to write
 json testresult
Thread-Index: AQHUT/VPJ24PdP6jq06El6v4I5qX7A==
Date: Wed, 19 Sep 2018 08:31:00 +0000
Message-ID: <1537345860-32081-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1537345860-32081-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1537345860-32081-1-git-send-email-ee.peng.yeoh@intel.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: ORSMSX101.amr.corp.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

To enable selftest to write testresult into json files, where
these json files will be used by future test case management
tools for test reporting.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/con=
text.py
index c78947e..9ed22ff 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -73,6 +73,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor=
):

         parser.add_argument('--machine', required=3DFalse, choices=3D['ran=
dom', 'all'],
                             help=3D'Run tests on different machines (rando=
m/all).')
+
+        parser.add_argument('-ej', '--export-json', action=3D'store_true',
+                            help=3D'Output test result in json format to f=
iles.')

         parser.set_defaults(func=3Dself.run)

@@ -99,8 +102,8 @@ class OESelftestTestContextExecutor(OETestContextExecuto=
r):
         return cases_paths

     def _process_args(self, logger, args):
-        args.output_log =3D '%s-results-%s.log' % (self.name,
-                time.strftime("%Y%m%d%H%M%S"))
+        args.test_start_time =3D time.strftime("%Y%m%d%H%M%S")
+        args.output_log =3D '%s-results-%s.log' % (self.name, args.test_st=
art_time)
         args.test_data_file =3D None
         args.CASES_PATHS =3D None

@@ -222,6 +225,11 @@ class OESelftestTestContextExecutor(OETestContextExecu=
tor):
             rc =3D self.tc.runTests(**self.tc_kwargs['run'])
             rc.logDetails()
             rc.logSummary(self.name)
+            if args.export_json:
+                json_result_dir =3D os.path.join(os.path.dirname(os.path.a=
bspath(args.output_log)),
+                                               'json_testresults-%s' % arg=
s.test_start_time,
+                                               'oe-selftest')
+                rc.logDetailsInJson(json_result_dir)

         return rc

--
2.7.4


--_003_9DDD2658D1FE414E99172D2DB1E4D04335EAACFDPGSMSX109garcor_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 19 Sep 2018 08:53:35 GMT";
	modification-date="Wed, 19 Sep 2018 08:53:35 GMT"

Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
 PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 19 Sep 2018 16:46:40 +0800
Received: from fmsmga006.fm.intel.com (10.253.24.20) by
 orsmsx105-2.jf.intel.com (10.22.225.145) with Microsoft SMTP Server id
 14.3.319.2; Wed, 19 Sep 2018 01:46:38 -0700
Received: from andromeda02.png.intel.com ([10.221.183.11])  by
 fmsmga006.fm.intel.com with ESMTP; 19 Sep 2018 01:46:18 -0700
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
Subject: [PATCH 1/2] oeqa/core/runner: enable oeqa to write testresult into
 json file
Thread-Topic: [PATCH 1/2] oeqa/core/runner: enable oeqa to write testresult
 into json file
Thread-Index: AQHUT/VIlGHIAZdy8EGVfPXzDqP3CA==
Date: Wed, 19 Sep 2018 08:30:59 +0000
Message-ID: <1537345860-32081-1-git-send-email-ee.peng.yeoh@intel.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: ORSMSX105.amr.corp.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

To enable future QA work, we need the oeqa testresult to be written
into json files, which will be used by the future test case
management tools, where these testresult json files will be stored
into git repository for test reporting.

Also this oeqa framework will be used by the future test case
management tools to write testresult for manual test case
executed into json files.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/runner.py | 120 +++++++++++++++++++++++++++++++++++++++=
----
 1 file changed, 109 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index eeb625b..8baf5af 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -6,6 +6,8 @@ import time
 import unittest
 import logging
 import re
+import json
+import pathlib

 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
@@ -44,6 +46,9 @@ class OETestResult(_TestResult):

         self.tc =3D tc

+        self.result_types =3D ['failures', 'errors', 'skipped', 'expectedF=
ailures', 'successes']
+        self.result_desc =3D ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL'=
, 'PASSED']
+
     def startTest(self, test):
         # May have been set by concurrencytest
         if test.id() not in self.starttime:
@@ -80,7 +85,7 @@ class OETestResult(_TestResult):
             msg +=3D " (skipped=3D%d)" % skipped
         self.tc.logger.info(msg)

-    def _getDetailsNotPassed(self, case, type, desc):
+    def _isTestResultContainTestCaseWithResultTypeProvided(self, case, typ=
e):
         found =3D False

         for (scase, msg) in getattr(self, type):
@@ -121,16 +126,12 @@ class OETestResult(_TestResult):
         for case_name in self.tc._registry['cases']:
             case =3D self.tc._registry['cases'][case_name]

-            result_types =3D ['failures', 'errors', 'skipped', 'expectedFa=
ilures', 'successes']
-            result_desc =3D ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL',=
 'PASSED']
-
-            fail =3D False
+            found =3D False
             desc =3D None
-            for idx, name in enumerate(result_types):
-                (fail, msg) =3D self._getDetailsNotPassed(case, result_typ=
es[idx],
-                        result_desc[idx])
-                if fail:
-                    desc =3D result_desc[idx]
+            for idx, name in enumerate(self.result_types):
+                (found, msg) =3D self._isTestResultContainTestCaseWithResu=
ltTypeProvided(case, self.result_types[idx])
+                if found:
+                    desc =3D self.result_desc[idx]
                     break

             oeid =3D -1
@@ -143,13 +144,38 @@ class OETestResult(_TestResult):
             if case.id() in self.starttime and case.id() in self.endtime:
                 t =3D " (" + "{0:.2f}".format(self.endtime[case.id()] - se=
lf.starttime[case.id()]) + "s)"

-            if fail:
+            if found:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (=
case.id(),
                     oeid, desc, t))
             else:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (=
case.id(),
                     oeid, 'UNKNOWN', t))

+    def _get_testcase_result_dict(self):
+        testcase_result_dict =3D {}
+        for case_name in self.tc._registry['cases']:
+            case =3D self.tc._registry['cases'][case_name]
+
+            found =3D False
+            desc =3D None
+            for idx, name in enumerate(self.result_types):
+                (found, msg) =3D self._isTestResultContainTestCaseWithResu=
ltTypeProvided(case, self.result_types[idx])
+                if found:
+                    desc =3D self.result_desc[idx]
+                    break
+
+            if found:
+                testcase_result_dict[case.id()] =3D desc
+            else:
+                testcase_result_dict[case.id()] =3D "UNKNOWN"
+        return testcase_result_dict
+
+    def logDetailsInJson(self, file_dir):
+        testcase_result_dict =3D self._get_testcase_result_dict()
+        if len(testcase_result_dict) > 0:
+            jsontresulthelper =3D OEJSONTestResultHelper(testcase_result_d=
ict)
+            jsontresulthelper.write_json_testresult_files_by_testmodule(fi=
le_dir)
+
 class OEListTestsResult(object):
     def wasSuccessful(self):
         return True
@@ -261,3 +287,75 @@ class OETestRunner(_TestRunner):
             self._list_tests_module(suite)

         return OEListTestsResult()
+
+class OEJSONTestResultHelper(object):
+    def __init__(self, testcase_result_dict):
+        self.testcase_result_dict =3D testcase_result_dict
+
+    def get_testcase_list(self):
+        return self.testcase_result_dict.keys()
+
+    def get_testsuite_from_testcase(self, testcase):
+        testsuite =3D testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def get_testmodule_from_testsuite(self, testsuite):
+        testmodule =3D testsuite[0:testsuite.find(".")]
+        return testmodule
+
+    def get_testsuite_testcase_dictionary(self):
+        testsuite_testcase_dict =3D {}
+        for testcase in self.get_testcase_list():
+            testsuite =3D self.get_testsuite_from_testcase(testcase)
+            if testsuite in testsuite_testcase_dict:
+                testsuite_testcase_dict[testsuite].append(testcase)
+            else:
+                testsuite_testcase_dict[testsuite] =3D [testcase]
+        return testsuite_testcase_dict
+
+    def get_testmodule_testsuite_dictionary(self, testsuite_testcase_dict)=
:
+        testsuite_list =3D testsuite_testcase_dict.keys()
+        testmodule_testsuite_dict =3D {}
+        for testsuite in testsuite_list:
+            testmodule =3D self.get_testmodule_from_testsuite(testsuite)
+            if testmodule in testmodule_testsuite_dict:
+                testmodule_testsuite_dict[testmodule].append(testsuite)
+            else:
+                testmodule_testsuite_dict[testmodule] =3D [testsuite]
+        return testmodule_testsuite_dict
+
+    def _get_testcase_result(self, testcase, testcase_status_dict):
+        if testcase in testcase_status_dict:
+            return testcase_status_dict[testcase]
+        return ""
+
+    def _create_testcase_testresult_object(self, testcase_list, testcase_r=
esult_dict):
+        testcase_dict =3D {}
+        for testcase in sorted(testcase_list):
+            result =3D self._get_testcase_result(testcase, testcase_result=
_dict)
+            testcase_dict[testcase] =3D {"testresult": result}
+        return testcase_dict
+
+    def _create_json_testsuite_string(self, testsuite_list, testsuite_test=
case_dict, testcase_result_dict):
+        testsuite_object =3D {'testsuite': {}}
+        testsuite_dict =3D testsuite_object['testsuite']
+        for testsuite in sorted(testsuite_list):
+            testsuite_dict[testsuite] =3D {'testcase': {}}
+            testsuite_dict[testsuite]['testcase'] =3D self._create_testcas=
e_testresult_object(
+                testsuite_testcase_dict[testsuite],
+                testcase_result_dict)
+        return json.dumps(testsuite_object, sort_keys=3DTrue, indent=3D4)
+
+    def write_json_testresult_files_by_testmodule(self, json_testresult_di=
r):
+        if not os.path.exists(json_testresult_dir):
+            pathlib.Path(json_testresult_dir).mkdir(parents=3DTrue, exist_=
ok=3DTrue)
+        testsuite_testcase_dict =3D self.get_testsuite_testcase_dictionary=
()
+        testmodule_testsuite_dict =3D self.get_testmodule_testsuite_dictio=
nary(testsuite_testcase_dict)
+        for testmodule in testmodule_testsuite_dict.keys():
+            testsuite_list =3D testmodule_testsuite_dict[testmodule]
+            json_testsuite =3D self._create_json_testsuite_string(testsuit=
e_list, testsuite_testcase_dict,
+                                                                self.testc=
ase_result_dict)
+            file_name =3D '%s.json' % testmodule
+            file_path =3D os.path.join(json_testresult_dir, file_name)
+            with open(file_path, 'w') as the_file:
+                the_file.write(json_testsuite)
--
2.7.4


--_003_9DDD2658D1FE414E99172D2DB1E4D04335EAACFDPGSMSX109garcor_--
