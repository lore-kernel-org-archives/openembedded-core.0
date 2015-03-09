Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 01A0E7393D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 17:54:10 +0000 (UTC)
Received: by qcxr5 with SMTP id r5so8643316qcx.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 10:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DX20zrhCVT/ONOvVl4GWvaATxEF6faayebD+AQPnLzc=;
	b=mbgEvBgD3Xa1TYWmRQua/dcSc3enUJIUvZ15GUs2XghJ4GbyanOJ3tbhoJeUvBtbrh
	lyI/MHgpN0JUSjeG8EN0UV0VTia0+psHmXCDcLxk2aJ6R0lJ1Cw0Nf+hNIj6v5yXuz1+
	o1OsUcP4dcKbNPVWdgpmOLjxz0VN+r16Ibuh9C7ui26S/W8juiRj/SfV6qaTZMWpOc8/
	v979ZNpCnsvssnMro9xePCgP39Ddi+SUzApYFW9shbIxyR/fRslFzr5xAt6FwQWxSp/e
	rpbx9ivZMihDHN5ABQZlAoFdLBZ/EBZuO81awmJnDB3RjhV6vI1mp8AkmdazIMZg3jvs
	Q4rg==
X-Gm-Message-State: ALoCoQkw7yjU4sOy4L8NhdmHRcIAMFXEJ977d15DVV1sUT36TAWGwz+VlxmZjb2BkbUh5ytGkkOV
X-Received: by 10.140.29.138 with SMTP id b10mr35836242qgb.78.1425923651668;
	Mon, 09 Mar 2015 10:54:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 9 Mar 2015 10:53:51 -0700 (PDT)
In-Reply-To: <CAHUo2cxmz74Mw-z7i9MHB9-tm5srq5jhcG8XYrA8C8qcrQumGw@mail.gmail.com>
References: <CAHUo2cxmz74Mw-z7i9MHB9-tm5srq5jhcG8XYrA8C8qcrQumGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Mar 2015 17:53:51 +0000
Message-ID: <CAJTo0LYJh4GCjb0ewCnZ2RvoNv5WtgxGV5x+a=ogoXWfBL1BeQ@mail.gmail.com>
To: ss infod <ssinfod@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem with mesa_10.1.3.bb for angstrom on i.mx 6
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
X-List-Received-Date: Mon, 09 Mar 2015 17:54:13 -0000
Content-Type: multipart/alternative; boundary=001a113a75a2bc210d0510deb8e5

--001a113a75a2bc210d0510deb8e5
Content-Type: text/plain; charset=UTF-8

On 9 March 2015 at 14:31, ss infod <ssinfod@gmail.com> wrote:

> Is there a way to build my image while disabling the mesa support ? (I
> want a GUI but I don't need the 3D support).
>
> Why is "mesa_10.1.3.bb" failing for this configuration ?
>

You can try disabling opengl by doing DISTRO_FEATURES_remove="opengl" in
your local.conf but some distributions don't actually work with this
disabled, so your mileage may vary.

I'd suggest that this is a BSP/distro problem before an oe-core problem so
you should probably start on the Angstrom/wandaboard lists, where
presumably someone else has seen this.

Ross

--001a113a75a2bc210d0510deb8e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2015 at 14:31, ss infod <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ssinfod@gmail.com" target=3D"_blank">ssinfod@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div>Is there a way to build my image w=
hile disabling the mesa support ? (I want a GUI but I don&#39;t need the 3D=
 support).</div><div><br></div><div>Why is &quot;<a href=3D"http://mesa_10.=
1.3.bb" target=3D"_blank">mesa_10.1.3.bb</a>&quot; failing for this configu=
ration ?</div><div></div></blockquote></div><br>You can try disabling openg=
l by doing DISTRO_FEATURES_remove=3D&quot;opengl&quot; in your local.conf b=
ut some distributions don&#39;t actually work with this disabled, so your m=
ileage may vary.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">I&#39;d suggest that this is a BSP/distro problem before an oe-c=
ore problem so you should probably start on the Angstrom/wandaboard lists, =
where presumably someone else has seen this.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a75a2bc210d0510deb8e5--
