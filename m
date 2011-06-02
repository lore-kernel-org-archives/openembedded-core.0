Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QS2Ti-0005om-7R
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 09:38:02 +0200
Received: by bwz5 with SMTP id 5so835576bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VlZOwMooi3eOsci4Bg5X6mAoC/l6D8QIskRJZFE8gqs=;
	b=E17tlLqPbLiD3xJt0W8fui020+qVjuCjFq7TMSrJWX94yN3oR9f/jdQoRpjjkUD9HV
	CIANUgDBKHQ0sjhFi9vzwqn8DXTkPuk8rco1Lhs3zV5O95MGpnGKP9+X6cGmxPfjNWbT
	1ElsywGL+5PdGjSdVyYKSusga0S48VE4D1zas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uzuHUkjIC8XDBJuiQb7RnMyjGhuN/OuQ1Kbvv3MmL+EWW+qilY5yN9Z+jLusqkBUoB
	0cctvAEA/+HU5zptP9zsuxhKhinhny9iN+va8GkOlZqe7+B/dRMi9bqBKe/ykNSGzgmx
	XdvO53RjuZ1fltLw1I7p1MSy3QQBf/NjB3tNI=
Received: by 10.204.73.157 with SMTP id q29mr400064bkj.101.1307000090242;
	Thu, 02 Jun 2011 00:34:50 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 16sm245440bkm.2.2011.06.02.00.34.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 00:34:48 -0700 (PDT)
Date: Thu, 2 Jun 2011 09:34:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110602073446.GH3281@jama.jama.net>
References: <4DE56B0D.4020209@intel.com>
MIME-Version: 1.0
In-Reply-To: <4DE56B0D.4020209@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Tell me your build error message annoyances!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2011 07:38:02 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KZLWU/9q3evlN4nQ"
Content-Disposition: inline

--KZLWU/9q3evlN4nQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 03:26:21PM -0700, Scott Garman wrote:
> Hey folks,
>=20
> I'd like to collect some feedback on error messages while building that=
=20
> you find confusing/annoying/unhelpful. I'm going to be working on trying=
=20
> to improve the situation and would like to hear from you about what=20
> could be more helpful.
>=20
> I'm starting to track some of these situations with the following bugs:
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D542
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1127
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1128
>=20
> I can't promise to fix everything you come up with, but I'd like to try=
=20
> to make a dent in some of these issues and improve the usability of our=
=20
> build system.
>=20
> Thanks,
>=20
> Scott

Hi,

I have
PATCHRESOLVE =3D "noop"
in my local.conf, because I prefer it to fail and continue building somethi=
ng else (with -k)=20
instead of waiting for user to resolve it in another screen session

but simple message that patch_do_patch failed because patch wasn't found or=
 didn't apply
without python trace would be much better.

NOTE: Running task 345 of 353 (ID: 1, virtual:native:/OE/shr-core/openembed=
ded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb, do_patch)
NOTE: package gobject-introspection-native-1.29.0+gitr2+8d64bc23d2b837421ec=
f9c7b0e4b8d5d95ca0d21-r4: task do_patch: Started
NOTE: Applying patch 'pathfix.patch' (openembedded-core/meta/recipes-gnome/=
gnome/gobject-introspection/pathfix.patch)
ERROR: Error executing a python function in /OE/shr-core/openembedded-core/=
meta/recipes-gnome/gnome/gobject-introspection_git.bb:
CmdError: Command Error: exit status: 1  Output:
Applying patch pathfix.patch
patching file giscanner/dumper.py
Hunk #1 FAILED at 82.
1 out of 1 hunk FAILED -- rejects in file giscanner/dumper.py
patching file giscanner/scannermain.py
Hunk #1 FAILED at 283.
1 out of 1 hunk FAILED -- rejects in file giscanner/scannermain.py
Patch pathfix.patch does not apply (enforce with -f)

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "patch_do_patch", line 136, in <module>
ERROR:
ERROR:   File "patch_do_patch", line 133, in patch_do_patch
ERROR:
ERROR:   File "/OE/shr-core/openembedded-core/meta/lib/oe/patch.py", line 3=
38, in Resolve
ERROR:     raise sys.exc_value
ERROR:
ERROR: The code that was being executed was:
ERROR:      0132:                       raise bb.build.FuncFailed(str(sys.e=
xc_value))
ERROR:      0133:               resolver.Resolve()
ERROR:      0134:
ERROR:      0135:
ERROR:  *** 0136:patch_do_patch(d)
ERROR:      0137:
ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
ERROR:      0129:                       patchset.Import({"file":local, "rem=
ote":url, "strippath": striplevel}, True)
ERROR:      0130:               except Exception:
ERROR:      0131:                       import sys
ERROR:      0132:                       raise bb.build.FuncFailed(str(sys.e=
xc_value))
ERROR:  *** 0133:               resolver.Resolve()
ERROR:      0134:
ERROR:      0135:
ERROR:      0136:patch_do_patch(d)
ERROR:      0137:
ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
ERROR: Function 'patch_do_patch' failed
ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/x86_64-linux/gob=
ject-introspection-native-1.29.0+gitr2+8d64bc23d2b837421ecf9c7b0e4b8d5d95ca=
0d21-r4/temp/log.do_patch.9995
Log data follows:
| NOTE: Applying patch 'pathfix.patch' (openembedded-core/meta/recipes-gnom=
e/gnome/gobject-introspection/pathfix.patch)
| ERROR: Error executing a python function in /OE/shr-core/openembedded-cor=
e/meta/recipes-gnome/gnome/gobject-introspection_git.bb:
| CmdError: Command Error: exit status: 1  Output:
| Applying patch pathfix.patch
| patching file giscanner/dumper.py
| Hunk #1 FAILED at 82.
| 1 out of 1 hunk FAILED -- rejects in file giscanner/dumper.py
| patching file giscanner/scannermain.py
| Hunk #1 FAILED at 283.
| 1 out of 1 hunk FAILED -- rejects in file giscanner/scannermain.py
| Patch pathfix.patch does not apply (enforce with -f)
|
| ERROR: The stack trace of python calls that resulted in this exception/fa=
ilure was:
| ERROR:   File "patch_do_patch", line 136, in <module>
| ERROR:
| ERROR:   File "patch_do_patch", line 133, in patch_do_patch
| ERROR:
| ERROR:   File "/OE/shr-core/openembedded-core/meta/lib/oe/patch.py", line=
 338, in Resolve
| ERROR:     raise sys.exc_value
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0132:                     raise bb.build.FuncFailed(str(sys.e=
xc_value))
| ERROR:      0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:  *** 0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
| ERROR:      0129:                     patchset.Import({"file":local, "rem=
ote":url, "strippath": striplevel}, True)
| ERROR:      0130:             except Exception:
| ERROR:      0131:                     import sys
| ERROR:      0132:                     raise bb.build.FuncFailed(str(sys.e=
xc_value))
| ERROR:  *** 0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:      0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
| ERROR: Function 'patch_do_patch' failed
NOTE: package gobject-introspection-native-1.29.0+gitr2+8d64bc23d2b837421ec=
f9c7b0e4b8d5d95ca0d21-r4: task do_patch: Failed
ERROR: Task 1 (virtual:native:/OE/shr-core/openembedded-core/meta/recipes-g=
nome/gnome/gobject-introspection_git.bb, do_patch) failed with exit code '1'
ERROR: 'virtual:native:/OE/shr-core/openembedded-core/meta/recipes-gnome/gn=
ome/gobject-introspection_git.bb' failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KZLWU/9q3evlN4nQ--
