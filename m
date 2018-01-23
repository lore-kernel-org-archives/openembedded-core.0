Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 17C456093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:55:07 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id 25so1187651ioj.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6oNtJ2FF0gI6/lQKyijKnTs5EDbKh0S5lxADc8qdslo=;
	b=NEjIamYH1xyglH+Sxw5SSv+24icoPahb0J6uV8IPjWKjyHoIfX2Aqcag03oUZ9x9Yv
	13uZg9bBVOJufkNdfbwXyJbKpXmj+PT3D3dDPTlCaULT2Nd2XDTvHi2oZ4YufV5AZpW2
	0c4F8yJXXGIkm6YyounuBBxbK3rkzyl628mU9ogPjjeSUOfFheYeC31ZFAFJ+z8YOXw7
	uw3APqp0k1Ku2l3hPIRWIQWV3oyWKYNVTbYLJzNXpcNSfpa39jxwb0HgKVgwo2gTc8r2
	LJw/QPPeMvYwToAcgmjBmQA+Hu15OvlqW130yHaqXSjuWZWtivJsT1Hi4tSj9CUU5rYG
	wyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6oNtJ2FF0gI6/lQKyijKnTs5EDbKh0S5lxADc8qdslo=;
	b=qPTukqDsu04oAq4ftisXxm1dvNqRrvqRUw4DPXCQ/O+1YttrN0f1u4WIZEEvd6nBa3
	sauUa4K4wzcyMaTBiTYhF2V/YKmZkCubPe+aYg56qZL1jiAj2xReeu55GuWmsm8VJ+Uf
	fLu4bEQVxsZTBgtgWlQok1dXg3FBZuEGTHSnV/JMXf8sgqYHXvi1SPMTBIGfyxmel8QN
	eqpLYpVs1+/CAMOYtVIogfYSB0Sub2r94eVWzp+TKbGg2IAN4Ss+nMaJf581w55upgXC
	Xqwp8IyOvqUc5Cn2eY7P3iTmc9IXu2OXaPg+L+awjzEFSjglG+rZHEltIIb6Wr6iPEFv
	Tj0g==
X-Gm-Message-State: AKwxyteTK0CLmBlph+5NW+8ms0CBmi79Gp4FhPMmp+ZP3oOF2rKcmpKm
	6OOD3mykhb85rAhNX+SPBH+PIENTRMDdvVGfvy0Jrw==
X-Google-Smtp-Source: AH8x224cQNuZw0HbUTSZGpxZFuv6T1tFVr2VIytFit+rzCHn/WDx13/gR3rkMcYKy59rpZJTA+EK+hEgro2Pf/ETiKY=
X-Received: by 10.107.32.19 with SMTP id g19mr3861640iog.217.1516719309393;
	Tue, 23 Jan 2018 06:55:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 23 Jan 2018 06:54:48 -0800 (PST)
In-Reply-To: <45d3a316-3dd6-f059-9bcb-60c52e6b9416@linux.intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
	<1516716352-32735-5-git-send-email-maxin.john@intel.com>
	<CAJTo0LakAyNOdEqvS5ZQid3qaB=bzYGt2yqJgyK-K9SAkT=bEQ@mail.gmail.com>
	<45d3a316-3dd6-f059-9bcb-60c52e6b9416@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jan 2018 14:54:48 +0000
Message-ID: <CAJTo0LZLdSmgWN8fxhaYT4FrzmU=4wJzUqxGPju96FzNjamoZQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] pango: upgrade to version 1.41.0
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
X-List-Received-Date: Tue, 23 Jan 2018 14:55:09 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a4a92aa3056372bbf6"

--001a1141a2a4a92aa3056372bbf6
Content-Type: text/plain; charset="UTF-8"

There now appears to be disagreement on whether Pango still has this
behaviour.  Maxin, can you ask upstream?  We either need to drop this
patch, or take it and drop the inherit upstream-version-is-even.

Ross

On 23 January 2018 at 14:42, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 01/23/2018 04:45 PM, Burton, Ross wrote:
>
>> This also inherits upstream-version-is-even so this is a development
>> snapshot.
>>
>
> Obviously AUH handles this correctly :)
> (yes, I'm on a AUH marketing tour).
>
> Alex
>

--001a1141a2a4a92aa3056372bbf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There now appears to be disagreement on whether Pango stil=
l has this behaviour.=C2=A0 Maxin, can you ask upstream?=C2=A0 We either ne=
ed to drop this patch, or take it and drop the inherit upstream-version-is-=
even.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 23 January 2018 at 14:42, Alexander Kanavin <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" targ=
et=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">On 01/23/2018 04:45 PM, Burto=
n, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This also inherits upstream-version-is-even so this is a development snapsh=
ot.<br>
</blockquote>
<br></span>
Obviously AUH handles this correctly :)<br>
(yes, I&#39;m on a AUH marketing tour).<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a1141a2a4a92aa3056372bbf6--
