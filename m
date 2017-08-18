Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4086A77FF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 20:42:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 13:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; 
	d="scan'208,217";a="125283060"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2017 13:42:46 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX109.amr.corp.intel.com ([169.254.11.206]) with mapi id
	14.03.0319.002; Fri, 18 Aug 2017 13:42:46 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [PATCH v3 00/11] Reproducible binaries
Thread-Index: AQHTETfNynAW4TLVUkeAe9xueooTOaKK7amA//+NC2uAAJpVgP//jJ7z
Date: Fri, 18 Aug 2017 20:42:46 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119E8809@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQcb27Zvu_Hd6pDZ8KHkyF86sJkB3rm4rvzfb_gy98pu4A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119E8748@ORSMSX112.amr.corp.intel.com>,
	<CA+chaQcAid1J41JMPZnFLhr4fwR9xr63JvYB7hQcLGFfLabrrg@mail.gmail.com>
In-Reply-To: <CA+chaQcAid1J41JMPZnFLhr4fwR9xr63JvYB7hQcLGFfLabrrg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/11] Reproducible binaries
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
X-List-Received-Date: Fri, 18 Aug 2017 20:42:46 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B6119E8809ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B6119E8809ORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, the warning is legit. because the kernel sources are not obtained the =
usual way via do_unpack (that's where SOURCE_DATE_EPOCH is being determined=
). This has been addressed in kernel.bbclass, kernel_do_compile() .

________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Friday, August 18, 2017 1:32 PM
To: Bystricky, Juro
Cc: Patches and discussions about the oe-core layer; Richard Purdie; Joshua=
 G Lock; Burton, Ross; Juro Bystricky
Subject: Re: [PATCH v3 00/11] Reproducible binaries

Thanks!

FWIW: I've refreshed the patches from ML and still see:
WARNING: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0 do_unpack:=
 Unable to determine src_date_epoch! path:/OE/build/oe-core/tmp-glibc/work-=
shared/qemux86/kernel-source




--_000_6E51916E4A1F32428260031F4C7CD2B6119E8809ORSMSX112amrcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Yes, the warning is legit. because the kernel sources are not obtain=
ed the usual way via do_unpack (that's where SOURCE_DATE_EPOCH is being det=
ermined). This has been addressed
 in kernel.bbclass, kernel_do_compile() .<br>
<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF395351" style=3D"direction: ltr;"><font size=3D"2" face=3D=
"Tahoma" color=3D"#000000"><b>From:</b> Martin Jansa [martin.jansa@gmail.co=
m]<br>
<b>Sent:</b> Friday, August 18, 2017 1:32 PM<br>
<b>To:</b> Bystricky, Juro<br>
<b>Cc:</b> Patches and discussions about the oe-core layer; Richard Purdie;=
 Joshua G Lock; Burton, Ross; Juro Bystricky<br>
<b>Subject:</b> Re: [PATCH v3 00/11] Reproducible binaries<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">Thanks!
<div><br>
</div>
<div>FWIW: I've refreshed the patches from ML and still see:</div>
<div>
<div>WARNING: linux-yocto-4.10.17&#43;gitAUTOINC&#43;e92bd55409_6648a34e00-=
r0 do_unpack: Unable to determine src_date_epoch! path:/OE/build/oe-core/tm=
p-glibc/work-shared/qemux86/kernel-source</div>
</div>
<div><br>
</div>
<div><br>
</div>
</div>
<div class=3D"gmail_extra"><br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B6119E8809ORSMSX112amrcor_--
