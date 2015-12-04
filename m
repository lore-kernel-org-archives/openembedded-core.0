Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id B25B96067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 15:27:04 +0000 (UTC)
Received: by lffu14 with SMTP id u14so114294853lff.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 07:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Q14Vci4IcVfhHmHwgVEnn4reQRETX48DBue3KWaF1Zw=;
	b=slmmknLR9g5gB/Wiau29lEG8yW6stS5e1ZI+a53VfV6RaNjlfJJaz98ov5PMXCALFi
	cqHaqZQATt/8l9UAY5yONjXf9q3Jkn9NWI6YiX2AhodymA8tejtqVS7c0goKpKVA6xlM
	kb128I3T4GGsVrRZYmWHq/WNXmGoV1w1lCJ4C8Bv+jLkkE5ZXy8yHWOu9dc7cDDYtzyE
	nGHF/bz55H4OTvnStR+ZZQrgEd6UsXmAvqP9gdsRpYUbjSgZ+Wct+McyFDkbHuNniN0P
	1XCmMzgMYVPl6MFg198V1sl8GSWrCF+b0iJhWG81IL0bChjAIg+dBevUnRzHeiicMiBb
	N1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Q14Vci4IcVfhHmHwgVEnn4reQRETX48DBue3KWaF1Zw=;
	b=IHY7c8ps9edRRTjl1Lfn/Bo4aQ6+f/QJW7L2JIenofOYrejAdnwNkTyYnTKpMFO94q
	a4AOvVDdciao8GKPFDQ2r7smArHGjGEvIo9ye5rpVEk8IKl8w7MTEa6pUV9kwzXwGlSz
	gvuvl24TcGMlOXyIRFQNtm5DLTAYV3e1yy76/PasYaxqqebl88uTGAeEsm3vysX2pTuK
	tTJbBMJzTFunbPtpcEG9LAT8e/QN6FqDRiY/bfwoTjinlXcvnhF8oqSs6pNVfKW4WGKC
	YMioUIi42Cul8r2pfYRP77DY7o07wzLDhDq7INZPG53WrASH15ac1PDkSB6lhTqWvQsN
	fplg==
X-Gm-Message-State: ALoCoQncmRBiSD99SssRr492wXgyjJHgjXNV1ITgj+lDsLjQVIAwiyyI6H9R0vdQmt6EGYguJn+b
MIME-Version: 1.0
X-Received: by 10.25.41.18 with SMTP id p18mr9070443lfp.75.1449242824460; Fri,
	04 Dec 2015 07:27:04 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Fri, 4 Dec 2015 07:27:04 -0800 (PST)
In-Reply-To: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
Date: Fri, 4 Dec 2015 20:57:04 +0530
Message-ID: <CAD3vsf6MiZ=JRHWzR0ZtQc1O23YyBPTv_rWRcYUm2TAFTSTuWQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Fri, 04 Dec 2015 15:27:06 -0000
Content-Type: multipart/alternative; boundary=001a114120c4bee5ca052614231c

--001a114120c4bee5ca052614231c
Content-Type: text/plain; charset=UTF-8

Ping.
Any updates regarding this patch?

Regards,
Jagadeesh


