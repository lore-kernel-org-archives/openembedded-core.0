Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A85B74812
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 12:27:06 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y15-v6so2755004wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tP+sl7TOnq3YB1N7sxoGv4IO6p8c6M0eabPoXkmyiZ0=;
	b=qdaAu8jDgj+gy4Phk0znc83NVen/SuCzCq9gORUQpBTYPwxa7HFYsEcUPEPjOU8mx7
	AflJvQTPuQ2vSD1nL+9U0pAvRKQjag2XE+oj+95xSwiNrQ/ud8MRtOWbJ1e4cpdEA/Ys
	8J0nj1n6TCwYMOFqFyF0h7W5/QZTbLsp+h1886G4Rb2k6NVU3nSUJJxLvCZ6bAoGTvI5
	+5JTFi0zPwpM+v84yBceiMxcX5lQEDhWNhuygQPoosMQfV4r34r5dzgXqrFs9eTAmZLK
	kv+dZZvOeTBO5ad5NRKWIhdpSFs+09wGz8lfsIZrEblvwFe+9Xdl4gzQPeq/IDtbSDJ/
	yOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tP+sl7TOnq3YB1N7sxoGv4IO6p8c6M0eabPoXkmyiZ0=;
	b=GC9HL8wJ+Oy7Lvc46Qd1GAu+a6NXaSiKEAm5rFTlYHg+xw+7nNChG3TsbmmW+9Yiab
	L9CweqPT1a7pvdfQHftetCtSbvntF1tbrvhx5n1Ol9rsuZ5AhMCyFuJy7p/ImDQCVRPd
	InK2AEArWTK88ZvvlvGX49HIL6shFEx0TdAFJ5tfP1n8E09PXrbeECVpUFOrYlm40QYR
	WOdt+BSh05PVILL2oqs+xQHrh05af2dudjrBTgGUN63GBCYEwQj7tIx5dTxHcLtaxWsL
	03S+s6fZEx+GKikRW8NTusn2za+aGhz0SWiPxAM6hEZGKQ+tLZlCMkzaFge9BtC0hBOW
	szlA==
X-Gm-Message-State: ALKqPwc1j/jnvMzkYi7xIsL9a7JoHy/1y0i1ZNdpbS5dIgqGeI6rexsx
	88pEyUy8x95YOxFnOwXF/Y3N1SIM1rHcFuv8rhc=
X-Google-Smtp-Source: AB8JxZrXwAd0MFg7+x0WNRdimaTxSQ0z6esgMq58j5o4e88z9cpxJV7T0z9wx17T19ZHWNjTCSNAMeOhKl5egqiCRbQ=
X-Received: by 2002:a19:14ca:: with SMTP id
	71-v6mr4233096lfu.126.1527164827394; 
	Thu, 24 May 2018 05:27:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 05:27:06 -0700 (PDT)
In-Reply-To: <53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 08:27:06 -0400
Message-ID: <CADkTA4OEpSL+grTWxPKomoA0s2S8V6KuNfu3+kJUmy1zHCaTTg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Thu, 24 May 2018 12:27:07 -0000
Content-Type: multipart/alternative; boundary="0000000000000ce90d056cf2c5b0"

--0000000000000ce90d056cf2c5b0
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:

> On 05/03/2018 04:49 AM, Alistair Francis wrote:
> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
> 'numa', 'features/numa/numa.scc', '', d)}"
>
> Isn't this enough to pull in the required configuration from
>
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-
> cache/tree/features/numa/numa.cfg
>
> If numa.cfg is missing something in yocto-kernel-cache that should be
> applied to all machines, perhaps these configurations should be added
> there?
>

Correct.

I wanted to run with this patch myself before sending feedback. In fact, I
think that the kernel-cache
numa config fragments are being used anyway. But since I'm traveling, I
haven't gotten to that yet.

Alistair: if you drop your fragment, are you actually getting a failure
during the kernel meta data task ?

I will resubmit my patches shortly that allow any kernel to leverage the
shared config frags, so
using the ones in the kernel cache definitely makes sense.

Bruce



> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000000ce90d056cf2c5b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On 05/03/2018 04:49 AM, Alistair Francis wrote:<br>
&gt; +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&#39;MACHINE_<=
wbr>FEATURES&#39;, &#39;numa&#39;, &#39;features/numa/numa.scc&#39;, &#39;&=
#39;, d)}&quot;<br>
<br>
</span>Isn&#39;t this enough to pull in the required configuration from<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tr=
ee/features/numa/numa.cfg" rel=3D"noreferrer" target=3D"_blank">https://git=
.yoctoproject.org/<wbr>cgit/cgit.cgi/yocto-kernel-<wbr>cache/tree/features/=
numa/numa.<wbr>cfg</a><br>
<br>
If numa.cfg is missing something in yocto-kernel-cache that should be<br>
applied to all machines, perhaps these configurations should be added there=
?<br></blockquote><div><br></div><div>Correct.</div><div><br></div><div>I w=
anted to run with this patch myself before sending feedback. In fact, I thi=
nk that the kernel-cache</div><div>numa config fragments are being used any=
way. But since I&#39;m traveling, I haven&#39;t gotten to that yet.</div><d=
iv><br></div><div>Alistair: if you drop your fragment, are you actually get=
ting a failure during the kernel meta data task ?</div><div><br></div><div>=
I will resubmit my patches shortly that allow any kernel to leverage the sh=
ared config frags, so</div><div>using the ones in the kernel cache definite=
ly makes sense.</div><div><br></div><div>Bruce</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--0000000000000ce90d056cf2c5b0--
