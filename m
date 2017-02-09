Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C63271E06
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:07:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so19664477wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=resent-from:resent-date:resent-message-id:resent-to:mime-version
	:date:delivered-to:message-id:subject:from:to;
	bh=eo4wcV/lQ19fAeNn7olvBijo0QR0R/dcCEcDLRkuCyE=;
	b=gE92OS40vwbOAWGp8IPIhHqbC/GVqUE1fSy0YWGOmUxcZtWzc+xztDI248vi8f0EW2
	dwBo4OQ0EuqFWvKLrGLdY216QK+sEwVIQpqTimBPHfeQqQknSw6+XI+8OX1WGuEnNKKK
	BdPCg56kquWkJnnPVFvJkUu7/y8pboRscNibvFvC+8pR5Sa8reEXjZCYoyjPOp+l1s7U
	ebfTBSlBFN5oHh/5GMK/bcu3i72j9hqVC6JhYl2FHYeHX7dmsAS61bwUhZD3rOVcs7yR
	y0Vy4YRpvE3UGN/GuCMech1ViTU/5WwTxOmxZanpIV5vgn46Li3I9zI49CaHzLhwoHaz
	e1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:mime-version:date:delivered-to:message-id:subject:from:to;
	bh=eo4wcV/lQ19fAeNn7olvBijo0QR0R/dcCEcDLRkuCyE=;
	b=KzfN6s7nfZ7TPEv4uSjDEaBwXMvfT2D2WdwjhnmPAx0EaZw1PdDL+BER8psTApWRXp
	3Q1ofAVBl3inn19v5dPnysTFEVb9fAh7iEm+Gtsw/VVsb0wpzQy2frfgH6wJt0MJRqrv
	rGE4bDWG0/vERQUCYi15OzP3+ADBuqKMI4yaHYo1t9k83UsWNtVD77Awzc8avaDEKNpe
	Q/ob9dpa5Je397YUvcVd248BLp4h3iU0IazETqRSXZ3qtf2XVMpzHg6e9jdVFFrlZC0H
	xovfdvjPZDn5ot9g6S7dp4LloOrNyINGp8fJTEELADGJ+cuWuYdzRFjGPkgN3IEr65ax
	wy9w==
X-Gm-Message-State: AMke39knWNr5leROMp9qNDPjImRVTdRAclkudM4XOFbFnq4IKXfFiEh0XZWggUjKwL4Hig==
X-Received: by 10.28.69.28 with SMTP id s28mr36031066wma.40.1486994848136;
	Mon, 13 Feb 2017 06:07:28 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v67sm13956283wrc.45.2017.02.13.06.07.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 06:07:27 -0800 (PST)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Mon, 13 Feb 2017 15:07:29 +0100
Resent-Message-ID: <20170213140729.GB3280@jama>
Resent-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 9 Feb 2017 00:39:30 -0800 (PST)
Date: Thu, 9 Feb 2017 09:39:30 +0100
Message-ID: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-TUID: JvrFL90mc5cg
Subject: core-image-tiny-initramfs failing to parse because of WIC (WKS_FULL_PATH, )
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
X-List-Received-Date: Mon, 13 Feb 2017 14:07:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c0dd5167ad6e2054814eb2d

--94eb2c0dd5167ad6e2054814eb2d
Content-Type: text/plain; charset=UTF-8

Running e.g. bitbake -e busybox with latest oe-core triggers this badly
looking exception:

Can we add some weak assignment for people who don't care about wic
or core-image-tiny-initramfs to continue using oe-core?

ERROR: ExpansionError during parsing /OE/oe-core/meta/recipes-core/images/
core-image-tiny-initramfs.bb
Traceback (most recent call last):
  File "/OE/bitbake/lib/bb/data_smart.py", line 412, in
DataSmart.expandWithRefs(s='\tout="${IMGDEPLOYDIR}/${IMAGE_NAME}"\n\twks="${WKS_FULL_PATH}"\n\tif
[ -z "$wks" ]; then\n\t\tbbfatal "No kickstart files from WKS_FILES were
found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
appropriately."\n\tfi\n\n\tBUILDDIR="${TOPDIR}" wic create "$wks" --vars
"${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
${WIC_CREATE_EXTRA_ARGS}\n\tmv "$out/$(basename "${wks%.wks}")"*.direct
"$out${IMAGE_NAME_SUFFIX}.wic"\n\trm -rf "$out/"\n', varname='IMAGE_CMD'):
                 try:
    >                s = __expand_var_regexp__.sub(varparse.var_sub, s)
                     try:
  File "/OE/bitbake/lib/bb/data_smart.py", line 111, in
VariableParse.var_sub(match=<_sre.SRE_Match object; span=(43, 59),
match='${WKS_FULL_PATH}'>):
                 else:
    >                var = self.d.getVarFlag(key, "_content")
                 self.references.add(key)
  File "/OE/bitbake/lib/bb/data_smart.py", line 773, in
DataSmart.getVarFlag(var='WKS_FULL_PATH', flag='_content', expand=True,
noweakdefault=False, parsing=False):
                     cachename = var + "[" + flag + "]"
    >            value = self.expand(value, cachename)

  File "/OE/bitbake/lib/bb/data_smart.py", line 436, in
DataSmart.expand(s="${@wks_search('${WKS_FILES}'.split(),
'${WKS_SEARCH_PATH}') or ''}", varname='WKS_FULL_PATH'):
         def expand(self, s, varname = None):
    >        return self.expandWithRefs(s, varname).value

  File "/OE/bitbake/lib/bb/data_smart.py", line 426, in
