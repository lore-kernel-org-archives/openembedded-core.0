Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id DFAC9780AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 17:04:17 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m83so5189166ioi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cwyUFclDq2pPhcMR55rCP7qYOucKuwN1BksquBH3r4E=;
	b=OSDb69rGpLavdKr03yQX24BJxjz42KdoL2r1k5sjt0uLZBuw/wfTZmAdeVAS3v0PIr
	v4qEgQ9S01b1KKFSjRkod+EkPf2SykEjo5UAwgdIHJVy4MUs4g7TxyMCKE+/Qjr+Zzbo
	LZ6RlIZqYWKHDew8TAWs/aELS7RrwyTZKNl7bu0DKhEda+Wa7RyP5ZllqudXCfCGZTlm
	79YAJh8diF2l/gk5TiD25iBWi7TLgruZAvh1YG44t4f0LdqI3jyGguHnLt6AXzJWmcFo
	ehGdktnyR4Jy2sx8y4hugkgc5gIOS6hrQereWXvIuiUbCbwGav0T2+0+OrWYkrwkvDeA
	Tj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cwyUFclDq2pPhcMR55rCP7qYOucKuwN1BksquBH3r4E=;
	b=qwaZccBeHHqV2lvL2/GZeIFCHh7UOmnxxOPsEhiowkyhBvhOvXyhB+qUV6T83UU1Nl
	vPv0VF9PiM8b2+rJeNTeYSDx8st2z0x96BHPxgSNRPIy096kGJEZCoKf0s7m3k2y04MY
	TfS8O2rfrVSXi+X9OUHnX7hgxRkw3KQSJspXj6W+OhQ1oSrQNoV7Z1K61WfqApJ4uAPk
	MnqTk6HcOPpbJo9HyQYGSCWh6VBxMsn7+2HpU1yoDgxgTA5/ZxZJe+kteRr2XL8cgf+m
	Bb3vsttoMKo3aQ3kAXr8f47YJCvBoiowhhIWo3D6/w00nnTgZH4YEtMhLVsUe2m9G9LU
	yZsw==
X-Gm-Message-State: AElRT7GHFxISOe6ZUkkOh1qZ+L+o4TSec8s7kBCNeDYrH+FKnxj55Ung
	3WS+b4UoAOacQiU+n+OI2/KiB2zYNUXHYSjEI5RJvw==
X-Google-Smtp-Source: AG47ELvHP80Krls4hx4JTuDOg3dgzmVGamEgIeHK0J63RSLpDsLYz95YBaOFe68Qgai/LNNHyNtBOiX6h7AzBQi9HtA=
X-Received: by 10.107.6.231 with SMTP id f100mr5846808ioi.23.1521047059133;
	Wed, 14 Mar 2018 10:04:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 14 Mar 2018 10:03:58 -0700 (PDT)
In-Reply-To: <1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
References: <1519721818-32415-1-git-send-email-anuj.mittal@intel.com>
	<1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Mar 2018 17:03:58 +0000
Message-ID: <CAJTo0LYQXYX9LxWdhyWXi19o2LP7Lha9=Fs-N1k=-M-e7Roc=w@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer: enable ptest support
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
X-List-Received-Date: Wed, 14 Mar 2018 17:04:18 -0000
Content-Type: multipart/alternative; boundary="001a113f9be4a5a62d0567625d61"

--001a113f9be4a5a62d0567625d61
Content-Type: text/plain; charset="UTF-8"

On 28 February 2018 at 02:51, Anuj Mittal <anuj.mittal@intel.com> wrote:

> +diff --git a/Makefile.am b/Makefile.am
> +index de057c4..42e90fe 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -96,6 +96,9 @@ check-torture:
> +
> + build-checks:
> +       $(MAKE) -C tests/check build-checks
> ++
> ++install-ptest:
> ++      $(MAKE) -C tests/check DESTDIR=$(DESTDIR) $@
> + else
> + check-valgrind:
>
+       echo "'check' library not installed, skipping"
>

I'd say not to bother patching the top-level and instead call the right
makefile from do_install_ptest.

++install-ptest: $(TESTS)
> ++      @$(INSTALL) -d $(DESTDIR)
> ++      @for dir in gst libs tools pipelines elements generic; do \
> ++              if [ -x $$dir/.libs ]; then \
> ++                      $(INSTALL) -d $(DESTDIR)/$$dir; \
> ++                      $(INSTALL_PROGRAM) $$dir/.libs/*
> $(DESTDIR)/$$dir/; \
> ++              fi \
> ++      done
>

Can this do string functions on TESTS instead of hard-coding the list of
directories?

Ross

--001a113f9be4a5a62d0567625d61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 February 2018 at 02:51, Anuj Mittal <span dir=3D"ltr=
">&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mitta=
l@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div =
class=3D"h5">+diff --git a/Makefile.am b/Makefile.am<br>
+index de057c4..42e90fe 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -96,6 +96,9 @@ check-torture:<br>
+<br>
+ build-checks:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C tests/check build-checks<br>
++<br>
++install-ptest:<br>
++=C2=A0 =C2=A0 =C2=A0 $(MAKE) -C tests/check DESTDIR=3D$(DESTDIR) $@<br>
+ else<br>
+ check-valgrind:<span style=3D"color:rgb(34,34,34)">=C2=A0</span></div></d=
iv></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div c=
lass=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;&#39;check&#39; library =
not installed, skipping&quot;<br>
</div></div></blockquote><div>=C2=A0</div><div>I&#39;d say not to bother pa=
tching the top-level and instead call the right makefile from do_install_pt=
est.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZ=
b"><div class=3D"h5">++install-ptest: $(TESTS)<br>
++=C2=A0 =C2=A0 =C2=A0 @$(INSTALL) -d $(DESTDIR)<br>
++=C2=A0 =C2=A0 =C2=A0 @for dir in gst libs tools pipelines elements generi=
c; do \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x $$dir/.libs ]; t=
hen \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(INSTALL) -d $(DESTDIR)/$$dir; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(INSTALL_PROGRAM) $$dir/.libs/* $(DESTDIR)/$$dir/; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \<br>
++=C2=A0 =C2=A0 =C2=A0 done<br></div></div></blockquote><div><br></div><div=
>Can this do string functions on TESTS instead of hard-coding the list of d=
irectories?</div><div><br></div><div>Ross</div></div></div></div>

--001a113f9be4a5a62d0567625d61--
