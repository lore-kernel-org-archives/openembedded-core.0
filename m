Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2396876B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:42:36 +0000 (UTC)
Received: by qkas77 with SMTP id s77so11700926qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AByomwRCw6yfppGNbHFAxCU8sfHlpp3i+2Uk8wbhp8w=;
	b=x/C710B7mLEQmsDw1np3GJ6gYQZWZYalQXOkcQG4N0cZoiXCDYjvyxSG0MMbcBJGSt
	A7PNnubLvHZ1hRzpMV5hhFY8x/wUj5ZgYm4eSDlijSRynzQo5qJMs01lsvqtliMUsluv
	gAVqSTo6kRP6Mn2K4wSnTgqQn6VqepnzXk/t2jLfly/UNG7F9K+3HoHx3l69CI08WICH
	VpOTsEIpRNLc2S5IYt3y7xlit3lwjVDQ4UUNZDif2VIb5goJsZ0Qc8CdTkvZDi3/eP9Y
	LzRwGaFRsjB0MPUv0rk+P/GYpeWlDNMWWd3XrgEGL2EXiU0AnIVb6Cz4nM/pZxUyyFig
	kYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AByomwRCw6yfppGNbHFAxCU8sfHlpp3i+2Uk8wbhp8w=;
	b=ahhzD7UKDDEfv3YSBv+Py+qch0NbgLI3h/HbByhnrB+s54jDw5Qkv6CDKDo6r2TDhK
	ZB7zl96LhxTNNKTqGQqFqnoPvuVdr+bWzfkEP0venzI1YsgypfVKwiXCv2A8z2Uk3+kA
	p0As398h2NQ5bNKDfx63Py39p8MkbmENDjCc4omJJ3VabIIZhoNvhNl1AZw4JnzgWj1J
	3ZQ7ue21FAR2e0CxlYheZkwDFQ65cWiOBj/cMCtXXeqx8lcwEkXGGxc2hrBqmeDKDaF+
	o0ZLdmSQPipvkYHS3Z9QBOqbnz/s3wi7mYAPJ/wTXR9ryiXtdf3S64D2oEPzrS6LRdGh
	kJNA==
X-Gm-Message-State: ALoCoQm2t86lj+SJZQX7j4wT85GxapNC5VFtCr8dtJ8g6KrdfC814OjpXgcp+BF/SP5EutCSI333
X-Received: by 10.55.73.144 with SMTP id w138mr10606258qka.104.1447249356258; 
	Wed, 11 Nov 2015 05:42:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Wed, 11 Nov 2015 05:42:16 -0800 (PST)
In-Reply-To: <20151111101548.GA2564@jama>
References: <20151111101548.GA2564@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Nov 2015 13:42:16 +0000
Message-ID: <CAJTo0LZPwD=HYXBZ-dJ4XgkLnTCwr+T2HDU1vzdb8EgWsc=YZg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-11-10
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
X-List-Received-Date: Wed, 11 Nov 2015 13:42:38 -0000
Content-Type: multipart/alternative; boundary=001a114a9f44c81327052443ffe0

--001a114a9f44c81327052443ffe0
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 10:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> Finally some good results, only libsdl2 from oe-core is failing with
> default configuration (you need to disable wayland PACKAGECONFIG to get
> it built).
>

I had a quick look at this: the wayland packageconfig requires the gles2
packageconfig.  If this is trivial to resolve there'll be a patch shortly.

Ross

--001a114a9f44c81327052443ffe0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2015 at 10:15, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":55g" clas=
s=3D"a3s" style=3D"overflow:hidden">Finally some good results, only libsdl2=
 from oe-core is failing with<br>
default configuration (you need to disable wayland PACKAGECONFIG to get<br>
it built).<br></div></blockquote></div><br>I had a quick look at this: the =
wayland packageconfig requires the gles2 packageconfig.=C2=A0 If this is tr=
ivial to resolve there&#39;ll be a patch shortly.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a9f44c81327052443ffe0--
