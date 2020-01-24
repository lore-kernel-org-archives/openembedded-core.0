Return-Path: <chris.laplante@agilent.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	by mail.openembedded.org (Postfix) with ESMTP id 8953A7FD47
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TLT7C2j7hT/db3F2YShtnDZDOE314dpyXIqpdNm2lZvIVLoZmpxer76YIp9n5T0acNAR6xxv8x/1xjoRpZGXkFkMo7KeNn7O7xMNOS6a0b5tb7lW5NeNQnzenPKBlyUUZUTnsN20SdbcwlvJ6GsJEnqLvouNCRztJRjPgVvGHGRf/afnm0QnN2jg7dOfk6rTjAu5Fco1ByqEFhFYieweSx+MGRlWqdNAgBe58B95iwdT6fJD88TqafaQaVmJR7ExLa8Iexr1O2TIsmR/lN0M8MtUS5BhBGbmEWLnNwvgZqk58NtLO6fxQmRbs4eItUxsUtNv7uQQJcx72xYt+IsKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JTykMaQ5NrhQVC1/pNZUBDmRZwf20oWH+r5m8YPCKvs=;
	b=U36RA6goYZ+ObUvNR/dFvgFoH38j6zJkfJaAiOguWJVyiSscxY2xuhplXtqtg3C4AjHCLeO0+Uf5w/OQ9V29CHH/Cg4rAKDWtnbfRRDJJSmh5BoXOc0Ce8/59YZTu6jxKX5Cvd7Vi5diZ2HAiO6SdJ7BheVP+kB0I65Wy21AcIp3lNsNcQWAwKJbDuKguL2C06a652E6mXKhxky0E1xBGeqELPJZvWjAM9dfKakdy6dbmrFKHWaypxRjjDB/RHRdtI2BMzgRHR5ZG/QZEdadZlKBhyuxOX5E/UPn2E9CxUtaTdzVyM9LK/O+JiElOVTHmFAau0+QcR77SwfWPFZE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JTykMaQ5NrhQVC1/pNZUBDmRZwf20oWH+r5m8YPCKvs=;
	b=Y+xmHyyFTB+Sa+0yD39OPAvMtiwtlyDR16ObRKs6qq3bSft9Ifxj8MRT0TMmc9eDyWEOQkve+/x9tB8scL4O/nc3DCTCXWp0AvPOgd5RZ/kKbhaLVqFX6WIfdkJ5KthrjUURxTlvQdAedIFMSENxEZDdhT9kXP2MGkYPnvDGZHQ=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.23; Fri, 24 Jan 2020 14:04:07 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2644.028;
	Fri, 24 Jan 2020 14:04:07 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
Thread-Index: AdXSu2r5qh8vRNvQSy2wYaWkj47c6w==
Date: Fri, 24 Jan 2020 14:04:07 +0000
Message-ID: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9deda21f-e206-40d4-f80d-08d7a0d6476e
x-ms-traffictypediagnostic: CY4PR12MB1653:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB16533760DB57B5F6A0F1B69D8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(29502001)(4326008)(54906003)(64756008)(66446008)(76116006)(86362001)(66556008)(66476007)(66946007)(8936002)(81156014)(52536014)(9686003)(55016002)(107886003)(81166006)(186003)(71200400001)(478600001)(5660300002)(2906002)(7696005)(8676002)(6916009)(6506007)(33656002)(26005)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1653;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jZ3xGrMSta8SkRT79lFreCZsPoRbsMndi+Z/u+bHAY9s/GjuF7dxYFhN1aHraNjDbcz0W1F3/xtfrQqdDj9pqmMAhYKLGilzuMoxG7KVR+KY11m1QrvW3apoO0/SjKLBjxQQD9GwH1QXuN9NQm0latF4slIzpJnPUKjPMPSko72E+mVr0rifiJwhZAl7s/YRGkVzckgoh5iQgDbqpxFTpk2uKIR1RoiRN6yIUK0H7VO6lrdS1IfezgWxSwPmcZa6PPgTiex8eCv123ivbcbmilbXV3XnrPfPrdrJEC1CNyp+NK3sZQXF7L/h2KfJFNyo+/b5StrhO4o4xf1nXbEtRYnOItqfYHCfcQKmMpC+7GLdzU9oVLoJFzAR21VSADyDdwp/WayKiKgZE+pTqW7R//wSu6fK8MiFu/bIRwfz2z89ckKrOmPAnO9ijIgJd1wghd1fDU0Ayo3lW4/Rv4UpTBE110GnMUD0kAGhsLjzEuFsVjsWtA2TbZX26GLqsIcp
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9deda21f-e206-40d4-f80d-08d7a0d6476e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 14:04:07.6635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrlAiGTX4/FMrx0d5+WFG/s0lFJPdEFmL08eiViFBJMcG3/V0bIgOB/46h7LDcNDupdzPfqXGEoL2H7wYmHs1m2EXzLCISsBdNP61bCjllc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1653
Cc: "dave_clouser@agilent.com" <dave_clouser@agilent.com>
Subject: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
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
X-List-Received-Date: Fri, 24 Jan 2020 14:04:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR12MB165355D4A69E257FD4AB30298B0E0CY4PR12MB1653namp_"

