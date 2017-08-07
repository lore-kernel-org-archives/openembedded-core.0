Return-Path: <shen.joon.tan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA1626E666
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 01:51:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2017 18:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,335,1498546800"; 
	d="scan'208,217";a="1202720953"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2017 18:51:38 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.102]) by
	KMSMSX154.gar.corp.intel.com ([169.254.12.48]) with mapi id
	14.03.0319.002; Mon, 7 Aug 2017 09:51:38 +0800
From: "Tan, Shen Joon" <shen.joon.tan@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] distrodata: function to identify new
	packages on a release
Thread-Index: AQHTB2sxd7tMIL6pFEGL0vAlQkd2kaJpVVaAgADuWgCADezCeA==
Date: Mon, 7 Aug 2017 01:51:37 +0000
Message-ID: <CBFEF43F49D9A844852DBDA94B6AF818462C8CA9@PGSMSX109.gar.corp.intel.com>
References: <1501223526-62997-1-git-send-email-shen.joon.tan@intel.com>
	<CAJ86T=XVbuUGujVF1=FT5W2XGPN8JPXXD-BdNZMacpHFwE4rZA@mail.gmail.com>,
	<CAJTo0LY8k4=ji4T+=gtsxNxab9vbyGY9z9X_MMVDqgEeY+WwXg@mail.gmail.com>
In-Reply-To: <CAJTo0LY8k4=ji4T+=gtsxNxab9vbyGY9z9X_MMVDqgEeY+WwXg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distrodata: function to identify new packages on a release
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
X-List-Received-Date: Mon, 07 Aug 2017 01:51:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CBFEF43F49D9A844852DBDA94B6AF818462C8CA9PGSMSX109garcor_"

--_000_CBFEF43F49D9A844852DBDA94B6AF818462C8CA9PGSMSX109garcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sure. I'll update it to use the current clone instead and submit it as V2

________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Saturday, July 29, 2017 9:12 PM
To: Andre McCurdy
Cc: Tan, Shen Joon; OE Core mailing list
Subject: Re: [OE-core] [PATCH] distrodata: function to identify new package=
s on a release

On 28 July 2017 at 23:59, Andre McCurdy <armccurdy@gmail.com<mailto:armccur=
dy@gmail.com>> wrote:
> +    git remote add -f origin git://git.yoctoproject.org/poky.git<http://=
git.yoctoproject.org/poky.git>

Is this patch intended for poky? Or should this be fetching oe-core and bit=
bake?

Seems to me that if the script were to use the current clone and just switc=
h branches, instead of using a fresh clone of poky, then it would be genera=
lly useful to anyone who wants these reports.

Ross

--_000_CBFEF43F49D9A844852DBDA94B6AF818462C8CA9PGSMSX109garcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Sure. I'll update it to use the current clone instead and submit it =
as V2
<div><br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF266449" style=3D"direction: ltr;"><font face=3D"Tahoma" si=
ze=3D"2" color=3D"#000000"><b>From:</b> Burton, Ross [ross.burton@intel.com=
]<br>
<b>Sent:</b> Saturday, July 29, 2017 9:12 PM<br>
<b>To:</b> Andre McCurdy<br>
<b>Cc:</b> Tan, Shen Joon; OE Core mailing list<br>
<b>Subject:</b> Re: [OE-core] [PATCH] distrodata: function to identify new =
packages on a release<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">On 28 July 2017 at 23:59, Andre McCurdy <span dir=3D"ltr">=
&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmai=
l.com</a>&gt;</span> wrote:<br>
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div class=3D"HOEnZb">
<div class=3D"h5">&gt; &#43;&nbsp; &nbsp; git remote add -f origin git://<a=
 href=3D"http://git.yoctoproject.org/poky.git" rel=3D"noreferrer" target=3D=
"_blank">git.yoctoproject.org/<wbr>poky.git</a><br>
<br>
</div>
</div>
Is this patch intended for poky? Or should this be fetching oe-core and bit=
bake?</blockquote>
<div><br>
</div>
<div>Seems to me that if the script were to use the current clone and just =
switch branches, instead of using a fresh clone of poky, then it would be g=
enerally useful to anyone who wants these reports.</div>
<div><br>
</div>
<div>Ross</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CBFEF43F49D9A844852DBDA94B6AF818462C8CA9PGSMSX109garcor_--
