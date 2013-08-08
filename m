Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67D32608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 15:23:56 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so3626191pad.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 08:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oVXmEPAO5rrTy/FWhHN+ztt3fLn1yX5r0v1ZxB58qmU=;
	b=AJ/xbFtyVSHcxyTxchthJT/EOcpzfD3Fe5ZSQ5VHUxBI+nWWV+bPheN+SZkC9uKh7i
	RW8EZ4JfTSMhjjXY1EZ+0xbqFIE2wx1NlTapoUSq5nE01hlDPRGKHEQWskhTLIJucHz0
	rnAnfzV56aBrcIO2VrDOHoYxrqDvMdBT66XL7xkWMQV+JctwyCChJCx7/83aNLXqVtit
	uDTy99shodwU/I/OxtJ1SN9juUi0fn0A42BHGPn4QK8ewMJ/8d+mYsXtdXkBGYk8+noB
	7ocVJBv/GRMly35wctxJEJxBJM6hBdyd5C3OWVrPL1920N3RdasDWpLAslUrBBm02Kpx
	CQgA==
X-Gm-Message-State: ALoCoQmM54mQCvM/EkbNQfHRVR5Ndjco2LwQjUaMheT8/+jVl1pqqJjr8sCH1RHx1PL7t/Z4rJJC
MIME-Version: 1.0
X-Received: by 10.66.155.102 with SMTP id vv6mr6746782pab.89.1375975437352;
	Thu, 08 Aug 2013 08:23:57 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 8 Aug 2013 08:23:57 -0700 (PDT)
In-Reply-To: <1375975325-2752-1-git-send-email-sgw@linux.intel.com>
References: <1375975325-2752-1-git-send-email-sgw@linux.intel.com>
Date: Thu, 8 Aug 2013 16:23:57 +0100
X-Google-Sender-Auth: sBTRSZnq-O6I4kUB5JKyqAibst4
Message-ID: <CAOMwXhMM0nV7_gq__E40fyhck32i5x1qSduFXoUQUXj0CPCqNQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzcode: Fix up tzdata to 2013d
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
X-List-Received-Date: Thu, 08 Aug 2013 15:23:57 -0000
Content-Type: multipart/alternative; boundary=047d7b86e3a829d46904e3713f8d

--047d7b86e3a829d46904e3713f8d
Content-Type: text/plain; charset=ISO-8859-1

Heh, good catch? :)


On Thu, Aug 8, 2013 at 4:22 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/tzcode/tzcode-native_2013d.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013d.bbb/meta/recipes-extended/tzcode/
> tzcode-native_2013d.bb
> index 8dea55e..af21151 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d2
>  # note that we allow for us to use data later than our code version
>  #
>  SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode\
> -           ftp://ftp.iana.org/tz/releases/tzdata2013b.tar.gz;name=tzdata"
> +           ftp://ftp.iana.org/tz/releases/tzdata2013d.tar.gz;name=tzdata"
>
>  SRC_URI[tzdata.md5sum] = "65b6818162230fc02f86f293376c73df"
>  SRC_URI[tzdata.sha256sum] =
> "cd1c96f0676e0edceebc6a418a2222ffb05becb41180dd9f847b9c7cef303b04"
> --
> 1.8.1.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b86e3a829d46904e3713f8d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Heh, good catch? :)</div><div class=3D"gmail_extra"><br><b=
r><div class=3D"gmail_quote">On Thu, Aug 8, 2013 at 4:22 PM, Saul Wold <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">=
sgw@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Saul Wold &lt;<a href=3D"mail=
to:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native_2013d.bb" t=
arget=3D"_blank">tzcode-native_2013d.bb</a> | 2 +-<br>
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native_2=
013d.bb" target=3D"_blank">tzcode-native_2013d.bb</a> b/meta/recipes-extend=
ed/tzcode/<a href=3D"http://tzcode-native_2013d.bb" target=3D"_blank">tzcod=
e-native_2013d.bb</a><br>

index 8dea55e..af21151 100644<br>
--- a/meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native_2013d.bb=
" target=3D"_blank">tzcode-native_2013d.bb</a><br>
+++ b/meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native_2013d.bb=
" target=3D"_blank">tzcode-native_2013d.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/README;md5=3Dd=
7a19b8c6d8a28785c4cd04ff2e46d2<br>
=A0# note that we allow for us to use data later than our code version<br>
=A0#<br>
=A0SRC_URI =3D&quot; <a href=3D"ftp://ftp.iana.org/tz/releases/tzcode${PV}.=
tar.gz;name=3Dtzcode" target=3D"_blank">ftp://ftp.iana.org/tz/releases/tzco=
de${PV}.tar.gz;name=3Dtzcode</a> \<br>
- =A0 =A0 =A0 =A0 =A0 <a href=3D"ftp://ftp.iana.org/tz/releases/tzdata2013b=
.tar.gz;name=3Dtzdata" target=3D"_blank">ftp://ftp.iana.org/tz/releases/tzd=
ata2013b.tar.gz;name=3Dtzdata</a>&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 <a href=3D"ftp://ftp.iana.org/tz/releases/tzdata2013d=
.tar.gz;name=3Dtzdata" target=3D"_blank">ftp://ftp.iana.org/tz/releases/tzd=
ata2013d.tar.gz;name=3Dtzdata</a>&quot;<br>
<br>
=A0SRC_URI[tzdata.md5sum] =3D &quot;65b6818162230fc02f86f293376c73df&quot;<=
br>
=A0SRC_URI[tzdata.sha256sum] =3D &quot;cd1c96f0676e0edceebc6a418a2222ffb05b=
ecb41180dd9f847b9c7cef303b04&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7b86e3a829d46904e3713f8d--
