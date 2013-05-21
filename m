Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 145166148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:52:45 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e15so260762vbg.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=DQ8HrHkrAsxmXm6S0Jju4s2y+MsMN0xWvSh+Dwq9j8k=;
	b=p2UhitBTWQtcBgTkIfyDtiAVDLNHYawmh0JERRHsbHTmxnDbdAq0HCRB5CbxrnL6My
	g2627+PTtxSK6/ZYoHU71DSj8wR0JlrySO3YSz5lhZjVTZV+p0cFlHgpBIEgMgLPAUha
	o4SqbNiVJfq0UDOqj9f6nWNCheehvxWAjvsN32S9NwD9dgole+5w+7OSQGgvcs4ly99D
	w9LFx2uspshhd1IIOFWG7EAdqCQx1m5lCfj0Z6VDd2Q88s/RvsTkwxW6fBm2LbABAfUb
	q1Qroff/TfPwL2qVefcypugqz8Yyqmbz+S+pE5iPdN86AjK9STf7TNHfLfuNXsL3SzLP
	Ne4g==
MIME-Version: 1.0
X-Received: by 10.52.117.212 with SMTP id kg20mr500152vdb.55.1369129966617;
	Tue, 21 May 2013 02:52:46 -0700 (PDT)
Received: by 10.220.98.7 with HTTP; Tue, 21 May 2013 02:52:46 -0700 (PDT)
In-Reply-To: <1369062325-30335-3-git-send-email-tf+lists.yocto@r-finger.com>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369062325-30335-3-git-send-email-tf+lists.yocto@r-finger.com>
Date: Tue, 21 May 2013 10:52:46 +0100
Message-ID: <CAJTo0LbAWWZNLAD4mBGa2xjFX9hJxhHTSRk0d40sSbOfm=EkBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQkNxGfk4GT7DuqxSe6XqovsXXXEmyZk+nHTPhlRlkYAr8GmU9iy7g7o5A5upul5yMzjShy/
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/8] clutter.bbclass: helper class for clutter and friends
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
X-List-Received-Date: Tue, 21 May 2013 09:52:46 -0000
Content-Type: multipart/alternative; boundary=bcaec547c9714fda1204dd3769c0

--bcaec547c9714fda1204dd3769c0
Content-Type: text/plain; charset=UTF-8

Hi Tomas,

On Monday, 20 May 2013, Tomas Frydrych wrote:

> +def get_minor_dir(v):
> +    import re
> +    m = re.match("^([0-9]+)\.([0-9]+)", v)
> +    return "%s.%s" % (m.group(1), m.group(2))
>
>
Just an observation not a critic, but I'd love to see these centralised,
we've got the same logic duplicated all over the place now.

+def get_fpu_setting(bb, d):
> +    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
> +        return "--without-fpu"
> +    return ""
>
> This option isn't used by Clutter or cogl anymore, so you can drop this
function.

Ross

--bcaec547c9714fda1204dd3769c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tomas,<br><br>On Monday, 20 May 2013, Tomas Frydrych  wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">+def get_minor_dir(v):<br>
+ =C2=A0 =C2=A0import re<br>
+ =C2=A0 =C2=A0m =3D re.match(&quot;^([0-9]+)\.([0-9]+)&quot;, v)<br>
+ =C2=A0 =C2=A0return &quot;%s.%s&quot; % (m.group(1), m.group(2))<br><br><=
/blockquote><div><br></div><div>Just an observation not a critic, but I&#39=
;d love to see these centralised, we&#39;ve got the same logic duplicated a=
ll over the place now.</div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">+def get_fpu_setting(bb, d):<=
br>
+ =C2=A0 =C2=A0if d.getVar(&#39;TARGET_FPU&#39;, True) in [ &#39;soft&#39; =
]:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;--without-fpu&quot;<br>
+ =C2=A0 =C2=A0return &quot;&quot;<br><br></blockquote><div>This option isn=
&#39;t used by Clutter or cogl anymore, so you can drop this function.</div=
><div><br></div><div>Ross</div>

--bcaec547c9714fda1204dd3769c0--
