Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2E52865C66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:18:01 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id m20so1047088qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 07:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=c53ofQG0vY6Ez1/iogkgPeOVoeHoTwJkT63fBD+GMuw=;
	b=HAaldupksEZ8uM0S4h4NNQ2QG7u+lWTPFpQMnMaxgMwHa4zXyy8jOdaeRddaSvCY6W
	rPibz1Us/IeSLrwpq/YTz7t4KUhcCbBfY6m+FJUM7um8pRsLeMPGXpuaXcAKv2sYZW6V
	sMyo2CYgzmD2mzWeNW/X5j7txmH+WlX/JJuoeYkiYw2NN6QAGLHzvUT7/bkYT6slC24r
	rO3uyzJuac2QifvlgNUacP4miubO+NwxrGNqp5B8pZFwrHC4zn9YQg3RdutnUPF8TTeB
	06oNWqe/pz15ObGqcaoMwjFCAomY//J73mUngotNnWDrIWPBw48CWBabBMFbazTBdwxi
	iHOA==
X-Gm-Message-State: ALoCoQkdk3XauH0g893laQgWJRDduDYq/ZYYRy8zmGfZlxNnGJC9YyAeEsdyoNoKdK22GOekmU/g
X-Received: by 10.140.94.168 with SMTP id g37mr5153969qge.80.1420643881782;
	Wed, 07 Jan 2015 07:18:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 7 Jan 2015 07:17:41 -0800 (PST)
In-Reply-To: <1420233904-26745-2-git-send-email-max.oss.09@gmail.com>
References: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
	<1420233904-26745-2-git-send-email-max.oss.09@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 15:17:41 +0000
Message-ID: <CAJTo0LaTaRFC=HzC9qeU6DOnxso5re66wYvhdRdUyPdVwPkJ2g@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCH 1/3] libfm: update to 1.2.3
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
X-List-Received-Date: Wed, 07 Jan 2015 15:18:08 -0000
Content-Type: multipart/alternative; boundary=001a113a9b34ed29c5050c116d47

--001a113a9b34ed29c5050c116d47
Content-Type: text/plain; charset=UTF-8

Hi Max,

On 2 January 2015 at 21:25, Max Krummenacher <max.oss.09@gmail.com> wrote:

> +do_install_append () {
> +    # remove files which are part of libfm-extra
> +    rm -f ${D}/usr/include/libfm-1.0/fm-xml-file.h
> +    rm -f ${D}/usr/include/libfm-1.0/fm-version.h
> +    rm -f ${D}/usr/include/libfm-1.0/fm-extra.h
> +    rm -f ${D}/usr/lib/pkgconfig/libfm-extra.pc
> +    rm -f ${D}/usr/lib/libfm-extra.so*
> +    rm -f ${D}/usr/lib/libfm-extra.a
> +    rm -f ${D}/usr/lib/libfm-extra.la
> +}
>

Don't use absolute paths such as /usr/lib/ as those paths are not constant
- multilib environments or x32 for example use different values for
${libdir}.

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/150/steps/BuildImages/logs/stdio
is an example of how this can break the build.

Ross

--001a113a9b34ed29c5050c116d47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi M=
ax,</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">On=
 2 January 2015 at 21:25, Max Krummenacher <span dir=3D"ltr">&lt;<a href=3D=
"mailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":273" class=3D"" style=3D"ov=
erflow:hidden">+do_install_append () {<br>
+=C2=A0 =C2=A0 # remove files which are part of <span class=3D"">libfm</spa=
n>-extra<br>
+=C2=A0 =C2=A0 rm -f ${D}/usr/include/<span class=3D"">libfm</span>-1.0/fm-=
xml-file.h<br>
+=C2=A0 =C2=A0 rm -f ${D}/usr/include/<span class=3D"">libfm</span>-1.0/fm-=
version.h<br>
+=C2=A0 =C2=A0 rm -f ${D}/usr/include/<span class=3D"">libfm</span>-1.0/fm-=
extra.h<br>
+=C2=A0 =C2=A0 rm -f ${D}/usr/lib/pkgconfig/<span class=3D"">libfm</span>-e=
xtra.pc<br>
+=C2=A0 =C2=A0 rm -f ${D}/usr/lib/<span class=3D"">libfm</span>-extra.so*<b=
r>
+=C2=A0 =C2=A0 rm -f ${D}/usr/lib/<span class=3D"">libfm</span>-extra.a<br>
+=C2=A0 =C2=A0 rm -f ${D}/usr/lib/<a href=3D"http://libfm-extra.la" target=
=3D"_blank"><span class=3D"">libfm</span>-extra.la</a><br>
+}</div></blockquote></div><br>Don&#39;t use absolute paths such as /usr/li=
b/ as those paths are not constant - multilib environments or x32 for examp=
le use different values for ${libdir}.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra"><a href=3D"https://autobuilder.yoctoprojec=
t.org/main/builders/nightly-x32/builds/150/steps/BuildImages/logs/stdio">ht=
tps://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/150/ste=
ps/BuildImages/logs/stdio</a> is an example of how this can break the build=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113a9b34ed29c5050c116d47--
