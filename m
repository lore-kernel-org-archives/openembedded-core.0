Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id E96BE77016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:20:30 +0000 (UTC)
Received: by qkcj187 with SMTP id j187so5311981qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bZlMu89aM587I2AMLGzXYMDZqXW9MEpgr+Prl/BaWK4=;
	b=BlU9VWMaAOdfwmcuYb75S+f/aMItcaQh5qEQmQDREJOd3vAhtTvUdN+L3/nX3dCapn
	F776hP01PsCfYfurEf0UfaUW1k+XQBcF8F0I0Yw7YD1GpRC81CJujlAa+ThP8yrUCZ6S
	3qijX2TbAagw3tbBcOg79s62+QEMoXALqSaG60k9ekw0a5y3VRvoqtAhv9oTnGgn2wKN
	qKebE7BLNYpD83wdygxxti7oDcrB9wEs8JxnVT32xxjUMim1ZDExd1EVcZdMft9/0/e8
	75Sm5ovotTTdSzqy+vVdScs+br5OP7UqeNg/KjzgifIbjbz+JFICH0gqcdepL3KvxKrT
	1MEg==
X-Gm-Message-State: ALoCoQmQtpMaYIzcMIvcP8ZOJo5ETB9cA2TtjecGrZEu9i5pKzHI5Z3/WZb2tsebyBbWXnKSYAbK
X-Received: by 10.55.195.66 with SMTP id a63mr2909918qkj.67.1441351230655;
	Fri, 04 Sep 2015 00:20:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 00:20:11 -0700 (PDT)
In-Reply-To: <1441348974.9573.42.camel@intel.com>
References: <1441348974.9573.42.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 08:20:11 +0100
Message-ID: <CAJTo0LZx0F3MTvq9i2+-ENukC3gA9tG56SNzDm9CAp3amJHKpw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: oe-init-build-env slowdown: chmod -R
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
X-List-Received-Date: Fri, 04 Sep 2015 07:20:31 -0000
Content-Type: multipart/alternative; boundary=001a1146675c19abd5051ee6bc66

--001a1146675c19abd5051ee6bc66
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 07:42, Patrick Ohly <patrick.ohly@intel.com> wrote:

> In my case (*), that chmod takes about 2 minutes to complete. strace
> shows that it does a fchmodat on all files, even if nothing needs to be
> changed. atop then shows that this keeps the disk 100% busy with writes.
> I don't know what gets written (can't be the access time, I tried
> mounting with noatime).
>

The autobuilder has been seen to take 14 minutes at this stage before being
killed by buildbot. :) There's a patch on the list for this, and will be
merged soon.

Ross

--001a1146675c19abd5051ee6bc66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 September 2015 at 07:42, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D=
"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17c" clas=
s=3D"a3s" style=3D"overflow:hidden">In my case (*), that chmod takes about =
2 minutes to complete. strace<br>
shows that it does a fchmodat on all files, even if nothing needs to be<br>
changed. atop then shows that this keeps the disk 100% busy with writes.<br=
>
I don&#39;t know what gets written (can&#39;t be the access time, I tried<b=
r>
mounting with noatime).<br></div></blockquote></div><br>The autobuilder has=
 been seen to take 14 minutes at this stage before being killed by buildbot=
. :) There&#39;s a patch on the list for this, and will be merged soon.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1146675c19abd5051ee6bc66--
