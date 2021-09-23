Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web11.1388.1632428080068424659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 13:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=IfBiVlzY;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
	h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=h+AWgizJR0FPxNYYINKtS73szy+d9kQjhq2IiahDoKw=;
	b=IfBiVlzYKD6P087/kAaVAGwc/rm+x7ZP8xyEX9iU8Ome4O9Ira5fQgRIGweQkuLuoBMTiGYxUR4C1hKw6HrCF3hXjyFTt4c6a28vYyheo1toSi0Uu5jZNpLRbj/ylj2qapSJmG/Ni2Y9+5YsMuf0CGO6u/apVT+Ev2V+9vNmS27SpOcSHvbzxkV6oSGVQI4KyiP/8viKIir2OY24WubpOPvyXIABwogQWYWDMVWKjowOfif9ejGR/6CIkg1HyJNR0Jgrtfgs6JN3NfTEGxMHj6lpxZuJMQQEYsilvG4dvv5HHufX/wQRPb2rSWLaBFub87CzFfMhFPeaEcsTDX89VQ==;
Received: from 164.25.165.83.dynamic.reverse-mundo-r.com ([83.165.25.164] helo=[192.168.1.245])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1mTV76-00011x-0z; Thu, 23 Sep 2021 22:14:36 +0200
Message-ID: <8baefc87d954923273edd25508b753b5da44091d.camel@igalia.com>
Subject: Re: [OE-core] [hardknott][PATCH v2 ] mesa: Add patches for red label issues on video for VC4 and Freedreno
From: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Sep 2021 22:14:25 +0200
In-Reply-To: <CANNYZj8+PEXuuGCUdqs2+T+-F-q1_VWczhZqdtebZeHF-9ieLw@mail.gmail.com>
References: 
	<CANPvuR=W+REiC0t0mN1H_B4dzpXDVpSv+WwrJhBVX1CPGKEJgQ@mail.gmail.com>
	 <20210923151723.3435155-1-psaavedra@igalia.com>
	 <CANNYZj_adECA+Vn1aM-9arV2JXckDT5Y6+T+Hr4gzpQs0kqv2g@mail.gmail.com>
	 <eecd36d1edb8fb6a25bba430505f223c021b8302.camel@igalia.com>
	 <CANNYZj8+PEXuuGCUdqs2+T+-F-q1_VWczhZqdtebZeHF-9ieLw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-+kN6IIhpKhML7cfo5B4e"

--=-+kN6IIhpKhML7cfo5B4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

OK. Looks good to me. Let's wait for the acceptance of the patch first.

On Thu, 2021-09-23 at 21:00 +0200, Alexander Kanavin wrote:
> On Thu, 23 Sept 2021 at 20:44, Pablo Saavedra <psaavedra@igalia.com>
> wrote:
> > I kindly accept your recommendation but could I make also a
> > question?: Couldn't it be enough just setting the 0001-freedreno-
> > YUV-formats-are-supported-as-external-only.patch with "Upstream-
> > status: Submitted" [1].
> > 
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991
> > 
> 
> 
> In this case I would like to be cautious and accept the patch into
> oe-core only after it has been accepted by upstream. There have been
> situations where submitted patches were never actually merged
> upstream for various reasons, and so we ended up with unmaintainable
> custom patches.
>  
> > I assume this point affects only to the 0001-freedreno-YUV-formats-
> > are-supported-as-external-only.patch patch since the other commits
> > are already in Mesa 20.2 (version available in Honister) and they
> > are not required for Honister and next Am I right?
> > 
> 
> 
> That's right.
>  
> Alex
> 


--=-+kN6IIhpKhML7cfo5B4e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>OK. Looks good to me. Let's wait for the acce=
ptance of the patch first.</div><div><br></div><div>On Thu, 2021-09-23 at 2=
1:00 +0200, Alexander Kanavin wrote:</div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, 23 Sept 2021 at 20:44, Pablo Saavedra &lt;<a href=3D"mailto:psaa=
vedra@igalia.com">psaavedra@igalia.com</a>&gt; wrote:<br></div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div>I kindly accept your recommendation but&nbsp;could I ma=
ke also a question?: Couldn't it be enough just setting the 0001-freedreno-=
YUV-formats-are-supported-as-external-only.patch with "Upstream-status:&nbs=
p;<span style=3D"font-family:sans-serif;font-size:12.7px;font-weight:700">S=
ubmitted"</span><span style=3D"font-family:sans-serif;font-size:12.7px"> [1=
].</span><div><br></div><div>[1]&nbsp;<a href=3D"https://gitlab.freedesktop=
.org/mesa/mesa/-/merge_requests/12991" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991</a></div><=
/div><br></blockquote><div><br></div><div>In this case I would like to be c=
autious and accept the patch into oe-core only after it has been accepted b=
y upstream. There have been situations where submitted patches were never a=
ctually merged upstream for various reasons, and so we ended up with unmain=
tainable custom patches.<br></div><div>&nbsp;</div><blockquote type=3D"cite=
" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1e=
x"><div><div></div><div>I assume this point affects only to the 0001-freedr=
eno-YUV-formats-are-supported-as-external-only.patch patch since the other =
commits are already in Mesa 20.2 (version available in Honister) and they a=
re not required for Honister and next Am I right?</div></div><br></blockquo=
te><div><br></div><div>That's right.<br></div><div>&nbsp;</div><div>Alex<br=
></div><div><div><span></span></div></div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"></bl=
ockquote></div></div></blockquote><div><br></div><div><span></span></div></=
body></html>

--=-+kN6IIhpKhML7cfo5B4e--
