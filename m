Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.3428.1612591998130876036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 22:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UCGKRKJn;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: milan.opensource@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a17so9902945ljq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 22:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2RkjAbi/hnLUiyWgbZmOW5tLeppIhybxIpe1KqLdTpk=;
        b=UCGKRKJneYKKZuuibVQtOc4YxFFnElagztIwcRidka80DZ0O9SD9tFVaawLHAMwwNL
         SoFQkivp6iQFSGQyDKaMpUFqlG6lpJQ1ZC4YzTdB+AGRI9Qq5EG/MeectiyIWcDB8eZu
         9E+tJ84C5eZSpp158jiNQtGmgrcK8gvvooPFRqAYiO9s3xu1Ph2gRYm4Naf1ba49CHtE
         ufYABO9p6e/cPE+2REaUn6KqArg8N6XlutGWyHneItlUJm85X/9YblN8j+TpXCD5QkfX
         yd34VL6L4YUlry43byzl/ePksCvLdTxG99MAax9lcqmSGQQmAvTi5xkzgr8X7ibpPBz7
         TkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RkjAbi/hnLUiyWgbZmOW5tLeppIhybxIpe1KqLdTpk=;
        b=WBdS4WsOKzH6tFzAwZ7ojNbFFSgmB+peNXGlcJNg9c4UkUUPydfz5rLI8i3ZBg9jnd
         4XHwpv9zGF/qyHQgzVr+GQM7Esa2n/mR3Ij/lDHXUM4DvoXnQ22dARcvejqswBQWjGx/
         SmupEemwXB+h+FS4DOhoBEYi+7wqcPPxvm0K91rlIrnOb/8OTuJw7o3LyWWtmUTyimLq
         n5RAnpo8ZwPabTt40jMXk4ReJrh2aSWdEXwuyoRsUnO6wStaaeilbVFtDWsI9ABWxrJT
         7jJSgey7VxNEE58Dh2gaa0v8I6B4e6TxxQgDEAZLyHcJFTAoiItZC/ocfec0xMrByrsn
         naBQ==
X-Gm-Message-State: AOAM531fs+Z2V1JFmiLO57nV9fs3WfLb9pObpWa52ggoBK031epH1l6f
	CIo15dFSpkTHTZh+QSBIhqBLpIomDSXzOdarF9qo4659iQ==
X-Google-Smtp-Source: ABdhPJx0thlE3DuLdtL/HBwPW/c3fffoIf5jAcDy+7zdMKfTBVjXXDFuz/3M+3Y30DbFDNmVvu/Fnt39p9cRo0co7hs=
X-Received: by 2002:a2e:9885:: with SMTP id b5mr530461ljj.43.1612591995966;
 Fri, 05 Feb 2021 22:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20210122055805.14834-1-milan.opensource@gmail.com>
In-Reply-To: <20210122055805.14834-1-milan.opensource@gmail.com>
From: "Milan Shah" <milan.opensource@gmail.com>
Date: Sat, 6 Feb 2021 11:43:04 +0530
Message-ID: <CAKdz3nEXkMAJ1C3Hv7TqzwbZGkLqcyfMVmxmhrSJG_kHPEyKYw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] manifest.py: Add tests to empty image
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, akuster@mvista.com, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000165b5805baa4d56e"

--000000000000165b5805baa4d56e
Content-Type: text/plain; charset="UTF-8"

Hi All,

This is a Gentle reminder to review this patch.

Thanks & Regards,
Milan Shah

On Fri, Jan 22, 2021 at 11:28 AM Milan Shah <milan.opensource@gmail.com>
wrote:

