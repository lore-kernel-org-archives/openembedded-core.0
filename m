Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1B26F60722
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 00:22:47 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id f99so7661098ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 17:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TC+4NNod7955LIWm8HIZ6YordObMGIR09Kbv1Pd++SU=;
	b=OVSKlQF0ihn6sO9n87zvFwOmx9wBJwwcIGu1zXnBdTKzQ9Xyhz6sht8sQpe8lpRp0P
	S7fOJQqQilquDYCYqcPk+xZovB40l7DN/7JLLnLuHVPYxRpA7+2TL/cC0g9PpUz88iKV
	peOSog2hM1TWB1Hzwoocxf7SFbmFn8BtLV+exh7Yi4CetgYRj9tSYF2CdOJp3UlEdQcG
	aw+3fKVzGeWFA7wT8xmfEg2lGwl70yDrsxOdKI93gaXPyQMWuc9MOHtgiu9gapvo8sLI
	6Vxzi12dGs2RBki3Y9wHl0g4ttbUWBwvAQ756cGwX6iInVDoGMOAODkRCMlyJ6rkMMmB
	03aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TC+4NNod7955LIWm8HIZ6YordObMGIR09Kbv1Pd++SU=;
	b=HuK8G20zDV3J9GIgSa1P5pYNfoM/TbAfJc1lEdG91HNhoZRVQQGg1o/HANCFJidYXz
	w01yrZzGHejzXqvuPgGa6yeUEauMKC9besjaOEo5hZmUBtCgB6XBC5OY0l611tZZ5V58
	BAMDfR56L/qdU25yOyoJKdWSJ0PSt7Jsz5RQ6xSyVTmIBonOUzCJy5G79erXPwVbokJn
	L7gO7CX+USpesPTGvoXSpyxfuVWQ6nrtDDa5v1EYkp5tmoYWJostvTwwaXX2amx8tln6
	4GZmqFYjtsiZYxaxbEXVXoBl/XIJrH+nNJpbwcLQOBX8KFSy7ruJDyp2jM7rI/b7Z0L+
	188A==
X-Gm-Message-State: AHPjjUjakhWb4aNdjnNCFXIDKi6/jh+3TKtS0Hq/8Dr6ybsl8cyr4fG7
	P3cA+SMwbdKUShu17w2KH61nEaFcgJlE
X-Google-Smtp-Source: ADKCNb53Xo8rFIELTKMSfJvnSRzw8+/oiPV2gMQwkJz9pgxsNeRFlegDW6WImwcrMLVXlx9Qy7kSxTovMoYP9zu3J1A=
X-Received: by 10.107.59.200 with SMTP id i191mr2981567ioa.117.1504311769036; 
	Fri, 01 Sep 2017 17:22:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Fri, 1 Sep 2017 17:22:28 -0700 (PDT)
In-Reply-To: <20170826112602.15344-2-jose.alarcon@ge.com>
References: <20170826112602.15344-1-jose.alarcon@ge.com>
	<20170826112602.15344-2-jose.alarcon@ge.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 2 Sep 2017 01:22:28 +0100
Message-ID: <CAJTo0LZPPuC23W4UnbTYBA8MLZAh1E=8RmU5LeTdVEDpJiQ46Q@mail.gmail.com>
To: Jose Alarcon <jose.alarcon@ge.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Sat, 02 Sep 2017 00:22:48 -0000
Content-Type: multipart/alternative; boundary="001a114f80dca0184e055829e0ec"

--001a114f80dca0184e055829e0ec
Content-Type: text/plain; charset="UTF-8"

On 26 August 2017 at 12:26, Jose Alarcon <jose.alarcon@ge.com> wrote:

> The do_rootfs log contains a number of unsatisfied package
> recommendations. At the moment those are only visible when
> reviewing the rootfs log.
>
> This patch adds an extra check to surface any unsatisfied
> recommendation  as WARNINGS to the build output when
> "debug-tweaks" is enabled.
>

But isn't that the point of recommends?

If the user uses BAD_RECOMMENDATIONS to explicitly stop specific
recommendations being installed, or the package just isn't available,
that's fine.

Ross

--001a114f80dca0184e055829e0ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 August 2017 at 12:26, Jose Alarcon <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:jose.alarcon@ge.com" target=3D"_blank">jose.alarcon@=
ge.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">The do_rootfs log contains a numb=
er of unsatisfied package<br>
recommendations. At the moment those are only visible when<br>
reviewing the rootfs log.<br>
<br>
This patch adds an extra check to surface any unsatisfied<br>
recommendation=C2=A0 as WARNINGS to the build output when<br>
&quot;debug-tweaks&quot; is enabled.<br></blockquote><div><br></div><div>Bu=
t isn&#39;t that the point of recommends?</div><div><br></div><div>If the u=
ser uses BAD_RECOMMENDATIONS to explicitly stop specific recommendations be=
ing installed, or the package just isn&#39;t available, that&#39;s fine.</d=
iv><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a114f80dca0184e055829e0ec--
