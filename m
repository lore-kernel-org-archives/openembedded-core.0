Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 580BD73695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 06:38:32 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 14 Sep 2016 23:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,338,1470726000"; d="scan'208,217";a="8584202"
Received: from lvernat-mobl7.ger.corp.intel.com (HELO [10.252.23.81])
	([10.252.23.81])
	by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2016 23:38:31 -0700
User-Agent: Microsoft-MacOutlook/14.6.7.160722
Date: Thu, 15 Sep 2016 09:38:31 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <D4001C1A.67CC9%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] scripts: introduce buildstats-diff
References: <1473852282-12088-1-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0LYuNzYTdhjmgpf-9rEC-axKW-khVGzU6iPN+MC=i+8arQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYuNzYTdhjmgpf-9rEC-axKW-khVGzU6iPN+MC=i+8arQ@mail.gmail.com>
Mime-version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts: introduce buildstats-diff
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
X-List-Received-Date: Thu, 15 Sep 2016 06:38:33 -0000
Content-type: multipart/alternative;
	boundary="B_3556777116_22425659"

--B_3556777116_22425659
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit


From:  "Burton, Ross" <ross.burton@intel.com>
Date:  Wednesday 14 September 2016 at 19:38
To:  Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc:  OE-core <openembedded-core@lists.openembedded.org>
Subject:  Re: [OE-core] [PATCH] scripts: introduce buildstats-diff


On 14 September 2016 at 12:24, Markus Lehtonen
<markus.lehtonen@linux.intel.com> wrote:
> +        if not tasks1:
> +            pkg_op = '++'
> +        elif not tasks2:
> +            pkg_op = '--'

BTW, I've been reading buildstats-diff output all day and find the lack of
whitespace between the operator and the package name makes the output harder
to read, so I've patched it locally to be just '+ ' or '- ' for clarity.

Sounds fine to me. I don't object your modification.
  - Markus




--B_3556777116_22425659
Content-type: text/html;
	charset="US-ASCII"
Content-transfer-encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-size:=
 14px; font-family: Calibri, sans-serif;"><div><br></div><span id=3D"OLK_SRC_B=
ODY_SECTION"><div style=3D"font-family:Calibri; font-size:11pt; text-align:lef=
t; color:black; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; PADDIN=
G-BOTTOM: 0in; PADDING-LEFT: 0in; PADDING-RIGHT: 0in; BORDER-TOP: #b5c4df 1p=
t solid; BORDER-RIGHT: medium none; PADDING-TOP: 3pt"><span style=3D"font-weig=
ht:bold">From: </span> "Burton, Ross" &lt;<a href=3D"mailto:ross.burton@intel.=
com">ross.burton@intel.com</a>&gt;<br><span style=3D"font-weight:bold">Date: <=
/span> Wednesday 14 September 2016 at 19:38<br><span style=3D"font-weight:bold=
">To: </span> Markus Lehtonen &lt;<a href=3D"mailto:markus.lehtonen@linux.inte=
l.com">markus.lehtonen@linux.intel.com</a>&gt;<br><span style=3D"font-weight:b=
old">Cc: </span> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openemb=
edded.org">openembedded-core@lists.openembedded.org</a>&gt;<br><span style=3D"=
font-weight:bold">Subject: </span> Re: [OE-core] [PATCH] scripts: introduce =
buildstats-diff<br></div><div><br></div><div dir=3D"ltr"><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On 14 September 2016 at 12:24, Markus Lehto=
nen <span dir=3D"ltr">&lt;<a href=3D"mailto:markus.lehtonen@linux.intel.com" tar=
get=3D"_blank">markus.lehtonen@linux.intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div id=3D":1ic" class=3D"a3s aXjCH m157287239512fb54">+&nbs=
p; &nbsp; &nbsp; &nbsp; if not tasks1:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pkg_op =3D '++'<br>
+&nbsp; &nbsp; &nbsp; &nbsp; elif not tasks2:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pkg_op =3D '--'</div></blockquote>=
</div><br>BTW, I've been reading buildstats-diff output all day and find the=
 lack of whitespace between the operator and the package name makes the outp=
ut harder to read, so I've patched it locally to be just '+ ' or '- ' for cl=
arity.</div></div></span><div><br></div><div>Sounds fine to me. I don't obje=
ct your modification.</div><div>&nbsp; - Markus</div><span id=3D"OLK_SRC_BODY_=
SECTION"><div dir=3D"ltr"><div class=3D"gmail_extra"><br></div></div></span></bo=
dy></html>

--B_3556777116_22425659--