On Sat, Nov 28, 2015 at 1:39 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> We get below host contamination warnings of license files for
> each recipe, when we try to create a separate ${PN}-lic package (which
> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
> in local.conf.
>
> -- snip --
> WARNING: QA Issue: libcgroup:
> /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by
> uid 5001, which is the same as the user running bitbake. This may be due to
> host contamination [host-user-contaminated]
> WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is
> owned by uid 5001, which is the same as the user running bitbake. This may
> be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is
> owned by uid 5001, which is the same as the user running bitbake. This may
> be due to host contamination [host-user-contaminated]
> -- CUT --
>
> Since the license files from source and OE-core, are populated in a normal
> shell environment rather in pseudo environment (fakeroot); the ownership of
> these files will be same as host user running bitbake. During the
> do_package
> task (which runs in pseudo environment (fakeroot)), os.link preserves the
> ownership of these license files as host user instead of root user.
> This causes license files to have UID same as host user id and resulting in
> above warnings during do_package_qa task.
>
> Changing ownership of license files to root user (which has UID and GID as
> 0)
> under pseudo environment will solve above warnings, and on exiting pseudo
> environment the license files will continue to be owned by host user.
> Perform
> this manipulation within try/except statements, as tasks which are not
> exected
> under pseudo (such as do_populate_lic) result in OSError when trying to
> change ownership of license files.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  meta/classes/license.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index c616a20..8fff156 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -185,6 +185,15 @@ def copy_license_files(lic_files_paths, destdir):
>                  os.remove(dst)
>              if os.access(src, os.W_OK) and (os.stat(src).st_dev ==
> os.stat(destdir).st_dev):
>                  os.link(src, dst)
> +                try:
> +                    os.chown(dst,0,0)
> +                except OSError as err:
> +                    if err.errno == 1:
> +                        # suppress "Operation not permitted" error, as
> +                        # sometimes this function is not executed under
> pseudo
> +                        pass
> +                    else:
> +                        raise
>              else:
>                  shutil.copyfile(src, dst)
>          except Exception as e:
> --
> 1.9.1
>
>

--001a114120c4bee5ca052614231c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div>Any updates regarding this patch?</div><div><br>=
</div><div>Regards,</div><div>Jagadeesh<br><div><br></div></div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Nov 28, 2015 a=
t 1:39 PM, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We get below host=
 contamination warnings of license files for<br>
each recipe, when we try to create a separate ${PN}-lic package (which<br>
contains license files), by setting LICENSE_CREATE_PACKAGE equal to &quot;1=
&quot;<br>
in local.conf.<br>
<br>
-- snip --<br>
WARNING: QA Issue: libcgroup: /libcgroup-lic/usr/share/licenses/libcgroup/g=
eneric_LGPLv2.1 is owned by uid 5001, which is the same as the user running=
 bitbake. This may be due to host contamination [host-user-contaminated]<br=
>
WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is own=
ed by uid 5001, which is the same as the user running bitbake. This may be =
due to host contamination [host-user-contaminated]<br>
WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is owned=
 by uid 5001, which is the same as the user running bitbake. This may be du=
e to host contamination [host-user-contaminated]<br>
-- CUT --<br>
<br>
Since the license files from source and OE-core, are populated in a normal<=
br>
shell environment rather in pseudo environment (fakeroot); the ownership of=
<br>
these files will be same as host user running bitbake. During the do_packag=
e<br>
task (which runs in pseudo environment (fakeroot)), os.link preserves the<b=
r>
ownership of these license files as host user instead of root user.<br>
This causes license files to have UID same as host user id and resulting in=
<br>
above warnings during do_package_qa task.<br>
<br>
Changing ownership of license files to root user (which has UID and GID as =
0)<br>
under pseudo environment will solve above warnings, and on exiting pseudo<b=
r>
environment the license files will continue to be owned by host user. Perfo=
rm<br>
this manipulation within try/except statements, as tasks which are not exec=
ted<br>
under pseudo (such as do_populate_lic) result in OSError when trying to<br>
change ownership of license files.<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/license.bbclass | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<br=
>
index c616a20..8fff156 100644<br>
--- a/meta/classes/license.bbclass<br>
+++ b/meta/classes/license.bbclass<br>
@@ -185,6 +185,15 @@ def copy_license_files(lic_files_paths, destdir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(dst=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.access(src, os.W_OK) =
and (os.stat(src).st_dev =3D=3D os.stat(destdir).st_dev):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.link(src, =
dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.c=
hown(dst,0,0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as =
err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e=
rr.errno =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # suppress &quot;Operation not permitted&quot; error, as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # sometimes this function is not executed under pseudo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfi=
le(src, dst)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a114120c4bee5ca052614231c--
