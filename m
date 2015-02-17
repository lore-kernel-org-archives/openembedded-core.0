Return-Path: <priyaiitmandi@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4C571F1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:28:36 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so29567694ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 03:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=f9TXuHtdyZ8anezujCGInc4Zkd0ioIaaCyy3VK6rfjo=;
	b=aswnbg2DG8tRZC8jlIpOEcN+hMdFcKC2AkjqZ11Pv3Ej/S6PCsApPoi4nLLYt5tsCi
	JgXu1+hh+VgcI8jo1/qxFT+Gu7fZhNhjgvqzhYxcs2Ez9Kmw/Vi1uZQradK6QVFzewnD
	kr041kTSQLHcvqheD3fRN7L839i7NzUuO9AoW8x5016ZDT2diHQSNw9Nal9sM3akH4pm
	EEYK26DiuRZKts2/dr4WPipSmYaAk2ya3UKBKh+6xTUYFm/9agXVHIqDPTYCfw+PKoVW
	grGBURabzELKUVqv4cH627AnNRh+Zutf46wRhmFXATuHQHl2sdRs14MJveyCizBUsnF9
	wbdg==
MIME-Version: 1.0
X-Received: by 10.50.62.110 with SMTP id x14mr27697190igr.2.1424172517409;
	Tue, 17 Feb 2015 03:28:37 -0800 (PST)
Received: by 10.107.134.207 with HTTP; Tue, 17 Feb 2015 03:28:37 -0800 (PST)
In-Reply-To: <CALTPfpHrYrWhPje7ippkoTUwPgBAuzmhcTKWa0Knec-iSLtgBQ@mail.gmail.com>
References: <CALTPfpHrYrWhPje7ippkoTUwPgBAuzmhcTKWa0Knec-iSLtgBQ@mail.gmail.com>
Date: Tue, 17 Feb 2015 16:58:37 +0530
Message-ID: <CALTPfpFroYMcfnn-SQZGYxsROm0nnD7g85K-h9Vv-OvWAD4m6w@mail.gmail.com>
From: Priya Agarwal <priyaiitmandi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Error while trying to enable selinux support in custom image
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
X-List-Received-Date: Tue, 17 Feb 2015 11:28:36 -0000
Content-Type: multipart/alternative; boundary=047d7bdc15b8ffc805050f4700df

--047d7bdc15b8ffc805050f4700df
Content-Type: text/plain; charset=UTF-8

I think I'll have to edit bblayers.conf to include path to meta-python and
networking-layer. However where is the path to networking layer. Is it same
as meta-networking.


On Tue, Feb 17, 2015 at 4:03 PM, Priya Agarwal <priyaiitmandi@gmail.com>
wrote:

> Hi,
>
> I want to add SELinux support in my custom imgae I am building for
> Freescale's T4240QDS Machine.
> I followed the steps given in FAQ section included in meta-selinux
> directory.
>
> However I am getting this error. How do I remove this.
>
> ERROR: Layer 'selinux' depends on layer 'meta-python', but this layer is
> not enabled in your configuration
> ERROR: Layer 'selinux' depends on layer 'networking-layer', but this layer
> is not enabled in your configuration
>
> I need to do this urgently.
> Thank You.
>
> Regards
>

--047d7bdc15b8ffc805050f4700df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think I&#39;ll have to edit bblayers.conf to include pat=
h to meta-python and networking-layer. However where is the path to network=
ing layer. Is it same as meta-networking. <br><br></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Tue, Feb 17, 2015 at 4:03 PM, Pri=
ya Agarwal <span dir=3D"ltr">&lt;<a href=3D"mailto:priyaiitmandi@gmail.com"=
 target=3D"_blank">priyaiitmandi@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><div><div><div>Hi,<=
br><br></div>I want to add SELinux support in my custom imgae I am building=
 for Freescale&#39;s T4240QDS Machine.<br></div>I followed the steps given =
in FAQ section included in meta-selinux directory.<br><br></div>However I a=
m getting this error. How do I remove this. <br><br>ERROR: Layer &#39;selin=
ux&#39; depends on layer &#39;meta-python&#39;, but this layer is not enabl=
ed in your configuration<br>ERROR: Layer &#39;selinux&#39; depends on layer=
 &#39;networking-layer&#39;, but this layer is not enabled in your configur=
ation<br><br></div>I need to do this urgently.<br></div>Thank You.<br><br><=
/div>Regards<br></div>
</blockquote></div><br></div>

--047d7bdc15b8ffc805050f4700df--
