Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id C414E71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 11:15:28 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so2821365qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BEoVxfFi2bE5rJ97qoy068wYd02B3X8u2qfVuDJ9878=;
	b=U+HJ4ZF6ZMARDx9wmXkXidSyHXoOEosM4JRTG7mJ8S0PESSEHNxqP66uIMXUf4Q+QI
	klQO1m04+u1R/G573ctrod8VZtiEpa9kpZ/BeHaYHE4lR7Bb4ouEU5SvqKuJCfc91WXq
	XfwvKToqtkbQgo2VJ+R+g/etaROyzJNlK64oqdpoSgpdXIGPPD2o+PFbgdM+x5tBkjq3
	sHiepiyorB49ZcNIG0CCOiVgy1R16/7tx74ujU+I76KRsvhTOa08Az6paUjk1p11LXwJ
	FRzq4ygFlxeb14Lx6b9WIZMR8tt1mAqGl/XFNkDHUFGpUv0NXEXpe+orZy4UOpzX0G1o
	0Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BEoVxfFi2bE5rJ97qoy068wYd02B3X8u2qfVuDJ9878=;
	b=CUyKjQqJRT7E7VHYfwO5Dve/htT5VHKwvr4wfuLyBZKjwaAOhMwGkJkMZfUEmLh6mU
	3ARkT4MFm22DmNOLASKajgnIzatWBvs0gSbcjpcYBPvo6EsHJGFvUobgBmjPhnnfdeIw
	ko9dwT/RAdHRcLGkeEXJ2nfh2c2BzUya9cUurTq95ETfQ06jYfNABLd0hvh/WysuSpvj
	AdKG2AIsIopncR90TnaV7H/tf7GH47sV3i+Xb+riKVduhySFo7NRFDTLpkzya5CK/O88
	VXk6NdFY1BwEmU4EPpTV/kd0MGB6EKhlvSI3oqX9ZrHf6RZ3o7nJqj23astLKwzwQ2FH
	7wfw==
X-Gm-Message-State: ALoCoQmvBfhh3MjEysOrCwhlQXuARVnOdM77PDMO4M9Go5vvO6OCG3QaAlud4AOb9ylhuUxBrnHd
X-Received: by 10.140.44.54 with SMTP id f51mr28224744qga.80.1446030929076;
	Wed, 28 Oct 2015 04:15:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 28 Oct 2015 04:15:09 -0700 (PDT)
In-Reply-To: <5630A999.1030605@linux.intel.com>
References: <cover.1446009435.git.kai.kang@windriver.com>
	<484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>
	<CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com>
	<56309F82.203@windriver.com> <5630A999.1030605@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Oct 2015 11:15:09 +0000
Message-ID: <CAJTo0LYJGSbo-vPOn9oS03tnd08G6=tTxuwJB8-eMyUR=1B_5Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix unsafe memory access
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
X-List-Received-Date: Wed, 28 Oct 2015 11:15:28 -0000
Content-Type: multipart/alternative; boundary=001a113b4cb6dcc0660523284f64

--001a113b4cb6dcc0660523284f64
Content-Type: text/plain; charset=UTF-8

On 28 October 2015 at 10:55, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> I suppose Backport is the best choice in upstream status [ Pending
>> Submitted Accepted Backport Denied Inappropriate ]. Though it is not
>> from official upstream, it is from somewhere else as listed in the patch.
>>
>
> 'Submitted [where]' is the right choice here, I think.
>

Yes, this is exactly what Submitted is for.

Ross

--001a113b4cb6dcc0660523284f64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 October 2015 at 10:55, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I suppose Backport is =
the best choice in upstream status [ Pending<br>
Submitted Accepted Backport Denied Inappropriate ]. Though it is not<br>
from official upstream, it is from somewhere else as listed in the patch.<b=
r>
</blockquote>
<br></span>
&#39;Submitted [where]&#39; is the right choice here, I think.<br></blockqu=
ote></div><br>Yes, this is exactly what Submitted is for.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113b4cb6dcc0660523284f64--
