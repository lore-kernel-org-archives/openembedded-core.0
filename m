Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED12796F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 05:23:11 +0000 (UTC)
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 4265SG0zfsz4f3kl6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 07:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1536297790;
	bh=wFJK5B/v7qFlv0oCaCpkGWMzY1qeV8Z47Ikl4d2ZDJI=; l=10;
	h=From:From:Reply-To:Sender;
	b=YaWjJqwqpbSvnukKUzelt2hkqzOs1st3sO3Mp9WefJN9JBc2zqxVF/8MIidNiNF/g
	OLdGtx7z2h3YWGdBU+a5NR8BE7abgRhaSSbXze7vp3HkaLYeWyke8y+C4L/0BlIuUR
	LmEFeBT5NvZmXFYMTihq/jJjnJ4tRMHaSONNC7XE=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4265SG0bWKz39p
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 07:23:10 +0200 (CEST)
X-AuditID: 0a3aad12-92fff70000000ca7-41-5b920b19ac6a
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id
	83.7D.03239.91B029B5; Fri,  7 Sep 2018 07:22:33 +0200 (CEST)
Received: from FE-MBX2014.de.bosch.com (fe-mbx2014.de.bosch.com [10.3.231.20])
	by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 4265SF5tzZzFypP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 07:23:09 +0200 (CEST)
Received: from SGPMBX2010.APAC.bosch.com (10.187.83.34) by
	FE-MBX2014.de.bosch.com (10.3.231.20) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Fri, 7 Sep 2018 07:23:09 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2010.APAC.bosch.com (10.187.83.34) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Fri, 7 Sep 2018 13:23:07 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.009; Fri, 7 Sep 2018 13:23:07 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-Core] eSDK: sstate issue with hardcoded path
Thread-Index: AQHURmj7tcxGQJTIO0GuJtIkzZrmlg==
Date: Fri, 7 Sep 2018 05:23:07 +0000
Message-ID: <410b48d9961e48c28807f095520edfc8@in.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.1.182]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUxTZxjl7W3LpeMul1srDxUyrWY/NsvKh5tfIxtLnJLpTDbnZhPn7bjS
	xn6QewsT/4xJBO1KgQqJFFNx6SrSAmGTDaeBrWOMYUSGyqAQUGTDQTbHhzKGY2t7wfbH/rw5
	z3mec97zPjcXx6iruBzXGc0Ma6T1CrFEKNnakKRMeMquVl2ZfHbz8MIf0a+gnT3NdWgvOiDZ
	ns3odfkM+0LGIYn2xB1V7kzi0bJ7VagQLYEFxeBApsNIg0dsQRKcIksE0Dn2k5AvphDccl7D
	+OIBgpKHF0R8MYPgrqMCC+op8jsElt/fDmIxuQM8lccFQbyKPAR9pZaQFUbWIrBabMJgQ0pu
	gfqGimh+KAN8lttiHieD63ptyFRIboC2pr9DmCC3wURdqyiIEZkEnw7aQz4YGQ/+8XMC/hEk
	uK7ewHgsg9/uLYl4vBbmpj3L8xq487hGzHvGwY/V48JyJHNEWDkixhwRYzyfDANVlWIePw/u
	81MYj5VwZsknjORrUXQ9knE6Vb4h/cX01GRWw3DHVCnJH5gMnyP+g1GtqLn/sA+ROFLEEmnI
	rqZEdD5XYPChTbhAISNGZirU1NMaU3aBlua077N5eoZTyAkUFRVFSZ/QXJ7GoOM4ncnoQ4Bj
	ilVE0amAjsimC44xrImX+dAaXKiIJ+ZOG9QUmUObmSMMk8uwK93XcZws9Xp6kVxoNBkZBRCb
	JYE8cSyTwxw9rNObV0YVSfz9qyM7kREEeIwPpeGxgRyZQQuCy6UNnC5nWZ7Ay6kVNiztRvtw
	f5HVjuEdI5WBszd0Pn5QZceoUCh5PHEhJuBIBrXaPOOTTPJEIpotU1OyiEbYdxINosCGpcTe
	YJzYwF8TTgNEq/Tse1TcMhkWpX4W0JAdYmhzlyHw/1ovgNP/WEVwcuxbETQW94nAu/ixGIZd
	X4jB1tklhYV/b8igvb17NXTX/gxQPHZzPbg+ObcBTjy8uBHalixKGC6/mwKjA8dTwemoTgOn
	vWYTzE9/9RJMX5vZArOLzq3gLJzfDrcW5zPgTIvrNVgYbd0B3prrO6Fl9GQWDPX8kgXN4yVv
	wKD11G6YvVL85mRg1YLAqvsvlwdXbabN/7PqZTb8OnkhIjJLd39dff8bW3/W9+edP9xcd1v2
	4Zo9Sm+jZmFOobrfkWObIps/Stpz8NI7f/pHEus8B9N39fXr26ubmmxDPRMvH6ioeKTsvOS6
	3JXX+OiZixtFA/vXxh9pGHqLniiqZFvMuN+5f/2XKe5d72Je69mibZmvAuFOcLfM9v61r2uA
	9SiEnJZOeQ5jOfo/THuFT88EAAA=
