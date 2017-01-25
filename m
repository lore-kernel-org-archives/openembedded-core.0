Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9D39571DCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:26:16 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id 11so73400358qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DYh8mnac4sVVlXipJctqIGSRx7KUP1QeaNmNptZSYt8=;
	b=aI1W+mPhlUchhc6+q/0CXLeau70AGX7Mw7HlyxeGOOMDfj1BvEvNHBtwtstys4ITyK
	MkpCLx3RJdefZe1kM0y4lov5cPjrQaWQdMmjnr9/olU89t094MKsR2l2zJY4xkMyc8wQ
	2TxJuYh/k4VkqsZRSI5fgs4IwavCp9UuZkW6H78YohW3qoo74ChQMBD2Vv6554LNhrj/
	iIbqjhoh2qVisL2ieI3JGHByBb13O6SnRDrnRH0g2UgXQC95BXp690/NuwX2irP6emNO
	t/1wjpnfSBTImtPDnkFKtwQ98ruEOa4Ceb7RtQW3AxIKj8XX2whLzO27TP2/EKskR3Px
	1GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DYh8mnac4sVVlXipJctqIGSRx7KUP1QeaNmNptZSYt8=;
	b=ONAgkMnNTJyPt1HILOnsuBK2XH8xSEBoNfidIwx+jFyfMYPdy9u9goNpTxVnXKK+zy
	w9XgOEgwkPiazyx+Fcek7KvPoqml3mvpOAa6BArphlBwgGDqy/B1eTMxGAH5MvWJ3Pxq
	2PYFDnVfAITVdXAHNTwIZ+bRCtz827PU49a8YSyl/7R8heMWPDlkqX1tNk3c5FWru+D5
	bhoTdwbZft6tbU5puCmlNzqpFUn7HmXHoUKI3s4PYKUQqaWwbgYbP4Tnm/LyjKRUlt6A
	vZFoymJFjZAzlzuU/BWcBlJgUrThm5eD4aOWmmeTSjnHk06gab8RLm3ZBG/PVfHSidCw
	IKdA==
X-Gm-Message-State: AIkVDXJE9C4GD0qxQMkPn0RTLqdHzX0At/8Xr/jHOAJ3ZHLt8bsd9294POh3aStfQnrZrbtw8MISTKXIDekQuocG
X-Received: by 10.55.15.231 with SMTP id 100mr32987801qkp.244.1485354375935;
	Wed, 25 Jan 2017 06:26:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 25 Jan 2017 06:25:55 -0800 (PST)
In-Reply-To: <1485335933-9845-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1485335933-9845-1-git-send-email-yannick.gicquel@iot.bzh>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jan 2017 14:25:55 +0000
Message-ID: <CAJTo0Lb+x3b7E+3ss2GA6vjScguW4DK_DAZO9wOzUMorSGVf3Q@mail.gmail.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ccache: update to 3.3.3
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
X-List-Received-Date: Wed, 25 Jan 2017 14:26:17 -0000
Content-Type: multipart/alternative; boundary=001a11476032f1b8260546ec0306

--001a11476032f1b8260546ec0306
Content-Type: text/plain; charset=UTF-8

On 25 January 2017 at 09:18, Yannick Gicquel <yannick.gicquel@iot.bzh>
wrote:

> -SRC_URI = "git://git.samba.org/ccache.git"
> +SRC_URI = "git://github.com/ccache/ccache.git"
>

Why don't we just use the tarballs?

-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b8a4fa173ed91c1a5204ea4f9c9ead
> c3"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=938c02728101936f2a74a67d1d82ee
> 25"


Always explain why the license checksum has changed.

[Patchwork-Status: Changes Requested]

Ross

--001a11476032f1b8260546ec0306
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2017 at 09:18, Yannick Gicquel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:yannick.gicquel@iot.bzh" target=3D"_blank">yannick.gicquel@iot.b=
zh</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-m_78665502647=
89227344:2kf" class=3D"gmail-m_7866550264789227344a3s gmail-m_7866550264789=
227344aXjCH gmail-m_7866550264789227344m159d4ed26843c052">-SRC_URI =3D &quo=
t;git://<a href=3D"http://git.samba.org/ccache.git" rel=3D"noreferrer" targ=
et=3D"_blank">git.samba.org/ccache.gi<wbr>t</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ccache/ccache.git" re=
l=3D"noreferrer" target=3D"_blank">github.com/ccache/ccach<wbr>e.git</a>&qu=
ot;<br></div></blockquote></div><br>Why don&#39;t we just use the tarballs?=
</div><div class=3D"gmail_extra"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span style=3D"=
font-size:12.800000190734863px">-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.=
txt;md5=3D</span><wbr style=3D"font-size:12.800000190734863px"><span style=
=3D"font-size:12.800000190734863px">b8a4fa173ed91c1a5204ea4f9c9ead</span><w=
br style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.800=
000190734863px">c3&quot;<br></span><span style=3D"font-size:12.800000190734=
863px">+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D</span><wbr sty=
le=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.800000190=
734863px">938c02728101936f2a74a67d1d82ee</span><wbr style=3D"font-size:12.8=
00000190734863px"><span style=3D"font-size:12.800000190734863px">25&quot;</=
span></blockquote><div class=3D"gmail_extra"><span style=3D"font-size:12.80=
0000190734863px"><br></span></div><div class=3D"gmail_extra"><span style=3D=
"font-size:12.800000190734863px">Always explain why the license checksum ha=
s changed.</span></div><div class=3D"gmail_extra"><span style=3D"font-size:=
12.800000190734863px"><br></span></div><div class=3D"gmail_extra"><span sty=
le=3D"font-size:12.800000190734863px">[Patchwork-Status: Changes Requested]=
</span></div><div class=3D"gmail_extra"><span style=3D"font-size:12.8000001=
90734863px"><br></span></div><div class=3D"gmail_extra">Ross</div></div>

--001a11476032f1b8260546ec0306--
