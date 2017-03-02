Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1AC77552
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 20:14:04 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s186so142477356qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wITZG3o5H7hu2QktoZRh3VSQk0UnVytb6bSdNO7Tn4o=;
	b=evTNMny8X+5EYGUdezd1vWrUMZalMLZiRG+1XUMx7fCdzmQJxTLePG9IsBl0sxzLVB
	CgcM0IyMh9SRwv2pZuC8+1m4X9PEM3HMi99rX7f4ENK96R1HHztcazTWPMa1s8ZTTKBI
	HiTtJItT9BNDbUnznNQT9V87sKsCEbxntf98UZY1KHbON5cGTctTLHqepGR8kv94gh7+
	tVqnxX7ST9Cm+qYV2Vr8FsUyPPVJ/Fr+YCRFOb+sJPzHzBY53JpU4KiMoDFeHcwligct
	j56/n6zAGJk61JJTcXf97Q6YbeX1CCNxqfk7MoU6q4iK2MClPoHUNzDtFH8QyZTSneWB
	Bs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wITZG3o5H7hu2QktoZRh3VSQk0UnVytb6bSdNO7Tn4o=;
	b=RZu47nywml/45UG8lhHUPDpjmBfyLFRR96J+PpcwQ6+6JnSHKNTKMdimo1+CIvzizf
	yppoOUqOZawAUEljiFpkmzuXJGpvfBYK2xWn55wB/94WgZdtqHXW5CSBH8rbqgVSaJln
	Y71wgNH5OgKtoRvfUrGaUk5bIL5R90qhQ7iDimpQqetpu5kZIjVz0G8RPnDhL0ujnaLY
	A23atTItro6cSACNdNtbtSq15YV0lYctEvSoJchTxtvu9chI9ldYmR6564jJI0VWu97g
	Fcu53SEi0xHm5KQ/tRgMY10ksxkkJF7CsX4MERBbRoZj1AH5EOH6H3WYigWiiP5oVKfs
	vD1Q==
X-Gm-Message-State: AMke39kHgXvSHjBp2rn8jlNeo7LIXHE22It8wOHC6HF1wRNlRD7wrBjyUU3st+gP8KTaMS3hIN8vOrQwX/fx72yS
X-Received: by 10.55.175.195 with SMTP id y186mr18413644qke.26.1488485646077; 
	Thu, 02 Mar 2017 12:14:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Mar 2017 12:13:45 -0800 (PST)
In-Reply-To: <1487752042-19804-48-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-48-git-send-email-amarnath.valluri@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Mar 2017 20:13:45 +0000
Message-ID: <CAJTo0LYj_iohfPXzDPHXdK=Qkfs20ZbbqmxZrrhr3a_5rtTWhQ@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 22/25] lsb: Make use of appropriate bitbake variables.
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
X-List-Received-Date: Thu, 02 Mar 2017 20:14:05 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c308f670549c512ba

--94eb2c06093c308f670549c512ba
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 08:27, Amarnath Valluri <amarnath.valluri@intel.com>
wrote:

> Using of bitbake environment variables in-place of hardcoded strings makes
> this
> recipe portable to all environments.
>

packages/corei7-64-poky-linux/lsb/lsb: FILELIST: directory renamed /bin ->
/usr/bin, removed "/usr/lib/lsb/install_initd /usr/lib/lsb/remove_initd",
added "/lib/lsb/remove_initd /lib/lsb/install_initd"

The commit log makes it sound like there are no changes in the usual case,
but files are moved around quite a lot.  Can you either stop files being
moved in the default case, or explain the moves.

Ross

--94eb2c06093c308f670549c512ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 08:27, Amarnath Valluri <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.valluri@=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div class=3D"gmail-">=
Using of bitbake environment variables in-place of hardcoded strings makes =
this<br>
recipe portable to all environments.<br></div></blockquote></div><br>packag=
es/corei7-64-poky-linux/lsb/lsb: FILELIST: directory renamed /bin -&gt; /us=
r/bin, removed &quot;/usr/lib/lsb/install_initd /usr/lib/lsb/remove_initd&q=
uot;, added &quot;/lib/lsb/remove_initd /lib/lsb/install_initd&quot;<br></d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The comm=
it log makes it sound like there are no changes in the usual case, but file=
s are moved around quite a lot.=C2=A0 Can you either stop files being moved=
 in the default case, or explain the moves.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c06093c308f670549c512ba--
