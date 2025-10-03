Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2F6CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:42:23 +0000 (UTC)
Subject: Re: [PATCH v2] ghostscript: upgrade 10.05.1 -> 10.06.0
To: openembedded-core@lists.openembedded.org
From: "Ryan Eatmon" <reatmon@ti.com>
X-Originating-Location: Richardson, Texas, US (192.228.67.13)
X-Originating-Platform: Windows Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 09:42:16 -0700
References: <20250930153901.246829-1-vanusuri@mvista.com>
In-Reply-To: <20250930153901.246829-1-vanusuri@mvista.com>
Message-ID: <27936.1759509736171972567@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="aT24xM1GCnJ2XA2UTRwS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224400

--aT24xM1GCnJ2XA2UTRwS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This was accepted onto master, and we are seeing different a different 32bi=
t build failure:
./brotli/c/dec/decode.c: In function 'PreloadSymbol':
./brotli/c/dec/huffman.h:83:47: error: ISO C90 forbids mixed declarations a=
nd code [-Werror=3Ddeclaration-after-statement]
83 | #define BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t __fastload_##H =
=3D (*H)
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~~~
./brotli/c/dec/decode.c:440:3: note: in expansion of macro 'BROTLI_HC_MARK_=
TABLE_FOR_FAST_LOAD'
440 | =C2=A0 BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
| =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--aT24xM1GCnJ2XA2UTRwS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>This was accepted onto master, and we are seeing different a different=
 32bit build failure:</div>
<div>./brotli/c/dec/decode.c: In function 'PreloadSymbol':<br />./brotli/c/=
dec/huffman.h:83:47: error: ISO C90 forbids mixed declarations and code [-W=
error=3Ddeclaration-after-statement]<br />&nbsp; &nbsp;83 | #define BROTLI_=
HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t __fastload_##H =3D (*H)<br />&nbsp;=
 &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~<br />./brotli/c/dec/decode.c:440:3: no=
te: in expansion of macro 'BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD'<br />&nbsp; =
440 | &nbsp; BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);<br />&nbsp; &nbsp; =
&nbsp; | &nbsp; ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</div>
<div>&nbsp;</div>
</div>

--aT24xM1GCnJ2XA2UTRwS--

