Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB7977DAF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:37:20 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c184so24763002lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 08:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=uJLIzsx4ezVWiukd3kFATSD0OjOPlSas6wUeefClVpU=;
	b=T0xI9XWsZ6dOzDsxkd0QbaSx03AbzfTRXiAUtFxWNIHyNO6h9RMN0agR7NU07JFaMn
	YUPU3Zs3inbpSB5G7wDL0N+ooWkxD7xiHAhPlTaWaNAXrZ2fZ5hnC3+NLmpbr/Hba0im
	MgJnZTaWxskYEG+C4xR1yijLYHemqLxgKn4iC8g98Irwp89oiA2BvbxX7cIXOgzc12vd
	RnL3gX0u7T4fcWik1SYZOcvoWAYOkoIzoGKuhTEKkP7RtnhvC21Bw8bhpWDx62TQDpEc
	6ECk45xjGsxjaT5y83HQLQm+pXG6z0R+lMgvT/JukJb//HsxMV5KaoTWin/LQtVYuU0e
	1x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=uJLIzsx4ezVWiukd3kFATSD0OjOPlSas6wUeefClVpU=;
	b=D+EPHSA3pYHQadmwjVNUtPszTlLasbHEWhfjXfa4mhtVX6YG3moiPW/ArDK3GcM/h4
	6I9GSHzJEx1tSdo6+FzWl8RvIyIy+Kn7uS8fEDOv1tvVIzWZSa7QF4Ms0Jjd/kcjJRAK
	sLfCSlQSd/qK/vLDsr/4k2zlfZqyxjUD60Wl0UQQ1d8ZD8YJVWzF+gbpV7RtsWOxv5Hr
	g0+NrN+W5eXa9hBic3A7ThmulNI9E/UAp26wi0CLWP3xJa7ekQQJEpg8PQiAWn39MJoo
	0CYm/xLbIplMGx8+gRko/rq5cy8YKIT13kVWJmGANn2WYO8QavKuX1/8s4MTzo5Of3Yr
	GoXA==
X-Gm-Message-State: AODbwcA/ROj1fBnhLVBF8MTgTjClgaDoHAe693Mu8eSthSEbpkeKUhY8
	elUihgMuDCCMv7CCM7G4WAUg1H9N/w==
X-Received: by 10.80.137.56 with SMTP id e53mr2323538ede.67.1496331441068;
	Thu, 01 Jun 2017 08:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
	<12b1e915-31c9-3258-1013-46854abb78ae@windriver.com>
	<f960d84e-0372-07f1-22f9-0768f5792f8b@linux.intel.com>
In-Reply-To: <f960d84e-0372-07f1-22f9-0768f5792f8b@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 01 Jun 2017 15:37:09 +0000
Message-ID: <CAMKF1spOiMc6rT4MBN5zx8LfqnpZAHVCGHWbarjy7YaS+rWLuA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Mark Hatle <mark.hatle@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: AS_NEEDED and rpm4
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
X-List-Received-Date: Thu, 01 Jun 2017 15:37:21 -0000
Content-Type: multipart/alternative; boundary="f403045c283e02e12c0550e7d046"

--f403045c283e02e12c0550e7d046
Content-Type: text/plain; charset="UTF-8"

I don't use rpm so I won't be able to test it
It just occurred to me when I was looking into that file for pulse audio
which should be removed as well I have patch for that I will send shortly
On Thu, Jun 1, 2017 at 1:54 AM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 06/01/2017 05:06 AM, Mark Hatle wrote:
>
> >> We added entry for disabling AS_NEEDED for rpm5, now that  we have move
> to rpm4
> >> is that entry sitll required in "conf/distro/include/as-needed.inc"
> >
> > Unknown, I hadn't realized this was done.  Should be easy to clear it
> and see if
> > everything is still working.
>
> Yes. That's why I really don't like those global include files that
> change flags behind recipes' back - any exceptions to default settings
> are very easy to miss and they really belong in recipes themselves. You
> are welcome to try and submit a patch.
>
> Alex
>
>

--f403045c283e02e12c0550e7d046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I don&#39;t use rpm so I won&#39;t be able to test it</div><div>It jus=
t occurred to me when I was looking into that file for pulse audio which sh=
ould be removed as well I have patch for that I will send shortly=C2=A0<br>=
<div class=3D"gmail_quote"><div>On Thu, Jun 1, 2017 at 1:54 AM Alexander Ka=
navin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.ka=
navin@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On 06/01/2017 05:06 AM, Mark Hatle wrote:<br>
<br>
&gt;&gt; We added entry for disabling AS_NEEDED for rpm5, now that=C2=A0 we=
 have move to rpm4<br>
&gt;&gt; is that entry sitll required in &quot;conf/distro/include/as-neede=
d.inc&quot;<br>
&gt;<br>
&gt; Unknown, I hadn&#39;t realized this was done.=C2=A0 Should be easy to =
clear it and see if<br>
&gt; everything is still working.<br>
<br>
Yes. That&#39;s why I really don&#39;t like those global include files that=
<br>
change flags behind recipes&#39; back - any exceptions to default settings<=
br>
are very easy to miss and they really belong in recipes themselves. You<br>
are welcome to try and submit a patch.<br>
<br>
Alex<br>
<br>
</blockquote></div></div>

--f403045c283e02e12c0550e7d046--
