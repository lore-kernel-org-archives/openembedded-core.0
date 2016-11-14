Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD1E6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:46:01 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n204so97632791qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r5kNc4JHZQMdZdINRgR8BdBF98/7AJ/VL2mbtyZGB0o=;
	b=y97oI+lY7IECh/Q4Q+BQIQ892Dvpjvy/gIh8R8FHV3v8eFjwqqC0T4lSWq3UdZ0IAc
	qL1BbzyT33wrocfBC7nNrsVtgQLgMHzvXOVTD6zIPHSn6ADiZwr4e2Hq3mRQTw6kmJ4H
	1iNDZugacwgY58+KtbyPtk3IBcMCxmV/Uf3zydysToDacXYp0KX9/saQanW1XLYJi6uW
	cElyvBDvtAJzeEPt8MyiiNICRQoobTTu+Itklfrt/hXFp6kpv8hF1WkOWAOuspfJrGlc
	B8Lb2TZLzobZ/XvtKBY5/gQ1OiAE+gK1L0t95cA56xxE55LFtoasA7JzNz7Y4VO8i0S0
	k73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r5kNc4JHZQMdZdINRgR8BdBF98/7AJ/VL2mbtyZGB0o=;
	b=jcP1irQ8yrCiIZRGBGbUvH27t/LiR6o/0YgfHGO8UDv1KyQcMBV/uWnv/Nd5LcyfWj
	LUkYIglyUWNL1oeQzcH3LXDbV9PizivCrRKG13u2qloVkluvTgI60U9E0snJHYNbBhMR
	cv0nB8K5bcBg4OrAD1dNKIF+tUe+1cF4mjsIe3rYEw12ROrsBFjZ0KAEAe6JDRJDIvNz
	X1EDqr18Ty5AvjsX4paeeMoIhj196gafOeDb7csjcJkOod+ubUiKflYH/gWMvo2PyH6q
	9Tm2tIrbTmM97XCUZdzQWxGenNXS1CG2ntGtfF4LOVPcccrmyx3d8ZloDzXyeZXtGUpa
	kbCw==
X-Gm-Message-State: ABUngvcszcLHXc5TPMiGpQ37Z/yARSmviUaVEPaneZlnYx2vyINoAk1WaUFDwSuWXJSfUJIi2lR+Iv8ko0V4xUOe
X-Received: by 10.55.5.145 with SMTP id 139mr16790012qkf.77.1479134762842;
	Mon, 14 Nov 2016 06:46:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 06:45:42 -0800 (PST)
In-Reply-To: <db0f1a76-ef02-c274-9dfd-1bb8808faebc@denx.de>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LYgvyAriBj2Wf839f6E6Vv04+MLh++gBOEdqSQS+zizwg@mail.gmail.com>
	<CAJTo0LYV3L=i9Nq94uYHck9cGHrqvHrVtJsqOv0do+A4j-eBhg@mail.gmail.com>
	<db0f1a76-ef02-c274-9dfd-1bb8808faebc@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 14:45:42 +0000
Message-ID: <CAJTo0LZVXqvWmRaYHCchxLJ-Bpb86d+EQk-49J3cUZUH07Q5NQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Mon, 14 Nov 2016 14:46:02 -0000
Content-Type: multipart/alternative; boundary=001a114c8f841d4d00054143e6fd

--001a114c8f841d4d00054143e6fd
Content-Type: text/plain; charset=UTF-8

On 12 November 2016 at 18:31, Marek Vasut <marex@denx.de> wrote:

> > Also the u-boot series went through a number of revisions, can you
> > verify that the patches in poky-contrib:ross/mut match what you expect
> > to see?
>
> Do you have a link for me ?


http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut-broken&id=4f6dbc99950da645dc4d0e23e0065ff8245a0e74

As the cleanups didn't really make sense standalone, I squashed the lot.

Ross

--001a114c8f841d4d00054143e6fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2016 at 18:31, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"=
mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><span class=3D"gmail-">&gt; Also the u-boot series wen=
t through a number of revisions, can you<br>
&gt; verify that the patches in poky-contrib:ross/mut match what you expect=
<br>
&gt; to see?<br>
<br>
</span>Do you have a link for me ?</blockquote></div><br><a href=3D"http://=
git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mut-broken=
&amp;id=3D4f6dbc99950da645dc4d0e23e0065ff8245a0e74">http://git.yoctoproject=
.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mut-broken&amp;id=3D4f6dbc=
99950da645dc4d0e23e0065ff8245a0e74</a><br></div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">As the cleanups didn&#39;t really make=
 sense standalone, I squashed the lot.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f841d4d00054143e6fd--
