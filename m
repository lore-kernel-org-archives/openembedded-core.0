Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 12E18771B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:19:08 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id b35so114375724qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BmglikRfsc0MyJasNb1GfEXSj9rsmRQdlKTVQkj2B6M=;
	b=00RZNKHSZ0hrM9u/SaoS8QTrvWMBFFLYy3xnp6gy3fwQL1Qj5JILP28DX0of3903Nj
	C+r3a0JDAccdzx37CFTwG1ujuaGWVQhrQsynzHtXFt86m1HEKTe2Jdk42tLbGjf2M5fd
	H0LX8XI9FfbEPJ26XY+OfARaKgPK5tH/C1AMoe8pDPFFBpNXmm9A9gNvafq58lXq7gjx
	TV+Y3lnj4AmlC2pLGEH6oyCY+Ia2GdLUiKqoAv5Oqshic7HD/040hSEjQ+zcFdVozX0a
	l0ISmQV6mN/BlfpHldlStmblHgXrliLG1ju2fg0qUJq+t28nGAsztyKQJ+hXekUQL6s1
	IQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=BmglikRfsc0MyJasNb1GfEXSj9rsmRQdlKTVQkj2B6M=;
	b=MwYf/Uqe0xOElLrBz3Eo6tfRl5B4lWrHvaqgSjQ3ThTx7totNs/DPsr0WlvS8jzFbB
	aJZ11zxW7+UO5tS7v2Mmz+YqVUqIu3aYgVyO2cYzRHQp0Bv3Bx2tie6tinjl1+LFpg7+
	JwYXYSFEY+mWFvy0N3dWylft3LYOSR9H165xWnL6RtmVtlEaWygSReNeTDaNJ6I/2cfb
	Hb7PtudlwqiYhm8+b8cQLFRrUW48F2rq1J5qVUxwlWKdhcv7hGfJQKq2JepznmauuhpT
	eBKz/+Ou0e3DRXp4PVGlLDl/HPsVrY7d7K9XepNuP8qD0CijRun5JEpCQvO1VwAoADAp
	IDIQ==
X-Gm-Message-State: AG10YORflw8TjMASZvwm7E0ygDPUQme/TGIc6F3l2NvJmBl2v9SxP42rZayy0C/U/hWSMHF1lsOPcXUTtQ3ZRw==
MIME-Version: 1.0
X-Received: by 10.140.238.8 with SMTP id j8mr37571197qhc.76.1456157949571;
	Mon, 22 Feb 2016 08:19:09 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Mon, 22 Feb 2016 08:19:08 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Mon, 22 Feb 2016 08:19:08 -0800 (PST)
In-Reply-To: <20160222154912.GD6329@jama>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
	<20160222154912.GD6329@jama>
Date: Mon, 22 Feb 2016 08:19:08 -0800
Message-ID: <CAMKF1srkT1+nYhnjdtC15DyfWN-RRrjNbd0k1_gu578kg0XA1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: Upgrade to 2.23
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
X-List-Received-Date: Mon, 22 Feb 2016 16:19:09 -0000
Content-Type: multipart/alternative; boundary=001a1135a2e852382c052c5e315c

--001a1135a2e852382c052c5e315c
Content-Type: text/plain; charset=UTF-8

Can you clone it outside oe
On Feb 22, 2016 7:48 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Sat, Feb 20, 2016 at 08:07:25AM +0000, Khem Raj wrote:
> > Drop kconfig and options-group support
> > Forward port cross-localedef support
> > Assume ssp support in libc when building gcc-initial
>
> Unfortunately sourceware git doesn't like us, glibc is failing to fetch :/
>
> ERROR: glibc-initial-2.23-r0 do_fetch: Fetcher failure: Fetch command
> failed with exit code 128, output:
> fatal: read error: Connection reset by peer
>
> ERROR: glibc-initial-2.23-r0 do_fetch: Function failed: Fetcher failure
> for URL:
> 'git://sourceware.org/git/glibc.git;branch=release/2.23/master;name=glibc
> '.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
>
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/glibc-initial/2.23-r0/temp/log.do_fetch.31233
> NOTE: recipe glibc-initial-2.23-r0: task do_fetch: Failed
>

--001a1135a2e852382c052c5e315c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Can you clone it outside oe</p>
<div class=3D"gmail_quote">On Feb 22, 2016 7:48 AM, &quot;Martin Jansa&quot=
; &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, =
Feb 20, 2016 at 08:07:25AM +0000, Khem Raj wrote:<br>
&gt; Drop kconfig and options-group support<br>
&gt; Forward port cross-localedef support<br>
&gt; Assume ssp support in libc when building gcc-initial<br>
<br>
Unfortunately sourceware git doesn&#39;t like us, glibc is failing to fetch=
 :/<br>
<br>
ERROR: glibc-initial-2.23-r0 do_fetch: Fetcher failure: Fetch command<br>
failed with exit code 128, output:<br>
fatal: read error: Connection reset by peer<br>
<br>
ERROR: glibc-initial-2.23-r0 do_fetch: Function failed: Fetcher failure<br>
for URL:<br>
&#39;git://<a href=3D"http://sourceware.org/git/glibc.git;branch=3Drelease/=
2.23/master;name=3Dglibc" rel=3D"noreferrer" target=3D"_blank">sourceware.o=
rg/git/glibc.git;branch=3Drelease/2.23/master;name=3Dglibc</a>&#39;.<br>
Unable to fetch URL from any source.<br>
ERROR: Logfile of failure stored in:<br>
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/glib=
c-initial/2.23-r0/temp/log.do_fetch.31233<br>
NOTE: recipe glibc-initial-2.23-r0: task do_fetch: Failed<br>
</blockquote></div>

--001a1135a2e852382c052c5e315c--
