Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 24B4077DB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:16:27 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id 4so6273028itv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GGaxMfeth0L+RmTOe2xD+2aNP/4amayU8YpThSM+LGE=;
	b=HmUWdA2YgP8rWzgXrq9V3QB8neXgPI1t7u7oduRdkmo0HL6XyHJJXRd4ITD1WjMiK2
	uo/1YQF9d4mvo+WWYiJT90mqAPGy/b7zRFBp/WfTlS9Tb33LINK9HlWSOH8Y9HqHecLp
	RYmmYTQQYP6Qmxfd0z7EDSPqKx2IL+vzL5qakT4ukEaiZseimESpm7RtXBO45ynl3/zm
	Xhz4qTZ3iUBW/attavIuqs09r3c2l/Set6Gge0uEFvqI2GwcLwPGZ0RMGXHUXC3Ud1KB
	Vc38W4NZQk1Tug/GPeWADCcMIh3T7u+soQfJkLu2otQ2hygsA2YAVcC8vwAlvDM0LUAK
	NC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GGaxMfeth0L+RmTOe2xD+2aNP/4amayU8YpThSM+LGE=;
	b=dC9p1ceELwZ14oceMcKSQVhtSnOjXV6UmDncs2hweP3Uw11hd9Rs+LLdMujweRI6Zv
	4wb4CeY9pob1na5xpHd+bdhjWrVvMwkFbnppxzyT+Pk0fb2WgzDQQiZlwzm01nF4m+xT
	AhwETxltqz4SRYCstJvZFNWBpOXu3+2wWaZwx7Upsjy20nLK+KjJhi1uDjWZQXdZzAGo
	T0nV699LOwPIefWYAllhYk1EuHlI/Xccs8FLDrq0kO6rCdtVukKhfV/9ChwW3ZQ47dpl
	tu+HBOYSx7PlJ1dBgCZC7TtwqDIjOqDJBbrI/SgUaKm9pd3f5U1hGHsNgdSytszF/Rq6
	r6ew==
X-Gm-Message-State: AHPjjUge1ZnTC3uITZUXY9uNDmo7MFp3uP2FeyLOqlujR3nRRBzDAv4t
	JBqAEct1BMf1CvACAtpjKCDuIWnlsyVFno8AuY1gIA==
X-Google-Smtp-Source: AOwi7QCCmYaoW7HJROZyQn7w2A6weNspvfkQYw9tNdFPrHQji7g9WhUTRNRviCpHc6c97UzWTrZJzOkl4JblhhcrdIE=
X-Received: by 10.36.181.73 with SMTP id j9mr198651iti.6.1506514589127; Wed,
	27 Sep 2017 05:16:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 05:16:08 -0700 (PDT)
In-Reply-To: <CAP9ODKopt-a_Ur8GKMjBwsGo_S9XBFmwZj9K9V8=kxQ6x__MgQ@mail.gmail.com>
References: <20170922235219.2785-1-sgw@linux.intel.com>
	<CAJTo0LaJmEy6EbDZ+uv92ESgLZx-wYB8mmKboJsP4pAR8uDA5g@mail.gmail.com>
	<CAP9ODKopt-a_Ur8GKMjBwsGo_S9XBFmwZj9K9V8=kxQ6x__MgQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 13:16:08 +0100
Message-ID: <CAJTo0La8Jnb+vccVTLHNqvJgwm4hZWt2VU2dr9zzyny0_RoOxg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland-protocols: extend to native and fix dependencies
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
X-List-Received-Date: Wed, 27 Sep 2017 12:16:28 -0000
Content-Type: multipart/alternative; boundary="f403045d9e42ef3263055a2ac248"

--f403045d9e42ef3263055a2ac248
Content-Type: text/plain; charset="UTF-8"

On 27 September 2017 at 13:13, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Wed, Sep 27, 2017 at 9:01 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 23 September 2017 at 00:52, Saul Wold <sgw@linux.intel.com> wrote:
> >>
> >> When trying to build a newer version of Mesa, a native version of
> >> wayland-protocols is needed to build.
> >
> >
> > Why does meta-target need wayland-protocols-native?
> >
> >>
> >> +DEPENDS = "wayland"
> >
> >
> > So how does wayland-protocols build now?  What was breaking?
>
> Many host machines provides it; make sure to test in a host without it
> installed.
>

My machine has a few wayland libraries installed, but no headers or
anything else relevant.

Ross

--f403045d9e42ef3263055a2ac248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 September 2017 at 13:13, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Wed, Sep 27, 2017 at 9:01 AM, Burton, Ross &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 23 September 2017 at 00:52, Saul Wold &lt;<a href=3D"mailto:sgw@lin=
ux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; When trying to build a newer version of Mesa, a native version of<=
br>
&gt;&gt; wayland-protocols is needed to build.<br>
&gt;<br>
&gt;<br>
&gt; Why does meta-target need wayland-protocols-native?<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +DEPENDS =3D &quot;wayland&quot;<br>
&gt;<br>
&gt;<br>
&gt; So how does wayland-protocols build now?=C2=A0 What was breaking?<br>
<br>
</span>Many host machines provides it; make sure to test in a host without =
it<br>
installed.<br></blockquote><div><br></div><div>My machine has a few wayland=
 libraries installed, but no headers or anything else relevant.</div><div><=
br></div><div>Ross=C2=A0</div></div></div></div>

--f403045d9e42ef3263055a2ac248--