Cc: "Ramadevi Sennakesavan \(RBEI/ECF3\)" <Ramadevi.Sennakesavan@in.bosch.com>,
	"Avanashilingam Gokulnath \(RBEI/ECF3\)"
	<Gokulnath.Avanashilingam@in.bosch.com>
Subject: eSDK: sstate issue with hardcoded path
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
X-List-Received-Date: Fri, 07 Sep 2018 05:23:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_410b48d9961e48c28807f095520edfc8inboschcom_"

--_000_410b48d9961e48c28807f095520edfc8inboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello OE-Core,


We are facing an issue with eSDK installation.


the taskhash of the recipes seems different in default and eSDK builds and =
we got the error while eSDK installation,

ERROR: Task wayland-native.do_fetch attempted to execute unexpectedly
ERROR: Task wayland-native.do_patch attempted to execute unexpectedly
ERROR: Task wayland-native.do_configure attempted to execute unexpectedly
ERROR: Task wayland-native.do_compile attempted to execute unexpectedly
ERROR: Task wayland-native.do_install attempted to execute unexpectedly
ERROR: Task wayland-native.do_populate_sysroot attempted to execute unexpec=
tedly and should have
[ lot of errors... shrinked]

While looking at the rootcause,
sstate siginfo file is hardcoded with absolute path

^A^@^@hWhUhPh<88>h<87>h>h<h~h`hVjN^A^@^@j=AD^A^@^@hAh?h}h=CBjO^A^@^@hnh^hqh=
5e<8c>^Mtaskwhitelist<94>N<8c>^Mruntaskhashes<94>}<94>(<8c>j/home/vicky/yoc=
to_esdk/..../curl/curl_7.59.0.bb.do_compile<94><8c>


I think, I can use vardepsexclude on some variables handling siginfo to ove=
rcome the issue,

I have tried searching sstate bbclass to exclude the path.

But no luck.


Can you please provide a suggestion to overcome the issue?


Thanks and Regards,

Vignesh Rajendran


--_000_410b48d9961e48c28807f095520edfc8inboschcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hello OE-Core,</p>
<p><br>
</p>
<p>We are facing an issue with eSDK installation.</p>
<p><br>
</p>
<p></p>
<div>the taskhash of the recipes seems different in default and eSDK builds=
 and we got the error while eSDK installation,<br>
</div>
<div><br>
</div>
<div>ERROR: Task wayland-native.do_fetch attempted to execute unexpectedly<=
br>
ERROR: Task wayland-native.do_patch attempted to execute unexpectedly<br>
ERROR: Task wayland-native.do_configure attempted to execute unexpectedly<b=
r>
ERROR: Task wayland-native.do_compile attempted to execute unexpectedly<br>
ERROR: Task wayland-native.do_install attempted to execute unexpectedly<br>
ERROR: Task wayland-native.do_populate_sysroot attempted to execute unexpec=
tedly and should have
<br>
</div>
<div>[ lot of errors... shrinked] <br>
</div>
<div><br>
</div>
<div>While looking at the rootcause, <br>
</div>
<div>sstate siginfo file is hardcoded with absolute path</div>
<div><br>
</div>
<div>^A^@^@hWhUhPh&lt;88&gt;h&lt;87&gt;h&gt;h&lt;h~h`hVjN^A^@^@j=AD^A^@^@hA=
h?h}h=CBjO^A^@^@hnh^hqh5e&lt;8c&gt;^Mtaskwhitelist&lt;94&gt;N&lt;8c&gt;^Mru=
ntaskhashes&lt;94&gt;}&lt;94&gt;(&lt;8c&gt;j/home/vicky/yocto_esdk/..../cur=
l/curl_7.59.0.bb.do_compile&lt;94&gt;&lt;8c&gt;
<br>
</div>
<p></p>
<p><br>
</p>
<p>I think, I can use vardepsexclude on some variables handling siginfo to =
overcome the issue,</p>
<p>I have tried searching sstate bbclass to exclude the path.</p>
<p>But no luck.<br>
</p>
<p><br>
</p>
<p>Can you please provide a suggestion to overcome the issue?<br>
</p>
<p><br>
</p>
<p>Thanks and Regards,</p>
<p>Vignesh Rajendran<br>
</p>
<p><br>
</p>
</div>
</body>
</html>

--_000_410b48d9961e48c28807f095520edfc8inboschcom_--
