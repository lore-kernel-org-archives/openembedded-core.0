Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3C59072DE1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 11:44:04 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id dc16so10312085qab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 03:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hr/vN9k1mEX07+CPcy1SRKYMRtney9yVpSDx3Pue07I=;
	b=h/h5bLtNTPcnIqNxlVQUKnbLM10S6XQgqLsZ+gLix7SeoVo5QQxv6W4jtmyG+SZxMk
	BYGCWNW2c4ak0Vrr0T/bxAhzuTeIL533Zonh/3qojhP7xu47q6kWxsuNTv3MyRr//iFp
	M45XWoZO9VGa3XqdIDrW60DpJEilI2Q2LSgRRXX+39SzZRtKSqETfSJI6k+XCKKdFm2t
	UholVGOI+th7Gxb77M6XHdCpQEp1OaXFzttbIKhBriEF/ZEQDsZQm99broW0Lzh68yeO
	o0ucO/zcTN3sZ55zjw3S8XRnWuYk90TN44OCQ9KAJZT3QpyQ4i4CbyxKU9zYF7C4Tktq
	UwAA==
X-Gm-Message-State: ALoCoQn+jioSFNrmbGB+uRCxcD7R9NB19u6cZ4kIhui3M3L9IMh4zP8sYEl6Ixk4kq/rrojUJFUq
X-Received: by 10.224.97.72 with SMTP id k8mr7224809qan.52.1423223046041; Fri,
	06 Feb 2015 03:44:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 6 Feb 2015 03:43:45 -0800 (PST)
In-Reply-To: <1423191769.21935.9.camel@picadillo>
References: <1420809842-516-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1420809842-516-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<20150202073734.GB3594@localhost.localdomain>
	<1422887389.9587.13.camel@picadillo>
	<20150203100536.GA3972@localhost.localdomain>
	<1422967794.18649.1.camel@picadillo>
	<20150206022724.GA3715@piout.net> <1423191769.21935.9.camel@picadillo>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Feb 2015 11:43:45 +0000
Message-ID: <CAJTo0Lb9SLRfrLwjMo4p1CC1pLh+DHWxeERmGzYK5mF3qS3j=w@mail.gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wic: fix extended/logical partition layout
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
X-List-Received-Date: Fri, 06 Feb 2015 11:44:07 -0000
Content-Type: multipart/alternative; boundary=001a11c2cb5a1890cf050e69f000

--001a11c2cb5a1890cf050e69f000
Content-Type: text/plain; charset=UTF-8

On 6 February 2015 at 03:02, Tom Zanussi <tom.zanussi@linux.intel.com>
wrote:

> I think for master it's Ross, cc'ed.  Sometimes it takes awhile, you
> just have to check every so often to see when it hits master.  Ross can
> correct me, but I think this is where its staged before it hits master,
> so you can see what's in the queue for testing (master under test):
>
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mut
>

That right.  I've been adding the wic patches over the last few days so
they'll be hitting master early next week.

Ross

--001a11c2cb5a1890cf050e69f000
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 February 2015 at 03:02, Tom Zanussi <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tom.zanussi@linux.intel.com" target=3D"_blank">tom.zanussi@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1=
ao" class=3D"a3s" style=3D"overflow:hidden">I think for master it&#39;s Ros=
s, cc&#39;ed.=C2=A0 Sometimes it takes awhile, you<br>
just have to check every so often to see when it hits master.=C2=A0 Ross ca=
n<br>
correct me, but I think this is where its staged before it hits master,<br>
so you can see what&#39;s in the queue for testing (master under test):<br>
<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/lo=
g/?h=3Dross/mut" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cg=
i/poky-contrib/log/?h=3Dross/mut</a></div></blockquote></div><br>That right=
.=C2=A0 I&#39;ve been adding the wic patches over the last few days so they=
&#39;ll be hitting master early next week.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c2cb5a1890cf050e69f000--
