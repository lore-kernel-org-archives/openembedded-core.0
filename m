Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7112B6A3ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:44:25 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so4462393pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=X5V+jRdaw3FsiDVb6YVcRtfw4mu4zS117o9Y/epZh/w=;
	b=pPze1qjUPYN3jbOlbSw4reZf9tR8hevGE0Kf3MqlCr/lNC/L3mjmAdgB6+fKOVL+mU
	FPftH4aQ9DX+ltJWwEWonhyuaA8rinNfMdhJX2hHR9aETKFZOifKXBho9wuI5bf59rdM
	yC/YsChV4Q2J3D/oxkWRYn9xnavAv1M87wZj7r/NEpKPm1j14OoxkLLfiOuNngZdzyzT
	YNNm2I/ZCYC+xFKaw0YhK9k1sU3ofZ59pwnO1mUymp0YJSwYvmaUbHpqGigiHxaJEMbZ
	prq4wO6r6wUW6Glu5WB6yZmsZSXqKZV52kr9vAxtlLRknD/XXe8h3OAr9xyJGVcL2bLj
	k2fA==
MIME-Version: 1.0
X-Received: by 10.68.2.165 with SMTP id 5mr2567026pbv.105.1375094666403; Mon,
	29 Jul 2013 03:44:26 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:44:26 -0700 (PDT)
In-Reply-To: <CAJTo0LazaFL14=WbXSM4CnF0y=25VLt7m4cP9nU4B7Qs2kXEnQ@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAJTo0LazaFL14=WbXSM4CnF0y=25VLt7m4cP9nU4B7Qs2kXEnQ@mail.gmail.com>
Date: Mon, 29 Jul 2013 11:44:26 +0100
X-Google-Sender-Auth: 8v_Ylw41bhsLAgrQ7Z56E5i3RaA
Message-ID: <CAOMwXhPMi6cG858ZX9r+c310hdvGMRbNKLYEadyr0e9GVUuTqw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn/UvbjN7RitgpVAgubirL7ff0Z0cXM9Z1yzQ3VmuHZQIY+GviCGWHHVHuoXgO5ZntODbDg
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:44:25 -0000
Content-Type: multipart/alternative; boundary=bcaec5215afb1fb41b04e2a42d68

--bcaec5215afb1fb41b04e2a42d68
Content-Type: text/plain; charset=ISO-8859-1

OK, I give up the contribution. I really cannot collaborate with people who
think it is acceptable to break *many* users' life for the whole project
without being able to use anything in favor of a very limited (!) people
with only two (!) applications.


On Mon, Jul 29, 2013 at 11:42 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 29 July 2013 11:20, Phil Blundell <pb@pbcl.net> wrote:
> > But in this particular case, your new patch seems to have more serious
> > problems since it will cause rfkill to silently disappear for many
> > people who do currently have it.
> >
> > If your distro selects a toolchain which doesn't contain the necessary
> > bits to support rfkill then it seems as though the appropriate course of
> > action would be to either:
>
> I'm in agreement  with Phil. Whilst support for userspaces that from
> 2009 is patchy at best with modern software (you'll need an equally
> old udev, systemd won't happen, etc) this is a trivial change but
> let's be clear that it's an option to handle older external userspaces
> and not our so there should be a PACKAGECONFIG for rfkill that
> defaults to enabled.
>
> Ross
>

--bcaec5215afb1fb41b04e2a42d68
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I give up the contribution. I really cannot collaborat=
e with people who think it is acceptable to break *many* users&#39; life fo=
r the whole project without being able to use anything in favor of a very l=
imited (!) people with only two (!) applications.</div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Jul 2=
9, 2013 at 11:42 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 July 2013 11:20, Phi=
l Blundell &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br=
>
&gt; But in this particular case, your new patch seems to have more serious=
<br>
&gt; problems since it will cause rfkill to silently disappear for many<br>
&gt; people who do currently have it.<br>
&gt;<br>
&gt; If your distro selects a toolchain which doesn&#39;t contain the neces=
sary<br>
&gt; bits to support rfkill then it seems as though the appropriate course =
of<br>
&gt; action would be to either:<br>
<br>
</div>I&#39;m in agreement =A0with Phil. Whilst support for userspaces that=
 from<br>
2009 is patchy at best with modern software (you&#39;ll need an equally<br>
old udev, systemd won&#39;t happen, etc) this is a trivial change but<br>
let&#39;s be clear that it&#39;s an option to handle older external userspa=
ces<br>
and not our so there should be a PACKAGECONFIG for rfkill that<br>
defaults to enabled.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--bcaec5215afb1fb41b04e2a42d68--