--_000_CY4PR12MB165355D4A69E257FD4AB30298B0E0CY4PR12MB1653namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

For about two years now, we have been using Emscripten together with Yocto,=
 via an emscripten.bbclass that I wrote. In a nutshell, it works by conduct=
ing the actual build in a Docker container, whose image is where Emscripten=
 is actually installed.  I mount all the necessary directories (e.g. ${B}, =
${S}, etc.) into the container, and I've got some Python scripting that ens=
ures that containers get cleaned up even if the build is aborted with Ctrl+=
C or otherwise dies. All of our Emscripten-enabled recipes happen to be usi=
ng CMake, so emscripten.bbclass is CMake specific. It's basically a reimple=
mentation of cmake.bbclass (from Poky) that happens to run in a container.

For the time being the specifics of how the Emscripten part works isn't rel=
evant (1). I provide it as background for what I really want to ask about, =
which is the Yocto-specific plumbing. Here's a snippet of it:

-------
    # Copyright (C) 2020 Agilent Technologies, Inc.
    # SPDX-License-Identifier: GPL-2.0-only
    CLASSOVERRIDE =3D "class-emscripten"
    SPECIAL_PKGSUFFIX_class-emscripten +=3D "-emscripten"
    BASEDEPENDS_class-emscripten =3D ""
    FILES_${PN} =3D+ "${libdir}/*.js"
    export prefix =3D "/usr/js"

    python emscripten_virtclass_handler() {
        pn =3D e.data.getVar("PN")
        if not pn.endswith("-emscripten"):
            return

        classextend =3D e.data.getVar('BBCLASSEXTEND') or ""
        if "emscripten" not in classextend:
            return

        def map_dependencies(varname, d, suffix =3D ""):
            if suffix:
                varname =3D varname + "_" + suffix
            deps =3D d.getVar(varname)
            if not deps:
                return
            deps =3D bb.utils.explode_deps(deps)
            newdeps =3D []
            for dep in deps:
                if dep =3D=3D pn:
                    continue
                elif dep in ["cmake-native"]:
                    continue
                elif dep.endswith("-emscripten"):
                    newdeps.append(dep)
                elif dep.endswith("-native"):
                    bb.warn("emscripten.bbclass: Native dependency {0} will=
 not be usable from within Emscripten Docker container".format(dep))
                    newdeps.append(dep)
            d.setVar(varname, " ".join(newdeps))

        e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":vi=
rtclass-emscripten")

        map_dependencies("DEPENDS", e.data)
        for pkg in [e.data.getVar("PN"), "", "${PN}"]:
            map_dependencies("RDEPENDS", e.data, pkg)
            map_dependencies("RRECOMMENDS", e.data, pkg)
            map_dependencies("RSUGGESTS", e.data, pkg)
            map_dependencies("RPROVIDES", e.data, pkg)
            map_dependencies("RREPLACES", e.data, pkg)

        provides =3D e.data.getVar("PROVIDES")
        nprovides =3D []
        for prov in provides.split():
            if prov.find(pn) !=3D -1:
                nprovides.append(prov)
            elif not prov.endswith("-emscripten"):
                nprovides.append(prov.replace(prov, prov + "-emscripten"))
            else:
                nprovides.append(prov)
        e.data.setVar("PROVIDES", ' '.join(nprovides))
    }

    addhandler emscripten_virtclass_handler
    emscripten_virtclass_handler[eventmask] =3D "bb.event.RecipePreFinalise=
"

    do_populate_sysroot[stamp-extra-info] =3D ""
    do_packagedata[stamp-extra-info] =3D ""
-------


There are two main goals of this code. First, it sets up dependencies betwe=
en -emscripten recipes. Second, it sets 'prefix' to be '/usr/js/' so that, =
for example, a "foo" and "foo-emscripten" recipe that both install developm=
ent headers won't collide. I call this the "sub-sysroot".

I have a few concerns/questions:
[a] Is the basic premise of a custom CLASSOVERRIDE supported by Yocto? Our =
situation seems a bit weird, because our emscripten recipes are still sort =
of "target" recipes, so I feel a bit funny completely wiping CLASSOVERRIDE.
[b] At the very least, I know I did something wrong, because sometimes we g=
et weird warnings like:

WARNING: app-emscripten-1.0+gitAUTOINC+1d1073e7c4-r0 do_compile: Manifest /=
home/user/yocto/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-l=
ibrary-emscripten.populate_sysroot not found in my_mach cortexa9t2hf-neon c=
ortexa9t2hf-vfp cortexa9hf-neon cortexa9hf-vfp armv7at2hf-neon armv7ahf-neo=
n armv7at2hf-vfp armv7ahf-vfp armv6thf-vfp armv6hf-vfp armv5tehf-vfp armv5e=
hf-vfp armv5thf-vfp armv5hf-vfp allarch x86_64_x86_64-nativesdk (variant ''=
)?

... usually followed by a build failure in "app-emscripten" because "librar=
y-emscripten:do_populate_sysroot" indeed didn't run. Related to [a] or perh=
aps the stamp-extra-info lines?
[c] Is there a better way to do the "sub-sysroot" (/usr/js)? Would multilib=
 cover this whole use case?  (2)

I appreciate any comments/help.
Chris


(1) I'm happy to cover it in a separate thread if people are interested. I =
hope to rewrite the class using Clang's WebAssembly backend, rather than ca=
ll out to the Emscripten container which has always seemed like a hack. Reg=
ardless, I will make what we have public on poky-contrib soon anyway.
(2) I suppose one option is to have Emscripten flavors of all the MACHINEs =
we are building for, but I'd like to avoid that. We only have a handful of =
Emscripten recipes, so a separate MACHINE at this time would be overkill.

--_000_CY4PR12MB165355D4A69E257FD4AB30298B0E0CY4PR12MB1653namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For about two years now, we have been using Emscript=
en together with Yocto, via an emscripten.bbclass that I wrote. In a nutshe=
ll, it works by conducting the actual build in a Docker container, whose im=
age is where Emscripten is actually
 installed.&nbsp; I mount all the necessary directories (e.g. ${B}, ${S}, e=
tc.) into the container, and I&#8217;ve got some Python scripting that ensu=
res that containers get cleaned up even if the build is aborted with Ctrl&#=
43;C or otherwise dies. All of our Emscripten-enabled
 recipes happen to be using CMake, so emscripten.bbclass is CMake specific.=
 It&#8217;s basically a reimplementation of cmake.bbclass (from Poky) that =
happens to run in a container.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For the time being the specifics of how the Emscript=
en part works isn&#8217;t relevant (1). I provide it as background for what=
 I really want to ask about, which is the Yocto-specific plumbing. Here&#82=
17;s a snippet of it:
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-------<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; # Copyright (C) 2020 Agilent Tech=
nologies, Inc.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; # SPDX-License-Identifier: GPL-2.=
0-only<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; &nbsp;CLASSOVERRIDE =3D &quot;class-ems=
cripten&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; SPECIAL_PKGSUFFIX_class-emscripte=
n &#43;=3D &quot;-emscripten&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; BASEDEPENDS_class-emscripten =3D =
&quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; FILES_${PN} =3D&#43; &quot;${libd=
ir}/*.js&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; export prefix =3D &quot;/usr/js&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; python emscripten_virtclass_handl=
er() {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pn =3D e.=
data.getVar(&quot;PN&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not pn=
.endswith(&quot;-emscripten&quot;):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; classexte=
nd =3D e.data.getVar('BBCLASSEXTEND') or &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;=
emscripten&quot; not in classextend:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def map_d=
ependencies(varname, d, suffix =3D &quot;&quot;):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if suffix:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; varname =3D varname &#43; &quot;_&qu=
ot; &#43; suffix<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; deps =3D d.getVar(varname)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if not deps:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; deps =3D bb.utils.explode_deps(deps)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; newdeps =3D []<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; for dep in deps:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if dep =3D=3D pn:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif dep in [&quot;cmake-native&quot=
;]:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif dep.endswith(&quot;-emscripten&=
quot;):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newdeps.appe=
nd(dep)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif dep.endswith(&quot;-native&quot=
;):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn(&quo=
t;emscripten.bbclass: Native dependency {0} will not be usable from within =
Emscripten Docker container&quot;.format(dep))<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newdeps.appe=
nd(dep)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; d.setVar(varname, &quot; &quot;.join(newdeps))<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.data.se=
tVar(&quot;OVERRIDES&quot;, e.data.getVar(&quot;OVERRIDES&quot;, False) &#4=
3; &quot;:virtclass-emscripten&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map_depen=
dencies(&quot;DEPENDS&quot;, e.data)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pkg i=
n [e.data.getVar(&quot;PN&quot;), &quot;&quot;, &quot;${PN}&quot;]:<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; map_dependencies(&quot;RDEPENDS&quot;, e.data, pkg)<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; map_dependencies(&quot;RRECOMMENDS&quot;, e.data, pkg)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; map_dependencies(&quot;RSUGGESTS&quot;, e.data, pkg)<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; map_dependencies(&quot;RPROVIDES&quot;, e.data, pkg)<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; map_dependencies(&quot;RREPLACES&quot;, e.data, pkg)<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; provides =
=3D e.data.getVar(&quot;PROVIDES&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nprovides=
 =3D []<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for prov =
in provides.split():<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if prov.find(pn) !=3D -1:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nprovides.append(prov)<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; elif not prov.endswith(&quot;-emscripten&quot;):<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nprovides.append(prov.replace(prov, =
prov &#43; &quot;-emscripten&quot;))<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nprovides.append(prov)<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.data.se=
tVar(&quot;PROVIDES&quot;, ' '.join(nprovides))<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; } <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; addhandler emscripten_virtclass_h=
andler<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; emscripten_virtclass_handler[even=
tmask] =3D &quot;bb.event.RecipePreFinalise&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; do_populate_sysroot[stamp-extra-i=
nfo] =3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; do_packagedata[stamp-extra-info] =
=3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-------<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There are two main goals of this code. First, it set=
s up dependencies between -emscripten recipes. Second, it sets &#8216;prefi=
x&#8217; to be &#8216;/usr/js/&#8217; so that, for example, a &#8220;foo&#8=
221; and &#8220;foo-emscripten&#8221; recipe that both install development =
headers
 won&#8217;t collide. I call this the &#8220;sub-sysroot&#8221;.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have a few concerns/questions:<o:p></o:p></p>
<p class=3D"MsoNormal">[a] Is the basic premise of a custom CLASSOVERRIDE s=
upported by Yocto? Our situation seems a bit weird, because our emscripten =
recipes are still sort of &#8220;target&#8221; recipes, so I feel a bit fun=
ny completely wiping CLASSOVERRIDE.<o:p></o:p></p>
<p class=3D"MsoNormal">[b] At the very least, I know I did something wrong,=
 because sometimes we get weird warnings like:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Arial&quot;,sans-serif">WARNING: app-emscripten-1.0&#43;gitAUTOI=
NC&#43;1d1073e7c4-r0 do_compile: Manifest /home/user/yocto/build/tmp/sstate=
-control/manifest-x86_64_x86_64-nativesdk-library-emscripten.populate_sysro=
ot
 not found in my_mach cortexa9t2hf-neon cortexa9t2hf-vfp cortexa9hf-neon co=
rtexa9hf-vfp armv7at2hf-neon armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp armv=
6thf-vfp armv6hf-vfp armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-vfp al=
larch x86_64_x86_64-nativesdk (variant
 '')?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:10.0pt;line-height:115%;text-=
autospace:none">
<span lang=3D"EN">... usually followed by a build failure in &#8220;app-ems=
cripten&#8221; because &#8220;library-emscripten:do_populate_sysroot&#8221;=
 indeed didn&#8217;t run. Related to [a] or perhaps the stamp-extra-info li=
nes?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN">[c] Is there a better way to do th=
e &#8220;sub-sysroot&#8221; (/usr/js)? Would multilib cover this whole use =
case?&nbsp; (2)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN">I appreciate any comments/help.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN">Chris<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">(1) I&#8217;m happy to cover it in a separate thread=
 if people are interested. I hope to rewrite the class using Clang&#8217;s =
WebAssembly backend, rather than call out to the Emscripten container which=
 has always seemed like a hack. Regardless, I
 will make what we have public on poky-contrib soon anyway.<o:p></o:p></p>
<p class=3D"MsoNormal">(2) I suppose one option is to have Emscripten flavo=
rs of all the MACHINEs we are building for, but I&#8217;d like to avoid tha=
t. We only have a handful of Emscripten recipes, so a separate MACHINE at t=
his time would be overkill.
<o:p></o:p></p>
</div>
</body>
</html>

--_000_CY4PR12MB165355D4A69E257FD4AB30298B0E0CY4PR12MB1653namp_--
