Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SxDhc-0000vb-Fn
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 10:57:48 +0200
Received: by yenl13 with SMTP id l13so506202yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 01:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=Qh6fMj89v7IRzgIVD1+CAPRr//GVucSIfH8uyF5sLMY=;
	b=N72g9pURFt+w6qS61QH7rsqng8CbU7ly14WbcpWTkQvKARKM4DJWwoDcMiEY/3KEst
	XnUH+dUAJzjE6ZHkQE5H9LAuyRwyKwyujltX7V3ElTAnDsueH7hx5DfVEBlKkqL+11iO
	gZTDUt8W0xWuQcagJB5vNiWi49k5Yw0B03aqkXTCskHgBmxmi4X91EKs6dyzzRk3DX7K
	sHTBhqVGUtifZgBSABSVE0gbynwOWaU7ZMhtmyiVhLV4GizPKXwXbeX7T4P2hdNV+/Oh
	1cBftyZgntx3+sVWuhw8aBlsE6nE54te58AUF1Tuy03rzIgHBcd2AaIubcjAOE+HmF/P
	Bi+w==
Received: by 10.42.132.1 with SMTP id b1mr1644647ict.8.1343983567156; Fri, 03
	Aug 2012 01:46:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Fri, 3 Aug 2012 01:45:46 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <501B8F3A.8000309@intel.com>
References: <501B8F3A.8000309@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 3 Aug 2012 11:45:46 +0300
Message-ID: <CAK18fxFeUezS1VEfN+z24_0NYn7nn+w3p=HyDQ_EigJ8qForgw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmshEzP0ztfDrOo+hZbJi23gxq+VVZSPW24LeddUi3KIc2ZcDZ+rt9PgGPPqPDZoyWXe23x
Subject: Re: while trying to update u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 08:57:48 -0000
Content-Type: multipart/alternative; boundary=90e6ba3fd4f91ab6cc04c6588f98

--90e6ba3fd4f91ab6cc04c6588f98
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 3, 2012 at 11:43 AM, Radu Moisan <radu.moisan@intel.com> wrote:

>  I found the following code in u-boot.inc
>
> if not d.getVar("UBOOT_MACHINE", True):
>     PN = d.getVar("PN", True)
>     FILE = os.path.basename(d.getVar("FILE", True))
>     bb.debug(1, "To build %s, see %s for instructions on \
>                     setting up your machine config" % (PN, FILE))
>     raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
>
> and while I don't have UBOOT_MACHINE set, u-boot still follows with no
> problems through do_fetch, do_configure, do_compile and so on, and finishes
> without any problem/error. I would have expected to be skipped as the above
> code snipped would imply, but I cannot find that log message anywhere (nor
> any error to indicate failure). Can somebody point me in the right
> direction with this?
>
>
Are you sure that variable is not set somewhere? Gave it a try on a machine
with no u-boot defined:

ERROR: Nothing PROVIDES 'u-boot'
ERROR: u-boot was skipped: because UBOOT_MACHINE is not set
ERROR: u-boot was skipped: because UBOOT_MACHINE is not set
ERROR: u-boot was skipped: because UBOOT_MACHINE is not set

ag

--90e6ba3fd4f91ab6cc04c6588f98
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 3, 2012 at 11:43 AM, Radu Moisan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_blan=
k">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">


 =20

   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    I found the following code in u-boot.inc<br>
    <br>
    <small><font face=3D"Droid Sans Mono">if not d.getVar(&quot;UBOOT_MACHI=
NE&quot;,
        True):<br>
        =A0=A0=A0 PN =3D d.getVar(&quot;PN&quot;, True)<br>
        =A0=A0=A0 FILE =3D os.path.basename(d.getVar(&quot;FILE&quot;, True=
))<br>
        =A0=A0=A0 bb.debug(1, &quot;To build %s, see %s for instructions on=
 \<br>
        =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 setting up your m=
achine config&quot; % (PN,
        FILE))<br>
        =A0=A0=A0 raise bb.parse.SkipPackage(&quot;because UBOOT_MACHINE is=
 not
        set&quot;)</font></small><br>
    <br>
    and while I don&#39;t have UBOOT_MACHINE set, u-boot still follows with
    no problems through do_fetch, do_configure, do_compile and so on,
    and finishes without any problem/error. I would have expected to be
    skipped as the above code snipped would imply, but I cannot find
    that log message anywhere (nor any error to indicate failure). Can
    somebody point me in the right direction with this?<span class=3D"HOEnZ=
b"><font color=3D"#888888"><br>
    </font></span></div><div bgcolor=3D"#FFFFFF" text=3D"#000000"><br></div=
></blockquote><div>=A0</div><div>Are you sure that variable is not set some=
where? Gave it a try on a machine with no u-boot defined:</div><div><br></d=
iv>

<div><div>ERROR: Nothing PROVIDES &#39;u-boot&#39;</div><div>ERROR: u-boot =
was skipped: because UBOOT_MACHINE is not set</div><div>ERROR: u-boot was s=
kipped: because UBOOT_MACHINE is not set</div><div>ERROR: u-boot was skippe=
d: because UBOOT_MACHINE is not set</div>

</div></div><br><div>ag</div>

--90e6ba3fd4f91ab6cc04c6588f98--
