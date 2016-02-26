Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id BADF7770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 20:59:13 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id y8so43801269igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 12:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9vM3H/KBU22OrgWucuW00lvaX2DbWnSX7hToXMj/nBI=;
	b=2M+nDdPpTX/ZJGJT/VFXu3EavEaSunTH6OAJoWC13X/Ubgoz2PaZeVUws2g9QaF0Mt
	qsCdN5Z07ialxeoi7k/yjg3N8qFLuC51KnPmT22YQxSsO3SQpv/Kw+38AYwEagnoeZ0J
	OuhNnIaOs4KZNU/tV9VDrOQZV78TK4T8ZAwQsYmoqjJQpGBB9xePxSDgKWfGwemV0Q+Z
	wpROY+CU1ZZkoife5D8tD5h/3nys9kpd0jE9A8JuuwpcNnR4IGhA+WgdRR23v+dyUAiv
	m3iiWwYQ29VaGqrTjSsv7twOx12qB67z+pv4wamjS8rbVVJuf0pnuHpd68OB30yGifP/
	YCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9vM3H/KBU22OrgWucuW00lvaX2DbWnSX7hToXMj/nBI=;
	b=IdJE72ehWdK8ks2lakX8AhPkGfqo3wWTAw2XzCdKGTtpDPKGmB564X9IEIYSN/pcjL
	69dtG2Ow/zRaFPPPRJWikexU83U4E0KjEJ/lvbXO3Ug5C/xwiFl5fCfQPGzah1rukv6g
	flKpD3R/EcU05Bo5EU11EoYcjCn5E8GgEz2Ci0WlEO22QKoBf3Kdb8sL1V7gC3DvXWnv
	IOU8YVVzPngh4/2JdRAqTyu91LQVIYfWUJRV13o6TVE/hN96JVfOz5Rz4XECMYysld1I
	QJAywxli0Xh09hYIAAIjYlgID5iS3SOVQFoubbkLyUMhl8auXZjnjkcoAGMmiRD0n1Eo
	eE/Q==
X-Gm-Message-State: AD7BkJJYXBLmQnGjvZ3Qp6OLzczlArm+9YaGp2HWZUjTEZu8PFGufQOzQrmrunpa1ajn7cWkGqaO3O5I5qnFeeOz
X-Received: by 10.50.126.8 with SMTP id mu8mr4537756igb.52.1456520354243; Fri,
	26 Feb 2016 12:59:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 12:58:54 -0800 (PST)
In-Reply-To: <56D0B298.9050108@balister.org>
References: <1456508168.11498.95.camel@linuxfoundation.org>
	<56D09D35.8040002@balister.org>
	<1456512644.11498.108.camel@linuxfoundation.org>
	<2042150.gN3rpHrprf@rjs-zotac.streifs.net>
	<56D0B298.9050108@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 20:58:54 +0000
Message-ID: <CAJTo0LbNVZ9k5P+ugk-kg4_PBG0P8nbkJpBHjkv2XqvJrjsdyA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Rudolf J Streif <rudolf.streif@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Yocto Project Status WW09
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
X-List-Received-Date: Fri, 26 Feb 2016 20:59:13 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf52fd62052cb292b4

--047d7b1635bf52fd62052cb292b4
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 20:16, Philip Balister <philip@balister.org> wrote:

> I must admit, I'm surprised this is tricky. I look forward to seeing
> what needs doing. Hopefully, it shows me things I can avoid in my work.
>

The moral of the story is don't rename layers if you want to maintain a
semblance of migration.  Renaming meta-yocto to meta-poky means the
bblayers.conf is invalid, so the migration code can't run because bitbake
aborts too early.

Ross

--047d7b1635bf52fd62052cb292b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2016 at 20:16, Philip Balister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1o9" class=
=3D"a3s" style=3D"overflow:hidden">I must admit, I&#39;m surprised this is =
tricky. I look forward to seeing<br>
what needs doing. Hopefully, it shows me things I can avoid in my work.<br>=
</div></blockquote></div><br>The moral of the story is don&#39;t rename lay=
ers if you want to maintain a semblance of migration.=C2=A0 Renaming meta-y=
octo to meta-poky means the bblayers.conf is invalid, so the migration code=
 can&#39;t run because bitbake aborts too early.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bf52fd62052cb292b4--
