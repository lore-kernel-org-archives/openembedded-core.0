Return-Path: <alexandru.damian@intel.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id EB10660167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 09:42:55 +0000 (UTC)
Received: by obfe9 with SMTP id e9so164912546obf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 02:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4TygU3MLN4qBVP2GUa/bSBXq7ZY+xyn3cHTV6wldEbY=;
	b=b5yID70OnzS2tcIRM1e7ieY63GKcww3amgDpDAyC378sEENR99sVGaiv5xHFAZsJ/2
	XbE/NbHXeaPStAkd2KLSVowgimqPEyzCBjt+VaktQnF2SktN2eecr40wscotQ3LbNdED
	gJ1nO5yLbLPpkZRg4pC7kG/Npe80ims+i8Vh7/5HubRM6uOXxBNx73ZTQ3M/c2ylExoY
	rzOzGgeLS6xtfUh+LgCo2YVXziz3xK4KmfQcK2QBTQu68dBydVNuC43SVWRb1i1J2+IN
	uTHC5bDhngas+vLTZF4ABn7c8CU2lamkxpxheSLevtjOQElhjTowZbo//s623kl47ym6
	k5zg==
X-Gm-Message-State: ALoCoQlIGdxw7GM2CaPildMq4rsO0MvwUW+BpriXOaoxqye3PfEP9t45VPSwU8xc28DK2SRHDsvE
X-Received: by 10.60.220.137 with SMTP id pw9mr22958816oec.47.1429695776416;
	Wed, 22 Apr 2015 02:42:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.131.135 with HTTP; Wed, 22 Apr 2015 02:42:35 -0700 (PDT)
In-Reply-To: <1429694551-29377-1-git-send-email-cristian.iorga@intel.com>
References: <1429694551-29377-1-git-send-email-cristian.iorga@intel.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Wed, 22 Apr 2015 10:42:35 +0100
Message-ID: <CAJ2CSBtE5wyK-Off9p8bZd+HvUt=cezgOPsavyZ5x+5F1mirZQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/toaster: fix bad indent
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
X-List-Received-Date: Wed, 22 Apr 2015 09:42:56 -0000
Content-Type: multipart/alternative; boundary=001a11347f90e3fc8f05144cfc12

--001a11347f90e3fc8f05144cfc12
Content-Type: text/plain; charset=UTF-8

Thank you for spotting this ! :)


Alex

On Wed, Apr 22, 2015 at 10:22 AM, Cristian Iorga <cristian.iorga@intel.com>
wrote:

> oe-selftest --list-classes crashes because
> of a bad indent (see below). Fixed.
>
> systemd-build$ oe-selftest --list-classes
> 2015-04-22 12:12:39,141 - selftest - INFO - Listing all available test
> modules:
> _sstatetests_noauto (hidden)
>  -- SStateBase
>  -- RebuildFromSState
>  --  -- test_sstate_rebuild
>  --  -- test_sstate_relocation
> _toaster (hidden)
> Traceback (most recent call last):
>   File "/mnt/Yo/yoctoproject/poky/scripts/oe-selftest", line 201, in
> <module>
>     ret = main()
>   File "/mnt/Yo/yoctoproject/poky/scripts/oe-selftest", line 157, in main
>     modlib = importlib.import_module(test)
>   File "/usr/lib/python2.7/importlib/__init__.py", line 37, in
> import_module
>     __import__(name)
>   File "/mnt/Yo/yoctoproject/poky/meta/lib/oeqa/selftest/_toaster.py",
> line 438
>     time.sleep(3)
>     ^
> IndentationError: unexpected indent
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/lib/oeqa/selftest/_toaster.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/_toaster.py
> b/meta/lib/oeqa/selftest/_toaster.py
> index 2ed08d2..51ebda3 100644
> --- a/meta/lib/oeqa/selftest/_toaster.py
> +++ b/meta/lib/oeqa/selftest/_toaster.py
> @@ -435,7 +435,7 @@ class Toaster_DB_Tests(ToasterSetup):
>              if k <= 5:
>                  files = zonefilelist[k]
>                  os.system("export TZ="+str(files)+"; python manage.py
> runserver > /dev/null 2>&1 &")
> -                    time.sleep(3)
> +                time.sleep(3)
>                  pid = subprocess.check_output("ps aux | grep
> '[/u]sr/bin/python manage.py runserver' | awk '{print $2}'", shell = True)
>                  if pid:
>                      os.system("kill -9 "+str(pid))
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Alex Damian
Yocto Project
SSG / OTC

--001a11347f90e3fc8f05144cfc12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Thank you for spotting this ! :)<br><br><br></div><div class=3D"=
gmail_default" style=3D"font-family:tahoma,sans-serif">Alex<br></div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 22, 2=
015 at 10:22 AM, Cristian Iorga <span dir=3D"ltr">&lt;<a href=3D"mailto:cri=
stian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">oe-selftest --list-classes c=
rashes because<br>
of a bad indent (see below). Fixed.<br>
<br>
systemd-build$ oe-selftest --list-classes<br>
2015-04-22 12:12:39,141 - selftest - INFO - Listing all available test modu=
les:<br>
_sstatetests_noauto (hidden)<br>
=C2=A0-- SStateBase<br>
=C2=A0-- RebuildFromSState<br>
=C2=A0--=C2=A0 -- test_sstate_rebuild<br>
=C2=A0--=C2=A0 -- test_sstate_relocation<br>
_toaster (hidden)<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/mnt/Yo/yoctoproject/poky/scripts/oe-selftest&quot;, line=
 201, in &lt;module&gt;<br>
=C2=A0 =C2=A0 ret =3D main()<br>
=C2=A0 File &quot;/mnt/Yo/yoctoproject/poky/scripts/oe-selftest&quot;, line=
 157, in main<br>
=C2=A0 =C2=A0 modlib =3D importlib.import_module(test)<br>
=C2=A0 File &quot;/usr/lib/python2.7/importlib/__init__.py&quot;, line 37, =
in import_module<br>
=C2=A0 =C2=A0 __import__(name)<br>
=C2=A0 File &quot;/mnt/Yo/yoctoproject/poky/meta/lib/oeqa/selftest/_toaster=
.py&quot;, line 438<br>
=C2=A0 =C2=A0 time.sleep(3)<br>
=C2=A0 =C2=A0 ^<br>
IndentationError: unexpected indent<br>
<br>
Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@intel.co=
m">cristian.iorga@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/_toaster.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/_toaster.py b/meta/lib/oeqa/selftest/_t=
oaster.py<br>
index 2ed08d2..51ebda3 100644<br>
--- a/meta/lib/oeqa/selftest/_toaster.py<br>
+++ b/meta/lib/oeqa/selftest/_toaster.py<br>
@@ -435,7 +435,7 @@ class Toaster_DB_Tests(ToasterSetup):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k &lt;=3D 5:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D zon=
efilelist[k]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.system(&qu=
ot;export TZ=3D&quot;+str(files)+&quot;; python manage.py runserver &gt; /d=
ev/null 2&gt;&amp;1 &amp;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time=
.sleep(3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(3)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D subpr=
ocess.check_output(&quot;ps aux | grep &#39;[/u]sr/bin/python manage.py run=
server&#39; | awk &#39;{print $2}&#39;&quot;, shell =3D True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pid:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0os.system(&quot;kill -9 &quot;+str(pid))<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr">Alex Damian<div>Yocto Project<br></d=
iv><div>SSG / OTC=C2=A0</div></div></div>
</div>

--001a11347f90e3fc8f05144cfc12--
