Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 237AF6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 00:00:19 +0000 (UTC)
Received: by igcto18 with SMTP id to18so350477igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 16:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uzF2i3CGZsXdYPkC/l+prb+Osh8rxjjmCEzWj3yIMfQ=;
	b=bt5I+1m6/MmPGn/xb1BBRjlz0/ATcY7lVsAbSN6hwEJZKenZGS4B15xNcNILFJhCS1
	lWmYXAQVTh1vR8SUObW+eIV56YbFyiUEpEcQLpuAxiZOrizQkrBWpZqwYIPSXB2Gsb4V
	L6Jb16hS128G+2XenUiTlfAsRbzuWaMlt6bp5txsjzvdeYJ2QoKEDPlB8bm7zWOCFUO4
	yTWeLx5zIsnGmSkYahB/VqUjf8twaczyHK6bg9A4TBPl28QIVeM2dbes3r3ypxUMFeEP
	sN8EWqPMJP8PxzGUVPbn+tnzs7AOe1NIzGyDUTLH7IWbJbQBwE9TMAik6AgM4hc7yv5h
	fFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uzF2i3CGZsXdYPkC/l+prb+Osh8rxjjmCEzWj3yIMfQ=;
	b=B+s+k5CQFarTTQXKVK83XN+Py55cHmwVPbqDLqNwHpjfDHWlj1AQiIYHvDxkm3QDrO
	LXT9k7ZV4xRlyabIdC7gK7saluvPXzDRDgeQOKJrA+ldnVWFj5dXaaWamvjjd79cmq4h
	6adUTeosDGuH8Fu/alH6nFQden+MIlFefUsZZgaiqXxi+dY8jVPXKj+msKDRWIa8qzug
	3ZzEKVyOJUfz3eWB7HIbELbFXSCjoh201jlcsiV/Pc5QOYd9vLMxR4luQspV5zwLXYfT
	lXmKhTxD93Q49anxBR+e3MzrcT6mIyzvhQZqf9dX9Y3clJxKXfx3y+RgQELhkutU7yNm
	/AlQ==
X-Gm-Message-State: ALoCoQk9Knykcpa/vI21iQ1zoaPkwgyu8+RTUEalAdhYuPRqMVymFDhOZ8J+4hLLO38iESDEb827
X-Received: by 10.50.155.33 with SMTP id vt1mr5973675igb.64.1449100820351;
	Wed, 02 Dec 2015 16:00:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 16:00:01 -0800 (PST)
In-Reply-To: <565F851D.4080502@opendreambox.org>
References: <cover.1449075091.git.ross.burton@intel.com>
	<58ec5aaf4b7988eb0feda9961ab4b6f7bd8361c9.1449075091.git.ross.burton@intel.com>
	<565F851D.4080502@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Dec 2015 00:00:01 +0000
Message-ID: <CAJTo0LZJoq8VMeNH6fke1K4jrFoAWvtBEqF2h360_vZyOEDFJQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Thu, 03 Dec 2015 00:00:20 -0000
Content-Type: multipart/alternative; boundary=001a11343daaa421870525f3133a

--001a11343daaa421870525f3133a
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 23:56, Andreas Oberritter <obi@opendreambox.org>
wrote:

> s/directb/directfb/
>

Well spotted, thanks!

Ross

--001a11343daaa421870525f3133a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 23:56, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5k3" cla=
ss=3D"a3s" style=3D"overflow:hidden">s/directb/directfb/<br></div></blockqu=
ote></div><br>Well spotted, thanks!</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11343daaa421870525f3133a--
