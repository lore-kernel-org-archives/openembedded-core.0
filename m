Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D510FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:35:38 +0000 (UTC)
Subject: Re: [PATCH] re2c: backport of partial fix for CVE-2018-21232
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Zenson di Piave, Veneto, IT (87.5.19.30)
X-Originating-Platform: Linux Firefox 98
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 14 Mar 2022 07:35:37 -0700
References: 
 <CAOSpxdZXurirkTARsX9pA7nS-euk06jRfiXkFqoDA5wfi6oGaQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZXurirkTARsX9pA7nS-euk06jRfiXkFqoDA5wfi6oGaQ@mail.gmail.com>
Message-ID: <8902.1647268537771385521@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LlXCFcEbnkO4R6vhngma"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:35:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163149

--LlXCFcEbnkO4R6vhngma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The official CVE description ( https://nvd.nist.gov/vuln/detail/CVE-2018-21=
232 ) only highlights a stack consumption in "find_fixed_tags" (and this is=
 actually fixed and is one of the included patches) but as stated in the gi=
thub issue ( https://github.com/skvadrik/re2c/issues/219 that is still open=
) there are also other recursion with the same problem and not all have bee=
n fixed by upstream. So we could say the CVE is "officially" fixed.
Tell me if I can remove the "partially" and add the CVE in the description,=
 thanks.

--LlXCFcEbnkO4R6vhngma
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The official CVE description (<a href=3D"https://nvd.nist.gov/vuln/detail/C=
VE-2018-21232" target=3D"_blank" rel=3D"noopener">https://nvd.nist.gov/vuln=
/detail/CVE-2018-21232</a>) only highlights a stack consumption in "find_fi=
xed_tags" (and this is actually fixed and is one of the included patches) b=
ut as stated in the github issue (<a href=3D"https://github.com/skvadrik/re=
2c/issues/219" target=3D"_blank" rel=3D"noopener">https://github.com/skvadr=
ik/re2c/issues/219</a> that is still open) there are also other recursion w=
ith the same problem and not all have been fixed by upstream. So we could s=
ay the CVE is "officially" fixed.<br />Tell me if I can remove the "partial=
ly" and add the CVE in the description, thanks.

--LlXCFcEbnkO4R6vhngma--

