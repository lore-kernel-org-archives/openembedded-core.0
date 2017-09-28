Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 50CE26E666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 09:34:28 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id l15so1029970iol.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z/pL53AlSbwoxTeU7bui/hIR5AXdN7oQ7wbVwd8bcNs=;
	b=OpR20iQETTEfI3Tmsl2L3YvkJ3VaXL/LMNE6fVruyrXdzwCK8fiwPTkAZR9gQXwjme
	BY4SNfyE/BM137pMdQG00uL9H3uOjJH/WAXtx5at9iemIs+8Ld3KkBtTLHQY99KoZtaL
	7N+CoRtYKEAoM35tPmzxlujFS36UHc9MpZmuRce4/lxz43ZPPzmPUTS9sXXsY+ErKLLz
	CCirMEEkzxKN33eyrPs7j5DZTYcuOAsz/vOxFAMwOdeJaIgq5vfiYYKkolBDfiRs73mv
	IpugW+efanbouwvGguI1WHInLz4phHI8GfTN9gB3OvQZB9v9VOcayKY8Q4pLerf64enm
	DbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z/pL53AlSbwoxTeU7bui/hIR5AXdN7oQ7wbVwd8bcNs=;
	b=Bn4GlqQ8qDpybXn6owwBrE2HrqACaMfcmJBD+JufIGRuY/FGS2qRnIXErwu12I4XxT
	5eyf91HUYkDfpu/8Olf8wDZbVJnMG6Rzoms/COQRxs4CV6b8MtzqYj/o5LAIfri7Najt
	EOq56VgX44Ed8f4WgoOGruKk9ixWSp+eMttzawNxVFQGBm+AN5wvT2ieCNK166YAU209
	Sypj+qdCWwh00J+mUjwVpZ7VdZYZNhH9MFuz9TblMZMM/NE/UJJj3SNTs+zhXdSLQRjg
	Aqg7OicTKm98vKVqSJAcDDQfCIlgrczog4YdqfYjTmIIqtkavwGTBFgobpJu9G3TIGt6
	SsiQ==
X-Gm-Message-State: AMCzsaXVkss/uwuWBUoFD6+8P+kyjkeTrezqtvzl/iDhxgs5O9unwMJs
	jwEFx++RaaYuGJbBaFi4ka9aGUHFdnkhFjZIenCgkg==
X-Google-Smtp-Source: AOwi7QD7RGvQwTNHiDlZmmXLMghqtAgqPjJ8ndiGJXUHF6NOMuW++q+N2suBbQFkL8TnIIse+mkYt8K0ymFVNVV7g7k=
X-Received: by 10.107.32.70 with SMTP id g67mr6475816iog.77.1506591269654;
	Thu, 28 Sep 2017 02:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 02:34:09 -0700 (PDT)
In-Reply-To: <59fecff0-d359-a4ea-3d3c-cb0064f0e70d@siemens.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LYxVmQidhcuq9VeSBzb7y1KPcgqN6_R97d7PNf51C094g@mail.gmail.com>
	<1ebb3564-9e52-9480-c1c8-9f959d9e9416@siemens.com>
	<CAJTo0LYwUhk9tHNHZ7DACOC5WXKW_x=1vrNd7pArCxP7-Pe_dA@mail.gmail.com>
	<b48b82e6-bb1d-2e7a-ab50-609bd39c93d8@siemens.com>
	<239a2cfd-1507-b8dc-0d85-0ab7afa98c71@siemens.com>
	<CAJTo0LbR-sLX4YY4F1myb2EcEGQ3qSZjQL5OPOh5jut2_h4djg@mail.gmail.com>
	<59fecff0-d359-a4ea-3d3c-cb0064f0e70d@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 10:34:09 +0100
Message-ID: <CAJTo0LYnEPOs3k0UTRHQdq_Mn=MZVWXbUNhEbJcpP_exHjcJXA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Thu, 28 Sep 2017 09:34:29 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c7342b4055a3c9d7b"

--001a1140ae2c7342b4055a3c9d7b
Content-Type: text/plain; charset="UTF-8"

Can you resubmit the patch here too please, patch review happens primarily
on the list.

Ross

On 28 September 2017 at 07:06, Andrej Valek <andrej.valek@siemens.com>
wrote:

> Thank You for pointing to this. I have fixed and updated the pull request.
>
> Andrej
>
> On 09/27/2017 05:35 PM, Burton, Ross wrote:
> > On 27 September 2017 at 09:52, Andrej Valek <andrej.valek@siemens.com
> > <mailto:andrej.valek@siemens.com>> wrote:
> >
> >     Could You please provide my the current status of my request?
> >
> >
> > Too much of a change for frozen master so it will have to wait for
> master to reopen.
> >
> > However it fails to build with ptest enabled:
> >
> > | NOTE: make
> > DESTDIR=/data/poky-tmp/master/build/work/corei7-64-poky-
> linux/libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest
> > install-ptest
> > | install: missing destination file operand after
> > '/data/poky-tmp/master/build/work/corei7-64-poky-linux/
> libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest'
> >
> > (noinst_PROGRAMS isn't set in the makefile)
> >
> > Ross
> >
>

--001a1140ae2c7342b4055a3c9d7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you resubmit the patch here too please, patch review h=
appens primarily on the list.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 September 2017 at 07:=
06, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mailto:andrej.valek@sieme=
ns.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Thank You for pointing to this. I have fixe=
d and updated the pull request.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrej<br>
</font></span><span class=3D"im HOEnZb"><br>
On 09/27/2017 05:35 PM, Burton, Ross wrote:<br>
&gt; On 27 September 2017 at 09:52, Andrej Valek &lt;<a href=3D"mailto:andr=
ej.valek@siemens.com">andrej.valek@siemens.com</a><br>
</span><div class=3D"HOEnZb"><div class=3D"h5">&gt; &lt;mailto:<a href=3D"m=
ailto:andrej.valek@siemens.com">andrej.valek@siemens.<wbr>com</a>&gt;&gt; w=
rote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Could You please provide my the current status of m=
y request?<br>
&gt;<br>
&gt;<br>
&gt; Too much of a change for frozen master so it will have to wait for mas=
ter to reopen.<br>
&gt;<br>
&gt; However it fails to build with ptest enabled:<br>
&gt;<br>
&gt; | NOTE: make<br>
&gt; DESTDIR=3D/data/poky-tmp/master/<wbr>build/work/corei7-64-poky-<wbr>li=
nux/libxml2/2.9.5-r0/image/<wbr>usr/lib/libxml2/ptest<br>
&gt; install-ptest<br>
&gt; | install: missing destination file operand after<br>
&gt; &#39;/data/poky-tmp/master/build/<wbr>work/corei7-64-poky-linux/<wbr>l=
ibxml2/2.9.5-r0/image/usr/<wbr>lib/libxml2/ptest&#39;<br>
&gt;<br>
&gt; (noinst_PROGRAMS isn&#39;t set in the makefile)<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a1140ae2c7342b4055a3c9d7b--
