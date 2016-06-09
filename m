Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3427C607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:38:18 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id z189so155853058itg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7/tpWFsDc0oFIK98doLs22GQ0Z+U9HGsoZaoSQC35sQ=;
	b=tNX5zweW/vscJyh3FMHUpJum7jimCdi/XZp5lAUOgDFxvuvAATvjRa4Ac8C2xLX+gd
	XgMkwwqf4AiYGLahQAhG41uxkb9zeHHm+UQUHdtkZjScB2fWtQtXXuhVRwl0K3vq5taF
	QWEuTIEtnQmyRrmuQcC57dcAqTPeS1aPa24g1jItwIFfjNj9hpH3p782qA191sybCjLL
	mv1NfT+KX4zxVm93gQOzUcIoq3EpvkctYPn6+O9G5wt0BSVsJZ6E+QbpzxJnodPxucLS
	LM1LvKhTrijaCQSwYrS/NaLoaeMY1D7c9jWfUOrMoxc1laNuU+T1mL5Qn87MyQ2q/iwO
	tUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7/tpWFsDc0oFIK98doLs22GQ0Z+U9HGsoZaoSQC35sQ=;
	b=cnGrx9biwwJ5pN/aGZ36hcKeI5YL6Uq9L5uJ4Mnsq+j1D/zEJtHFQj4mhIN4ejcfVU
	MIVaLolxiICd3HhIel7rFdbOWheyPpjT3oSvRx9/TKHgOEUYHYFONFNbUl2JDmQcsbLq
	bqeAhXTpiksV+P4OaoURyfpDpDlyyWiXiZZvWglyS3rnqAFYHP6WTPxJ7B3F3Z2Gy4kK
	ydMc6S7FsRqw5g86LP6O/+lqmMopO8NajrTjNiJhuN33PfdF2se15qj5m2ft/NZGwlOe
	z9X/naXVCRpiUWnUXCnBYTAOJoZY+C2pxw8HmZqP0zJwZBwkDSpQkn0GDUyVvKJ2w8EI
	JwSg==
X-Gm-Message-State: ALyK8tKV/JdB26P2h8fB3qSrmRNyRy9b3f1BBjcqNGvSr+KL1o8CMHeF08ozCQKTXd1fiPR5f43kg1U9DX3+vIpE
X-Received: by 10.36.120.193 with SMTP id p184mr22893182itc.22.1465483099390; 
	Thu, 09 Jun 2016 07:38:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 07:37:59 -0700 (PDT)
In-Reply-To: <c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 15:37:59 +0100
Message-ID: <CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 14:38:19 -0000
Content-Type: multipart/alternative; boundary=001a114aa4289058110534d95f8e

--001a114aa4289058110534d95f8e
Content-Type: text/plain; charset=UTF-8

On 9 June 2016 at 15:08, Philip Balister <philip@balister.org> wrote:

> That said, what other layers use vala? If it leaves core, is there a
> layer that can host it and support other layers using it without to much
> trouble?
>

That's the key question really - can the support be extracted and added to
eg meta-vala in some way?

Ross

--001a114aa4289058110534d95f8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2016 at 15:08, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zo" class=3D"a3s=
 aXjCH m155357ea4ac6fbb8">That said, what other layers use vala? If it leav=
es core, is there a<br>
layer that can host it and support other layers using it without to much<br=
>
trouble?</div></blockquote></div><br>That&#39;s the key question really - c=
an the support be extracted and added to eg meta-vala in some way?</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a114aa4289058110534d95f8e--
