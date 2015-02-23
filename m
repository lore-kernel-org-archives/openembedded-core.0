Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id D8B967372B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 18:15:04 +0000 (UTC)
Received: by ykp9 with SMTP id 9so217449ykp.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=F+RmYpP5c+04fcr1Jsadj2QUHo/DoQR+TMrnyTl95XU=;
	b=fFc2tDusc/kcX3mqcfvhyi4nWVItw/SAIR8jDmLdflQ/LPu/cMtFPQeJENOoDRAaqh
	FLRJlAHFnqJxWqbYwUuiOCFkmlfUD3CaT3HVNnhJ4cr8e1JqXHNBUU31WD9CwS4BYmiO
	HNPAr855djWv3+R6TNdfAYy3Y0cnRInWXawexPit0V1+wtAmnrO2ahp++edsgh2gMooW
	jL+SguIVa4eFHnmMNMsgmdkBuPy/vomlT62ixXB/YGZlewHdLdKqdGjCPrAr8BtSq5vK
	SYB+89XMaUJ/5GdX36KQlj5sFluiuffx8d0ldZ1xCE2r3sK8CgNm2z7rQg9V+GP1p9mf
	rtUw==
X-Received: by 10.236.32.209 with SMTP id o57mr10980060yha.76.1424715305285;
	Mon, 23 Feb 2015 10:15:05 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.120.4 with HTTP; Mon, 23 Feb 2015 10:14:45 -0800 (PST)
In-Reply-To: <1424713164-14602-1-git-send-email-ross.burton@intel.com>
References: <1424713164-14602-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 23 Feb 2015 11:14:45 -0700
X-Google-Sender-Auth: twsw2Y3fbetQaWFUb107mxvgkiU
Message-ID: <CABcZANkANYrhm2pHnNRWmad-t6iGZ50xPW+TaXacDi_QT-mWjA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] base-files: clean up and clarify hostname logic
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
X-List-Received-Date: Mon, 23 Feb 2015 18:15:05 -0000
Content-Type: multipart/alternative; boundary=089e0160b6acad7fa5050fc561ea

--089e0160b6acad7fa5050fc561ea
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 10:39 AM, Ross Burton <ross.burton@intel.com> wrote:

> Change the hostname logic the default value is ${MACHINE}, and explain how
> to
> change it.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Looks good, other than the grammar issue in the commit message. "Change the
hostname logic the default value" :)

Acked-by: Christopher Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160b6acad7fa5050fc561ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Feb 23, 2015 at 10:39 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":91" class=3D"" style=
=3D"overflow:hidden">Change the hostname logic the default value is ${MACHI=
NE}, and explain how to<br>
change it.<br>
<span class=3D""><br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;</span></div></blockquote></div><br>Looks good, o=
ther than the grammar issue in the commit message. &quot;<span style=3D"fon=
t-size:12.8000001907349px">Change the hostname logic the default value&quot=
; :)</span></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Acked-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;</div><div class=3D"gmail_extra">-- <=
br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsli=
b<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e0160b6acad7fa5050fc561ea--
