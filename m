Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C589977CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 07:24:36 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id h64so8010092iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BliDMf8/E2GXi9eZOvAsUF5qXUAA96bvW689x0T4ehQ=;
	b=hXsJleWEEwf35foRVZiwvQSLdo2/ivvRP5uV/cY/ZJHEw7N7qp/7mQ7OkO2/CBLp5H
	gRzsRNM7OBhX2xHnSq2S11zuI3GhgzLt3m23HGWcJuPzeJEWfzGiuOQ52PP+BgvFj7uT
	T6D3Y5c95tUrRNx94sEF6HQj60fP/TMO5FwngVp5uYtlH0KJLsjjQKbxCd8YVoAjgt0e
	Kd6b/V2Hf1aXStC7jFImZkYvqYDc7KEC9VvU2x8/3PdAxMl9WDrsSj442/+zwjRhTrvm
	w36nAYyyc365QFWcnyudbAq/F7ioaI9tuP/uIP1sjLSgbOb0c9YHS4Uxo57b12jx+UFE
	DPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BliDMf8/E2GXi9eZOvAsUF5qXUAA96bvW689x0T4ehQ=;
	b=jIIF0olIHiaexLn3Fbp+9VXi/pv6tf9deDmMsATmpMWwzQpyWThk0nzzy2aaoAyhhs
	taKshczisY/HjqRDN1m8YFvfYL94Wz7NFj2MthC3yy4AgEHTcr8bCqUR6VrYVR41P+Gd
	RAD9q3QrkUMxqNlNtqupEYVDvhVyk1SKQkFLuSffGbVRiAyGNGLb7016CPPAtI5lYa2O
	vrPgWcRLa5kA47veZ9KgilLtXiwsceEpuSaQz5FdyND/14H0T6nA7Jyk0ISXlI2+9JVn
	bTuNaugl/J8kfcYiTpysjNCOnqJBO1rr2ayFDGeoV+1IKlVq4BGNqsGTMOKyZOkhUZC9
	EulQ==
X-Gm-Message-State: AIVw112gNc7spStRUlH6p2NuyQOM23b0xGknbVwhZu56Ipf38njNGF8f
	8FDS8h4jwEcXX7WR8fwEkN7/twTDDcrn
X-Received: by 10.107.170.212 with SMTP id g81mr3646395ioj.19.1499844277466;
	Wed, 12 Jul 2017 00:24:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Wed, 12 Jul 2017 00:24:06 -0700 (PDT)
In-Reply-To: <CAMKF1sqe6wH+HfWLvzfYV=Ozg0YYDzfF9eRrUGGn98EB8f2bQA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
	<CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
	<CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
	<CAC+thW0yRO-=x_Of7vF6n9RxiqSUcpzGdVhFndwKSmfg+4JSNQ@mail.gmail.com>
	<CAMKF1sqe6wH+HfWLvzfYV=Ozg0YYDzfF9eRrUGGn98EB8f2bQA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 12 Jul 2017 10:24:06 +0300
Message-ID: <CAHiDW_EiNh8toWOwZ6qkqxYsXatyVUygG0dkibYzxw0O+TEQ=Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Wed, 12 Jul 2017 07:24:37 -0000
Content-Type: multipart/alternative; boundary="001a11425b7060acb7055419b50e"

--001a11425b7060acb7055419b50e
Content-Type: text/plain; charset="UTF-8"

On 12 July 2017 at 08:11, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jul 11, 2017 at 9:56 PM, Andrea Galbusera <gizero@gmail.com>
> wrote:
> > I may be in the need to craft something locally to unbreak building with
> > current master... Could you please shed some light on how this should be
> > done then? Is this a matter of completely removing either mesa-gl or
> > userland from gtk+3 deps or a more selective change to avoid the clash in
> > recipe-sysroot?
>
> Firstly, determine where this file belongs to. If it is part of
> egl/gles then it should go to userland, otherwise it should be
> provided by mesa when using userland for graphics
>

It's a "generic" Khronos platform header (so not part of EGL or GLES[1-3]
but needed by all), in a perfect world we could use any version of it ...
unfortunately "Adopters may modify this file to suit their platform" and of
course that's what Userland has done.

I think I'll just send a patch to mesa-gl recipe to not install the header.
If someone wants to solve this properly with the upstreams, be my guest.

Jussi

--001a11425b7060acb7055419b50e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 12 July 2017 at 08:11, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_-8739775874278883=
400m_4452814043463377778m_-9200332532879437627HOEnZb"><div class=3D"m_-8739=
775874278883400m_4452814043463377778m_-9200332532879437627h5">On Tue, Jul 1=
1, 2017 at 9:56 PM, Andrea Galbusera &lt;<a href=3D"mailto:gizero@gmail.com=
" target=3D"_blank">gizero@gmail.com</a>&gt; wrote:<br>&gt; I may be in the=
 need to craft something locally to unbreak building with<br>
&gt; current master... Could you please shed some light on how this should =
be<br>
&gt; done then? Is this a matter of completely removing either mesa-gl or<b=
r>
&gt; userland from gtk+3 deps or a more selective change to avoid the clash=
 in<br>
&gt; recipe-sysroot?<br>
<br>
</div></div>Firstly, determine where this file belongs to. If it is part of=
<br>
egl/gles then it should go to userland, otherwise it should be<br>
provided by mesa when using userland for graphics<br>
</blockquote></div><br></div><div class=3D"gmail_extra">It&#39;s a &quot;ge=
neric&quot; Khronos platform header (so not part of EGL or GLES[1-3] but ne=
eded by all), in a perfect world we could use any version of it ... unfortu=
nately &quot;Adopters may modify this file to suit their platform&quot; and=
 of course that&#39;s what Userland has done.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">I think I&#39;ll just send a patch =
to mesa-gl recipe to not install the header. If someone wants to solve this=
 properly with the upstreams, be my guest.=C2=A0</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Jussi</div></div>

--001a11425b7060acb7055419b50e--
