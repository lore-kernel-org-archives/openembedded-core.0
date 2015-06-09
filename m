Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 71C3D736BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 15:15:00 +0000 (UTC)
Received: by qcnj1 with SMTP id j1so7418174qcn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 08:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=x9or8cb5LfB1VJwGyJ9hyM499tmUYExvBOZc9AdWlIM=;
	b=GB95t0wD1p0zH/DxUwfmcPoJn5dH8Ej/6aJUvJSMj9IY/k77iOLUZyV4yau13nkp+4
	Jxx1gjNn0w+OmJEi2+l54hZ0cxHPtsbJ46MJ0iNeKROzE2BYT91Mw9T72oTviXfXZxOd
	z0yKu3Bns7KfWxMTh9OhrQneTX1wBw0dgUJ1TsLTRZHA0DsEgKkhSIXoNFSqywRW03zq
	0xOlxR1RQ9s3CD4XnKJlJAOssaOucSfAP4vFQiw+z6EQ8LBv3DYlGZP+EQfi4/pff+E9
	JoL0XpvyZdGm9UGbr6dCFJBm2pX2LcgzrSzzTfqesUKH9EHz6VCcI5D1O4g7SRISjNgR
	NjBQ==
X-Gm-Message-State: ALoCoQltQmFU7snkaDZvSqt9ZiBoB5pmPaU5c41t2Io2efcHG20cqDJ4L6Xx8DaNsIBk0OtY4pUi
X-Received: by 10.140.235.195 with SMTP id g186mr28333412qhc.64.1433862901970; 
	Tue, 09 Jun 2015 08:15:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 08:14:41 -0700 (PDT)
In-Reply-To: <CAMCfZKGuZoHJGAYK4VgRM-q_GXWbn6VaEyrnnUFBvwXEdtMV2w@mail.gmail.com>
References: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
	<CAJTo0LadVJPTXNb5MLV6AHhbcS9_rEN1qYz0D+cp0nmB4uv9aQ@mail.gmail.com>
	<CAMCfZKGuZoHJGAYK4VgRM-q_GXWbn6VaEyrnnUFBvwXEdtMV2w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 16:14:41 +0100
Message-ID: <CAJTo0LZ=bwCmkEQZez6eyhaR1aB7-DEs2x3JjLwYmkM6MHy-MQ@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] Issue on linking qtwebengine
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
X-List-Received-Date: Tue, 09 Jun 2015 15:15:02 -0000
Content-Type: multipart/alternative; boundary=001a11354c8aedd3ac05181738a2

--001a11354c8aedd3ac05181738a2
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 15:53, Diego Sueiro <diego.sueiro@gmail.com> wrote:

> When qtwebengine compile task are running in parallel with another task I
> get an "file not recognized: File format not recognized" error.
>
> I put PARALLEL_MAKE="" but the compile task still uses all CPUs.
>

It's possible that qmake or whatever qtwebengine is using isn't respecting
PARALLEL_MAKE.  I don't use qt so can't comment any further.

Ross

--001a11354c8aedd3ac05181738a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 15:53, Diego Sueiro <span dir=3D"ltr">&lt;<a href=3D"mail=
to:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>When qtwebengine compile task are running in parallel with another task I =
get an &quot;file not recognized: File format not recognized&quot; error.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I put P=
ARALLEL_MAKE=3D&quot;&quot; but the compile task still uses all CPUs.</div>=
<div class=3D"gmail_extra"></div></blockquote></div><br>It&#39;s possible t=
hat qmake or whatever qtwebengine is using isn&#39;t respecting PARALLEL_MA=
KE.=C2=A0 I don&#39;t use qt so can&#39;t comment any further.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354c8aedd3ac05181738a2--
