Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA3871A8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:29:01 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id z55so17415512wrz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DnMb84d6lz6yE5iiQHcoYS9rBdikW4JdUOikWmgUo9E=;
	b=QkeGDbSrTeDIgqSqPb0q9izOmX/SnWarTBEk8m4wID2AdWC4CMp/5CPfi0WvfUjbq7
	+iESSpsI+MiHIRB5bgiCdxFA0COx2TNrJxi5Txd+TO55kvV9dAhh3y39LpExw+q9wjyl
	4UBSRef3j/kqF2ZOBJf0Z1uO6izGdi/e+/NrFv7jzxwjnSmWE4QwHQ5JZJtqjyx/Vc/r
	9LUxgXCLaGC9I+cVW9ul7/ydl4KOPLQ952ICgBZym//GlhrkG64+Ngqp62LpuNhHomC3
	FZCnJtQblADqyS6NzPwGDOnzx27zQdACmoV3teSZ0bynSM3msauk4OiGNylNuoSxEvPU
	ymbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DnMb84d6lz6yE5iiQHcoYS9rBdikW4JdUOikWmgUo9E=;
	b=m3ie6Hp+cR6w5XGq3eVK7C2Jhm4LJygwu/Fhca/XIXgVXMe8TpK37vlYj34mGeiDdR
	/XIo8k498vNGDxSBgGGDGzjVMP9XZqiv/KMClqzJlXEcx5vMd1MvNcEol06IcwL215SK
	gXAyjDA0sQPhj6unqSu11l3CjT5oitOi0SuWKtojMdVJYvZ99VhBf8s40nflbQdmeqq8
	YSF9NsEC+WFL3lWO/P4UOqgxrN0XsPrAh9L/WP3/hKqCXU0nPfoIT7Q04iea+emJVNWn
	y1C5w9X5xgriRgxQXEPL3OTIXjfaf4TNhSjk5N0sKWAibbRU2ZfryZTSPdX7OcCb9Nlv
	3/kw==
X-Gm-Message-State: AMCzsaUs71UFg2ZtmBNzWPuNubqQNkzFK/B0TvGb6prYaYkrgHuFtbJz
	0+5636GeFo157+zPLNxExNWwgAO61J5E+VkX314=
X-Google-Smtp-Source: ABhQp+SYeDi9oaStY5QBYNIuTPDOuGz/UPYyM3BVHDUm4LIzoCs0w0ydE6Ct+JEZuH2Wr0JiDLPd/9pJGRaYtqEiBLE=
X-Received: by 10.223.143.51 with SMTP id p48mr1629768wrb.104.1508927342596;
	Wed, 25 Oct 2017 03:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+jxWbeubv1tSJLXs5v6wP0do_+jzgepSMc2okvj4imip=+yjA@mail.gmail.com>
In-Reply-To: <CA+jxWbeubv1tSJLXs5v6wP0do_+jzgepSMc2okvj4imip=+yjA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Oct 2017 10:28:52 +0000
Message-ID: <CA+chaQfdT_wySFELWqaDtMC3Q-1k6MQ-0ApnwZEHmAPzvuMWcA@mail.gmail.com>
To: shubhabrata sen <shubhabrata.sen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Swig dependency error while building firmware with apparmor
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
X-List-Received-Date: Wed, 25 Oct 2017 10:29:02 -0000
Content-Type: multipart/alternative; boundary="f403045d5cfa3f56e3055c5c86fd"

--f403045d5cfa3f56e3055c5c86fd
Content-Type: text/plain; charset="UTF-8"

you probably want swig-native dependency.

On Wed, Oct 25, 2017, 11:09 shubhabrata sen <shubhabrata.sen@gmail.com>
wrote:

> Hi,
>
> I'm trying to build a firmware with the apparmor recipe and I keep getting
> the following error
>
> *checking for swig... no*
> | checking whether the libapparmor debug output should be enabled... no
> | checking whether the libapparmor man pages should be generated... yes
> | checking for podchecker... podchecker
> | checking for pod2man... pod2man
> | checking whether python bindings are enabled... yes
> *| configure: error: swig is required when enabling python bindings*
> | WARNING:
> /home/shubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure.8464:1
> exit 1 from 'PERL="${PERL}"
> PYTHON="/home/shubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python"
> ./configure --build=x86_64-linux --host=arm-poky-linux-gnueabi
> --target=arm-poky-linux-gnueabi --prefix=/usr --libdir=/usr/lib
> --mandir=/usr/share/man --includedir=/usr/include --with-perl --with-python'
>
> I've included the SWIG recipe in the build and I can successfully build
> the firmware including swig with the bitbake command but somehow the
> apparmor recipe can't find the swig package. Any help regarding this would
> be appreciated.
>
> Thanks
>
> Shubh
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d5cfa3f56e3055c5c86fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">you probably want swig-native dependency.</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 25, 2017, 11:09=
 shubhabrata sen &lt;<a href=3D"mailto:shubhabrata.sen@gmail.com">shubhabra=
ta.sen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to build a firmware wit=
h the apparmor recipe and I keep getting the following error</div><div><br>=
</div><div><div><b>checking for swig... no</b></div><div>| checking whether=
 the libapparmor debug output should be enabled... no</div><div>| checking =
whether the libapparmor man pages should be generated... yes</div><div>| ch=
ecking for podchecker... podchecker</div><div>| checking for pod2man... pod=
2man</div><div>| checking whether python bindings are enabled... yes</div><=
div><b>| configure: error: swig is required when enabling python bindings</=
b></div><div>| WARNING: /home/shubhabs/dists/cvp/builds/p1367/tmp/work/cort=
exa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure.84=
64:1 exit 1 from &#39;PERL=3D&quot;${PERL}&quot; PYTHON=3D&quot;/home/shubh=
abs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/appa=
rmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python&quot; ./=
configure --build=3Dx86_64-linux --host=3Darm-poky-linux-gnueabi --target=
=3Darm-poky-linux-gnueabi --prefix=3D/usr --libdir=3D/usr/lib --mandir=3D/u=
sr/share/man --includedir=3D/usr/include --with-perl --with-python&#39;</di=
v></div><div><br></div><div>I&#39;ve included the SWIG recipe in the build =
and I can successfully build the firmware including swig with the bitbake c=
ommand but somehow the apparmor recipe can&#39;t find the swig package. Any=
 help regarding this would be appreciated.</div><div><br></div><div>Thanks<=
/div><div><br></div><div>Shubh</div></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--f403045d5cfa3f56e3055c5c86fd--
