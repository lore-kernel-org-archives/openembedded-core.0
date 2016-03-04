Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 051CD734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 23:47:36 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id m184so78976299iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 15:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LZMiOYhPavOJZ2dE8LmdzxORCIQh15nYy1Wi6KtXQiQ=;
	b=ica8dnnWMhcqHyIYbk2ykcplp4ycFfkAmvukmtqRvYRATPW9Yip79hQnTIQymAXRFl
	NnATJcnlkwuCfVUjqz9dLC0T257Rot+hqRKxK5gQW/TmhB1XckMSTD7W573/laD4GrAZ
	cFrQGf8spOJkYVQce8jXkQ+19JjS4NmgrsZli+/jzxhi+C0qivH3MAjFDRQStyj+w70h
	D3TbO6G7Fi0VNhY0jFETWnt7jDwCDN+pULKwcsKEfIrewhjON27I+fArcVVQYC850qDK
	zDi/hgBeHJlwTXNsWcXbJ1Bv0TVfgNPobQdmkzlzoeta76WuUBOvNSXLyc+91Y8llCzA
	cciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LZMiOYhPavOJZ2dE8LmdzxORCIQh15nYy1Wi6KtXQiQ=;
	b=KL442tf0Ar1bAJT5I6i9skz6kaEuNscqsISem8Uj6AnyO0NUL47iEi2mOs9F6FfquZ
	z51hWzci4DHvwOz3e8Cs3rgEP22IcZX9JaqQ9I2vBaowz+/RVAeCfJS2GErfpG49xQvm
	ny906fvGN/PX1CqcW2kG0mBzwfxzV6YArNqrmF0Jz38dZn20DQNCFRSis71AwhA/2SUM
	bXEdoj55SaS+l/ZioMCUkRaBF+f7grREZ2283IrjPa05yZcEck48Hp5BznjzRrzyMYH8
	T9pjMuscXCfw8AsQa3kYn7Amb9zdgY+zrz1W4/yXmqLin81US52YVNUyeZVp0WfLzzlS
	5sCQ==
X-Gm-Message-State: AD7BkJINsuyeaJJRU0hhEe9koNnF8+w8bLBkOX1I36YxF68nT8JHoAf9Yt2vFakTwGBwpS3AF/DdbptBiyL/KPSz
X-Received: by 10.107.10.30 with SMTP id u30mr10282651ioi.99.1457135257507;
	Fri, 04 Mar 2016 15:47:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 15:47:18 -0800 (PST)
In-Reply-To: <1457131877.2804.65.camel@linuxfoundation.org>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<1457131877.2804.65.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Mar 2016 23:47:18 +0000
Message-ID: <CAJTo0LYTw1KEfcG=badVNJU+NyVQPCNM5XHviiF3gmpJOf_obA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Fri, 04 Mar 2016 23:47:37 -0000
Content-Type: multipart/alternative; boundary=001a113f92c069f206052d41bd4f

--001a113f92c069f206052d41bd4f
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 22:51, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> * some xmlto execution issue
>

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/bin/xmlto.real:
Bad substitution

This is a bashism in a /bin/sh script.  Patch incoming!

Ross

--001a113f92c069f206052d41bd4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 22:51, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":n=
g" class=3D"" style=3D"overflow:hidden">* some xmlto execution issue<br></d=
iv></blockquote></div><br>/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/bin/xmlto.real: Bad=
 substitution</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">This is a bashism in a /bin/sh script.=C2=A0 Patch incoming!</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113f92c069f206052d41bd4f--
