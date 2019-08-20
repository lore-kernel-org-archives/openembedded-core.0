Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id 63FCE7ED62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 20:21:04 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id b187so4439149vsc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fqrlL/e6V/JV0MuHzLVzBBy3wDVZmOEdbFjPNQ0uljo=;
	b=jqfg5ZWoW3Ar+20apBzhTXA3Nh3AWotOnh+c8+rZed4cemveyYFKYftpEbwxYNLxl6
	nb4sKmibignUvtFJubs64QLxS2O8wWQUY7USaLMKixTlPjcrcQn/nkrUW9IKp/UKyy6u
	UTETvVOwlx8c3PvlugT3wqIDSkQQlPVltfZG33l/bbwuj74QCxN+OBG3zP7dkYekatCd
	NEVmSb0Hpn37khPoBONOwtAVk3MGdVlmxEPnio8bpsC2wm/3atNoqUMBUG9qsezZoodJ
	YZYP67HQEJ0CSXhzJHJqGX9MAUAb2pUv8QaublznXvkF5gWIi5SeKCow197MXDRa/5DV
	jppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fqrlL/e6V/JV0MuHzLVzBBy3wDVZmOEdbFjPNQ0uljo=;
	b=t+EzXsi1ywdiU90IMmMPaZuT+m2JEcSJbsent1d2GVKHoTBp3Jk+Ah8lFxn+FXra2C
	r4n0GEP0pgaK1naQz2jvOiBKhn4iprBUl3acJOySDDWlRSuU4XsRgxLyVgiUE9Js6nCX
	3muo4oB9SBCpat0X4uG/1zMthp1/Mu3R926GzLTzoQh6nWRTG8KPBa01iNWnwPItioB6
	WKN8i+gz4Hu4bvv1nDp7qoXEGTfAdYormj8xc3uA934BOGFdNjtlJ9SBGIpVUHuWXAk6
	rUCmHyZN2fUnych0UMKj2/GxmqYwp47PvC8G5psZZ6vZRXzyycQZ9j+sfJd1tmfZ+/QA
	YyFQ==
X-Gm-Message-State: APjAAAUm1OhSY+qRka9wf+UmxZc27lIQOE1nxUzbgUkI958a+VKTyWn9
	dORF8euoK9fjD/2hqMnMhs92QlF4mB/TbSfopNo=
X-Google-Smtp-Source: APXvYqwC0nbcY8VFvt/30Ze54o8frzHfjtVw5hwb1CRGcoTxdozIeh68/qcupIwbM0wuzjlr2i3uvxNAusK4R+qvK+Y=
X-Received: by 2002:a67:e45a:: with SMTP id n26mr5783620vsm.94.1566332465194; 
	Tue, 20 Aug 2019 13:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
	<28dbc362015c3cbae5b8550e8636e74802afbfc3.camel@linuxfoundation.org>
	<4cbf8a7b-f0b2-9a16-6a91-bead26ecef50@windriver.com>
In-Reply-To: <4cbf8a7b-f0b2-9a16-6a91-bead26ecef50@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2019 22:20:53 +0200
Message-ID: <CANNYZj-G7CvxTSX=L8tDm87xoa=u6cuJ+7s1nbvydtPc+GOmNw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Tue, 20 Aug 2019 20:21:04 -0000
Content-Type: multipart/alternative; boundary="000000000000302b73059092329c"

--000000000000302b73059092329c
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2019 at 15:46, Mark Hatle <mark.hatle@windriver.com> wrote:

> Looking at what my customers are doing, I completely agree.  I look at the
> design criteria for my customer's devices and I'm seeing 256MB as -very-
> common.
>  More happens, but it's rare still.  (But I have some customers with GB of
> ram,
> but that is usually to support their application, but the base system!)
>
> (Note, I do have customers -with- graphics requirements [X11] that are in
> the
> 128/256 MB ram ranges.  In most cases OpenGL is something they would like,
> but I
> don't believe it's a hard requirement for them.)
>
> I do still have many customers with 128 MB of ram requirements.  So it's
> important for us to set a reasonable baseline (256MB).  So going under this
> requires 'work', but I think that is acceptable.
>

For contrast, in the kind of system I am helping to develop everything is
measured in gigabytes. RAM should be in the ballpark of 10Gb. Disk storage
maybe 10x that. OpenGL is at the foundation of display output and isn't
optional in any way. There's basically every connectivity option enabled,
multiple cameras, touchscreens and whatnot. The whole thing will eventually
look not that far from iOS in terms of UI and capabilities and
containerized 3rd party apps (except it *also* needs to support multiple
screens and multiple users). And yes, it's all pulled together through
bitbake and a zoo of layers, images and target configurations. Yocto is
able to target cases like this, which is amazing - hopefully this clears up
a bit where I am coming from in this, even if it's a 'minority' position.

Alex

--000000000000302b73059092329c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 20 Aug 2019 at 15:46, Mark Hatle =
&lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Looking a=
t what my customers are doing, I completely agree.=C2=A0 I look at the<br>
design criteria for my customer&#39;s devices and I&#39;m seeing 256MB as -=
very- common.<br>
=C2=A0More happens, but it&#39;s rare still.=C2=A0 (But I have some custome=
rs with GB of ram,<br>
but that is usually to support their application, but the base system!)<br>
<br>
(Note, I do have customers -with- graphics requirements [X11] that are in t=
he<br>
128/256 MB ram ranges.=C2=A0 In most cases OpenGL is something they would l=
ike, but I<br>
don&#39;t believe it&#39;s a hard requirement for them.)<br>
<br>
I do still have many customers with 128 MB of ram requirements.=C2=A0 So it=
&#39;s<br>
important for us to set a reasonable baseline (256MB).=C2=A0 So going under=
 this<br>
requires &#39;work&#39;, but I think that is acceptable.<br></blockquote><d=
iv><br></div><div>For contrast, in the kind of system I am helping to devel=
op everything is measured in gigabytes. RAM should be in the ballpark of 10=
Gb. Disk storage maybe 10x that. OpenGL is at the foundation of display out=
put and isn&#39;t optional in any way. There&#39;s basically every connecti=
vity option enabled, multiple cameras, touchscreens and whatnot. The whole =
thing will eventually look not that far from iOS in terms of UI and capabil=
ities and containerized 3rd party apps (except it *also* needs to support m=
ultiple screens and multiple users). And yes, it&#39;s all pulled together =
through bitbake and a zoo of layers, images and target configurations. Yoct=
o is able to target cases like this, which is amazing - hopefully this clea=
rs up a bit where I am coming from in this, even if it&#39;s a &#39;minorit=
y&#39; position.</div><div><br></div><div>Alex</div></div></div>

--000000000000302b73059092329c--
