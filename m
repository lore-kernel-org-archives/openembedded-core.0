Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9DFD2E00C
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 06:46:09 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.377.1764917167933097657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 22:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=k1MYfe4U;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=427ef4961=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1764917166; x=1796453166;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=J1W6ECIYwq0VhSjezSAw3tpckM2sd9s0vTAt0bY5Tig=;
  b=k1MYfe4U9agiPVNARe3tSVJ1zNB0eELrlnR5/RxEAZgjOz6lx+3hr7Ay
   k0Zsd2hradPT27go/4RMSylwLCNKhGytO0S40P8Z25Fu/I+rzWf5a9rSx
   025PWizvlph4GFiDdnc28oj7K2AkOKNsiLOPSxE5Ujz7dpRENQtD3g6nr
   QIgRZO/9tv/8V7Yau9XfD1csqTGdc+rUzgEHnACokvOqIW+JeZh/MnU6Q
   PhmyzQwQSXKP6o6YF1xeYE+98ZXZkH+l3iU66GiE5VvEcLWD6x40WBsWo
   HpHJuMngUlloXi9n/oob3+E5Sht5821usNKsLdwNHlWBIhpV2TJud9HCH
   Q==;
X-CSE-ConnectionGUID: 6ttuMSOHSAS7okqHD54pPg==
X-CSE-MsgGUID: UeT+30nfRoW6rqWQNJEAmw==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:WB6OHqsnID+dtwBcTZ9xd0tfWufnVFJfMUV32f8akzHdYApBsoF/q
 tZmKWmPPavZMDH3ftEjaY/i8xgG75PTnNVjHAY6qyFnRX5B9ZOVVN+UEBz9bniYRiHhoOCLz
 O1DMIWafJBsJpP4jk3wWlQ0hSAkjclkfpKlVqicfHg3HVI4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bNNwRcawr40Ird7kk31BjOkGlA5AFnP6gW5Aa2e0Q9V/rzG4ngdhMUfaEERoZWd
 86bpJml82XQ+QsaC9/Nut7Tbk0QT7fOChOFg3xQVrLKqkAqSvsai/tT2FI0MC+7uh3R9zxD4
 IwlWa+YEG/FCpbxdNE1CHG0Jc3c0Zpuo9crKVDn2SCaItavn3HEm52CB2luVWEUF3oe7cijO
 pX0JRhUBi1vid5az5rlVvVxo/8EDPLCB9wYuWhA4WyFFc4pFMWrr6Xivbe03R8KrexlWNP3R
 u5CMXxkaw7YJRFON1cTTpk5mY9EhFGmK3sB9QnT/uxuuDC7IA9ZidABNPLZd9qLXoNShVqVv
 GbP+WjRDhAXNNjZwj2Amp6prraUwH+nCd1NRdVU8NZXjWHQnTQVBicRagWhuMaArGyTctdAf
 hl8Fi0G6PJaGFaQZtDxRRyxpjiKpBMdW91eHvcS8wCAz6fS+ECSAW1sZjlZZdorscU7STAn2
 hqCmMnkLThuq6GOD3WF+7GZqDm/NSQYISkFfyBscOcey4C75thu1VSUCI84SMZZk+HIJN05+
 BjSxABWulnZpZdjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:6gLOeq/P2dCqOFGqe3Nuk+Eidb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVcqKQwdcLW7VJVoLkmslqKdjbNhRotKPzOWwldAUrsSiLcKqgeIc0KRltK1vZ
 0QC5SWJ+eAamSS5vyKgjVQfexQpOWvweSDnufSpk0dKz2CJpsQmjtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTAyYt6gDncIcuDfr5mT/aiWFiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7WQywPa1UXU85NK8eGRvudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30mcd15AY0RLsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGppnYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuJIO5lbZvs3+9La1wVx4SqbpXWN
 WGNfusrcq+pGnqJUwwvQFUsa2RtzoIb1m7q3M5y7KoOght7Q9EJnQjtbAid1c7heEAosp/lp
 b52+JT5cdzZ/5TUKV8CY46MLKKNlA=
X-Talos-CUID: =?us-ascii?q?9a23=3AA7D8+2gXaakgaGu1UcO4NLByZDJuLGHB0VLrBG+?=
 =?us-ascii?q?DIF02T76MaXPNpLtcnJ87?=
X-Talos-MUID: 9a23:yp7pOwV9gtIGnKLq/ALhuHI5bMFm2aORVloUrqwgmeStMDMlbg==
X-IronPort-AV: E=Sophos;i="6.20,251,1758578400"; 
   d="scan'208";a="135449779"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a
 new FIT image implementation
