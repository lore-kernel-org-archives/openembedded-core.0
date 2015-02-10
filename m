Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE83A6E218
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 12:52:10 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id b13so28193729qcw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 04:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yfURbtguqe4YnPirmtIMvK99lehHnWIlcXfc/i1BBVA=;
	b=Cv3EzJEcKDIVFtZ/RNDZ55hDS1xDiIcj8eHhMm3ytq3LKQ439szTzflDN6kSlEGITm
	Mg2OVTZiE0ELZf8xcvXYyavh364uny9lbRfV510oc082uIEGTzUd+ShST2qlCQ6LsCAb
	YZ29wZeYwBdflwE9/+i/wUQV+kWBq5NqYqJhW7bGn7ekmIwcbameQfjYdlnkJ4SlOiuh
	xo6NxaGKSAMesILwUjE4PHootWbr7gvwf7DS+kMN03FyaZca2Up3A6e09G0R3MXK09fT
	mwu8F/0A5M2auXoXBIdr1psjPwfOWhJzR+6jTEoUSEUj9SjqQWw1Xc1zzp94Ig12Td58
	dPwQ==
X-Gm-Message-State: ALoCoQm5MVhiSsovhsSJGHXPwebn5wyNx2GLIsTzX+4qjQM70MiRBuyVb0CXWHqTrZHMiLOnjNgO
X-Received: by 10.140.49.5 with SMTP id p5mr50380760qga.15.1423572731851; Tue,
	10 Feb 2015 04:52:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 04:51:51 -0800 (PST)
In-Reply-To: <1423500745-2142-2-git-send-email-ben.shelton@ni.com>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
	<1423500745-2142-2-git-send-email-ben.shelton@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 12:51:51 +0000
Message-ID: <CAJTo0LZqMc=EG0yw08rg=L+eLXadD+uPa4=K5_4oU2LLnHoO-Q@mail.gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Tue, 10 Feb 2015 12:52:14 -0000
Content-Type: multipart/alternative; boundary=001a11351944fe7f8e050ebb5abd

--001a11351944fe7f8e050ebb5abd
Content-Type: text/plain; charset=UTF-8

On 9 February 2015 at 16:52, Ben Shelton <ben.shelton@ni.com> wrote:

>  do_install() {
> -       oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}"
> install_gui
> -       rm ${D}${bindir}/trace-cmd
> -       rm -rf ${D}${datadir}/trace-cmd
> -       rmdir ${D}${datadir}
> +    oe_runmake DESTDIR="${D}" install_gui
> +    rm ${D}${bindir}/trace-cmd
> +    rm -rf ${D}${libdir}/trace-cmd
> +    rmdir ${D}${libdir}
>  }
>

For future reference, shell functions should be tab-indented (Python, 4
spaces).  I've fixed this when merging so there's no need to send a v2.

Ross

--001a11351944fe7f8e050ebb5abd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2015 at 16:52, Ben Shelton <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ben.shelton@ni.com" target=3D"_blank">ben.shelton@ni.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1mf" class=3D"a3s" =
style=3D"overflow:hidden">=C2=A0do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake CC=3D&quot;${CC}&quot; AR=3D&quot;${=
AR}&quot; prefix=3D&quot;${prefix}&quot; DESTDIR=3D&quot;${D}&quot; install=
_gui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/trace-cmd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/trace-cmd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${datadir}<br>
+=C2=A0 =C2=A0 oe_runmake DESTDIR=3D&quot;${D}&quot; install_gui<br>
+=C2=A0 =C2=A0 rm ${D}${bindir}/trace-cmd<br>
+=C2=A0 =C2=A0 rm -rf ${D}${libdir}/trace-cmd<br>
+=C2=A0 =C2=A0 rmdir ${D}${libdir}<br>
=C2=A0}</div></blockquote></div><br>For future reference, shell functions s=
hould be tab-indented (Python, 4 spaces).=C2=A0 I&#39;ve fixed this when me=
rging so there&#39;s no need to send a v2.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11351944fe7f8e050ebb5abd--
