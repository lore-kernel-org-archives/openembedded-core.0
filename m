Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1233C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 07:28:11 +0000 (UTC)
Subject: Re: [PATCH] sstate: Preserve permissions when extracting tar archive
To: openembedded-core@lists.openembedded.org
From: "Jacob Kroon" <jacob.kroon@gmail.com>
X-Originating-Location: =?utf-8?b?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNFICgzNy4y?=
 =?utf-8?b?NDcuMjkuNjgp?=
X-Originating-Platform: Linux Firefox 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 16 Jan 2022 23:28:11 -0800
References: <20220114074138.51861-1-jacob.kroon@gmail.com>
In-Reply-To: <20220114074138.51861-1-jacob.kroon@gmail.com>
Message-ID: <28618.1642404491183454308@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="WvcXltV7dEi9XxLhX8LN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 07:28:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160633

--WvcXltV7dEi9XxLhX8LN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Although this is now fixed in master, I was wondering why this doesn't seem=
 to be a problem in dunfell.
In dunfell, sstate packages are unpacked with "tar -xvzf", no -p flag, but =
still my buildhistory doesn't show any noise when doing:

bitbake -c cleansstate shadow-native && bitbake shadow-native && bitbake -c=
 clean shadow-native && bitbake shadow-native

After dunfell was the switch to tar+zstd, but I don't understand why that w=
ould change the extracted permissions.

If anyone has got a clue, i'd be interested to know why.

Jacob
(testing the message reply function from the archived mailing list)

--WvcXltV7dEi9XxLhX8LN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Although this is now fixed in master, I was wondering why this doesn't seem=
 to be a problem in dunfell.<br />In dunfell, sstate packages are unpacked =
with "tar -xvzf", no -p flag, but still my buildhistory doesn't show any no=
ise when doing:<br /><br />bitbake -c cleansstate shadow-native &amp;&amp; =
bitbake shadow-native &amp;&amp; bitbake -c clean shadow-native &amp;&amp; =
bitbake shadow-native<br /><br />After dunfell was the switch to tar+zstd, =
but I don't understand why that would change the extracted permissions.<br =
/><br />If anyone has got a clue, i'd be interested to know why.<br /><br /=
>Jacob<br />(testing the message reply function from the archived mailing l=
ist)

--WvcXltV7dEi9XxLhX8LN--