Thread-Topic: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclass: add a
 new FIT image implementation
Thread-Index: AQHb1GD7ifSFsKXPwEygZg0ERfU1UrUSnwPAgAAFVwCAARM2AA==
Date: Fri, 5 Dec 2025 06:46:04 +0000
Message-ID: <bcfe72105d0a44efa7ed065fc58d0fea@diehl.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
 <20250603082419.409564-12-adrian.freihofer@siemens.com>
 <0d773cb9aace446eb588342c42d17916@diehl.com>
 <AS1PR10MB5724417B1328B03E60727C4E8EA6A@AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5724417B1328B03E60727C4E8EA6A@AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-04T15:01:57.983Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
x-disclaimerprocessed: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-GBS-PROC: JH31JkgOAVpzNaKNEwNMTSLiMUob3Yd/bsmpZLFH4TbO6xjWINlNeQkiFZD5WMxW
X-GBS-PROCJOB: MTlanz4MLoCs3JCAYys6N2Mmy3JuQ7nXXZ6KUI6C+Zdh8tbpLhE26fLsuQ7f569m
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 06:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227334

Hi Adrian,

Thanks for your reply.
I was not aware of a version from meta-oe, but that fits my needs.
You are right, it is strange that there are two variants.
On the other hand, oe-core does not have the signing class either and there=
for must not be compatible.
Maybe one day meta-oe fitimage class inherits from kernel-fit-image class a=
nd adds the compatibility for signing class.
Your resigning idea looks doable, but I would prefer to not introduce a stu=
b key.

Regards, Denis

-----Urspr=FCngliche Nachricht-----
Von: Freihofer, Adrian <adrian.freihofer@siemens.com>
Gesendet: Donnerstag, 4. Dezember 2025 16:02
An: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>; openembedded-core@lis=
ts.openembedded.org
Betreff: [EXT] Re: [EXT] [OE-core] [PATCH v7 11/20] kernel-fit-image.bbclas=
s: add a new FIT image implementation

[EXTERNAL EMAIL]


Hi Denis

I'm not entirely sure which FIT image implementation you are using: the one=
 from oe-core or the one from meta-openembedded. Since you are asking me pe=
rsonally, I assume it is the one from oe-core.

I suspect that the classes from meta-openembedded are not compatible with t=
he FIT image implementation in oe-core. But I'm probably not the right pers=
on to answer this question, as I don't even understand why a second FIT ima=
ge implementation was necessary instead of improving the one in oe-core. Fr=
om my perspective, it would probably be better to extend the run_mkimage_si=
gn function in oe-core with PKCS#11 support than to maintain a second FIT i=
mage implementation in meta-openembedded.

Another approach is to perform the signing within bitbake using a key from =
a file. Signing with a more secure PKCS#11 backend can be performed as a re=
-signing, which is done independently of bitbake as the final step in the r=
elease process.

Regards,
Adrian
Diehl Metering GmbH, Donaustrasse 120, 90451 Nuernberg
Sitz der Gesellschaft: Ansbach, Registergericht: Ansbach HRB 69
Geschaeftsfuehrer: Dr. Christof Bosbach (Sprecher), Dipl.-Dolm. Annette Geu=
ther, Dipl.-Kfm. Reiner Edel, Jean-Claude Luttringer

Bitte denken Sie an die Umwelt, bevor Sie diese E-Mail drucken. Diese E-Mai=
l kann vertrauliche Informationen enthalten. Sollten die in dieser E-Mail e=
nthaltenen Informationen nicht f=FCr Sie bestimmt sein, informieren Sie bit=
te unverzueglich den Absender per E-Mail und loeschen Sie diese E-Mail in I=
hrem System. Jede unberechtigte Form der Reproduktion, Bekanntgabe, Aenderu=
ng, Verteilung und/oder Publikation dieser E-Mail ist strengstens untersagt=
. Informationen zum Datenschutz finden Sie auf unserer Homepage<https://www=
.diehl.com/metering/de/impressum-und-rechtliche-hinweise/>.

Before printing, think about environmental responsibility.This message may =
contain confidential information. If you are not authorized to receive this=
 information please advise the sender immediately by reply e-mail and delet=
e this message without making any copies. Any form of unauthorized use, pub=
lication, reproduction, copying or disclosure of the e-mail is not permitte=
d. Information about data protection can be found on our homepage<https://w=
ww.diehl.com/metering/en/data-protection/>.

