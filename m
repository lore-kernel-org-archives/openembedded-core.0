Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.29933.1610952885262913757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 22:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJtsCu89;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: milan.opensource@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id q205so16687740oig.13
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Jan 2021 22:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZJTA6C4Votkzj3q1q6roFIM32hAnfOVFaMTL8p2fpsk=;
        b=gJtsCu89YjbuKkaHuBztWF+FM6SWgFZtO2R8y6ZzegkoGm5hIikXzpLdPP3nSFPt9P
         SkBOqoL3dj1SMaSPvi67keD5eRm22N2j334GfupjyKbRTkwgLYYIxZv7oP8fuJm4S/eh
         MClRmPk4FV/vFBA/21pRmWIcN+B3JH/shBtNbMvTizmoSFPiQSdMRdd+NY2Dr6dt0JAq
         RtAbPakT6SimJc2yn+spybLvo3TZVIOjIb4u4AYlDUr+EMIedwnv4Gzj9LyMJ9d0QF2P
         pkTO9821dtCE446reUx8eKticpYYqcciHTzOVzLCT6e+F+Z60FdloEXjMRWx1MNj75to
         oo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZJTA6C4Votkzj3q1q6roFIM32hAnfOVFaMTL8p2fpsk=;
        b=YO6HME+qz0IBT4P7UA8DBxQFOYo13FoRBoSdLr4IcPvMNod7nnpD39r3P9QTc9ch4M
         kD2+pKSW8H7/0/9YEfLFPH3gbQEXioubmoMbILDp0FEw57PjkWXcjUK8MTwTYpZo/2o8
         ktoWRKNvSrzcqMjmFPqZrKOYI3xXcKcuGeAixJdbqaG5NLh4YosU1dTszjkUloBM8Zit
         Wzv7Emeo2xyMqcqrtMpsJYIiHPqQRq/htTjvDT3RCfuWV38oofTmYd9hJlP+qMaKGMBS
         KJEYFUrW3+W01PXpcmvABMvSMMCK5Io1inagsOwn8d6aDELfZGDPPw3W4hVJvTsjZzKt
         LT9g==
X-Gm-Message-State: AOAM530MgQb+NVUlrFkfqgkSNwlPJU23w7tOaQvUQfRb+vEkSFj8mdHP
	25hwq8hzJXvuADbgc6RyjF55bFGHCt2LOLSg5JpnGWFxBA==
X-Google-Smtp-Source: ABdhPJzGj8MQJCPZSUjkRkBxws3Egj95gzZkhsTqXvYBJ9ywkLD0Y7P0PqBr2kFkh8xQWogiCZM01mQ7Siyni2ruGfw=
X-Received: by 2002:a54:4413:: with SMTP id k19mr12650108oiw.110.1610952884498;
 Sun, 17 Jan 2021 22:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20210112133626.2229251-1-milan.opensource@gmail.com>
In-Reply-To: <20210112133626.2229251-1-milan.opensource@gmail.com>
From: "Milan Shah" <milan.opensource@gmail.com>
Date: Mon, 18 Jan 2021 12:24:32 +0530
Message-ID: <CAKdz3nFCjdLoJtGPCoAWNnSN7TPE5XCFUXa_yVUgVHxs-P0EVg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] manifest.py: Add tests to empty image
To: openembedded-core@lists.openembedded.org
Cc: alejandro.franco@intel.com, paul.eggleton@linux.intel.com, 
	benjamin.esquivel@intel.com, leonardo.sandoval.gonzalez@intel.com, 
	richard.purdie@linuxfoundation.org, akuster@mvista.com, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000006e360a05b92732e6"

--0000000000006e360a05b92732e6
Content-Type: text/plain; charset="UTF-8"

Hi All,

This is a gentle reminder to review this patch.

On Tue, Jan 12, 2021 at 7:06 PM Milan Shah <milan.opensource@gmail.com>
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

--0000000000006e360a05b92732e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>This is a gentle reminder to re=
view this patch.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Jan 12, 2021 at 7:06 PM Milan Shah &lt;<a hre=
f=3D"mailto:milan.opensource@gmail.com">milan.opensource@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">An oe-sel=
ftest test is added to ensure<br>
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
</blockquote></div>

--0000000000006e360a05b92732e6--
