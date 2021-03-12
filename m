Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.2389.1615512723239887193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 17:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=TVOO+PqT;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: DKP2Au9v80WdGcmnOXUf0UQTrAbCOQLFpx4RETtASbSU1G2YD8TKF/ITC+BVpcCdOrhWJguKzx
 XEvwiQXiJ1tQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="186391840"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="186391840"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 17:31:59 -0800
IronPort-SDR: Y41mt7dsVrGFWnGApom2yOfpC7Xi1ndN4XiMeZS4o7hLRFPqN4ryDziLgyaXQb1A/xkUfrgzKo
 NdZruFMbdRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="603752722"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2021 17:31:58 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 17:31:58 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 17:31:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 11 Mar 2021 17:31:58 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 11 Mar 2021 17:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjQHjuqGuLth1mczwRijk8XpWY6QZVluwt2+mANL0leohxIpKowFaXk50cgXtc0+31r2Wk3lyLJ0dUB9YzCv3JsrIo85pBKnax60r+uHxdbQh2AGEfYyn3/lL9PKgA9HBwciwSZRREG7U6k+be4IGGQzsnOw90x5wFE3QtvjzVTbCah+j1X+VpQNTL/BRq14crzceyvxjbJ1RMSLaZsEaTl1pSuVM9r9gX6ODCIpRL9yOSYY20k1150Tm12Up/gBsvx3/vrvWjIRrS7D9L96gFFW5Yj+e6gsYGkk0JVkIYBiD1iuTW/qUNjuycg+o5YYzmftL6moPRxFzQAhZmUduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WygP5XAzOTze2dyPWHYcsQGBE1NWDV43U5Figxsx03I=;
 b=PjXcyuB0VPNVuORLn4WimuO8svfhQnmZ90PnWa8bYo6bm1h1buNwdI+zMjxrYOhX1HK0rDE5ZU6QAMWbq+oSvg0uf4ArBd5h+oiqek9hSGZb6pRDc1RT1VbpQO52JuSLojx+c+9QVtOTH7HcDfEflsCi28lUu/5rsBDXMcHUjJtiCcOiEWmHFhZAj6kWgcl/evq1/v06uMUfecEMo4WhpT9uCiJSY9Gamp9kSpw+WL9J/o+ybWQar0SeH+i1mKelR95xHbvyHj/YIYAHP76Fy3rFC4WABBZy/9P+98KdQ1VR1mLhe3h+exwdc5UNqOoVbP9W6ujZ9csIOboj8Lo8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WygP5XAzOTze2dyPWHYcsQGBE1NWDV43U5Figxsx03I=;
 b=TVOO+PqTyRIdc+3XQQBQofWFyPDvWHO279zlcBDtfydnILTr/xO2vj7TnZ6+udjSs7uSxA46dQ1RC8rfUPaQ6nz9aYfC4WgdYOUaqfDVhfLhE5zMxPm7o6YMGOK56WVj5WiXrTlH2ciQMWhJ71EAka9/4zNv8yFVJlwXlb1lJjo=
