Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5B66460778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:02:03 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id y33so111012823qta.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VCB5/to1I9bUDWZeZ7gvRGVIgN2GkGICGh56J+Jeb/c=;
	b=mZBQng+tvm5e5mfV9wQk7trK8PO+QPT5ouEWmvkjMmFiAccayJcca34Gq5OfLfkuil
	fi+En73bZQU4xHlS0VdumxoKe4nfiqW+BkhtA5FZ5NuGUaaSwUQEK4jmlpkK+jvstQyc
	HVp7/pTPbHVaAQ8sdfxFStdViE8HpOsEXZTiGPWebsHqVqDCsQONZt02eyU+bJPkUkXF
	wp+95+f4a9k44gRvtVopL7y7C9GsloRexjHl7hZFDz4ZpspPNI7b/ziqihNGLRC9X1zU
	sABO9kdsCocS0sBrZZMOKGedyj3pahjRrTFXj/htQFRf4aSv5dDuO/vhF0GRDeZyu8lF
	SgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VCB5/to1I9bUDWZeZ7gvRGVIgN2GkGICGh56J+Jeb/c=;
	b=cBv/rutNPp4RQplKFqwd6bBvOjLJyOoNLYxfZfVyQC+q056Uc6uMveElkdI8HOqEX8
	QDTg6VbarHSYSsgEFrKt91oMoF+YX5wOSWg3QwktX4PW458wQt83IVSEsbaMYOcb8Jac
	yAORGQsUxkRkrhJZb0cAOYi/ZxFq9yPss4cTLHGnrkYrSf+GUXNe+E51+O8aTmWO4PDk
	AijWMUVM6daZ7FqbLXRDGpKiSZVWP8XloUGmm8vlAM2/UWG7/h7zfxZZV1UozvU2NQcX
	lVsONwEy6AhHDTzS6kRYL45cLbYVFSqEU5k+xtIz+s5MtJ7tOiMSX29xPACsJIAPIisq
	234w==
X-Gm-Message-State: AN3rC/7vz1Er7yJd4Fj9isuTDzyI3fJLw7KNvJpgVDyR/ThSwvOVSyn3
	SkMslJWb05uKErNLKEYg7anTK1wseII7
X-Received: by 10.200.3.105 with SMTP id w41mr24080569qtg.188.1493035324652;
	Mon, 24 Apr 2017 05:02:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 05:01:44 -0700 (PDT)
In-Reply-To: <1493034871-24823-1-git-send-email-andrej.valek@siemens.com>
References: <1493034871-24823-1-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 13:01:44 +0100
Message-ID: <CAJTo0Lau-Vc_Z1d3mCSPbOp2kjc=Hk95k6SCMxLHOQRrnyMz7Q@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: 2.0.22 -> 2.1.8
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
X-List-Received-Date: Mon, 24 Apr 2017 12:02:05 -0000
Content-Type: multipart/alternative; boundary=f4030435cf5829dc0d054de860a2

--f4030435cf5829dc0d054de860a2
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 12:54, Andrej Valek <andrej.valek@siemens.com> wrote:

> +Fix missing test directory creation.
> +
> +Due to removed makefile.am/in files in test/sample/include
> +directories, output directories are not created in
> +configuration step. Compilation step will fails, when
> +trying to write to non-existing directory.
> +
> +Upstream-Status: Inappropriate [Other]
> +Workaround specific to our build system.


How is this specific to our builds and not just a build race?


> -LIC_FILES_CHKSUM = "file://LICENSE;md5=45c5316ff684bcfe2f9f86d8b1279559"
>
+LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
>

Always explain why the checksum needed changing.

Ross

--f4030435cf5829dc0d054de860a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 April 2017 at 12:54, Andrej Valek <span dir=3D"ltr">=
&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andrej.va=
lek@siemens.com</a>&gt;</span> wrote:<div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
+Fix missing test directory creation.<br>
+<br>
+Due to removed <a href=3D"http://makefile.am/in" rel=3D"noreferrer" target=
=3D"_blank">makefile.am/in</a> files in test/sample/include<br>
+directories, output directories are not created in<br>
+configuration step. Compilation step will fails, when<br>
+trying to write to non-existing directory.<br>
+<br>
+Upstream-Status: Inappropriate [Other]<br>
+Workaround specific to our build system.</blockquote><div><br></div><div>H=
ow is this specific to our builds and not just a build race?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">-LIC_FILES_CHKSUM =3D &quot;file://=
LICENSE;md5=3D<wbr>45c5316ff684bcfe2f9f86d8b12795<wbr>59&quot;<br></blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>17f20574c0b154d12236d=
5fbe964f5<wbr>49&quot;<br></blockquote><div><br></div><div>Always explain w=
hy the checksum needed changing.</div><div><br></div><div>Ross</div></div><=
/div></div>

--f4030435cf5829dc0d054de860a2--
