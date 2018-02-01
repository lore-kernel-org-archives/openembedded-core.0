Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80111784E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:43:54 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u12-v6so189291ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LbsAR+ltpkNkH5tlG+FEpoOjWRkQbjqBMl1BJpFqVYg=;
	b=FAmvi0FItUOiENolWmhSKkQWnTii/g4mihWZ7VJgFoLbEyTTady8tPOcYyP8PRd+2/
	3bjMGu0Ch7lRH+c6pQEMArmuBT09LPMJsIC5yCIthk20a4kToNcdkF7QdSYmhiEBOx60
	GcpZQVjFpw/f25d8A6V34Lsr9RFt8l528tF4LrbNZUtKHM/0HLyZ7rYo4dSH1jEW768P
	TPF/eYByJvLGrGZS73USbbwrNwwJ6C6zsj6wrAIN6nvDQbyC1GLTuHdyR9AUtwisp8KQ
	0mOmHMmxC8NhAeN+A1tZKU0FHQjqW4HBdh5ptBCw1QO7r9HrvMG19428krhrVdmWIG22
	1qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LbsAR+ltpkNkH5tlG+FEpoOjWRkQbjqBMl1BJpFqVYg=;
	b=DAyS0YcRga6VW5beZlTOUuu/IVC/Fbwtbt7jAiBqLhbyQg+WhVZGMwpmMAg2eA2XDR
	99ILIpHRoslarc5E7UOrZ1eGUFsQu0LT5xK4IKzR2FBKpb0SfqxEz435UNRAIAT17zeU
	6D1Pm2JL0EiahhLRv/o4qbXB+ZkneO4Ys9M3aOQvLSPoBQ7C1dSNOYfXXJPyYGgd3ERI
	oJEmvGbxp7n8lkELqLbhZ35a4cljp+nEOTiLPJDVTVcL/DMqlz3cyytxjLAK4YmjeZ2/
	X39xWxEwSOJs8TNl/lt41+rtd+/QGcHxi4E8rs9Pgu3U7R5VzeiTkYeD8kkpfwQJED8W
	pgaQ==
X-Gm-Message-State: AKwxytcQ3rgnh5pIl7+VmIextZxFq5ML/784obMlB0Q9m4krNKRku98k
	GvCrBHYcrdkX+NzO4QHpM4HiYeZsA+M6HSHUGxuamQ==
X-Google-Smtp-Source: AH8x225q4pARCpabg/gESycuE6Mhd0Hqev1sJVNJtzhKw9vm4HRpf5ehyt+fRonS+gLe8mT/dtnfCHgdbEoJg3ndlkU=
X-Received: by 10.36.185.84 with SMTP id k20mr6705181iti.124.1517496235662;
	Thu, 01 Feb 2018 06:43:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 06:43:35 -0800 (PST)
In-Reply-To: <37022525-6de2-9522-7423-70745cd5cb62@linux.intel.com>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
	<48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
	<32b564ff-9cad-370f-48b1-389bf69e2ffb@linux.intel.com>
	<8812d964-49f1-b18f-751a-bcdffac028c0@vaisala.com>
	<37022525-6de2-9522-7423-70745cd5cb62@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 14:43:35 +0000
Message-ID: <CAJTo0Lb-KfRh1ZY_TbeB8AM3txGeBbpr0sCje5FXzi5auoJnaw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Thu, 01 Feb 2018 14:43:54 -0000
Content-Type: multipart/alternative; boundary="f403045d96c2133886056427a0d8"

--f403045d96c2133886056427a0d8
Content-Type: text/plain; charset="UTF-8"

On 1 February 2018 at 14:39, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 02/01/2018 01:36 PM, Mauno Niko wrote:
>
>> Before we can declare that, we need to look what comm is actually used
>>> for during build, and why its absence is not a problem and doesn't cause
>>> errors.
>>>
>>> Consider also that using comm from host may break reproducibility, if
>>> absence or presence of comm on the host results in a different output
>>> from the build.
>>>
>>
>> My patch initially did add coreutils-native to u-boot DEPENDS.
>>
>> Should I resubmit it? (did not apply due to mismatch in recipe filename
>> (version))
>>
>
> RP has already merged the patch you sent, I think :)
>
> Still, in my opinion - yes, it's better to undo the HOSTTOOLS change, and
> add coreutils-native. But first, research a bit further for what purpose
> comm is used during build and why its absence doesn't break it.
>

coreutils is on 100% of linux desktops (rounding up), and this would be the
only recipe to build-depend on coreutils-native.  I don't see the problem
with depending on the host for this.

Ross

--f403045d96c2133886056427a0d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 14:39, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On 02/01/2018 01:36 PM, Mauno Niko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Before we can declare that, we need to look what comm is actually used<br>
for during build, and why its absence is not a problem and doesn&#39;t caus=
e<br>
errors.<br>
<br>
Consider also that using comm from host may break reproducibility, if<br>
absence or presence of comm on the host results in a different output<br>
from the build.<br>
</blockquote>
<br>
My patch initially did add coreutils-native to u-boot DEPENDS.<br>
<br>
Should I resubmit it? (did not apply due to mismatch in recipe filename (ve=
rsion))<br>
</blockquote>
<br></span>
RP has already merged the patch you sent, I think :)<br>
<br>
Still, in my opinion - yes, it&#39;s better to undo the HOSTTOOLS change, a=
nd add coreutils-native. But first, research a bit further for what purpose=
 comm is used during build and why its absence doesn&#39;t break it.<br></b=
lockquote><div><br></div><div>coreutils is on 100% of linux desktops (round=
ing up), and this would be the only recipe to build-depend on coreutils-nat=
ive.=C2=A0 I don&#39;t see the problem with depending on the host for this.=
</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045d96c2133886056427a0d8--
