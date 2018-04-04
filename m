Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 15480 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Apr 2018 23:44:20 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0068.outbound.protection.outlook.com [104.47.1.68])
	by mail.openembedded.org (Postfix) with ESMTP id EDA1960234
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 23:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PdQsfYPzrAPZt63YrQGKBOBxQbVds9/fQvzzSAPbaiQ=;
	b=jVu4enczgNLfyKMlTTYGZra22xumTQ/mtj1yzC0bjqUFGIXVvYcNf/rp2gIad9wrfRo1Mmr61jRIbhU/O7yfhUztPwW+QLE2pM551iWj4n5S/Xl8y/mrmPUaKDLUQ+oKgQLp4Z9RBgHG0wz0qYOn+Z3TdpFt73wZ7KHbcszTwTg=
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) by
	AM5PR0402MB2802.eurprd04.prod.outlook.com (10.175.41.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.653.12; Wed, 4 Apr 2018 20:09:30 +0000
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com
	([fe80::c0e7:a573:efad:aa60]) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com
	([fe80::c0e7:a573:efad:aa60%10]) with mapi id 15.20.0653.012;
	Wed, 4 Apr 2018 20:09:30 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: python3-native certificate failure
Thread-Index: AdPHknKk2Tme/Xf0REaBJpxIFGCIjQ==
Date: Wed, 4 Apr 2018 20:09:30 +0000
Message-ID: <AM5PR0402MB2817BAED1816216C67E76BC6E2A40@AM5PR0402MB2817.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.168.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2802;
	7:V761imkCCSPsfaONNS1V4Y9kk15PSRqLje98WDeQqNMMOSu4PXJd/hLiF1weUFfT1wVTIn8re5Qtd9lcu8uMngS4ikrBbbEhPAC6ztz6DsjaHD0+4NDMusrNbZwfX2wxAeuzEjLV7Uqhh4DvkKKqxSdIAkEHX5XfcZRNFwv2x0ZWshSQuAqcqmucAk3j3sMB4uXgrPDwWYso2cTbi+JuGOELgEF6Qfj5LLGW2OGX6OuHXDgodQPWaV1FLHCocT89
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 297a1721-9805-4a30-bc23-08d59a67f9e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2802; 
x-ms-traffictypediagnostic: AM5PR0402MB2802:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-microsoft-antispam-prvs: <AM5PR0402MB28026768D1CBFB21B75AFDB6E2A40@AM5PR0402MB2802.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(158342451672863)(42262312472803)(21748063052155)(5213294742642)(21532816269658);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:AM5PR0402MB2802; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2802; 
x-forefront-prvs: 0632519F33
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39860400002)(396003)(366004)(39380400002)(199004)(189003)(6506007)(5640700003)(105586002)(6916009)(2906002)(74316002)(33656002)(25786009)(7736002)(55016002)(3660700001)(9686003)(54896002)(6306002)(66066001)(486006)(3280700002)(6436002)(2501003)(2900100001)(53936002)(5250100002)(186003)(8676002)(2351001)(97736004)(106356001)(8936002)(81156014)(7696005)(5660300001)(478600001)(99286004)(81166006)(790700001)(26005)(59450400001)(3846002)(316002)(14454004)(6116002)(68736007)(86362001)(476003)(102836004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2802;
	H:AM5PR0402MB2817.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: i2ZSIYOXfD6jACdrjokpfER/g6oRF9iNHiDN3Qd24zEg5CtfLYd2WFcTsXIOEEb/GdeTFB3xCczUwDlC6QV87zhwohEsrHKU/LzTOc7Zyx+tgXK0XjOI62b1GUYEoOUcG3uEaC+M1S4lJ9GqxtRVUk1jOITYo9ziiGOU9MhGERPrIvWBT0sBXM0rEtznxDYoKyNIi8/ZR3HKSXV/Z1TfRyj2Lr6ccV4vObMCaY48L4AdbZ+NGHlvvgbu+I8Si9WA8R69oRrnlOb5YHagy2OIcwL+0xpX9j4L1HUwHvnjfmspNNQQAKYoVnMIPRF0qoEAk6yHrl3bBgzunIQZopedbjcXt3NE+BCEf3pVJeRi/8BO3oAnetXSJqJ76kNXXDdP3BMcJA6021Rqf95RIipacjjmO5AXub2+SSg9frRYsPw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297a1721-9805-4a30-bc23-08d59a67f9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2018 20:09:30.6976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2802
Subject: python3-native certificate failure
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
X-List-Received-Date: Wed, 04 Apr 2018 23:44:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0402MB2817BAED1816216C67E76BC6E2A40AM5PR0402MB2817_"

--_000_AM5PR0402MB2817BAED1816216C67E76BC6E2A40AM5PR0402MB2817_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am trying to download a URL from a source package using python3-native, b=
ut it is failing with a certificate failure. I added DEPENDS on ca-certific=
ates-native and python3-certifi-native, but it doesn't seem to help. A coll=
eague with a corresponding SDK took the aarch64 sysroot certificates and dr=
opped them in x86_64 sysroot and the problem was fixed.

Tom

r60874@tx30imx-01:~/rocko/build-xwayland$ bitbake imx-gpu-sdk -c devshell
root@tx30imx-01:~/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/im=
x-gpu-sdk/5.0.2-r0/git# python3
Python 3.5.3 (default, Mar  6 2018, 14:15:44)
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import urllib.request
>>> urllib.request.urlretrieve("https://sourceforge.net/projects/tclap/file=
s/tclap-1.2.2.tar.gz", "~")
Traceback (most recent call last):
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 1254, in do_open
    h.request(req.get_method(), req.selector, req.data, headers)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.p=
y", line 1107, in request
    self._send_request(method, url, body, headers)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.p=
y", line 1152, in _send_request
    self.endheaders(body)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.p=
y", line 1103, in endheaders
    self._send_output(message_body)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.p=
y", line 934, in _send_output
    self.send(msg)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.p=
y", line 877, in send
    self.connect()
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.p=
y", line 1261, in connect
    server_hostname=3Dserver_hostname)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py", line=
 385, in wrap_socket
    _context=3Dself)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py", line=
 760, in __init__
    self.do_handshake()
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py", line=
 996, in do_handshake
    self._sslobj.do_handshake()
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py", line=
 641, in do_handshake
    self._sslobj.do_handshake()
ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_=
ssl.c:720)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 188, in urlretrieve
    with contextlib.closing(urlopen(url, data)) as fp:
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 163, in urlopen
    return opener.open(url, data, timeout)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 466, in open
    response =3D self._open(req, data)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 484, in _open
    '_open', req)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 444, in _call_chain
    result =3D func(*args)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 1297, in https_open
    context=3Dself._context, check_hostname=3Dself._check_hostname)
  File "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux=
