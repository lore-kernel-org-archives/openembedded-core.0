Return-Path: <walczak.piotr.89@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3D76760125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:39:23 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id u64so8034107lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=9UuzgHmpicAxq4HAFkrHMIAI+EOK//21z3ZQH0TBUaM=;
	b=yMzbiRXqJNJDFa7TG4rC/vz94kCXqqpVuh0aIOWkKdlm9NL8GV+pupD4jsyQAPzBPM
	j49Px1WFeWfQbEX8njTp6Ulg9d6/COVbvrZIxcUSljJxJU9aEbooTu1LujdI+lUAAr9v
	xjeIMm9qcomuAoCQqu6Ng70vW9PiBWjhGjS/ir80eirD7++MMcq3Q6+eevAaNXCxiCHX
	NtGtzsIM/b2ndRVGTrraDNcJm6kqZBH9fxC4mB/yjcfYsV+O44fNsXSlgMAIQvnbm5Ld
	p5Xz4ByS34Bma14aKlhDFvODmakzcebbh4UmuwMPB7jbVqloP/0/QZEyo82Q687B/pNy
	WTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=9UuzgHmpicAxq4HAFkrHMIAI+EOK//21z3ZQH0TBUaM=;
	b=R0YZBdHpOEoFt2GRsRsWJhvxte7b6aN5HZ8iREyZwkJbfFmx9ezqwMxkpDUjyEHpHh
	4D3YwFSOf9oARzxdJZGD2U1Tc8E55RA5GiU3djIkGUOjZsPjzbDXxqoMuYGsSWT8owa4
	VxfxN7dPtQYR10S4yNHXPfpe6X5Vx7jcfE54zcPa12e+9g+tkQQtVyaO3kB0w0v15/dE
	16wJ9a8fbTZjYdgt1xu0aonRUDf/z2btHBRXTUPCKikXQ5F3hgU04xXSyXJzaLsiPGz6
	c+wU0a0Ps98iAN5yyBZ3Z4ViGYUkpNxUgqq/CY+60x11zcIy7rQ16sxnfRNvxSXXcUZS
	dIlQ==
X-Gm-Message-State: AOPr4FW1GB/rvzjqOf4c71vEYVea83Vbw/cXbYpVb/VsR1gN2De8px5HgZhnaeNcnEMYcU/Ov+ich+ZRk1AFVQ==
MIME-Version: 1.0
X-Received: by 10.112.56.33 with SMTP id x1mr744264lbp.46.1461659962995; Tue,
	26 Apr 2016 01:39:22 -0700 (PDT)
Received: by 10.114.28.68 with HTTP; Tue, 26 Apr 2016 01:39:22 -0700 (PDT)
Date: Tue, 26 Apr 2016 10:39:22 +0200
Message-ID: <CAG=7jcpiagFM15vpYqrJZnKgbWK2A-w+SEQvV2nMEzp9QyESOg@mail.gmail.com>
From: Piotr Walczak <walczak.piotr.89@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [devtool] Incrementation of patch number when using devtool update-recipe
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
X-List-Received-Date: Tue, 26 Apr 2016 08:39:26 -0000
Content-Type: multipart/alternative; boundary=001a113491cae077da05315f3a8f

--001a113491cae077da05315f3a8f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Firstly I would like to say hello and thanks for devtool app, it's a killer
feature which improves working with temporary sources a lot!

My question is related to following scenario:
I use the devtool (from poky 2.0.1) to modify sources for specific package
and then to generate patch, the work flow* is:

$ devtool modify <recipe_name> <ext_srcs_path>
$ [performing modifications in sources]
$ git commit -m "<patch_name>"
$ devtool update-recipe <recipe-name> -m patch -n -a <path_to_layer>
$ devtool reset

Let's assume that during one 'modify' session I've committed two patches,
the output is:

=E2=94=9C=E2=94=80=E2=94=80 <package>
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 0001-first-change.patch
=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 0002-second-change.patch
=E2=94=9C=E2=94=80=E2=94=80 recipe_git.bb
=E2=94=94=E2=94=80=E2=94=80 recipe_git.bbappend

At this moment everything works as expected.
Then I push the changes to remote server (code changes to separate upstream
and patches to meta-layer repo).
When I need to add another patch, I start the same procedure:

$ devtool modify <recipe_name> <ext_srcs_path>
$ [src changes]
$ git commit -m "<patch_name>"
$ devtool update-recipe <recipe-name> -m patch -n -a <path_to_layer>

