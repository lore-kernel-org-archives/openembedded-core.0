Return-Path: <rahulchauhankitps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93392C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 05:21:08 +0000 (UTC)
Subject: Proposal to change the SRC_URI source reference of neard package.
To: openembedded-core@lists.openembedded.org
From: "Rahul Chauhan" <rahulchauhankitps@gmail.com>
X-Originating-Location: Melbourne, Victoria, AU (155.190.53.6)
X-Originating-Platform: Windows Chrome 99
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 26 Mar 2022 22:21:07 -0700
Message-ID: <rAGk.1648358467578549439.5IXP@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9pYsDW6yvbPbiepT04KV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 05:21:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163661

--9pYsDW6yvbPbiepT04KV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I am building neard recipe. And neard recipe fetching source code from " ht=
tps://cdn.kernel.org/pub/linux/network/nfc ".
https://cdn.kernel.org/pub/linux/network/nfc/neard-0.16.tar.gz

In this tar file few plugins (eg. tizen) and tests scripts (eg. Test-channe=
l,test-see,neard-ui.py,ndef-agent etc) are missing.

I observed that,all missing files are present in below tar file.
https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.ta=
r.gz

Is there any specific reason to fetch the neard source from https://cdn.ker=
nel.org/pub/linux/network/nfc/neard-0.16.tar.gz insteed of "https://git.ker=
nel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.tar.gz"

If community is okay then i can propose the patch by modifying the SRC-URI =
in neard recipe.

Thanks in advane
Rahul Kumar

--9pYsDW6yvbPbiepT04KV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi Team,</div>
<div>&nbsp;</div>
<div>I am building neard recipe. And neard recipe fetching source code from=
 "<a href=3D"https://cdn.kernel.org/pub/linux/network/nfc" target=3D"_blank=
" rel=3D"noopener">https://cdn.kernel.org/pub/linux/network/nfc</a>".</div>
<div><a href=3D"https://cdn.kernel.org/pub/linux/network/nfc/neard-0.16.tar=
.gz" target=3D"_blank" rel=3D"noopener">https://cdn.kernel.org/pub/linux/ne=
twork/nfc/neard-0.16.tar.gz</a></div>
<div>&nbsp;</div>
<div>In this tar file few plugins (eg. tizen) and tests scripts (eg. Test-c=
hannel,test-see,neard-ui.py,ndef-agent etc) are missing.&nbsp;</div>
<div>&nbsp;</div>
<div>I observed that,all missing files are present in below tar file.&nbsp;=
</div>
<div><a href=3D"https://git.kernel.org/pub/scm/network/nfc/neard.git/snapsh=
ot/neard-0.16.tar.gz" target=3D"_blank" rel=3D"noopener">https://git.kernel=
.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.tar.gz</a></div>
<div>&nbsp;</div>
<div>Is there any specific reason to fetch the neard source from https://cd=
n.kernel.org/pub/linux/network/nfc/neard-0.16.tar.gz insteed of "https://gi=
t.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.tar.gz"</div=
>
<div>&nbsp;</div>
<div>If community is okay then i can propose the patch by modifying the SRC=
-URI in neard recipe.</div>
<div>&nbsp;</div>
<div>Thanks in advane</div>
<div>Rahul Kumar</div>
</div>

--9pYsDW6yvbPbiepT04KV--

