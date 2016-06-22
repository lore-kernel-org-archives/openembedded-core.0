Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id EAB90731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:45:46 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id a5so101716645ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=35PhtsbNJEXfF3OCl2RBSRhUHoGYFSY62oLnjZoVOno=;
	b=JrOfNgtVjJjxLIBB8JbroAnLQ2dWRI1rVEQ5m4xW1rio6ExcjZyBE3nCqnqLrc6KSn
	TTS9cC+RD03ChRtq5p80vktKjRQfO7uZiT0y7jzXxMekqNzJ8yIWGJ67Dg2RaFlq/fiz
	/8J7eYVJZKWZwDATWid1sAgazEILbWo+o3acw+T9UsiElCtUdr4jXAHGkfMJDLtuVaCS
	7GQGR4qnPDJklIDh8C0uW4RkXgABqr6Ciiwisl3D9VBPikzxt/vMRhMleL5bFcZuFlKw
	8GxLOtSAtb1FtCibz5Wh0qVCqbF+sOSS9u6ceHxZ1jJzfM2cz9Uc2nNEd1PxZhGyDCwj
	ssbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=35PhtsbNJEXfF3OCl2RBSRhUHoGYFSY62oLnjZoVOno=;
	b=LI+0ACxasDRm4a5AERvgJpGgq3Kdr5OUu6oMRT2e9aBm9V/9VRlpH+Xm7Mty4u+vEY
	qRPhsQOsoz9qTu8CngLuZoFjB1ugEsldggAkDwA/zYaXi0HCTRezeJ4Urdw+H/k+k/RQ
	TJCQ8UBxqLh0KPTFsMCC6NgG0rFqkJ02pRSFJ3M4JwfwBVh45J90Fqb39WRykg9PkXQf
	4NZQG0UsitQ1RNYSHyIzmvSyhasWX6NfszYlyB3XwtgXYOwP59JAOowPI5wrVu+27zZm
	QSfL0FVywhoisPOBoP0UNkHbIsfGe3ISl5yHC5wQ1hmVayEtnOOENs2D9EzXIVUkNiaw
	426A==
X-Gm-Message-State: ALyK8tLZjXl8k2yUN/bFCTx4DV4efo15GpW/G/fjVNuhFBzSpcC+TqThlt3c8m3FBMq5zNaqejRIpC6PuxswgYnZ
X-Received: by 10.36.57.211 with SMTP id l202mr15035771ita.22.1466606747335;
	Wed, 22 Jun 2016 07:45:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 22 Jun 2016 07:45:27 -0700 (PDT)
In-Reply-To: <20160622144241.GA4153@jama>
References: <1466503279-28937-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20160622144241.GA4153@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jun 2016 15:45:27 +0100
Message-ID: <CAJTo0Lar56vj6VOo097yhbTMtAx78PsS7kU3Yeh_7xb-XpBy0g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: remove the extra dot from the recipe filename
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
X-List-Received-Date: Wed, 22 Jun 2016 14:45:47 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca33664b0535defe7f

--001a114ab3ca33664b0535defe7f
Content-Type: text/plain; charset=UTF-8

On 22 June 2016 at 15:42, Martin Jansa <martin.jansa@gmail.com> wrote:

> WARNING: e2fsprogs-1.43-r0 do_packagedata: QA Issue: Package version for
> package e2fsprogs-locale-uk went backwards which would break package feeds
> from (0:1.43.-r0.1 to 0:1.43-r0.0) [version-going-backwards]
>

Have you checked what opkg/rpm actually think about this?  Maybe the sanity
test is broken.

Ross

--001a114ab3ca33664b0535defe7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 June 2016 at 15:42, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4rf" class=3D=
"a3s aXjCH m1557890b56a23db4">WARNING: e2fsprogs-1.43-r0 do_packagedata: QA=
 Issue: Package version for package e2fsprogs-locale-uk went backwards whic=
h would break package feeds from (0:1.43.-r0.1 to 0:1.43-r0.0) [version-goi=
ng-backwards]<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Have you checked w=
hat opkg/rpm actually think about this?=C2=A0 Maybe the sanity test is brok=
en.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a114ab3ca33664b0535defe7f--