Received: from DM6PR11MB4105.namprd11.prod.outlook.com (2603:10b6:5:5::30) by
 DM6PR11MB3388.namprd11.prod.outlook.com (2603:10b6:5:5f::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Fri, 12 Mar 2021 01:31:55 +0000
Received: from DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::4817:b500:8d20:d405]) by DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::4817:b500:8d20:d405%5]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 01:31:55 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cve-check: produce cve-summary in JSON format
Thread-Topic: [OE-core] [PATCH] cve-check: produce cve-summary in JSON format
Thread-Index: AQHXCp3T50ZjHFzNJEm/iiuOIFYPuKp/qHyQ
Date: Fri, 12 Mar 2021 01:31:54 +0000
Message-ID: <DM6PR11MB410531718464C24B806464FBB96F9@DM6PR11MB4105.namprd11.prod.outlook.com>
References: <1666AA95395CE489.31532@lists.openembedded.org>
In-Reply-To: <1666AA95395CE489.31532@lists.openembedded.org>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.0.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b54d4a1-955d-4ff7-bab1-08d8e4f69ed3
x-ms-traffictypediagnostic: DM6PR11MB3388:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3388B15E5DA79401B2028C55B96F9@DM6PR11MB3388.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XriQlxpZQ5NTmwDOjZ8lBd+NbkmczWQRkIPiiEQUL/Zvc4Qg6pua0T4qEu2B8SM6VqZ87OiYzDhB/VNtq1Qj8gTbIdExEcPhBTvApdj1ifVhlavUlIoANlZmGqZ4XEuL+kJP/k7vHb0jq8mDQyYON0tDQIheLUn4HanV745viMlLgt3K9nMdRLY4+oT7Jfp5CW7a96wQK1cN267pJZMFRnZAFGgIKWRAVPHzC6kPlkna/94USglbSQXeCrg79Z7pmUF5vsMexZBr+cfpRJhmqjbmZQikGF9MhIavLebwAlE/pU8CaMCwFonI27CWYxHQzZkkf29A6g4fV6r2PWFQYN3aVpCHbRUByyXfOj0wKhOz4lKuCuYeSMoB6aFA7RbGUZ6p2rVf6W1nDXASd+/x9VxIR6KqdhBbU9wA3E0ThpgD0j/aduPhy4bujsJ4eGm7s8v8/Yx0F1O02SrhXbg5FILRmuRuwTOnEWxHkf/YOZOf9qNPvWGo/0FwNRS4j2h0iUt7Ubqak15eIM5cvHBLSM4cNg6Vq/ogs01zO+EbjhFlxigQlZTVWcpU5B7jvgxSmhs81Jmx64s13urKyS+lynsoN6Ki5BRbF6ddpnqgjBA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4105.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(136003)(376002)(396003)(9686003)(66476007)(52536014)(83380400001)(33656002)(66556008)(86362001)(478600001)(7696005)(55016002)(186003)(316002)(64756008)(76116006)(66446008)(6506007)(26005)(110136005)(8936002)(71200400001)(8676002)(2906002)(5660300002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/JTQFpS0d1qSuDQy9nRHUzOfaQkDWS+yNnTAeG8oGb4SfB0hCKSGQ80S8pg4?=
 =?us-ascii?Q?BeJJLBnoTYWKaKvARva4wGfsoIIXIzmg7pYXpkww0z6rFbd9cqpYwxmjV9dD?=
 =?us-ascii?Q?n+F6vDQ5rPC+I8JhBToGUfgi5sWPgPmorX5T2A5XpnHe/WZZ2RAZVzROLe+i?=
 =?us-ascii?Q?6+zmWQlWVXGkh8OCjxGZjfIm2Xiyp+P9iNmfNKHBPyLMRkhEwWP6cr8eOgkn?=
 =?us-ascii?Q?lvDXmx4zfQrID8LR7ipU+yLEKVgUwk8rsYfdM0/FQZlHThwgL6wONGfSkFlQ?=
 =?us-ascii?Q?BM80ApO79jwq16xpzME5vl+wJxB51K8Gjter15hzWXexAMapUv2VRGC8e2VE?=
 =?us-ascii?Q?L5qq/OYcC8YKBlmsIcEZFwqGIVqlX7wgSxp5H8k/CaPAwhq61y0q6VPusGA1?=
 =?us-ascii?Q?4MxY/RLeNmO/6zPI5YHfUTHjfBI5mfJMMyqroADTLIX5By+PRYtx9XjMPigk?=
 =?us-ascii?Q?s8udHhDw3rlY79i1Mxb04mOgzb2uw5IxAuLWbkrEzmdKqbrJ0hWfAXRKcxU3?=
 =?us-ascii?Q?CC8M9GmSIXxuC0445RUckRR39ZniEbJ4+YfWXaDpoyMhSR/I2NfHKm17G8KG?=
 =?us-ascii?Q?MeLrTBX/ICOkD7lG06Qab4L+ry/nOK+wOchy8TVTN+mkYTU2TNbkrnaAoomB?=
 =?us-ascii?Q?EaiDKCTlxDtRVqerwYGpcPqr861/IlwooE03PslhR+zBDKi2TDqx7e584oMr?=
 =?us-ascii?Q?2Rdw1OshkDZD10oxvSVFibu55iwxdXxLd8BSlFNE8/13YsUafjjZ9oNfoRtB?=
 =?us-ascii?Q?sFc8BAecn3ahzaldjNbTlX9+aaDOPZ5LhfoJZ7haJgwQtomaRASveQG0v+HS?=
 =?us-ascii?Q?gbhAd123aEoEiaZ3d00mQiYEYxgS4DpTs4f3E25SHfwyJFbO4ik2ZO/9gt9D?=
 =?us-ascii?Q?KrXBHojcrkJJ0drlyEG2e4tOTOHuwDqdGJKqXJ0QchIFibFCQKnVzuq/E0Rj?=
 =?us-ascii?Q?4CKscCXlYlavZXofIDq7aRsXElqEFKV77ZJa3qOk02I/SgjXcrWuAh47pt0C?=
 =?us-ascii?Q?BBm4feMwoj3CsXSfsQLgKgv5YSqnKBcFPsRLhueUDV3JTWGI2yX4WbB5y4z1?=
 =?us-ascii?Q?VNJ9JIR/YFUIParjL/69mH5G2+2U3unHFOHA0z6EuWnS0uKFMPEVZ20aecMP?=
 =?us-ascii?Q?fVwtvVZ8t20fOV5ePCiNeVkKVlMYaglW7joP/8pAqlJAdWOA5ueKBC6JAVC7?=
 =?us-ascii?Q?rBpB5R61JaYy6MQGPkha7BX8oNPSaqhW6YcUAf7bSBiSw/HntRluoFwq71w9?=
 =?us-ascii?Q?2K0duogZFJ/cG4/ku0BbygDt7sqaLA/tXwN8AL2rs1THabXkoGyjHQTPqi3l?=
 =?us-ascii?Q?mBc=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b54d4a1-955d-4ff7-bab1-08d8e4f69ed3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 01:31:54.9669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmi8Sbue8UXodxqIty3r0IumHlHO+Ot1tG+Imc293TK63ND5p2IaoTzCcTnIuH+PTWOBfPHca2nQhZcGLt42EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3388
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Lee Chee Yang
>Sent: Wednesday, 24 February, 2021 7:11 PM
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [PATCH] cve-check: produce cve-summary in JSON format
>
>From: Lee Chee Yang <Chee.Yang.Lee@intel.com>
>
>produce cve-summary in JSON format so it can be translate and consume by
>other tools.
>
>output json summary file use similar name as
>CVE_CHECK_SUMMARY_FILE_NAME but with .json extension.
>
>[yocto#13975]
>
>Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
>---
> meta/classes/cve-check.bbclass | 43 +++++++++++++++++++++++++++++++++-
> 1 file changed, 42 insertions(+), 1 deletion(-)
>
>diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcla=
ss
>index 112ee3379d..09bd1f6597 100644
>--- a/meta/classes/cve-check.bbclass
>+++ b/meta/classes/cve-check.bbclass
>@@ -66,8 +66,10 @@ CVE_VERSION_SUFFIX ??=3D ""
> python cve_save_summary_handler () {
>     import shutil
>     import datetime
>+    import json
>
>     cve_tmp_file =3D d.getVar("CVE_CHECK_TMP_FILE")
>+    cve_tmp_file_json =3D "%s-json" % cve_tmp_file
>
>     cve_summary_name =3D d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
>     cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR") @@ -85,6 +87,26 @@
>python cve_save_summary_handler () {
>             if os.path.exists(os.path.realpath(cvefile_link)):
>                 os.remove(cvefile_link)
>             os.symlink(os.path.basename(cve_summary_file), cvefile_link)
>+
>+    cve_summary_file_json =3D os.path.join(cvelogpath, "%s-%s.json" %
>(cve_summary_name, timestamp))
>+    # cve_tmp_file_json record each CVE in single line, consolidate them =
into
>single json file
>+    if os.path.exists(cve_tmp_file_json):
>+        cve_json =3D {}
>+        cve_json['CVEs'] =3D []
>+        f_json =3D open(cve_tmp_file_json,"r")
>+        for line in f_json:
>+            cve_json['CVEs'].append(json.loads(line))
>+        f_json.close()
>+
>+        with open(cve_summary_file_json,"w") as f:
>+            json.dump(cve_json, f, indent=3D4)
>+
>+        if cve_summary_file_json and os.path.exists(cve_summary_file_json=
):
>+            cvefile_link =3D os.path.join(cvelogpath, "%s.json" %
>+ cve_summary_name)
>+
>+            if os.path.exists(os.path.realpath(cvefile_link)):
>+                os.remove(cvefile_link)
>+            os.symlink(os.path.basename(cve_summary_file_json),
>+ cvefile_link)
> }
>
> addhandler cve_save_summary_handler
>@@ -118,6 +140,7 @@ python cve_check_cleanup () {
>     Delete the file used to gather all the CVE information.
>     """
>     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
>+    bb.utils.remove("%s-json" % e.data.getVar("CVE_CHECK_TMP_FILE"))
> }
>
> addhandler cve_check_cleanup
>@@ -340,7 +363,7 @@ def cve_write_data(d, patched, unpatched, whitelisted,
>cve_data):
>     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>     CVE manifest if enabled.
>     """
>-
>+    import json
>
>     cve_file =3D d.getVar("CVE_CHECK_LOG")
>     fdir_name  =3D d.getVar("FILE_DIRNAME") @@ -356,6 +379,7 @@ def
>cve_write_data(d, patched, unpatched, whitelisted, cve_data):
>         return
>
>     nvd_link =3D "https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D"
>+    json_string =3D ""
>     write_string =3D ""
>     unpatched_cves =3D []
>     bb.utils.mkdirhier(os.path.dirname(cve_file))
>@@ -370,17 +394,30 @@ def cve_write_data(d, patched, unpatched, whiteliste=
d,
>cve_data):
>         write_string +=3D "CVE: %s\n" % cve
>         if cve in whitelisted:
>             write_string +=3D "CVE STATUS: Whitelisted\n"
>+            json_string +=3D '{"CVE STATUS": "Whitelisted"'
>         elif is_patched:
>             write_string +=3D "CVE STATUS: Patched\n"
>+            json_string +=3D '{"CVE STATUS": "Patched"'
>         else:
>             unpatched_cves.append(cve)
>             write_string +=3D "CVE STATUS: Unpatched\n"
>+            json_string +=3D '{"CVE STATUS": "Unpatched"'
>         write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
>         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["sco=
rev2"]
>         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["sco=
rev3"]
>         write_string +=3D "VECTOR: %s\n" % cve_data[cve]["vector"]
>         write_string +=3D "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
>
>+        json_string +=3D ',"LAYER": "%s"' % layer
>+        json_string +=3D ',"PACKAGE NAME": "%s"' % d.getVar("PN")
>+        json_string +=3D ',"PACKAGE VERSION": "%s%s"' % (d.getVar("EXTEND=
PE"),
>d.getVar("PV"))
>+        json_string +=3D ',"CVE": "%s"' % cve
>+        json_string +=3D ',"CVE SUMMARY": %s' %
>json.dumps(cve_data[cve]["summary"])
>+        json_string +=3D ',"CVSS v2 BASE SCORE": "%s"' % cve_data[cve]["s=
corev2"]
>+        json_string +=3D ',"CVSS v3 BASE SCORE": "%s"' % cve_data[cve]["s=
corev3"]
>+        json_string +=3D ',"VECTOR": "%s"' % cve_data[cve]["vector"]
>+        json_string +=3D ',"MORE INFORMATION": "%s%s"}\n' % (nvd_link,
>+ cve)
>+
>     if unpatched_cves:
>         bb.warn("Found unpatched CVE (%s), for more information check %s"=
 % ("
>".join(unpatched_cves),cve_file))
>
>@@ -401,3 +438,7 @@ def cve_write_data(d, patched, unpatched, whitelisted,
>cve_data):
>
>             with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
>                 f.write("%s" % write_string)
>+
>+            with open("%s-json" % d.getVar("CVE_CHECK_TMP_FILE"), "a") as=
 f:
>+                f.write("%s" % json_string)
>+
>--
>2.17.1

