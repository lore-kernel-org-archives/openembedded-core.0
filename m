Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6627060557
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 09:46:33 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id l6so8658209qcy.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 01:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qhM0Z9rwpnt4cuHn07Qm7mp5htZhW3EKoayVPskK0yk=;
	b=UE4x8a4w3iek6KkgKMHQBodKGd0PtwhFl8wSygVu2m1CmmyEOsigSyYemIkr41JU8O
	7au9dxVKppHriNuqajleBflOSIsIKacofvs9WXjPi5AQVpzNwjiSCfs3K7jsONxwVCm1
	1dGVxg5aQmxsSHX7c+vgMz3K8XUez0gPDLZPt0D4GGvr4YvRGyRakL5F7bBtHiMcFmt9
	kv7nFA/CBs6SS9WLCSbRB/+HvKv7UzV8Z3L+OoVhfwU1DLcd+Zdc7iOq7u55TJKrXt6G
	7eeWLjfgjtUGpArO66J8h4UqwwzHMXn9/vdj2c4v9H4IvOekTOFxePZhbNUNW/NUkh4B
	eEcQ==
X-Gm-Message-State: ALoCoQkScSftBPMpZXBT/fz+FCXeocc6M3xsh83iXA6zqcQmqZ6vw1z/Fyi9UQphCbBRF/z2WA9u
X-Received: by 10.140.96.101 with SMTP id j92mr59117560qge.87.1415007994339;
	Mon, 03 Nov 2014 01:46:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 01:46:13 -0800 (PST)
In-Reply-To: <CADwFkYfm-TG4WH1ONn0LzH87YqP7yyc6BkyHC_Sb-M23D7wx1w@mail.gmail.com>
References: <CADwFkYdjkNrBGCJRMfc4JVg5j31461djp2sc9q9crSezHHzSUA@mail.gmail.com>
	<CADwFkYfm-TG4WH1ONn0LzH87YqP7yyc6BkyHC_Sb-M23D7wx1w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 09:46:13 +0000
Message-ID: <CAJTo0LakKz2UHX9qwiBzD-WD23koXFO1QUhFrAcz+oGTN=u+1A@mail.gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: where is the 'libGL.so.*"?
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
X-List-Received-Date: Mon, 03 Nov 2014 09:46:37 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8adb7c8b0506f138c4

--001a113a9d8adb7c8b0506f138c4
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 09:17, Yi Qingliang <niqingliang2003@gmail.com> wrote:

> I have removed 'x11' in 'DISTRO_FEATURE', I don't know if it is the reason.
>

That's the reason.  libGL.so is GLX, and the X in GLX means X11.

If you're building something that wants to use OpenGL without X11, then you
need to use EGL.

Ross

--001a113a9d8adb7c8b0506f138c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
 November 2014 09:17, Yi Qingliang <span dir=3D"ltr">&lt;<a href=3D"mailto:=
niqingliang2003@gmail.com" target=3D"_blank">niqingliang2003@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I have=
 removed &#39;x11&#39; in &#39;DISTRO_FEATURE&#39;, I don&#39;t know if it =
is the reason.</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"g=
mail_extra"></div></div></div></blockquote></div><br></div><div class=3D"gm=
ail_extra">That&#39;s the reason. =C2=A0libGL.so is GLX, and the X in GLX m=
eans X11.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">If you&#39;re building something that wants to use OpenGL without X11, =
then you need to use EGL.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a113a9d8adb7c8b0506f138c4--