/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/reques=
t.py", line 1256, in do_open
    raise URLError(err)
urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] cert=
ificate verify failed (_ssl.c:720)>

--_000_AM5PR0402MB2817BAED1816216C67E76BC6E2A40AM5PR0402MB2817_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I am trying to download a URL from a source package =
using python3-native, but it is failing with a certificate failure. I added=
 DEPENDS on ca-certificates-native and python3-certifi-native, but it doesn=
&#8217;t seem to help. A colleague with
 a corresponding SDK took the aarch64 sysroot certificates and dropped them=
 in x86_64 sysroot and the problem was fixed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tom<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">r60874@tx30imx-01:~/rocko/build-xwayland$ bitbake im=
x-gpu-sdk -c devshell<o:p></o:p></p>
<p class=3D"MsoNormal">root@tx30imx-01:~/rocko/build-xwayland/tmp/work/aarc=
h64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/git# python3<o:p></o:p></p>
<p class=3D"MsoNormal">Python 3.5.3 (default, Mar&nbsp; 6 2018, 14:15:44)<o=
:p></o:p></p>
<p class=3D"MsoNormal">[GCC 5.4.0 20160609] on linux<o:p></o:p></p>
<p class=3D"MsoNormal">Type &quot;help&quot;, &quot;copyright&quot;, &quot;=
credits&quot; or &quot;license&quot; for more information.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; import urllib.request<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; urllib.request.urlretrieve(&quot;https:=
//sourceforge.net/projects/tclap/files/tclap-1.2.2.tar.gz&quot;, &quot;~&qu=
ot;)<o:p></o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 1254, in do_open<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; h.request(req.get_method(), req.s=
elector, req.data, headers)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/http/client.py&quot;, line 1107, in request<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self._send_request(method, url, b=
ody, headers)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/http/client.py&quot;, line 1152, in _send_request<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self.endheaders(body)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/http/client.py&quot;, line 1103, in endheaders<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self._send_output(message_body)<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/http/client.py&quot;, line 934, in _send_output<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self.send(msg)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/http/client.py&quot;, line 877, in send<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self.connect()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/http/client.py&quot;, line 1261, in connect<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; server_hostname=3Dserver_hostname=
)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/ssl.py&quot;, line 385, in wrap_socket<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; _context=3Dself)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/ssl.py&quot;, line 760, in __init__<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self.do_handshake()<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/ssl.py&quot;, line 996, in do_handshake<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self._sslobj.do_handshake()<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/ssl.py&quot;, line 641, in do_handshake<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self._sslobj.do_handshake()<o:p><=
/o:p></p>
<p class=3D"MsoNormal">ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certi=
ficate verify failed (_ssl.c:720)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">During handling of the above exception, another exce=
ption occurred:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &l=
t;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 188, in urlretrieve<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; with contextlib.closing(urlopen(u=
rl, data)) as fp:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 163, in urlopen<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; return opener.open(url, data, tim=
eout)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 466, in open<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; response =3D self._open(req, data=
)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 484, in _open<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; '_open', req)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 444, in _call_chain<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; result =3D func(*args)<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 1297, in https_open<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; context=3Dself._context, check_ho=
stname=3Dself._check_hostname)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/r60874/rocko/build-xwayland/=
tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-nativ=
e/usr/lib/python3.5/urllib/request.py&quot;, line 1256, in do_open<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; raise URLError(err)<o:p></o:p></p=
>
<p class=3D"MsoNormal">urllib.error.URLError: &lt;urlopen error [SSL: CERTI=
FICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:720)&gt;<o:p></o:p>=
</p>
</div>
</body>
</html>

--_000_AM5PR0402MB2817BAED1816216C67E76BC6E2A40AM5PR0402MB2817_--
