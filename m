Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id CF9CB77EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 18:33:55 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id w94so11336446ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z0Lb4GDiul+p4uNmM0TYtvBACzSSjndpDavLxA+0n3g=;
	b=YgON4T8F+gaZOtocth4XKXtdnSajXPJtYFf5bhp5MzSkx8N+ivRc+ifXs1nTTxVbVM
	HBkIPDM9VlcC0dtE4iK6BP4nR+gqjDMSQrvJj48g05zY+rwqENLgVnph2mf1Ew8PBuIx
	JJb4hCspASSdWCbaVzCkIvfmPVm0DwKEoGPa0T0hG/GaSi2bozYABkURjOCK9VCFCOYw
	x9Geq+Dlyoid0GyZLQsME/vTAI2LwB9mfN6Cz94gp4OY0TJGljRrIxN6o/Hvqt+BWcI8
	x1rHNKDwRH83vWJv5bQR9E+TPIttXIb7YDwn7a8kPZA6JO+YVjUxTpoayZUkTy45cwDe
	4EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z0Lb4GDiul+p4uNmM0TYtvBACzSSjndpDavLxA+0n3g=;
	b=SlnAW+5vXUkj1SORPtj4TpanGBy+EP3e28LFcGvN534fm4or6EbHYFXr20utSgJj4Y
	Knfl7qrk3jtB2DlmX7KmMT44qRtpBsSpsrD9OkuKgwoGwp5wZbSa9mCkhUg/vSfOzesy
	3EgvJvZEcPcVkq/3+6KL41wrk76b9FxDzPj3XDpWPc9Ue60A2lQGI5xls3wmrQyoQdcH
	bHJCHIXjmYgn0DhDV4D+aMzZgU6jRrw/5a1l88unn9uLebkKS8eYaUkF1we2qRzXl1FR
	qnSjwdS1e6u6yFK9tzoBC3p6XfegqWmGDnhiQ4VsPpHCRayDv/DIgrNutroNB+RDvAXb
	w/Pg==
X-Gm-Message-State: AHPjjUhe90VPZQJT16EaTNzmfVjCflNT+aKO7BjJmWXNWeZh1TUXXZVc
	VcbyKEjnso7iCoc3m8HpPbwtVOy+wrb9hotuESkaOA==
X-Google-Smtp-Source: AOwi7QDooLMkgjXD6okdUuiG962MGf0DR1/gqVCRrAfhTSvg3IaaboFgqtG+ol9hPMx0VfPmBsvdqI3MYdQsMysSvN8=
X-Received: by 10.107.41.135 with SMTP id p129mr32707376iop.142.1507142036943; 
	Wed, 04 Oct 2017 11:33:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 11:33:36 -0700 (PDT)
In-Reply-To: <6D4566C9E07A8D4DAB6F935696920A842450D831@ATVIES991UAMSX.ww300.siemens.net>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
	<bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
	<CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
	<ba1bbc29-6515-e99f-be98-921ccd96c614@siemens.com>
	<CAJTo0LaHrM7r1S4=Qp5AXZMwrH5Qd4Vcn2O5Z2QnDW9Q24wPrw@mail.gmail.com>
	<6D4566C9E07A8D4DAB6F935696920A842450D831@ATVIES991UAMSX.ww300.siemens.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 19:33:36 +0100
Message-ID: <CAJTo0LZr=YGp5ArRhyGrje7fNuR7nei0byOURGmg+5nYycuKuw@mail.gmail.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 18:33:57 -0000
Content-Type: multipart/alternative; boundary="001a1141f226bd6798055abcd9e7"

--001a1141f226bd6798055abcd9e7
Content-Type: text/plain; charset="UTF-8"

The meta-poky bbappend only manipulates poky-tiny, which I'm not using.

Ross

On 4 October 2017 at 19:31, Marko, Peter <Peter.Marko@siemens.com> wrote:

> Can be that You're using old defconfig from different layer (e.g.
> meta-poky) via bbappend?
> Peter
>
> On 10/04/2017 06:13 PM, Burton, Ross wrote:
> > On 4 October 2017 at 12:56, Andrej Valek <andrej.valek@siemens.com
> > <mailto:andrej.valek@siemens.com>> wrote:
> >
> >     I have unpacked the rpm package over command "rpm -qp --scripts
> >     busybox-1.27.2-r0.i586.rpm" and links to /bin/sh looks good for me.
> >
> >     update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50
> >
> >
> > I wiped tmp and rebuild busybox and it's still linking to busybox.suid
> here.
> > Annoyingly I asked Joshua to replicate and he confirmed your
> busybox.nosuid link.
> >
> > Argh! :(
> >
> > Ross
>
>

--001a1141f226bd6798055abcd9e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The meta-poky bbappend only manipulates poky-tiny, which I=
&#39;m not using.<div><br></div><div>Ross</div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 4 October 2017 at 19:31, Marko, Pete=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=
=3D"_blank">Peter.Marko@siemens.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Can be that You&#39;re using old defconfig from different =
layer (e.g. meta-poky) via bbappend?<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Peter<br>
</font></span><span class=3D"im HOEnZb"><br>
On 10/04/2017 06:13 PM, Burton, Ross wrote:<br>
</span><span class=3D"im HOEnZb">&gt; On 4 October 2017 at 12:56, Andrej Va=
lek &lt;<a href=3D"mailto:andrej.valek@siemens.com">andrej.valek@siemens.co=
m</a><br>
</span><div class=3D"HOEnZb"><div class=3D"h5">&gt; &lt;mailto:<a href=3D"m=
ailto:andrej.valek@siemens.com">andrej.valek@siemens.<wbr>com</a>&gt;&gt; w=
rote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I have unpacked the rpm package over command &quot;=
rpm -qp --scripts<br>
&gt;=C2=A0 =C2=A0 =C2=A0busybox-1.27.2-r0.i586.rpm&quot; and links to /bin/=
sh looks good for me.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0update-alternatives --install /bin/sh sh /bin/busyb=
ox.nosuid 50<br>
&gt;<br>
&gt;<br>
&gt; I wiped tmp and rebuild busybox and it&#39;s still linking to busybox.=
suid here.<br>
&gt; Annoyingly I asked Joshua to replicate and he confirmed your busybox.n=
osuid link.<br>
&gt;<br>
&gt; Argh! :(<br>
&gt;<br>
&gt; Ross<br>
<br>
</div></div></blockquote></div><br></div>

--001a1141f226bd6798055abcd9e7--
