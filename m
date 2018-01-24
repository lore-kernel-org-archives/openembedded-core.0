Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 84A9A6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:46:44 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id b5so4717864itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ryrkmi5JDv2MfpM/CKVM2SIqg+NlFQA7SV6qx2RkHCs=;
	b=hyqM5unmztU6gLp1DHsishcgBjYCgOxqD2APsukTNFURN/gn6g2DqsVrygQP7+AEmd
	cYREeV3oYyr+F4dSgbBvzXMDydYUm8jTqrlSiqwSElITdsepPWGXJZH/SmUR6HyaoK6V
	05UmmZweuR1+0nkfzuJtAhRRwl7kR0wLjbuShvROloYn0qUvBin/5TCTY8HshX4hFPB1
	mBEmSWyK+VVYwdEu2d1fHgOvnK+YX4PjUMXRgYRuHzslHUZ5ELsmMiyzdZoXTSq7R2qw
	Ozfc25kb3d5Gegs0wsBtaIEn/R/MLcl0rR+ro50G5ccT9eRwnHEXA2jujXfIcHa7Y0LO
	WEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ryrkmi5JDv2MfpM/CKVM2SIqg+NlFQA7SV6qx2RkHCs=;
	b=T8s/p5W9d+66iN9AwULMo8go6H0FpxCaIiqvEq9dht+pcrb1kitpHF8Bui2PK2Fujo
	gKJ9VSKKhvubnPsKDKkgAHlK2TSjthN5RuEvLkuxO+XT32/PVAP4CrLoO1kskB7mqNcS
	xkZURc8pKY5/Xy2R/ewOfFwb1vHnpc3SWrMljF12uMERZEGYTvKu6MebpZK2qZs/PcBN
	YTHtpur5ozDjkGkXR/G1fcXoETCbfHba54x4nze/eYB81fNs3mmrZ5Z0IukiLt4oe1ZU
	OSNymPHzhpNC0uqJM/J0qt/Eevqcppbzj8gT4hbN7H1lyrYLX/3jmvSzNodSkSf7W+Ov
	7JRg==
X-Gm-Message-State: AKwxytfJuQo7bj5T3WJWxZt/+1gmgdAlPXQCbqyaakSwxqBoexN1yqt3
	4HqiObONtNCso+LYrN2gEGSdsbz42GgORp599RyM9w==
X-Google-Smtp-Source: AH8x224ko5OTbDYu+RHqFljXHpP+k7w8iNNh5uaYw28WOO+JeerBMJdpM0ndg9PFWMPIEs6juTgHNqQiU9rqC/WmH5k=
X-Received: by 10.36.228.79 with SMTP id o76mr7943923ith.85.1516790805651;
	Wed, 24 Jan 2018 02:46:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 24 Jan 2018 02:46:25 -0800 (PST)
In-Reply-To: <CAMKF1soaz0h4hsK-L9RSZKqyTvHL4yXVbdWYUkkovsqnNC3d3w@mail.gmail.com>
References: <1516661989-26346-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spfw=Z6UJRM6x5GD7bUs=yJdTe2YbDT3n4naBM-0_N6+w@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B64051B447@ORSMSX112.amr.corp.intel.com>
	<CAMKF1soaz0h4hsK-L9RSZKqyTvHL4yXVbdWYUkkovsqnNC3d3w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jan 2018 10:46:25 +0000
Message-ID: <CAJTo0LamCj02M4j5Zfdhr4btz7ZS0nF94b9Mph_asEpo=McA+w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libc6: improve reproducibility
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
X-List-Received-Date: Wed, 24 Jan 2018 10:46:44 -0000
Content-Type: multipart/alternative; boundary="94eb2c1246da2b8e72056383613a"

--94eb2c1246da2b8e72056383613a
Content-Type: text/plain; charset="UTF-8"

On 23 January 2018 at 21:39, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jan 23, 2018 at 2:44 PM, Bystricky, Juro
> <juro.bystricky@intel.com> wrote:
> >
> >> >
> >> > plural.c: plural.y
> >> >         $(BISON) $(BISONFLAGS) $@ $^
> >> >
> >> > If the above rule does not fire, we use a "fallback" plural.c,
> otherwise
> >> > we use plural.c re-generated from plural.y.
> >> > The fix is to always require bison to be installed and unconditionally
> >> > re-generate plural.c. (This is achieved by touching plural.y).
> >> >
> >> > [YOCTO #12291]
> >>
> >> 2.27 will be there for next release. So I wonder if we should just wait.
> >
> > AFAIK 2.27 will always generate plural.c (plural.c will not be part of
> the distro at all). So "touching" plural.y is not needed. But we still need
> to add bison-native to DEPENDS
> >
> > DEPENDS += "gperf-native bison-native"
> >
> >
>
> right. perhaps we should apply this patch and make a note for 2.27
> upgrade to drop the last hunk


That's the plan.

Ross

--94eb2c1246da2b8e72056383613a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 January 2018 at 21:39, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Jan 23, 2018 =
at 2:44 PM, Bystricky, Juro<br>
&lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.bystricky@intel.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; plural.c: plural.y<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(BISON) $(BISONFLAGS) $@ $^=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If the above rule does not fire, we use a &quot;fallback&quot=
; plural.c, otherwise<br>
&gt;&gt; &gt; we use plural.c re-generated from plural.y.<br>
&gt;&gt; &gt; The fix is to always require bison to be installed and uncond=
itionally<br>
&gt;&gt; &gt; re-generate plural.c. (This is achieved by touching plural.y)=
.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [YOCTO #12291]<br>
&gt;&gt;<br>
&gt;&gt; 2.27 will be there for next release. So I wonder if we should just=
 wait.<br>
&gt;<br>
&gt; AFAIK 2.27 will always generate plural.c (plural.c will not be part of=
 the distro at all). So &quot;touching&quot; plural.y is not needed. But we=
 still need to add bison-native to DEPENDS<br>
&gt;<br>
&gt; DEPENDS +=3D &quot;gperf-native bison-native&quot;<br>
&gt;<br>
&gt;<br>
<br>
</span>right. perhaps we should apply this patch and make a note for 2.27<b=
r>
upgrade to drop the last hunk</blockquote><div><br></div><div>That&#39;s th=
e plan.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c1246da2b8e72056383613a--
