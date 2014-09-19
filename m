Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id CC7A86FC4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 16:14:06 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id ty20so3488843lab.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=PrWgT8QZnThI2XfuR3fVB5nk7wSlsy9c3LYugJvThpE=;
	b=NcwVou4z6lSo0F78y82tX/pMVaEPw1remG8zfmgkPyBWAEQE6qilg+zw1UneUVU0yf
	aoqOYbyS3eMnQGNfWG/ybEay141gfB81Xk56X3eBK7NxyR50LbHbdccDOCJHekod7oXu
	+OvZSWYCE2bduH5CiuFGiPMfoEcMnEs+Nh+nhn1MdVLMkU2vdT0J1y/JqxGbgdPRf18X
	P3ZpMGw53wS8q/Ax34/bJia/CcpFjzM4HY1FeKkyaxnEfIqV2bvmsqPMYpQ+Miz7mk4S
	x3pma3GxhEWiaytKfSePqeJJjTha8V2DVW68hAGfMmGOsDMOJNWaKTVzSrnXbCTxVhUj
	/RlQ==
X-Received: by 10.112.144.228 with SMTP id sp4mr7601746lbb.54.1411143246695;
	Fri, 19 Sep 2014 09:14:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.236 with HTTP; Fri, 19 Sep 2014 09:13:46 -0700 (PDT)
In-Reply-To: <201409190906.30763.marex@denx.de>
References: <1411031735-14721-1-git-send-email-marex@denx.de>
	<1411047011.4736.0.camel@ted> <201409190906.30763.marex@denx.de>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 19 Sep 2014 09:13:46 -0700
X-Google-Sender-Auth: yxEMeHtldGASXnql0Jy6nZW3ZpA
Message-ID: <CABcZANkxOj-8VhQvafT5cQP1TDfTmVn=MGDYygkUaxQNtwYezw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nativesdk-packagegroup-python: buildtools-tarball: Introduce NativeSDK package group
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
X-List-Received-Date: Fri, 19 Sep 2014 16:14:17 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8f5af251cd05036d630b

--047d7b3a8f5af251cd05036d630b
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 19, 2014 at 12:06 AM, Marek Vasut <marex@denx.de> wrote:

> On Thursday, September 18, 2014 at 03:30:11 PM, Richard Purdie wrote:
> > On Thu, 2014-09-18 at 11:15 +0200, Marek Vasut wrote:
> > > Introduce and use nativesdk-packagegroup-python , which contains all
> > > necessary python components for the native SDK. Make use of this
> > > package group in buildtools-tarball.bb immediatelly.
> >
> > Specifically, isn't this the list of packages needed to run bitbake and
> > its associated utils? "python" isn't therefore a particularly good
> > description of this package?
>
> This is really just and only python packages, nothing else.


The fact that it only contains python packages doesn't mean it contains all
python packages, or is somehow generic. It's a specific subset of python
modules used by bitbake.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b3a8f5af251cd05036d630b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Sep 19, 2014 at 12:06 AM, Marek Vasut <span dir=3D"ltr">&lt;<a href=
=3D"mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thursday, Septem=
ber 18, 2014 at 03:30:11 PM, Richard Purdie wrote:<br>
&gt; On Thu, 2014-09-18 at 11:15 +0200, Marek Vasut wrote:<br>
&gt; &gt; Introduce and use nativesdk-packagegroup-python , which contains =
all<br>
&gt; &gt; necessary python components for the native SDK. Make use of this<=
br>
&gt; &gt; package group in <a href=3D"http://buildtools-tarball.bb" target=
=3D"_blank">buildtools-tarball.bb</a> immediatelly.<br>
&gt;<br>
&gt; Specifically, isn&#39;t this the list of packages needed to run <span =
class=3D"il">bitbake</span> and<br>
&gt; its associated utils? &quot;python&quot; isn&#39;t therefore a particu=
larly good<br>
&gt; description of this package?<br>
<br>
</span>This is really just and only python packages, nothing else.</blockqu=
ote></div><br>The fact that it only contains python packages doesn&#39;t me=
an it contains all python packages, or is somehow generic. It&#39;s a speci=
fic subset of python modules used by bitbake.<br>-- <br>Christopher Larson<=
br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZauru=
s<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--047d7b3a8f5af251cd05036d630b--