DataSmart.expandWithRefs(s="${@wks_search('directdisk.wks
core-image-tiny-initramfs.wks'.split(),
'/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
'/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
% l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}') or
''}", varname='WKS_FULL_PATH'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc) from exc

bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH,
expression was ${@wks_search('directdisk.wks
core-image-tiny-initramfs.wks'.split(),
'/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
'/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
% l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}') or
''} which triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH,
line 1)

--94eb2c0dd5167ad6e2054814eb2d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Running e.g. bitbake -e busybox with latest oe-core trigge=
rs this badly looking exception:<div><br></div><div>Can we add some weak as=
signment for people who don&#39;t care about wic or=C2=A0core-image-tiny-in=
itramfs to continue using oe-core?</div><div><br></div><div><div>ERROR: Exp=
ansionError during parsing /OE/oe-core/meta/recipes-core/images/<a href=3D"=
http://core-image-tiny-initramfs.bb">core-image-tiny-initramfs.bb</a></div>=
<div>Traceback (most recent call last):</div><div>=C2=A0 File &quot;/OE/bit=
bake/lib/bb/data_smart.py&quot;, line 412, in DataSmart.expandWithRefs(s=3D=
&#39;\tout=3D&quot;${IMGDEPLOYDIR}/${IMAGE_NAME}&quot;\n\twks=3D&quot;${WKS=
_FULL_PATH}&quot;\n\tif [ -z &quot;$wks&quot; ]; then\n\t\tbbfatal &quot;No=
 kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FI=
LE or WKS_FILES appropriately.&quot;\n\tfi\n\n\tBUILDDIR=3D&quot;${TOPDIR}&=
quot; wic create &quot;$wks&quot; --vars &quot;${STAGING_DIR}/${MACHINE}/im=
gdata/&quot; -e &quot;${IMAGE_BASENAME}&quot; -o &quot;$out/&quot; ${WIC_CR=
EATE_EXTRA_ARGS}\n\tmv &quot;$out/$(basename &quot;${wks%.wks}&quot;)&quot;=
*.direct &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;\n\trm -rf &quot;$out/&quo=
t;\n&#39;, varname=3D&#39;IMAGE_CMD&#39;):</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:</div><div>=C2=A0 =C2=A0 &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D __expand_var_r=
egexp__.sub(varparse.var_sub, s)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:</div><div>=C2=A0 File &qu=
ot;/OE/bitbake/lib/bb/data_smart.py&quot;, line 111, in VariableParse.var_s=
ub(match=3D&lt;_sre.SRE_Match object; span=3D(43, 59), match=3D&#39;${WKS_F=
ULL_PATH}&#39;&gt;):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0else:</div><div>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var =3D self.d.getVarFlag(key, &quot;_co=
ntent&quot;)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0self.references.add(key)</div><div>=C2=A0 File &quot;/OE/bitbake/=
lib/bb/data_smart.py&quot;, line 773, in DataSmart.getVarFlag(var=3D&#39;WK=
S_FULL_PATH&#39;, flag=3D&#39;_content&#39;, expand=3DTrue, noweakdefault=
=3DFalse, parsing=3DFalse):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cachename =3D var + &quot;[&quot; =
+ flag + &quot;]&quot;</div><div>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0value =3D self.expand(value, cachename)</div><div><br><=
/div><div>=C2=A0 File &quot;/OE/bitbake/lib/bb/data_smart.py&quot;, line 43=
6, in DataSmart.expand(s=3D&quot;${@wks_search(&#39;${WKS_FILES}&#39;.split=
(), &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;, varname=3D&#39;WKS_=
FULL_PATH&#39;):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def expand(sel=
f, s, varname =3D None):</div><div>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return self.expandWithRefs(s, varname).value</div><div><br></div><div=
>=C2=A0 File &quot;/OE/bitbake/lib/bb/data_smart.py&quot;, line 426, in Dat=
aSmart.expandWithRefs(s=3D&quot;${@wks_search(&#39;directdisk.wks core-imag=
e-tiny-initramfs.wks&#39;.split(), &#39;/OE/oe-core/meta/recipes-core/image=
s:${@&#39;:&#39;.join(&#39;%s/wic&#39; % p for p in &#39;/OE:${TMPDIR}:/OE/=
oe-core/meta&#39;.split(&#39;:&#39;))}:${@&#39;:&#39;.join(&#39;%s/scripts/=
lib/wic/canned-wks&#39; % l for l in &#39;/OE:${TMPDIR}:/OE/oe-core/meta:/O=
E/oe-core&#39;.split(&#39;:&#39;))}&#39;) or &#39;&#39;}&quot;, varname=3D&=
#39;WKS_FULL_PATH&#39;):</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0except Exception as exc:</div><div>=C2=A0 =C2=A0 &g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ExpansionEr=
ror(varname, s, exc) from exc</div><div><br></div><div>bb.data_smart.Expans=
ionError: Failure expanding variable WKS_FULL_PATH, expression was ${@wks_s=
earch(&#39;directdisk.wks core-image-tiny-initramfs.wks&#39;.split(), &#39;=
/OE/oe-core/meta/recipes-core/images:${@&#39;:&#39;.join(&#39;%s/wic&#39; %=
 p for p in &#39;/OE:${TMPDIR}:/OE/oe-core/meta&#39;.split(&#39;:&#39;))}:$=
{@&#39;:&#39;.join(&#39;%s/scripts/lib/wic/canned-wks&#39; % l for l in &#3=
9;/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core&#39;.split(&#39;:&#39;))}&#39;=
) or &#39;&#39;} which triggered exception SyntaxError: invalid syntax (WKS=
_FULL_PATH, line 1)</div></div><div><br></div></div>

--94eb2c0dd5167ad6e2054814eb2d--
