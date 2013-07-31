Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id EB3846A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:13:08 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 10so866997pdc.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=IgxeCNkRn9edNj15ScuG5YyI8Lt2GM56gc0dI6/ZhEY=;
	b=QX0XZQZ1kOxe0PHThQHSX6E1RueygmtBL3RZgewqIyylgOf3Dox9T8ssZeCqApQ9Bj
	J7sUXJb1wMAGXxywfRG3B/jg90XcGLcGNi+15Y3p5RwJJ3WpoIM3kmF4oqTS8wNm9WmU
	61t4/9nE0qYgsnFjvKeEP6/O6uycq/6j+3IXo4+uBERMJB0UlSq2AfkHjEeJvEHeHgSM
	id1KuXl6jtjQJ+BLeUndclJJHkMEOLPnbbE4Bx/Q7kzKXZ5Mq0GRnCt+6mFP5lBYIbZ/
	01mxpeD72xJzWfScR+U8gQYRXnE9XuRxeCZmo8oXgFzK5wzkOtoJowlMN4NJaRZZa5AB
	oosA==
MIME-Version: 1.0
X-Received: by 10.68.163.131 with SMTP id yi3mr81256035pbb.55.1375283589701;
	Wed, 31 Jul 2013 08:13:09 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Wed, 31 Jul 2013 08:13:09 -0700 (PDT)
In-Reply-To: <CAJTo0LbmKQvDG4upqg+0F6XP8CE=Jp9H2NgsJsHnHTExuM=PFQ@mail.gmail.com>
References: <1375276614-24376-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbmKQvDG4upqg+0F6XP8CE=Jp9H2NgsJsHnHTExuM=PFQ@mail.gmail.com>
Date: Wed, 31 Jul 2013 16:13:09 +0100
X-Google-Sender-Auth: SdPXxdp7NcxCkPGxPYkkBfmFa5c
Message-ID: <CAOMwXhOOG+oYxLXWMeqwejjz=+WcJqwfmYDn20BbeqgbSt1JYg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlvDMMw5EsncnlCwhLuzikGIUZaaZC9sAGyPvS85kUiV/1Pn9mFwhKQvvgdl9+oRVcVnenc
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Wed, 31 Jul 2013 15:13:09 -0000
Content-Type: multipart/alternative; boundary=047d7bacb46ed4787304e2d0295b

--047d7bacb46ed4787304e2d0295b
Content-Type: text/plain; charset=ISO-8859-1

Just for the record as I already wrote, there are files already around, and
I would not like to screw up anyone's work and use because I do not know
why they are around. However, that should not be blocking people who need
the new features for their software to operate.

Anyway, I would like to withdraw this change because I do not find my
pleasure about pedantic nitpicking I got on IRC. I think those not only do
not move the project forward, but blocking many people's contribution and
usability for no real gain.

Anyone can grab my change, and do whatever wished with it.


On Wed, Jul 31, 2013 at 2:24 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 31 July 2013 14:16, Laszlo Papp <lpapp@kde.org> wrote:
> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 28
> +++++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 29
> ++++++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 26
> +++++++++++++++++++
> >  3 files changed, 83 insertions(+)
> >  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> >  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> >  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>
> Unless there's a good reason to keep the older version around please
> delete the old files and use the -M option to send-email/format-patch
> so that it detects the rename and sends a minimal diff that is easier
> to review.
>
> If there is a good reason to keep the old version around, please say what
> it is.
>
> Ross
>

--047d7bacb46ed4787304e2d0295b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just for the record as I already wrote, there are files al=
ready around, and I would not like to screw up anyone&#39;s work and use be=
cause I do not know why they are around. However, that should not be blocki=
ng people who need the new features for their software to operate.<div>
<br></div><div>Anyway, I would like to withdraw this change because I do no=
t find my pleasure about pedantic nitpicking I got on IRC. I think those no=
t only do not move the project forward, but blocking many people&#39;s cont=
ribution and usability for no real gain.</div>
<div><br></div><div>Anyone can grab my change, and do whatever wished with =
it.</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">On Wed, Jul 31, 2013 at 2:24 PM, Burton, Ross <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 31 July 2013 14:16, Las=
zlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<=
br>
&gt; Signed-off-by: Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@=
kde.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.07.b=
b" target=3D"_blank">u-boot-fw-utils_2013.07.bb</a> | 28 ++++++++++++++++++=
+++<br>
&gt; =A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb=
" target=3D"_blank">u-boot-mkimage_2013.07.bb</a> =A0| 29 +++++++++++++++++=
+++++<br>
&gt; =A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=
=3D"_blank">u-boot_2013.07.bb</a> =A0 =A0 =A0 =A0 =A0| 26 +++++++++++++++++=
++<br>
&gt; =A03 files changed, 83 insertions(+)<br>
&gt; =A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot=
-fw-utils_2013.07.bb" target=3D"_blank">u-boot-fw-utils_2013.07.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot=
-mkimage_2013.07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot=
_2013.07.bb" target=3D"_blank">u-boot_2013.07.bb</a><br>
<br>
</div>Unless there&#39;s a good reason to keep the older version around ple=
ase<br>
delete the old files and use the -M option to send-email/format-patch<br>
so that it detects the rename and sends a minimal diff that is easier<br>
to review.<br>
<br>
If there is a good reason to keep the old version around, please say what i=
t is.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--047d7bacb46ed4787304e2d0295b--
