Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id E6E4B608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:49:22 +0000 (UTC)
Received: by lfaz4 with SMTP id z4so53808773lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 02:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MX5mlMMTdjm25WzDlH1lQ8KbcN+EEyKnhAM1hIkn/B0=;
	b=XHpuJEium+MeKppnEINjBycep8HWi9N94aMoQiyife6kuAxUCtJ40qHiT9smtdJ9qM
	BsVp+xcsMPubyVW5qH+m9fXqvzIXI0S7IVhRK6OVZ/fNY9tkL7zLV2BvGo2mwlFAYroP
	vcLjD3ZGA/RCTt3ejVmAmlQd8yfwp68E1IwZFgRQUnMpUj5gIGC48pHkbkhCWzb6TCm4
	XcK/oiE3mJ/s6Hr4CsO+Tug0fpDaG6ix81lrV9opHc+a+6hmRdzazEp2bimhDdYjGyOn
	SXom6Io9zc5vKnUG611CeirYFLT1QzCsnLjLsAg8ie4W2jqaziiT9F0Pu8uecLCP93NH
	UQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=MX5mlMMTdjm25WzDlH1lQ8KbcN+EEyKnhAM1hIkn/B0=;
	b=FP6XVCFB2PnBEWVgb1sqQfwJncxtnvxsnqocxvoSIoCI57IcaTpjv0vn81WyV+W87A
	aa6gRWwzAG0n4AyVEMV11zgW5U3eFr6jkxZaQHaLcxeMQlLoNIU76+0KSAPv1T9vLgNY
	DE2eCk/QZB49cNEGZTrzQte3aTQUZmd5mqXqO/tmFbS8vIIrYtdqIeIlbQslFqyDcn7v
	rj/dUivf+RCzRj/8S5H4QyeMnPh+ziwT6sMN18D7v8d3RX0V6FHAl3bdKly17v61mVnl
	reVYBlMj7pHDUyBS9Ahwvb5ynvdV88rVUzkJljOb7e60/m50OS9BkAbr1Eilo2dq9/bX
	v8BA==
X-Gm-Message-State: ALoCoQkbDLje4FJOYI93SOP4z4g9JY0vOKQjnCl6FSKXreLt7mXkwe0XkJHTROhZMI0XD5S+GR9lLxaY8mO5D7ND/Kc8R/Go/SKPfOfdJB+uYOjnvmFby0I=
MIME-Version: 1.0
X-Received: by 10.25.41.18 with SMTP id p18mr5159638lfp.75.1449744562544; Thu,
	10 Dec 2015 02:49:22 -0800 (PST)
Received: by 10.114.59.172 with HTTP; Thu, 10 Dec 2015 02:49:22 -0800 (PST)
In-Reply-To: <CAD3vsf6MiZ=JRHWzR0ZtQc1O23YyBPTv_rWRcYUm2TAFTSTuWQ@mail.gmail.com>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf6MiZ=JRHWzR0ZtQc1O23YyBPTv_rWRcYUm2TAFTSTuWQ@mail.gmail.com>
Date: Thu, 10 Dec 2015 16:19:22 +0530
Message-ID: <CAD3vsf6G9O0nOZV8cyqQSg2Sk3VK3VbpvwzwVdTg+mn5=H_NBw@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Dec 2015 10:49:23 -0000
Content-Type: multipart/alternative; boundary=001a114120c4aa788d052688f5f4

--001a114120c4aa788d052688f5f4
Content-Type: text/plain; charset=UTF-8

Ping again.
Waiting for your feedback.

Regards,
Jagadeesh

On Fri, Dec 4, 2015 at 8:57 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Ping.
> Any updates regarding this patch?
>
> Regards,
> Jagadeesh
>
>
> On Sat, Nov 28, 2015 at 1:39 PM, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> We get below host contamination warnings of license files for
>> each recipe, when we try to create a separate ${PN}-lic package (which
>> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
>> in local.conf.
>>
>> -- snip --
>> WARNING: QA Issue: libcgroup:
>> /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by
>> uid 5001, which is the same as the user running bitbake. This may be due to
>> host contamination [host-user-contaminated]
>> WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is
>> owned by uid 5001, which is the same as the user running bitbake. This may
>> be due to host contamination [host-user-contaminated]
>> WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is
>> owned by uid 5001, which is the same as the user running bitbake. This may
>> be due to host contamination [host-user-contaminated]
>> -- CUT --
>>
>> Since the license files from source and OE-core, are populated in a normal
>> shell environment rather in pseudo environment (fakeroot); the ownership
>> of
>> these files will be same as host user running bitbake. During the
>> do_package
>> task (which runs in pseudo environment (fakeroot)), os.link preserves the
>> ownership of these license files as host user instead of root user.
>> This causes license files to have UID same as host user id and resulting
>> in
>> above warnings during do_package_qa task.
>>
>> Changing ownership of license files to root user (which has UID and GID
>> as 0)
>> under pseudo environment will solve above warnings, and on exiting pseudo
>> environment the license files will continue to be owned by host user.
>> Perform
>> this manipulation within try/except statements, as tasks which are not
>> exected
>> under pseudo (such as do_populate_lic) result in OSError when trying to
>> change ownership of license files.
>>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> ---
>>  meta/classes/license.bbclass | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>> index c616a20..8fff156 100644
>> --- a/meta/classes/license.bbclass
>> +++ b/meta/classes/license.bbclass
>> @@ -185,6 +185,15 @@ def copy_license_files(lic_files_paths, destdir):
>>                  os.remove(dst)
>>              if os.access(src, os.W_OK) and (os.stat(src).st_dev ==
>> os.stat(destdir).st_dev):
>>                  os.link(src, dst)
>> +                try:
>> +                    os.chown(dst,0,0)
>> +                except OSError as err:
>> +                    if err.errno == 1:
>> +                        # suppress "Operation not permitted" error, as
>> +                        # sometimes this function is not executed under
>> pseudo
>> +                        pass
>> +                    else:
>> +                        raise
>>              else:
>>                  shutil.copyfile(src, dst)
>>          except Exception as e:
>> --
>> 1.9.1
>>
>>
>

--001a114120c4aa788d052688f5f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping again.<div>Waiting for your feedback.</div><div><br><=
/div><div>Regards,</div><div>Jagadeesh</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Fri, Dec 4, 2015 at 8:57 PM, Jagadeesh =
Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@mv=
ista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ping.<div>Any updates=
 regarding this patch?</div><div><br></div><div>Regards,</div><div>Jagadees=
h<br><div><br></div></div></div><div class=3D"HOEnZb"><div class=3D"h5"><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Nov 28, 2015=
 at 1:39 PM, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We get below ho=
st contamination warnings of license files for<br>
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
appa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<br>
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
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114120c4aa788d052688f5f4--
