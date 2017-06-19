Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id EFAD47807C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:04:16 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u195so59495146wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gs5duJcO6b7G1lKkWiUSGVJX/NQMBCfWqQjD40hk9po=;
	b=KlexDA5Ksdi3j/ymWeCkoLWXsVq9tXcmRNPsdhVL5SLKLYlMdKKjudxphEMle3YUdC
	mlaZyRoo1uj72gq+aUATiWS2e+KeFMrDdh1lp1xVf56jHgFxXCKTLL6l2wgypD71sCLF
	k9RFcCV7rU+3JQUTF0dySezJTM2ZDWeU0KtgHmLLY5nk1NmhIsYn6+v836r/EJPJrUVU
	lWG5W7eh43drp/Rw55tiAJOf1WOHMDOqOpgwImm46FLGq8xyiJPS1RvzWB7ckSLJZHBV
	RngqaCbvQIpb56sf04D0+0AONGX1WyGBQKY2HjzWWH8JbhnrWl4vi3zLrFNvaVxlFFUP
	d9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gs5duJcO6b7G1lKkWiUSGVJX/NQMBCfWqQjD40hk9po=;
	b=eewRBF3HlAcU1cWCjBKkVUwrmyt9K8rI0Z0LU/2IWafKT54f2l/jNjOCypDbyohdoL
	WhVhc0pyepNcS4TeKdBeg8Ccx2u3n6mJYRhez2BobhY/7JGX7Bg207iHPEhQ5WYT0atS
	3X8Iicq1yBvTeOaT+yanxD5/Qo2e1eMPGTZYdFZ/Xf4b3DcHF8NaXgYdWCETFiBYe6in
	SUgZjG8Fc1iIQeLJQyoC24HR9JDrrxdhg2IjBsbBlz+RpJKJnA1ZJKBtys1sUWBRUnqG
	1TKVshUF5FQoo6Zd036VnycL1Lh8/prFRvBkfuhtcZdt9Xn9nY9wdrVoNq3Ji1nlUBU5
	unHA==
X-Gm-Message-State: AKS2vOyo71EWuxnuguZ331f2dKHoKl83OCpj7Ts66IVTZNNnO6ZisHYD
	LrJ9RfUJoE9yvryPJNY6LFufMqWgGw==
X-Received: by 10.80.144.68 with SMTP id z4mr16846283edz.143.1497881057296;
	Mon, 19 Jun 2017 07:04:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Mon, 19 Jun 2017 07:04:16 -0700 (PDT)
In-Reply-To: <e905342f-1cf6-73ef-c6d9-d3782129a036@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>
	<642953f4-8927-acdc-a469-6970a3fb450d@gmail.com>
	<e905342f-1cf6-73ef-c6d9-d3782129a036@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jun 2017 07:04:16 -0700
Message-ID: <CAMKF1spA=Wu9TtxpCVR5MvyoLC1wksTYZYB2CiSC4XevYiTeow@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/32] icu: update to 59.1
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
X-List-Received-Date: Mon, 19 Jun 2017 14:04:17 -0000
Content-Type: multipart/alternative; boundary="f403045c2b78560a4f0552509c94"

--f403045c2b78560a4f0552509c94
Content-Type: text/plain; charset="UTF-8"

On Monday, June 19, 2017, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 06/16/2017 08:54 PM, Khem Raj wrote:
>
> -# icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
>>> -# therefore pass one
>>> -BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
>>> -
>>>
>>
>> I think this change should be tried on oldest supported distro for build
>> host like centos, I wonder if the std option was papering over c++11
>> missing bits on gcc 4.8
>>
>
> At least centos has officially supported gcc 6.x packages, so those can
> and should be used (and required by Yocto documentation). We should not be
> held back by default compiler versions which may be too old.


If that should be ok if we have documented that process as defaults on
those supported systems

>
>
> Alex
>
>

--f403045c2b78560a4f0552509c94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, June 19, 2017, Alexander Kanavin &lt;<a href=3D"mailto:a=
lexander.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 06/16/2017 08:54 PM, Khem Raj =
wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-# icu configure defaults to CXX11 if no -std=3D option is passed in CXXFLA=
GS<br>
-# therefore pass one<br>
-BUILD_CXXFLAGS_append_pn-icu-<wbr>native =3D &quot; -std=3Dc++98&quot;<br>
-<br>
</blockquote>
<br>
I think this change should be tried on oldest supported distro for build<br=
>
host like centos, I wonder if the std option was papering over c++11<br>
missing bits on gcc 4.8<br>
</blockquote>
<br>
At least centos has officially supported gcc 6.x packages, so those can and=
 should be used (and required by Yocto documentation). We should not be hel=
d back by default compiler versions which may be too old.</blockquote><div>=
<br></div><div>If that should be ok if we have documented that process as d=
efaults on those supported systems=C2=A0=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
<br>
Alex<br>
<br>
</blockquote>

--f403045c2b78560a4f0552509c94--
