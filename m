Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id C04007F7F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:11:15 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id k15so14612431vsp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jvEBzLtrdaOEuPQ0iIy4O6Z4d/0n/xsB313R329Wcvo=;
	b=TBkAyeHFmEQuxFzetJeOsSLcFTL0lQs/IU/dqACDzWgUh4D2liBaVZ4rsFSORoqZ3/
	oxkglBGtfTFyMKLPxeGn/wZcEo4laG1jlw7nGyjdibMFzFVIDdVeGRLrtp63QFSS7ohN
	pu7XLEfO7DJOmfbQLWr+hCuBS+mrNe2Nj/zKKwSvzP1i+/hWgKhB94wChYkFR8of5DHY
	OQg1NnFWiX9ZHLOOWNeOK7yjNpq0PAoh8l5TF/1YmZ1AM3W/s/Fg5Lbg2nsdAO4gzBEh
	N8rYcQigxpSxcEtiK8JQTsAjM9SvJVaAjq20LFZmM8nlBDV/AePUoEwA0IMZkS3f+P1r
	Wyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jvEBzLtrdaOEuPQ0iIy4O6Z4d/0n/xsB313R329Wcvo=;
	b=UV5dMn+PERLgrsS9ietbS/iS5Py3EL3QSdpY4UFauNzhugGkc3eWn+9tJrak6zxn4L
	teMH7g0TWXYfefTQor/jbLXYEQmqWa4oSV68lAiLIik4sMq9N36SW1e+kfZoL2ez616x
	2P5ghX80NnRtlAufrH17+Py0uM4D5zIzUDOz6ZT9JdMQB3FvVTSd7PNnCX/PGTOxv4DJ
	qPLUtFyDQQ9BRFQ6fkMaRbgcmLn0eGdV+LEYukdvs3pv6zjlQdVQbO8kIFctdS622oNa
	fF2PJthBAR9kqWPq0FqBVnpJiC44jD2o878Doa8/ojXtkcKdZSYcMvi0WA8QPOCrpiK8
	ecJg==
X-Gm-Message-State: APjAAAV+0OYt2jiD3S6qkp1sKeb7L7LqunUJh9kJl9hd/O0vm3UD7W6w
	usiyOpeS81AvZ/Ok3SiAR+zHW+JpXYhvflCTics=
X-Google-Smtp-Source: APXvYqzPR08e4cnIdykGZbb2FaOgwQYDwifLqriqW7F1yPH7+M8G6eeZdt0IYFWYQ0io9aK2hMKWCFlmIICNLPXhQtU=
X-Received: by 2002:a67:fc04:: with SMTP id o4mr21728805vsq.35.1574179876546; 
	Tue, 19 Nov 2019 08:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
In-Reply-To: <CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 17:11:05 +0100
Message-ID: <CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 16:11:16 -0000
Content-Type: multipart/alternative; boundary="0000000000005aadfa0597b550b6"

--0000000000005aadfa0597b550b6
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2019 at 16:51, Khem Raj <raj.khem@gmail.com> wrote:

>
> think about building a release after many years, if we do not have to
> update SRC_URI to point to archive then its one less things to do
> given that the same copies are in archive for current releases too
> its just better for long term.
>

Building a release after many years without having a preserved local copy
of DL_DIR is asking for trouble, regardless of whether man-pages comes from
archive or not. Other things will have changed their location or vanished
off the internet in the meantime, even though they supposedly come from
'stable' locations. But if you have a DL_DIR, then you don't need to fix
the recipes at all.

Alex

--0000000000005aadfa0597b550b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 19 Nov 2019 at 16:51, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><br>
think about building a release after many years, if we do not have to<br>
update SRC_URI to point to archive then its one less things to do<br>
given that the same copies are in archive for current releases too<br>
its just better for long term.<br></blockquote><div><br></div><div>Building=
 a release after many years without having a preserved local copy of DL_DIR=
 is asking for trouble, regardless of whether man-pages comes from archive =
or not. Other things will have changed their location or vanished off the i=
nternet in the meantime, even though they supposedly come from &#39;stable&=
#39; locations. But if you have a DL_DIR, then you don&#39;t need to fix th=
e recipes at all.<br></div><div><br></div><div>Alex<br></div><br></div></di=
v>

--0000000000005aadfa0597b550b6--