The patch is generated and located in the same place as previous patches,
bbappend is updated, everything is fine. The only problem is that during
this session of 'devtool modify', the patch is named again as
0001-<patch_name>, as a result the output is:

=E2=94=9C=E2=94=80=E2=94=80 <package>
=E2=94=82  =E2=94=9C=E2=94=80=E2=94=80 0001-first-change.patch
=E2=94=82  =E2=94=9C=E2=94=80=E2=94=80 0002-second-change.patch
=E2=94=82  =E2=94=9C=E2=94=80=E2=94=80 0001-third-change.patch
=E2=94=9C=E2=94=80=E2=94=80 recipe_git.bb
=E2=94=94=E2=94=80=E2=94=80 recipe_git.bbappend

It doesn't influence the output image, patches are valid, only the version
number is confusing.
How can I avoid that and generate patch with increased version (0003 in
this case)?

* such a work flow is required due to some constraints (organization
policy) as I currently don't have access to repository from which this
package is being fetched.

Best regards,
Piotr.

--001a113491cae077da05315f3a8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Firstly I would like to =
say hello and thanks for devtool app, it&#39;s a killer feature which impro=
ves working with temporary sources a lot!</div><div><br></div><div>My quest=
ion is related to following scenario:</div><div>I use the devtool (from pok=
y 2.0.1) to modify sources for specific package and then to generate patch,=
 the work flow* is:</div><div><br></div><div>$ devtool modify &lt;recipe_na=
me&gt; &lt;ext_srcs_path&gt;</div><div>$ [performing modifications in sourc=
es]</div><div>$ git commit -m &quot;&lt;patch_name&gt;&quot;</div><div>$ de=
vtool update-recipe &lt;recipe-name&gt; -m patch -n -a &lt;path_to_layer&gt=
;</div><div>$ devtool reset</div><div><br></div><div>Let&#39;s assume that =
during one &#39;modify&#39; session I&#39;ve committed two patches, the out=
put is:</div><div><br></div><div>=E2=94=9C=E2=94=80=E2=94=80 &lt;package&gt=
;</div><div>=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 0001-first-change.patch</=
div><div>=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 0002-second-change.patch</di=
v><div>=E2=94=9C=E2=94=80=E2=94=80 <a href=3D"http://recipe_git.bb">recipe_=
git.bb</a></div><div>=E2=94=94=E2=94=80=E2=94=80 recipe_git.bbappend</div><=
div><br></div><div>At this moment everything works as expected.</div><div>T=
hen I push the changes to remote server (code changes to separate upstream =
and patches to meta-layer repo).</div><div>When I need to add another patch=
, I start the same procedure:</div><div><br></div><div>$ devtool modify &lt=
;recipe_name&gt; &lt;ext_srcs_path&gt;</div><div>$ [src changes]</div><div>=
$ git commit -m &quot;&lt;patch_name&gt;&quot;</div><div>$ devtool update-r=
ecipe &lt;recipe-name&gt; -m patch -n -a &lt;path_to_layer&gt;</div><div><b=
r></div><div>The patch is generated and located in the same place as previo=
us patches, bbappend is updated, everything is fine. The only problem is th=
at during this session of &#39;devtool modify&#39;, the patch is named agai=
n as 0001-&lt;patch_name&gt;, as a result the output is:</div><div><br></di=
v><div>=E2=94=9C=E2=94=80=E2=94=80 &lt;package&gt;</div><div>=E2=94=82 =C2=
=A0=E2=94=9C=E2=94=80=E2=94=80 0001-first-change.patch</div><div>=E2=94=82 =
=C2=A0=E2=94=9C=E2=94=80=E2=94=80 0002-second-change.patch</div><div>=E2=94=
=82 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 0001-third-change.patch</div><div>=E2=
=94=9C=E2=94=80=E2=94=80 <a href=3D"http://recipe_git.bb">recipe_git.bb</a>=
</div><div>=E2=94=94=E2=94=80=E2=94=80 recipe_git.bbappend</div><div><br></=
div><div>It doesn&#39;t influence the output image, patches are valid, only=
 the version number is confusing.</div><div>How can I avoid that and genera=
te patch with increased version (0003 in this case)?</div><div><br></div><d=
iv>* such a work flow is required due to some constraints (organization pol=
icy) as I currently don&#39;t have access to repository from which this pac=
kage is being fetched.</div><div><br></div><div>Best regards,</div><div>Pio=
tr.</div></div>

--001a113491cae077da05315f3a8f--
