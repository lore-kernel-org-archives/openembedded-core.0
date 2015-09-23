Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 740FC76903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:12:17 +0000 (UTC)
Received: by vkfp126 with SMTP id p126so29428921vkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LIIVqflDpdXQv1F9wNayWenX669B1aD+GiuNUIwrwN4=;
	b=Rw2fadSCTSVzpRwtj3oEp6IHGGrAA5bQSvTMXQft51HujWMt5SPIn+MmZ1PCUDrjUc
	00y8VYQ65s85ChQrPNEtSAGyDAdjBGFXb7fZqQYsCTrZ0hUD327Y0KDeQy3Uy7T2T/cs
	kHVY6432QIfFlK0EajejnUm3y2MI5tSx65ohoOmZ+gZOCuotVXsa3v8GTZlNf6ad00Rc
	EUMAZsFm+xFAOicCfbjOAiKy/GAvHOqu8mg8Mp02lmf9Dbl4WfQNg0R67HnYVFWOix/y
	jWMyt/ZjKFHogOJ3teD04YJviTkr7Md1uDem4e7WCvX/t74SEtXuqTdfSIafYefokeoR
	Iv4A==
X-Received: by 10.31.52.140 with SMTP id b134mr19944219vka.136.1443021137816; 
	Wed, 23 Sep 2015 08:12:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Wed, 23 Sep 2015 08:11:58 -0700 (PDT)
In-Reply-To: <1442998964-15233-2-git-send-email-george.l.musat@intel.com>
References: <1442998964-15233-1-git-send-email-george.l.musat@intel.com>
	<1442998964-15233-2-git-send-email-george.l.musat@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Sep 2015 08:11:58 -0700
X-Google-Sender-Auth: 3o2ocWEFuwBUMbh1zbJKMBxyNr4
Message-ID: <CABcZAN=KLH1yKR1iNgZqegvUWOZF-AyKSJusC5q6v3VQ1EzkFQ@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/runexported: Removed DEPLOY_DIR as mandatory.
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
X-List-Received-Date: Wed, 23 Sep 2015 15:12:19 -0000
Content-Type: multipart/alternative; boundary=001a1143f92452b4cf05206b8a84

--001a1143f92452b4cf05206b8a84
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 2:02 AM, Lucian Musat <george.l.musat@intel.com>
wrote:

> We don't need DEPLOY_DIR for every runtime test so there is no
> need for it to be mandatory.
>
> Signed-off-by: Lucian Musat <george.l.musat@intel.com>
> ---
>  meta/lib/oeqa/runexported.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
> index 96442b1..7d68965 100755
> --- a/meta/lib/oeqa/runexported.py
> +++ b/meta/lib/oeqa/runexported.py
> @@ -112,7 +112,7 @@ def main():
>          d["DEPLOY_DIR"] = options.deploy_dir
>      else:
>          if not os.path.isdir(d["DEPLOY_DIR"]):
> -            raise Exception("The path to DEPLOY_DIR does not exists: %s"
> % d["DEPLOY_DIR"])
> +            print "WARNING: The path to DEPLOY_DIR does not exist: %s" %
> d["DEPLOY_DIR"]
>

First, we generally use loggers / the bb messaging commands instead of
print. Assuming that's not appropriate here for some reason, at least use
the print function, not the print command, to make the python more forward
portable. The command no longer works in future versions of python.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143f92452b4cf05206b8a84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 23, 2015 at 2:02 AM, Lucian Musat <span dir=3D"ltr">&lt;<a href=
=3D"mailto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":j5=
" class=3D"a3s" style=3D"overflow:hidden">We don&#39;t need DEPLOY_DIR for =
every runtime test so there is no<br>
need for it to be mandatory.<br>
<br>
Signed-off-by: Lucian Musat &lt;<a href=3D"mailto:george.l.musat@intel.com"=
>george.l.musat@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runexported.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py<br=
>
index 96442b1..7d68965 100755<br>
--- a/meta/lib/oeqa/runexported.py<br>
+++ b/meta/lib/oeqa/runexported.py<br>
@@ -112,7 +112,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d[&quot;DEPLOY_DIR&quot;] =3D options.dep=
loy_dir<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.isdir(d[&quot;DEPLOY_DIR&q=
uot;]):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&quot;The path t=
o DEPLOY_DIR does not exists: %s&quot; % d[&quot;DEPLOY_DIR&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;WARNING: The path to=
 DEPLOY_DIR does not exist: %s&quot; % d[&quot;DEPLOY_DIR&quot;]</div></blo=
ckquote></div><br>First, we generally use loggers / the bb messaging comman=
ds instead of print. Assuming that&#39;s not appropriate here for some reas=
on, at least use the print function, not the print command, to make the pyt=
hon more forward portable. The command no longer works in future versions o=
f python.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1143f92452b4cf05206b8a84--