> An oe-selftest test is added to ensure
> meta-selftest/recipes-test/images/test-empty-image.bb builds and is empty.
>
> It is just a test that ensures that an empty image has no packages in it
> (i.e. nothing in the manifest)
>
> See [YOCTO #8455] for details.
>
> Signed-off-by: Milan Shah <milan.opensource@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/manifest.py | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/manifest.py
> b/meta/lib/oeqa/selftest/cases/manifest.py
> index 5d13f35468..d9b8612628 100644
> --- a/meta/lib/oeqa/selftest/cases/manifest.py
> +++ b/meta/lib/oeqa/selftest/cases/manifest.py
> @@ -162,3 +162,48 @@ class VerifyManifest(OESelftestTestCase):
>              self.logger.debug(logmsg)
>              self.logger.info(msg)
>              self.fail(logmsg)
> +
> +class VerifyEmptyManifest(OESelftestTestCase):
> +    '''Tests for the manifest files of an empty image'''
> +
> +    @classmethod
> +    def setUpClass(self):
> +
> +        # the setup should bitbake test-empty-image
> +        super(VerifyEmptyManifest, self).setUpClass()
> +        self.buildtarget = 'test-empty-image'
> +        self.classname = 'VerifyEmptyManifest'
> +
> +        self.logger.info("{}: doing bitbake {} as a prerequisite of the
> test"\
> +                .format(self.classname, self.buildtarget))
> +        if bitbake(self.buildtarget).status:
> +            self.logger.debug("{} Failed to setup {}"\
> +                    .format(self.classname, self.buildtarget))
> +            self.skipTest("{}: Cannot setup testing scenario"\
> +                    .format(self.classname))
> +
> +
> +    @classmethod
> +    def test_image_manifest_empty(self):
> +        '''Verifying the image manifest file is empty, this may take a
> build'''
> +
> +        # get manifest location based on target to query about
> +        try:
> +            mdir = VerifyManifest.get_dir_from_bb_var('DEPLOY_DIR_IMAGE',
> +                                                self.buildtarget)
> +            mfilename = get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
> +                    + ".manifest"
> +            mpath = os.path.join(mdir, mfilename)
> +            self.logger.info("Manifest file path is: {}" .format(mpath))
> +
> +            if not os.path.isfile(mpath): raise IOError
> +            if not os.path.getsize(mpath) == 0: raise OSError
> +
> +        except OSError:
> +            raise self.skipTest("{}: manifest file is not empty"\
> +                .format(self.classname))
> +
> +        except IOError:
> +                msg = "{}: Error cannot find manifests in dir:\n{}"\
> +                        .format(self.classname, mdir)
> +                self.fail(msg)
> --
> 2.25.1
>
>

--000000000000165b5805baa4d56e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi All,<div><br></div><div>This is a Gent=
le reminder to review this patch.</div><div><br></div><div>Thanks &amp; Reg=
ards,</div><div>Milan Shah</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 22, 2021 at 11:28 AM Milan Shah=
 &lt;<a href=3D"mailto:milan.opensource@gmail.com">milan.opensource@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">An oe-selftest test is added to ensure<br>
meta-selftest/recipes-test/images/<a href=3D"http://test-empty-image.bb" re=
l=3D"noreferrer" target=3D"_blank">test-empty-image.bb</a> builds and is em=
pty.<br>
<br>
It is just a test that ensures that an empty image has no packages in it<br=
>
(i.e. nothing in the manifest)<br>
<br>
See [YOCTO #8455] for details.<br>
<br>
Signed-off-by: Milan Shah &lt;<a href=3D"mailto:milan.opensource@gmail.com"=
 target=3D"_blank">milan.opensource@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/manifest.py | 45 +++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 45 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selft=
est/cases/manifest.py<br>
index 5d13f35468..d9b8612628 100644<br>
--- a/meta/lib/oeqa/selftest/cases/manifest.py<br>
+++ b/meta/lib/oeqa/selftest/cases/manifest.py<br>
@@ -162,3 +162,48 @@ class VerifyManifest(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.logger.debug(logmsg)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.logg=
er.info" rel=3D"noreferrer" target=3D"_blank">self.logger.info</a>(msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fail(logmsg)<br>
+<br>
+class VerifyEmptyManifest(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 &#39;&#39;&#39;Tests for the manifest files of an empty imag=
e&#39;&#39;&#39;<br>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def setUpClass(self):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the setup should bitbake test-empty-image<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(VerifyEmptyManifest, self).setUpClass()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.buildtarget =3D &#39;test-empty-image&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.classname =3D &#39;VerifyEmptyManifest&#3=
9;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.logger.info" rel=3D"nor=
eferrer" target=3D"_blank">self.logger.info</a>(&quot;{}: doing bitbake {} =
as a prerequisite of the test&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .format(self.class=
name, self.buildtarget))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bitbake(self.buildtarget).status:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.debug(&quot;{} Faile=
d to setup {}&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .for=
mat(self.classname, self.buildtarget))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&quot;{}: Cannot s=
etup testing scenario&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .for=
mat(self.classname))<br>
+<br>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def test_image_manifest_empty(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;Verifying the image manifest fi=
le is empty, this may take a build&#39;&#39;&#39;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # get manifest location based on target to que=
ry about<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mdir =3D VerifyManifest.get_dir_=
from_bb_var(&#39;DEPLOY_DIR_IMAGE&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.buildtarget)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mfilename =3D get_bb_var(&quot;I=
MAGE_LINK_NAME&quot;, self.buildtarget)\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + &q=
uot;.manifest&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mpath =3D os.path.join(mdir, mfi=
lename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">self.logger.info</a>(&quot;Manifes=
t file path is: {}&quot; .format(mpath))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isfile(mpath): ra=
ise IOError<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.getsize(mpath) =
=3D=3D 0: raise OSError<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise self.skipTest(&quot;{}: ma=
nifest file is not empty&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .format(self.class=
name))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;{}: =
Error cannot find manifests in dir:\n{}&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .format(self.classname, mdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(msg)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000165b5805baa4d56e--
