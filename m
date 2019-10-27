Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 85ED17F765
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:12:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p4so7266257wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6CFnBPjVDlXwYd7R2VkEF3SBA+gt1uVebuVh4Zu7ifQ=;
	b=dSFrLOkunkK8xd+bmDTW7AI7WGCU1mi3V6NZYXEsXy7q3cBVj0+w0hH/0K6PFqfH0S
	TRwKZ5rCA172Gkst3IZLxd8TfFkDj7W/mQLN0kqWsxpZNp0KXm6NjbVi9QIS6kY4kiEH
	DNGDPVu6FBtDMHIcqonyxShTgQMsuWOgQzF3GHuC+gickyaHnHqQLsue3quUc9BrveqB
	MHVNNkEkYWQrdqkcMYHFQJHNjrZy3H8fh7OH16c3d34kNnbSU6F3Y7SsmvZDnlYkhZ9p
	MchNLiOH3EpMflCuWEO1ae15eBcOLdN5L7hyRMDF1B3N53IDGLUQsSzTMyF6VvAe1JRb
	iWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6CFnBPjVDlXwYd7R2VkEF3SBA+gt1uVebuVh4Zu7ifQ=;
	b=l/J7DxYJSByjKN+Cz9jj7T+1Zo2sJmTAlQI8tpfQ8UEyGOB5VCiKjBdeCoZ5kWg5ku
	AsB52Z3sb2E0UPW9MAmjFlTHBcST8QVw+Cta0uQa9pjIOng8pYzoPBLEcHRD+YbmmPU/
	/ORi6lfOvpnXbiZwivX1+BBPcxldFVtCvoZfTzg8mHDhTet71wvPlz9ahN3UVikOoIn2
	GJRTCF0JkQeUyJMMR2XhLEKbyGN6Bap5E9lZ4p+GCQQzq47+CCozpYR6XsB3Vkh60s2W
	C7d+HIbh4NxJes7Nb+gWW3GdxcBXglmelPLpinbF79ajcnh4z0vVUui10qdkw9T2z1bk
	7rxQ==
X-Gm-Message-State: APjAAAWb5TzUIG3a5WaK1UzKIIY9z7UPdVYH28+Lt21u0gEooDmzCuOv
	T5rbOH8l44vS1XqS6Fh5LwMJPtoUkdn6LLbkrFE=
X-Google-Smtp-Source: APXvYqwMfBioKMcZGyrqTTNAB67LdSxr3L4mshG95esDrby6sVMFWHzUPGBgfRo++URRRgPlygUgyC3MgHABUSF2jPw=
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr11001762wrp.353.1572189163975;
	Sun, 27 Oct 2019 08:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
In-Reply-To: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 27 Oct 2019 10:12:31 -0500
Message-ID: <CAJdd5GZ=PGC_5WT3P2uG8B0rK8pVK6s9BbNz7R5Yj-BjZ1xXPg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 15:12:43 -0000
Content-Type: multipart/alternative; boundary="000000000000a376c70595e5d0df"

--000000000000a376c70595e5d0df
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 27, 2019, 4:58 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I've been trying to figure out why we get a weird build failure with
> hash equivalence enabled. Armin has also been searching for an odd
> issue with warrior and the qemu tests. I may have a lead.
>
> If you build a standard qemu:
>
> "bitbake qemu-system-native"
>
> and save off the resulting qemu-system-XXX binaries, then add:
>
> PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
> PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"
> PACKAGECONFIG_append_pn-qemu-system-native = " glx"
>
> to local.conf, then:
>
> "bitbake qemu-system-native"
>
> it rebuilds as expected, save off the qemu-system-XXX binaries,
>
> then remove the local.conf entries and:
>
> "bitbake qemu-system-native -c configure -f"
> "bitbake qemu-system-native"
>
> then save off the resulting qemu-system-XXX binaries, you'll find that
> whilst these first and last sets should match, they don't. Its obvious
> with "ldd qemu-system-x86_64" that the linked libraries persist from
> the second to third set when they should not.
>
> The reason is that when configuration changes, autotools.bbclass will
> wipe out ${B} however qemu doesn't use the autotools class and hence B
> is not cleaned for changes in configuration.
>
> We could abstract the pieces of autotools.bbclass which do this into a
> separate class, or, easier, have qemu's do_configure wipe ${B}.
>

Excellent catch. Any thoughts on how might be able to automate detection of
such problems in the reproducible build QA test?


> Armin: This may be the issue you're searching for with warrior?
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a376c70595e5d0df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Oct 27, 2019, 4:58 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;ve be=
en trying to figure out why we get a weird build failure with<br>
hash equivalence enabled. Armin has also been searching for an odd<br>
issue with warrior and the qemu tests. I may have a lead.<br>
<br>
If you build a standard qemu:<br>
<br>
&quot;bitbake qemu-system-native&quot;<br>
<br>
and save off the resulting qemu-system-XXX binaries, then add:<br>
<br>
PACKAGECONFIG_append_pn-qemu-system-native =3D &quot; gtk+&quot;<br>
PACKAGECONFIG_append_pn-qemu-system-native =3D &quot; virglrenderer&quot;<b=
r>
PACKAGECONFIG_append_pn-qemu-system-native =3D &quot; glx&quot;<br>
<br>
to local.conf, then:<br>
<br>
&quot;bitbake qemu-system-native&quot;<br>
<br>
it rebuilds as expected, save off the qemu-system-XXX binaries,<br>
<br>
then remove the local.conf entries and:<br>
<br>
&quot;bitbake qemu-system-native -c configure -f&quot;<br>
&quot;bitbake qemu-system-native&quot;<br>
<br>
then save off the resulting qemu-system-XXX binaries, you&#39;ll find that<=
br>
whilst these first and last sets should match, they don&#39;t. Its obvious<=
br>
with &quot;ldd qemu-system-x86_64&quot; that the linked libraries persist f=
rom<br>
the second to third set when they should not.<br>
<br>
The reason is that when configuration changes, autotools.bbclass will<br>
wipe out ${B} however qemu doesn&#39;t use the autotools class and hence B<=
br>
is not cleaned for changes in configuration.<br>
<br>
We could abstract the pieces of autotools.bbclass which do this into a<br>
separate class, or, easier, have qemu&#39;s do_configure wipe ${B}.<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Excellen=
t catch. Any thoughts on how might be able to automate detection of such pr=
oblems in the reproducible build QA test?</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
Armin: This may be the issue you&#39;re searching for with warrior?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000a376c70595e5d0df--
