Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A472F71A8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:20:06 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 11so107769192qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tFfpp6ZnPYSPm8448SM8FCkCKrKLnHKjeLZ/ibWRrjQ=;
	b=g0OwEnRj37z+EzJzbTRNmlgUxn7v0MZkkW7DmVEacADfg8VWXzarR6g7ipP/zUvE+K
	rVOfr7kmKpSEGUUuK0jxOZ/H1M7M1oKbAHvoPEdfCUq7mpo5xzL/JtlDF6ZsKNtuQfpw
	/fI9WaFvIryLLT1+8vgwBTyO8G8yQ025GpSbD9ylOoirbvMqMDorbYLXKjgQrlsJgE2E
	cczB//M0Ht6wbFkJ002MUVU76PuVpuGEJx1OHvKhedvfFaSjaJ8AnxXwcHPiQDdZKBBG
	pG33YiMZVvx3P0RfV+FJ6m749h/TiFhNX+m0iTy7+Syfz1NN9Nbjx5IiH7ggvQisDzyS
	SrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tFfpp6ZnPYSPm8448SM8FCkCKrKLnHKjeLZ/ibWRrjQ=;
	b=pZ6pwNpIZh9jqlXFwOe5GuYZb1ZJktnTb7B3TWgq71Zp9scyyN2tXBwMaq9mxRjRxa
	vg9PQKEo7EJ8DvgQrbGLJm0sEeTQw0ihrwhG1uU1ct82XE9c06+rXaD9ERBWIxEabYiM
	CNWwNctI728nnyLJLJUpDfyIMxxkJasUmkgVyK6d8re88TAVqmrx9dYIYIwTsNeuPoNi
	BBROZrrAiijRyxa7zy1P0ieC+NVk88NToY5K5yHKXWs//lCgS0gvPMzLwNmvVyOdu1AJ
	H4+n6CXjISx74A8/MeT4MEDRg5uoEuXwm9DkRNgV1ywdFxWWWVNl/1mAkVFgEHAAhZ52
	g7/A==
X-Gm-Message-State: AIkVDXJZYLw2CwXduME7x3dkN5KNE9wQIh7ctju4nhGOhy1LmZNT3ooZnuWRdt4NocHCkWrxBOb6oItcFWzy1dw5
X-Received: by 10.55.16.11 with SMTP id a11mr8669492qkh.3.1484137207296; Wed,
	11 Jan 2017 04:20:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 04:19:46 -0800 (PST)
In-Reply-To: <20170111035102.18447-2-raj.khem@gmail.com>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 12:19:46 +0000
Message-ID: <CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 12:20:07 -0000
Content-Type: multipart/alternative; boundary=001a11475cbc0a2e410545d09f89

--001a11475cbc0a2e410545d09f89
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 03:51, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

This fails when building gdk-pixbuf for x86-64 with gobject-introspection
enabled:

|
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/gdk-pixbuf/2.36.1-r0/build/gdk-pixbuf/tmp-introspectylz98kc7/.libs/GdkPixbuf-2.0:
> Relink
> `/data/poky-master/tmp-glibc/sysroots/intel-corei7-64//usr/lib/libpng16.so.16'
> with
> `/data/poky-master/tmp-glibc/sysroots/intel-corei7-64//lib/libpthread.so.0'
> for IFUNC symbol `longjmp'


The gdk-pixbuf link does use -lpthread, is this saying that libpng should
be linked against pthread too?  I can replicate on demand if you have any
suggestions.

Ross

--001a11475cbc0a2e410545d09f89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2017 at 03:51, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D"gmail-:5cu" class=3D"gmail-a3s gmail-=
aXjCH gmail-m1598ba80a384f278">Signed-off-by: Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br></div></blockquote></di=
v><br>This fails when building gdk-pixbuf for x86-64 with gobject-introspec=
tion enabled:<br></div><div class=3D"gmail_extra"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
">| /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/gdk-pixbuf/2.36.1=
-r0/build/gdk-pixbuf/tmp-introspectylz98kc7/.libs/GdkPixbuf-2.0: Relink `/d=
ata/poky-master/tmp-glibc/sysroots/intel-corei7-64//usr/lib/libpng16.so.16&=
#39; with `/data/poky-master/tmp-glibc/sysroots/intel-corei7-64//lib/libpth=
read.so.0&#39; for IFUNC symbol `longjmp&#39;</blockquote><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">The gdk-pixbuf link does use=
 -lpthread, is this saying that libpng should be linked against pthread too=
?=C2=A0 I can replicate on demand if you have any suggestions.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11475cbc0a2e410545d09f89--
