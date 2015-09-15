Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id DDCA4762B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 00:12:30 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so3664474igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 17:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=BhEaqRoHjGfTVMchPBJkhQ1W2LYmRHeOTzkh4l2WCeo=;
	b=Hc1LEKQ5DvvEjBUO1Uu12PkrGhOpz7uxgmYge91P9F/0BS5TP34E28bkt1fDDDtgs4
	x1gHwA8UJHoDHCenrolbxPiqpGK4KHXXr8zfN+AC5fJtedp/b5M9UAOxnNCBmeuKZ8zd
	GLIPWksgjQXnDskDvNx961p4iaJqgJmwteH/HMFQELmwV+xfHcIcJUDbjbV6ldC8Ca9x
	aYLsAg7P8A+vyjbEj0lHQHGgSHVKegmg0NTY6CeoOpP6dyTjzYZnOwxAibUO4fNxChT+
	IYz5Rn2Jkzh/nryS9ISqXrEt1ZjYrlrcLHJ8Hwa8v6ly14lrEGrbQtLBEOpEffTgDdWA
	5GGw==
X-Received: by 10.50.61.165 with SMTP id q5mr1008753igr.10.1442275950662; Mon,
	14 Sep 2015 17:12:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Mon, 14 Sep 2015 17:12:11 -0700 (PDT)
In-Reply-To: <CABcZANmRBjAg_T_W_ZKdoEmCGjmffmfvKqSr3O_FGos-jKSe5Q@mail.gmail.com>
References: <1442266696-6751-1-git-send-email-kergoth@gmail.com>
	<CABcZANmRBjAg_T_W_ZKdoEmCGjmffmfvKqSr3O_FGos-jKSe5Q@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 14 Sep 2015 17:12:11 -0700
X-Google-Sender-Auth: Q__Ums2nwddHxDRI_98huvhEM8A
Message-ID: <CABcZANn9G+31+sRvMzvakG4qTP18ce0awPmqR+Vz8QhfMWG1Jw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] image.bbclass: add do_rootfs vardeps for IMAGE_{CMD, TYPEDEP}_*
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
X-List-Received-Date: Tue, 15 Sep 2015 00:12:31 -0000
Content-Type: multipart/alternative; boundary=047d7bdca446b519ce051fbe0912

--047d7bdca446b519ce051fbe0912
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 4:41 PM, Christopher Larson <chris_larson@mentor.com
> wrote:

> On Mon, Sep 14, 2015 at 2:38 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> We want do_rootfs to rerun if the image commands or dependencies change
>> for any of
>> our configured fstypes (IMGE_FSTYPES).
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>
>
> Hold off on accepting this, need to account compression types and
> COMPRESS_CMD. Expect a v2.


'[PATCH] image.bbclass: add do_rootfs vardeps for {COMPRESS,IMAGE}_CMD_*'
is submitted, and supercedes this.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7bdca446b519ce051fbe0912
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 14, 2015 at 4:41 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@me=
ntor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><span class=3D""><div =
class=3D"gmail_quote">On Mon, Sep 14, 2015 at 2:38 PM, Christopher Larson <=
span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank"=
>kergoth@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div style=3D"=
overflow:hidden">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
We want do_rootfs to rerun if the image commands or dependencies change for=
 any of<br>
our configured fstypes (IMGE_FSTYPES).<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;</div></blockquote><=
/div><br></span>Hold off on accepting this, need to account compression typ=
es and COMPRESS_CMD. Expect a v2.</blockquote></div><br>&#39;[PATCH] image.=
bbclass: add do_rootfs vardeps for {COMPRESS,IMAGE}_CMD_*&#39; is submitted=
, and supercedes this.<br>-- <br><div class=3D"gmail_signature"><div dir=3D=
"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div></div>
</div></div>

--047d7bdca446b519ce051fbe0912--
