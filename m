Return-Path: <liu.ming50@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 655DA77ACB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 03:59:40 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i13so10781888qtc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OD8WGTKrkNzvctP3MbawtxrpCl9awSto7bOlJuncGlQ=;
	b=f1EBXiJTaENTwPMaThwWiHzImqhaQA+J98h5c/fkvnOtwKn6Jk5B2pqySvRRt53IBx
	7qdd1xDjQi5VNm/TwQmWq10Cl1dFVMrrijTdFqXtP8cM1Y/qDxllfqOEJi9FV6o2aG6Q
	KyoLOVAlEZyjnlykdIxEnzrdRFPTAdPzYWnPCOxfQB5Jxxucoht0ols+vCcniOxeOpE3
	RhNG0QBrvzfoYoWDUxcfURBrSPRMtCDvtAehp0SJZ49xnKuSVgRkRHfjFP8vxnlxBFXS
	pUtHyX6icLK6Yfshy2sxSziOUWfOHrGo4arDTFd+GDU9ZO6gfBNRbFvI/E+MhSldGUep
	grIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OD8WGTKrkNzvctP3MbawtxrpCl9awSto7bOlJuncGlQ=;
	b=L/0POSd6tN/UU3I20rv3lFPp7jBDhp8aPwah1+1MVocjMSK3As4cnXpqMZacIrb6kW
	52jJDYy8AVul2MQ7SxUMswAWd4KmWuBqNtQ+eHDKWnzN6ZFTQvd2Fke/yjH9OjGOWNji
	Vxz4fT7Wjz2aqFJOfxciwvKTcBYV0VdTESrtQJOk+2E6k3mPx9GS2yRQ9VUwInlMqwWU
	lMrruQtuaBz5euBvh66Jou3LN9rbrjpJpv3+kM2kO1E6Aex7UlTMOwklxQz9m7R31Ds/
	55sanddCbHdJfwd/tai1+8gR/vC1L7cuS8gj397h0tB8D+TV5STnCV1w9qk2RbAcAA1f
	f8gQ==
X-Gm-Message-State: AMCzsaUOf+ri4miVTxIF9Jih45rC+f//LoWwRp5qUtN1mZmwGTS6U1K3
	fixAaZS0fwxY3Q4roGHWcEir6Tqozr/aavvdDMs=
X-Google-Smtp-Source: AOwi7QATWD/OBh+W5jQ1FUtpsQ3j83NXQrFmuTg2SminoODcQOyI4Erms0wC54JFMu2ZILQ0rpoJYjwe0WC5HsWZMqU=
X-Received: by 10.200.42.244 with SMTP id c49mr21723734qta.46.1507003182404;
	Mon, 02 Oct 2017 20:59:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.55.72 with HTTP; Mon, 2 Oct 2017 20:59:41 -0700 (PDT)
In-Reply-To: <e2c0777f-af1f-d7d9-ebe3-816f4d6059a2@linux.intel.com>
References: <1506920927-1938-1-git-send-email-liu.ming50@gmail.com>
	<e2c0777f-af1f-d7d9-ebe3-816f4d6059a2@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 3 Oct 2017 05:59:41 +0200
Message-ID: <CALatG=4EguhkFgC-cSJ4tgrLDUtog1FMJN8NAr6WQG2qKmogLw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Tue, 03 Oct 2017 03:59:41 -0000
Content-Type: multipart/alternative; boundary="001a114063a85cd87f055a9c85bd"

--001a114063a85cd87f055a9c85bd
Content-Type: text/plain; charset="UTF-8"

Hi, Alexander:

Thanks for the input, I will then try to investigate the rpm code for
tweaking the values.

//Ming Liu

2017-10-02 13:37 GMT+02:00 Alexander Kanavin <
alexander.kanavin@linux.intel.com>:

> On 10/02/2017 08:08 AM, liu.ming50@gmail.com wrote:
>
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> This patch aims to fix a kernel-devsrc rpm installation failure on
>> target, I had sent the patch to libsolv upstream, but its maintainers
>> rejected it with the reason:
>> ...
>> we probably want to sync these values with RPM code...
>> ...
>>
>> I am not a rpm expert, would somebody please comment on this? Is this a
>> issue also should be addressed in rpm?
>>
>
> Note that they did not reject the pull request, but merely commented on
> it; it is still open.
>
> What the upstream probably meant is that rpm could also be defining these
> values somewhere, and so instead of just re-defining them blindly to
> arbitrary values in libsolv, you should take them from rpm header files, or
> otherwise figure out how the header limits are handled in rpm.
>
> Alex
>

--001a114063a85cd87f055a9c85bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Alexander:<div><br></div><div>Thanks for the input, I =
will then try to investigate the rpm code for tweaking the values.</div><di=
v><br></div><div>//Ming Liu</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">2017-10-02 13:37 GMT+02:00 Alexander Kanavin <span di=
r=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=
=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span>:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><span class=3D"">On 10/02/2017 08:08 AM, <a href=3D"ma=
ilto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a> wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank=
">liu.ming50@gmail.com</a>&gt;<br>
<br>
This patch aims to fix a kernel-devsrc rpm installation failure on<br>
target, I had sent the patch to libsolv upstream, but its maintainers<br>
rejected it with the reason:<br>
...<br>
we probably want to sync these values with RPM code...<br>
...<br>
<br>
I am not a rpm expert, would somebody please comment on this? Is this a<br>
issue also should be addressed in rpm?<br>
</blockquote>
<br></span>
Note that they did not reject the pull request, but merely commented on it;=
 it is still open.<br>
<br>
What the upstream probably meant is that rpm could also be defining these v=
alues somewhere, and so instead of just re-defining them blindly to arbitra=
ry values in libsolv, you should take them from rpm header files, or otherw=
ise figure out how the header limits are handled in rpm.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a114063a85cd87f055a9c85bd--
