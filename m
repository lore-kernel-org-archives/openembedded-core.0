Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id B4CFB62133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 18:18:09 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id c47so72059709qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R8LaVpyEDB06vVqBjehhHudqvnDdaDGbOLB/Zb6bkhs=;
	b=1Kfm9+MOyH840kSOnX7Izq49t9z9IsE4L/N9WqhRwTBgIHK+omLVHfr4QNtaw0Y+Dy
	CprBu3XF0jYuPM7UcEnIJhBLmW7f/sN2QP2E5LXII1yW5aTKzEo2pzTvxC3hPu2GOtlg
	2L9PunQPTgT9k/WjqJFvFE1byjAM0YkWzNAOfy50h3paKHJTk3Go1/rSsnFU9bkF4MVt
	cKAGbOlfbKwP3nEf0Skf2HHc6GV4gjELaWVyZRrOIdLtNzrmovdAQsn2FROjTeMAFLKG
	/gJcFIrj8bbpFHYXY4ECXa+cIkhwbi1qU21iuPBnGYRHOuOo2yZOTORiwZcOv95Fk2z8
	m7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R8LaVpyEDB06vVqBjehhHudqvnDdaDGbOLB/Zb6bkhs=;
	b=GdNGMASZwnf004ga/AACJu7bNl0+ezgFP1fJnvJOhrrOhdd27xpPtb7i5ekovhDxKm
	KlSW3IDvI/Bpruc5a5gLCM5+o7tv9OETT5/x56/desFkAwn2Xnokz1oLp3fIdwAdWgly
	WYHjZhKfqsXeaYGa7cmjoIo3hoVj682mr3TdYqgMrnp9Cfrdgw2AVixRZJWyzZhQxJ66
	yD+HwFLCa5CtDEorDOavzxKa/3irtJiZFZ1mSIqN3JFUw3rO8ZifBfC1m5YAJfgNBmf8
	n+XmVGeNW/6cED50DH8pt0A4e2jn15pv+sDZd5JeAxoGL6WtbJwhNOn2efX52qspSRBY
	8FJQ==
X-Gm-Message-State: AKaTC03oQ/hoxoZiGwY8Y5rY4eOt9e+9XAICT0Z7oM5sDbyUFBBkDaR+T+RCisM+kkBH3FV5LhL9YgH91VTABV92
X-Received: by 10.237.49.230 with SMTP id 93mr7904177qth.109.1480097890536;
	Fri, 25 Nov 2016 10:18:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 25 Nov 2016 10:17:50 -0800 (PST)
In-Reply-To: <20161124104959.32350-1-freesilicon@gmail.com>
References: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
	<20161124104959.32350-1-freesilicon@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Nov 2016 18:17:50 +0000
Message-ID: <CAJTo0LaJZesXW8ytS+nkVh2Sa1JGKzMsSN=MPvoqMQz5sezyAQ@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 25 Nov 2016 18:18:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e2ffa277054224246a

--94eb2c1251e2ffa277054224246a
Content-Type: text/plain; charset=UTF-8

On 24 November 2016 at 10:49, David Vincent <freesilicon@gmail.com> wrote:

> -        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm',
> '/var/lib/smart'])
> +        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir,
> '/var/lib/smart'])
>

Can we extend the un-hardcoding so this uses ${localstatedir}/lib/smart,
and rpmlibdir also uses ${localstatedir}?

Also current master lets you not bother passing True to d.getVar() as that
is the default now.

Ross

--94eb2c1251e2ffa277054224246a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 November 2016 at 10:49, David Vincent <span dir=3D"ltr">&lt;<a href=
=3D"mailto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">-=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc/<wbr>rpm&#39;=
, &#39;/var/lib/rpm&#39;, &#39;/var/lib/smart&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc/<wbr>rpm&#39=
;, rpm_libdir, &#39;/var/lib/smart&#39;])<br></span></blockquote></div><br>=
</div><div class=3D"gmail_extra">Can we extend the un-hardcoding so this us=
es ${localstatedir}/lib/smart, and rpmlibdir also uses ${localstatedir}?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also cur=
rent master lets you not bother passing True to d.getVar() as that is the d=
efault now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--94eb2c1251e2ffa277054224246a--
