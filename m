Return-Path: <prvs=50312766aa=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC197725D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:16:42 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-a6-57ac88c7687e
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	7E.08.03522.7C88CA75; Thu, 11 Aug 2016 09:16:40 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 11 Aug 2016 09:16:39 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3
	portions from BSD
Thread-Index: AQHR8086hnYKgcvZc0iDTbUZ8+O5AqBDzo+AgABUlgA=
Date: Thu, 11 Aug 2016 14:16:38 +0000
Message-ID: <2462430.p4xgNLk5XP@localhost.localdomain>
References: <1470864947-17916-1-git-send-email-michael.davis@essvote.com>
	<CAJTo0LYpubvSWuWkRt_wH3jU2G+6-gAw_fNvUe5Rikfut-=BiA@mail.gmail.com>
In-Reply-To: <CAJTo0LYpubvSWuWkRt_wH3jU2G+6-gAw_fNvUe5Rikfut-=BiA@mail.gmail.com>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWyRiBPQ/dEx5pwg/YJghZ3fr5jt5i3w96B
	yWPxnpdMHuc2rmAMYIritklKLCkLzkzP07dL4M5onviIpeCMVMXEOz3sDYxLxbsYOTkkBEwk
	fvS8ZIewxSQu3FvP1sXIxSEkcJRRYsbxxywQzixGiXk3JrGAVLEJGEmcu76JEcQWEdCSOPv6
	MTOIzSwQLXHn9xmwScIC4RKrn8xhh6iJkLi09iWUbSVxacl5NhCbRUBVoqn/N5jNK2Am0b2o
	mx1i2QRGidUntwMt4+DgFAiU2P7EBaRGCKim7eFLsBsYgS79fmoNE8RecYlbT+YzQXwgILFk
	z3lmCFtU4uXjf6wQtqzEtx1TWCDqYyVmTLvIDLFXUOLkzCcsExjFZiEZNQtJ2SwkZQsYmVcx
	8uUa6aUWF5fll6TqJefnbmIExgYXA9PsHYx7JjgcYhTgYFTi4b0wdXW4EGtiWXFl7iFGaQ4W
	JXFeFSGlcCGB9MSS1OzU1ILUovii0pzU4kOMTBychxglOLikRIpT81JSixJLSzLiQfEWXwyM
	OKkGxtgYnuwZNSpMFpYyvvxhr2Qfy7RPrGm7uLHOlnXfrPthTI63j05pTnrxQ1Lzj0ex4MqT
	ZQaTntz+ffwA64zvlclzhRhiDEWsL0knP1zf2clyIOLRwTXys/4ctaqZ8CX4sLWrcWZH/i3B
	Xn0fF4OwB6Y/vQ591dGYmHDtw0rupRb/bz5/ujYrTYmlOCPRUIu5qDgRAHVH9XiJAgAA
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Thu, 11 Aug 2016 14:16:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2462430p4xgNLk5XPlocalhostlocaldomain_"

--_000_2462430p4xgNLk5XPlocalhostlocaldomain_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Lol hit up a few too many times. This is what I get for pushing close to 5.



On Thursday, August 11, 2016 10:13:53 AM Burton, Ross wrote:


On 10 August 2016 at 22:36, Davis, Michael <michael.davis@essvote.com<mailt=
o:michael.davis@essvote.com>> wrote:

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy and
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.

Wrong list still, meta-oe patches go to openembedded-devel@.


Ross



--_000_2462430p4xgNLk5XPlocalhostlocaldomain_
Content-Type: text/html; charset="us-ascii"
Content-ID: <5A65BF18C4CD09408CE7161205FC91FA@essvote.com>
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-=
html40/strict.dtd">
<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"qrichtext" content=3D"1">
<style type=3D"text/css">
p, li { white-space: pre-wrap; }
</style>
</head>
<body style=3D" font-family:'Sans Serif'; font-size:10pt; font-weight:400; =
font-style:normal;">
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-rig=
ht:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
Lol hit up a few too many times. This is what I get for pushing close to 5.=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-rig=
ht:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
<br>
<br>
<br>
On Thursday, August 11, 2016 10:13:53 AM Burton, Ross wrote:<br>
</p>
<p style=3D" margin-top:12px; margin-bottom:0px; margin-left:40px; margin-r=
ight:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
<br>
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margin-ri=
ght:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
On 10 August 2016 at 22:36, Davis, Michael &lt;<a href=3D"mailto:michael.da=
vis@essvote.com"><span style=3D" text-decoration: underline; color:#2980b9;=
">michael.davis@essvote.com</span></a>&gt; wrote:<br>
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:46px; margin-ri=
ght:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
GPLV3 and BSD portions were originally placed in the same package.<br>
The GPLv3 portion has been seperated into pcsc-lite-spy and<br>
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-rig=
ht:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
<br>
Wrong list still, meta-oe patches go to openembedded-devel@.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margin-ri=
ght:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
<br>
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margin-ri=
ght:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
Ross</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-rig=
ht:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">
<br>
<br>
</p>
</body>
</html>

--_000_2462430p4xgNLk5XPlocalhostlocaldomain_--
