Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id B1A0471A14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:05:50 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s140so32521307qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2rfn+M+CkfQ+2C5E/8AJSLl6pk2NOs/uw5jdbyl8HrQ=;
	b=EkYAkUzNvxEuUwbKOmQnGld8Jox+k3Ogg/y7sop16P125y8RXheL9iOPTEXA8hpOcI
	6CafENsjFb6jLtLVj7FUIfuuTIMKvtQ3qYc92TOww9t28zmZ0dWcSX5eSGjKKKDnTuub
	YU8kYBVdLu8xy1C7bF7FB6D3E2s/onJsQL7jux1tgDmaqfNazMFp/wBgkMvaAJtev2+4
	fzXmD9uoQt6eDw//u+1Qx9z9aknBrlldcBTWywSgtr+xNcNqdQ1KDxP5AWDFP+qEhI0Y
	bptQHrjviYd0o/YKkblh+lI2Y7wDwxy3OVFF3DxLaarJaK8wFVELHdlMmdHFSQQOS830
	bC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2rfn+M+CkfQ+2C5E/8AJSLl6pk2NOs/uw5jdbyl8HrQ=;
	b=O03/4UAJ0YuzoVc1MnOL6n6HuztEzOCvhOfAVnHOTyBFZHCd8973UJzgzHpt541rqN
	V+cKHzpUAFj8hhrMUX6wKlVZp87rHfIYnm/20jCYvUo+C6HCVfHQGu3ioM81Uy6jFHG9
	gDXDjfZ8xdVFNaKCk+cUu7Qvy1aAIspbJgivbzBzPpw/1jQPCzjmaa6vIjb/KkTQpmjP
	ux9dIC8gBOdn/DLIwKMd/X+cU+JNaDJkq0VW4+gFr2mTeebCYXO0r5XrZ+XRrkYbEKYe
	L1sbC9FK+KqBNAhSfYX5/zdj3rXdP+1KO0cYoxOx9k1syI+5JRTsh2g0wLu6RbureewB
	weRQ==
X-Gm-Message-State: AMke39kD2SPOCbyNnkDeiSbDE89EzpTeCjZ208fgeaZ774irfjZtmzln0LwGbEOvHA/gcRkgeSKc1nGrrgdGAJNI
X-Received: by 10.55.1.134 with SMTP id u6mr8423893qkg.36.1486717550903; Fri,
	10 Feb 2017 01:05:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 10 Feb 2017 01:05:30 -0800 (PST)
In-Reply-To: <20170210045853.9043-1-raj.khem@gmail.com>
References: <20170210045853.9043-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Feb 2017 09:05:30 +0000
Message-ID: <CAJTo0LavCSR6139KU4X-EnFEcWqk30PbtcmLJUo26X8WWGdpBA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Inherit pythonnative
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
X-List-Received-Date: Fri, 10 Feb 2017 09:05:52 -0000
Content-Type: multipart/alternative; boundary=001a114046c480dc020548296784

--001a114046c480dc020548296784
Content-Type: text/plain; charset=UTF-8

On 10 February 2017 at 04:58, Khem Raj <raj.khem@gmail.com> wrote:

> On buildhosts where default python has switched to using python3
> qemu-native fails configure like this
>
> | ERROR: Cannot use 'python', Python 2.6 or later is required.
> |        Note that Python 3 or later is not yet supported.
> |        Use --python=/path/to/python to specify a supported Python.
>

Build hosts where /usr/bin/python is Python3 are Doing It Wrong, and Python
upstream says don't do that.

Many other recipes depend on /usr/bin/python existing, so I'm not sure we
want to start building our own Python so early in the build just yet,
especially as we're trying to move away from Py2.  Can we not just list
python2 as a host dependency (to be honest, I thought it already was).

Ross

--001a114046c480dc020548296784
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2017 at 04:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":6db" class=3D"a3s aXj=
CH m15a2664c2e4d19e5">On buildhosts where default python has switched to us=
ing python3<br>
qemu-native fails configure like this<br>
<br>
| ERROR: Cannot use &#39;python&#39;, Python 2.6 or later is required.<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that Python 3 or later is not yet support=
ed.<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use --python=3D/path/to/python to specify a su=
pported Python.</div></blockquote></div><br>Build hosts where /usr/bin/pyth=
on is Python3 are Doing It Wrong, and Python upstream says don&#39;t do tha=
t.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Man=
y other recipes depend on /usr/bin/python existing, so I&#39;m not sure we =
want to start building our own Python so early in the build just yet, espec=
ially as we&#39;re trying to move away from Py2.=C2=A0 Can we not just list=
 python2 as a host dependency (to be honest, I thought it already was).</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a114046c480dc020548296784--
