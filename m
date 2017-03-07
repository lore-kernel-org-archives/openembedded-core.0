Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC6E77513
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 14:05:44 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id y76so5219196qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 06:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GPVPjSKB9aUP80US0dHX/CkAsxJySTmGB8JeDgfs9EU=;
	b=Ta9y03e+8hg1wBkyPuxPP81FZCSdjDNNBAbLcpCVfhAtIlWirW6W+CdbhxRCriLacp
	N5bqekxVBTGq9I5WDAsBZFMxJamPCXjyWDis7RvQow/NllQfXcBmZzTAwVfX7WSDf9yq
	CBEP/G2lI2BakDa3PWjRswx0jd/+C9xAgMHTSAYOkjPJf2dfJFXd7m3/EEKQtHZzYBn9
	A+nsARhhJioQB8okehhKZoNLwKvhq+fJnM34HaFpJUoD1sQ8GiTttEqNktx+nE9asvoR
	35tJxjg6ShHCEwCG3OalqGd7kY4v0OkctJXxA2NTYUiB63PaQQrSN4VZ13PEKf7Z+XJA
	azJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GPVPjSKB9aUP80US0dHX/CkAsxJySTmGB8JeDgfs9EU=;
	b=t7JJflp68AxtuVbqeWrVcGeuYn98S/VB2RAFNIacowXvRzSVG7/LtuzzA4D2eWCoKL
	INgqA8RX5U1frHuVnUt0THnI5Zp/IgW7hIQkMNQ8MBUaPQMFcGQuV2cp5NNnnwnYqV4q
	rMX2N6E9cNyVKNQO8KujiDXs3Q9ZSJyEIa6wSRjsD5SMsdQEOGaXZFLuLeHJd33njObJ
	HCYms316xLs8yl3MMn3JJAp8nZgyMZD2u9E9ehQj+d0wT/PRJComG8Y7325tZqs74qdn
	kR1J/jaDJq3l7GysuUdBBptnch70SY90o89gRQInOQa3l7+R46bJ05XliRf0c4TMb1o3
	Ik3g==
X-Gm-Message-State: AMke39n7fjHl9YdRpkYo9r5XOxjG6RgEJdy2/dVYdua3xNv73qkOlKlURc9nLVhGLQVWR4z4OyQjkNEH7KXFKsCT
X-Received: by 10.200.2.150 with SMTP id p22mr513051qtg.197.1488895545980;
	Tue, 07 Mar 2017 06:05:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 06:05:25 -0800 (PST)
In-Reply-To: <a89026c4b38641650e5c14e231e452e842220238.1488272553.git.jussi.kukkonen@intel.com>
References: <cover.1488272553.git.jussi.kukkonen@intel.com>
	<a89026c4b38641650e5c14e231e452e842220238.1488272553.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 14:05:25 +0000
Message-ID: <CAJTo0LaYNtKw_37Y3qs7=ptKcq9ZsamgEUOZS+QM-Cm0kaYGdw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/6] vulkan: Add recipe for Vulkan common loader
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
X-List-Received-Date: Tue, 07 Mar 2017 14:05:45 -0000
Content-Type: multipart/alternative; boundary=f4030435c23420dbe7054a2482ef

--f4030435c23420dbe7054a2482ef
Content-Type: text/plain; charset=UTF-8

On 28 February 2017 at 09:26, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:
>
> Add a recipe for vulkan loader library and the vulkaninfo binary.
>
> Vulkan can be built to support X11 or wayland or both. There is
> currently no support for building tests, validation layers or even
> the demos as that would require a bunch of otherwise unnecessary
> dependencies.

Under musl, this doesn't link:

| ../loader/libvulkan.so.1.0.39: undefined reference to `__secure_getenv'
| collect2: error: ld returned 1 exit status
| demos/CMakeFiles/vulkaninfo.dir/build.make:99: recipe for target
'demos/vulkaninfo' failed

Ross

--f4030435c23420dbe7054a2482ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 28 February 2017 at 09:26, Jussi Kukkonen &lt;<a hr=
ef=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wro=
te:<br>&gt;<br>&gt; Add a recipe for vulkan loader library and the vulkanin=
fo binary.<br>&gt;<br>&gt; Vulkan can be built to support X11 or wayland or=
 both. There is<br>&gt; currently no support for building tests, validation=
 layers or even<br>&gt; the demos as that would require a bunch of otherwis=
e unnecessary<br>&gt; dependencies.<br><br>Under musl, this doesn&#39;t lin=
k:<br><br>| ../loader/libvulkan.so.1.0.39: undefined reference to `__secure=
_getenv&#39;<br>| collect2: error: ld returned 1 exit status<br>| demos/CMa=
keFiles/vulkaninfo.dir/build.make:99: recipe for target &#39;demos/vulkanin=
fo&#39; failed<br><br><div>Ross</div></div>

--f4030435c23420dbe7054a2482ef--
