Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 184C372F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:05:12 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c85so117151619wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7F7uR8PwQMT2QEpi4ZvDAELiehZ84IwdXi0G/R/XYJU=;
	b=NHv9IvWFLze1ZDA7xbKQpjmUWE9rCinzWrR9NQMG5LAp7Qs3HnQ5mdj6bJ4cHyCI9k
	6iEgy0vaSvam+6X3tIumW2sTqTjDm7eLDujF90XVTQ+qLpUkeSWTr82sD1CkFK72uxm+
	uZ2TYLffJ7woNZD9qsvVcAFjx3U/X2q0OfHWr6sASgBpP7QWwc+vnoYnNydgH3LUpuNC
	A0QP55zJvkN6nbbGecGdXanUvvKE3j8vGOlBaxgdHDrcM/a764Wj8KL7c+YFKYcw4+KD
	rxAAFoPOsyOM3nfcrq63Mrv2LDYpYGL3GJtCZzrzyyHN/jE0RkthKrqsAxhlMzVsGVjp
	zy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7F7uR8PwQMT2QEpi4ZvDAELiehZ84IwdXi0G/R/XYJU=;
	b=JOF4vt/S58Rhc0S0SwFLEB7RX9dbHV1RBwsIDR4BRSaZzxbiUqED1cKS3MwwnkI/BC
	wgmBIPArZQd7RFFravEAmmQNBftYI/2R0dmTStulw9c0haR24bPPNoAYnnoPnwVpDhuo
	YCWlSQTurnw/bxMJh+z+F6+M1IWWQIWQa4amlT1xWFkjDxcTTtJMv0MQEPxna4GZwZfZ
	JIagO73Ef0twAJ+sGaZ2Xz5cI1PDbFtM3ey0KqV486/3+j1Om7Tq1BBFT5FHRNk4+NcX
	cOKQuFGmGQotNgmUH1TjGWGzM3fIveZUR81EjrGm98I18YOFajmfOWN3j9UXFpFRuLj4
	AkYw==
X-Gm-Message-State: AMke39k/vGqApI43IGKzH8rK4QEaCvmQ1SmeESBpVN0JR3rV4ou0RVBw9PoyFwuT3T56+PONL2o5UIoGXepG6g==
X-Received: by 10.28.96.130 with SMTP id u124mr28243961wmb.81.1487696713125;
	Tue, 21 Feb 2017 09:05:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Tue, 21 Feb 2017 09:05:12 -0800 (PST)
In-Reply-To: <20170218001600.GC3276@jama>
References: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
	<20170215085849.GA6218@linux.intel.com> <20170218001600.GC3276@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Feb 2017 18:05:12 +0100
Message-ID: <CA+chaQdeP09KRPPoa3SDyR0vXHfmUo8DF2AJd=2oYpJEZjQHgA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: core-image-tiny-initramfs failing to parse because of WIC (WKS_FULL_PATH, )
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
X-List-Received-Date: Tue, 21 Feb 2017 17:05:14 -0000
Content-Type: multipart/alternative; boundary=001a1148f03a1e950405490d6217

--001a1148f03a1e950405490d6217
Content-Type: text/plain; charset=UTF-8

You asked for bblayers.conf and local.conf on IRC, here it is:

bblayers.conf:
LCONF_VERSION = "7"
TMPDIR := "/OE/build/oe-core"
BBPATH = "${TOPDIR}:${TMPDIR}"
BBLAYERS = "${TOPDIR}/openembedded-core/meta"

local.conf:
empty

and in environment:
BB_ENV_EXTRAWHITE=MACHINE DISTRO http_proxy ftp_proxy https_proxy all_proxy
ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE
BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD
MACHINE=qemux86
DISTRO is empty


On Sat, Feb 18, 2017 at 1:16 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Feb 15, 2017 at 10:58:49AM +0200, Ed Bartosh wrote:
> > Hi Martin,
> >
> > Sorry for the delay. I missedd your message somehow.
> >
> > I can't reproduce this. Tried with latest poky and latest oe-core +
> > bitbake. I built core-image-tiny-initramfs from scratch and bitbake -e
> > busybox works for me just fine.
> >
> > Can you provide more details about your setup, please?
>
> Hi Ed,
>
> I was also having troubles reproducing it in different setup as well,
> until I've
> found out that my local.conf had this line:
>
> IMAGE_FSTYPES_qemux86 = "vmdk"
>
> which prevented ever using wic (USING_WIC variable was always empty).
>
> Now with this line removed I can share the complete exception reproduced
> with just oe-core layer included:
>
> $ bitbake -e core-image-tiny-initramfs | tee env.core-image-tiny-initramfs5
> NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,
> IP: 127.0.0.1, PORT: 38869, PID: 21506
> Parsing recipes...ERROR: ExpansionError during parsing /OE/build/oe-core/
> openembedded-core/meta/recipes-core/images/core-image-tiny-initramfs.bb
> Traceback (most recent call last):
>   File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 412, in
> DataSmart.expandWithRefs(s='\tout="${IMGDEPLOYDIR}/${IMAGE_
> NAME}"\n\twks="${WKS_FULL_PATH}"\n\tif [ -z "$wks" ]; then\n\t\tbbfatal
> "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set
> WKS_FILE or WKS_FILES appropriately."\n\tfi\n\n\tBUILDDIR="${TOPDIR}" wic
> create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e
> "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}\n\tmv
> "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"\n\trm
> -rf "$out/"\n', varname='IMAGE_CMD'):
>                  try:
>     >                s = __expand_var_regexp__.sub(varparse.var_sub, s)
>                      try:
>   File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 111, in
> VariableParse.var_sub(match=<_sre.SRE_Match object; span=(43, 59),
> match='${WKS_FULL_PATH}'>):
>                  else:
>     >                var = self.d.getVarFlag(key, "_content")
>                  self.references.add(key)
>   File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 773, in
> DataSmart.getVarFlag(var='WKS_FULL_PATH', flag='_content', expand=True,
> noweakdefault=False, parsing=False):
>                      cachename = var + "[" + flag + "]"
>     >            value = self.expand(value, cachename)
>
>   File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 436, in
> DataSmart.expand(s="${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}", varname='WKS_FULL_PATH'):
>          def expand(self, s, varname = None):
>     >        return self.expandWithRefs(s, varname).value
>
>   File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 426, in
> DataSmart.expandWithRefs(s="${@wks_search('directdisk.wks
> core-image-tiny-initramfs.wks'.split(), '/OE/build/oe-core/
> openembedded-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p
> in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-core/openembedded-
> core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l
> for l in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-core/openembedded-
> core/meta:/OE/build/oe-core/openembedded-core'.split(':'))}') or ''}",
> varname='WKS_FULL_PATH'):
>                  except Exception as exc:
>     >                raise ExpansionError(varname, s, exc) from exc
>
> bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH,
> expression was ${@wks_search('directdisk.wks core-image-tiny-initramfs.wks'.split(),
> '/OE/build/oe-core/openembedded-core/meta/recipes-core/images:${@':'.join('%s/wic'
> % p for p in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-core/openembedded-
> core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l
> for l in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-core/openembedded-
> core/meta:/OE/build/oe-core/openembedded-core'.split(':'))}') or ''}
> which triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH, line
> 1)
>
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> The strange part of this exception is the unexpanded ${TMPDIR} in the
> WKS_SEARCH_PATH value,
> that lead me to following 2 lines in conf/bblayers.conf:
>
> TMPDIR := "/OE/build/oe-core"
> BBPATH = "${TOPDIR}:${TMPDIR}"
>
> I'm not sure why it appears unexpanded in WKS_SEARCH_PATH, I see you do
> some magick with all these
> WKS_* variables, especially in that anonymous python, but the exception is
> actually from
> expanding IMAGE_CMD_wic () function and it goes away if I remove following
> line from it:
>
>         wks="${WKS_FULL_PATH}"
>
> And it also goes away if I use immediate expansion when setting that
> BBPATH in bblayers.conf.
>
> Interesting variables from bitbake -e with immediate expansion:
> # $BBPATH [4 operations]
> #   immediate /OE/build/oe-core/conf/bblayers.conf:6
> #     "${TOPDIR}:${TMPDIR}"
> #   postdot /OE/build/oe-core/openembedded-core/meta/conf/layer.conf:2
> #     ":${LAYERDIR}"
> #   set data_smart.py:911 [expandVarref]
> #     "/OE/build/oe-core:/OE/build/oe-core:/OE/build/oe-core/
> openembedded-core/meta"
> #   set /OE/build/oe-core/openembedded-core/meta/conf/
> documentation.conf:94
> #     [doc] "Used by BitBake to locate .bbclass and configuration files.
> This variable is analogous to the PATH variable."
> # pre-expansion value:
> #   "/OE/build/oe-core:/OE/build/oe-core:/OE/build/oe-core/
> openembedded-core/meta"
> BBPATH="/OE/build/oe-core:/OE/build/oe-core:/OE/build/oe-
> core/openembedded-core/meta"
>
> # $WKS_SEARCH_PATH
> #   set? /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.
> bbclass:10
> #     "${THISDIR}:${@':'.join('%s/wic' % p for p in
> '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l
> for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> WKS_SEARCH_PATH="/OE/build/oe-core/openembedded-core/meta/
> recipes-core/images:/OE/build/oe-core/wic:/OE/build/oe-core/
> wic:/OE/build/oe-core/openembedded-core/meta/wic:/
> OE/build/oe-core/scripts/lib/wic/canned-wks:/OE/build/oe-
> core/scripts/lib/wic/canned-wks:/OE/build/oe-core/openembedded-core/meta/
> scripts/lib/wic/canned-wks:/OE/build/oe-core/openembedded-
> core/scripts/lib/wic/canned-wks"
>
> # $WKS_FULL_PATH
> #   set /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.
> bbclass:11
> #     "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
> WKS_FULL_PATH="/OE/build/oe-core/openembedded-core/
> scripts/lib/wic/canned-wks/directdisk.wks"
>
> And the same without immediate expansion, but with
> 'wks="${WKS_FULL_PATH}"' line removed so that it doesn't fail to parse:
> # $BBPATH [4 operations]
> #   set /OE/build/oe-core/conf/bblayers.conf:6
> #     "${TOPDIR}:${TMPDIR}"
> #   postdot /OE/build/oe-core/openembedded-core/meta/conf/layer.conf:2
> #     ":${LAYERDIR}"
> #   set data_smart.py:911 [expandVarref]
> #     "${TOPDIR}:${TMPDIR}:/OE/build/oe-core/openembedded-core/meta"
> #   set /OE/build/oe-core/openembedded-core/meta/conf/
> documentation.conf:94
> #     [doc] "Used by BitBake to locate .bbclass and configuration files.
> This variable is analogous to the PATH variable."
> # pre-expansion value:
> #   "${TOPDIR}:${TMPDIR}:/OE/build/oe-core/openembedded-core/meta"
> BBPATH="/OE/build/oe-core:/OE/build/oe-core-glibc:/OE/build/
> oe-core/openembedded-core/meta"
>
> # $WKS_SEARCH_PATH
> #   set? /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.
> bbclass:10
> #     "${THISDIR}:${@':'.join('%s/wic' % p for p in
> '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l
> for l in '${BBPATH}:${COREBASE}'.split(':'))}"
> WKS_SEARCH_PATH="/OE/build/oe-core/openembedded-core/meta/
> recipes-core/images:/OE/build/oe-core/wic:/OE/build/oe-core-
> glibc/wic:/OE/build/oe-core/openembedded-core/meta/wic:/
> OE/build/oe-core/scripts/lib/wic/canned-wks:/OE/build/oe-
> core-glibc/scripts/lib/wic/canned-wks:/OE/build/oe-core/
> openembedded-core/meta/scripts/lib/wic/canned-wks:/
> OE/build/oe-core/openembedded-core/scripts/lib/wic/canned-wks"
>
> # $WKS_FULL_PATH
> #   set /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.
> bbclass:11
> #     "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
> WKS_FULL_PATH="/OE/build/oe-core/openembedded-core/
> scripts/lib/wic/canned-wks/directdisk.wks"
>
> Let me know if sharing "bitbake -e core-image-tiny-initramfs" from these 2
> tests would be useful for you.
>
> Regards,
> >
> > On Thu, Feb 09, 2017 at 09:39:30AM +0100, Martin Jansa wrote:
> > > Running e.g. bitbake -e busybox with latest oe-core triggers this badly
> > > looking exception:
> > >
> > > Can we add some weak assignment for people who don't care about wic
> > > or core-image-tiny-initramfs to continue using oe-core?
> > >
> > > ERROR: ExpansionError during parsing /OE/oe-core/meta/recipes-core/
> images/
> > > core-image-tiny-initramfs.bb
> > > Traceback (most recent call last):
> > >   File "/OE/bitbake/lib/bb/data_smart.py", line 412, in
> > > DataSmart.expandWithRefs(s='\tout="${IMGDEPLOYDIR}/${IMAGE_
> NAME}"\n\twks="${WKS_FULL_PATH}"\n\tif
> > > [ -z "$wks" ]; then\n\t\tbbfatal "No kickstart files from WKS_FILES
> were
> > > found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
> > > appropriately."\n\tfi\n\n\tBUILDDIR="${TOPDIR}" wic create "$wks"
> --vars
> > > "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> > > ${WIC_CREATE_EXTRA_ARGS}\n\tmv "$out/$(basename "${wks%.wks}")"*.direct
> > > "$out${IMAGE_NAME_SUFFIX}.wic"\n\trm -rf "$out/"\n',
> varname='IMAGE_CMD'):
> > >                  try:
> > >     >                s = __expand_var_regexp__.sub(varparse.var_sub,
> s)
> > >                      try:
> > >   File "/OE/bitbake/lib/bb/data_smart.py", line 111, in
> > > VariableParse.var_sub(match=<_sre.SRE_Match object; span=(43, 59),
> > > match='${WKS_FULL_PATH}'>):
> > >                  else:
> > >     >                var = self.d.getVarFlag(key, "_content")
> > >                  self.references.add(key)
> > >   File "/OE/bitbake/lib/bb/data_smart.py", line 773, in
> > > DataSmart.getVarFlag(var='WKS_FULL_PATH', flag='_content',
> expand=True,
> > > noweakdefault=False, parsing=False):
> > >                      cachename = var + "[" + flag + "]"
> > >     >            value = self.expand(value, cachename)
> > >
> > >   File "/OE/bitbake/lib/bb/data_smart.py", line 436, in
> > > DataSmart.expand(s="${@wks_search('${WKS_FILES}'.split(),
> > > '${WKS_SEARCH_PATH}') or ''}", varname='WKS_FULL_PATH'):
> > >          def expand(self, s, varname = None):
> > >     >        return self.expandWithRefs(s, varname).value
> > >
> > >   File "/OE/bitbake/lib/bb/data_smart.py", line 426, in
> > > DataSmart.expandWithRefs(s="${@wks_search('directdisk.wks
> > > core-image-tiny-initramfs.wks'.split(),
> > > '/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p
> in
> > > '/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.
> join('%s/scripts/lib/wic/canned-wks'
> > > % l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}')
> or
> > > ''}", varname='WKS_FULL_PATH'):
> > >                  except Exception as exc:
> > >     >                raise ExpansionError(varname, s, exc) from exc
> > >
> > > bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH,
> > > expression was ${@wks_search('directdisk.wks
> > > core-image-tiny-initramfs.wks'.split(),
> > > '/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p
> in
> > > '/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.
> join('%s/scripts/lib/wic/canned-wks'
> > > % l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}')
> or
> > > ''} which triggered exception SyntaxError: invalid syntax
> (WKS_FULL_PATH,
> > > line 1)
> >
> > --
> > Regards,
> > Ed
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a1148f03a1e950405490d6217
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You asked for bblayers.conf and local.conf on IRC, here it=
 is:<div><br></div><div>bblayers.conf:</div><div><div>LCONF_VERSION =3D &qu=
ot;7&quot;</div><div>TMPDIR :=3D &quot;/OE/build/oe-core&quot;</div><div>BB=
PATH =3D &quot;${TOPDIR}:${TMPDIR}&quot;</div><div>BBLAYERS =3D &quot;${TOP=
DIR}/openembedded-core/meta&quot;</div></div><div><br></div><div>local.conf=
:</div><div>empty</div><div><br></div><div>and in environment:</div><div><d=
iv>BB_ENV_EXTRAWHITE=3DMACHINE DISTRO http_proxy ftp_proxy https_proxy all_=
proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMA=
CHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD</div=
></div><div>MACHINE=3Dqemux86<br></div><div>DISTRO is empty</div><div><br><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat=
, Feb 18, 2017 at 1:16 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Feb 15, 2017 at =
10:58:49AM +0200, Ed Bartosh wrote:<br>
&gt; Hi Martin,<br>
&gt;<br>
&gt; Sorry for the delay. I missedd your message somehow.<br>
&gt;<br>
&gt; I can&#39;t reproduce this. Tried with latest poky and latest oe-core =
+<br>
&gt; bitbake. I built core-image-tiny-initramfs from scratch and bitbake -e=
<br>
&gt; busybox works for me just fine.<br>
&gt;<br>
&gt; Can you provide more details about your setup, please?<br>
<br>
Hi Ed,<br>
<br>
I was also having troubles reproducing it in different setup as well, until=
 I&#39;ve<br>
found out that my local.conf had this line:<br>
<br>
IMAGE_FSTYPES_qemux86 =3D &quot;vmdk&quot;<br>
<br>
which prevented ever using wic (USING_WIC variable was always empty).<br>
<br>
Now with this line removed I can share the complete exception reproduced<br=
>
with just oe-core layer included:<br>
<br>
$ bitbake -e core-image-tiny-initramfs | tee env.core-image-tiny-initramfs5=
<br>
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/<wbr>prserv.sql=
ite3, IP: 127.0.0.1, PORT: 38869, PID: 21506<br>
Parsing recipes...ERROR: ExpansionError during parsing /OE/build/oe-core/<w=
br>openembedded-core/meta/<wbr>recipes-core/images/<a href=3D"http://core-i=
mage-tiny-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">core-<wbr>imag=
e-tiny-initramfs.bb</a><br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/OE/build/oe-core/bitbake/<wbr>lib/bb/data_smart.py&quot;=
, line 412, in DataSmart.expandWithRefs(s=3D&#39;\<wbr>tout=3D&quot;${IMGDE=
PLOYDIR}/${IMAGE_<wbr>NAME}&quot;\n\twks=3D&quot;${WKS_FULL_<wbr>PATH}&quot=
;\n\tif [ -z &quot;$wks&quot; ]; then\n\t\tbbfatal &quot;No kickstart files=
 from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES =
appropriately.&quot;\n\tfi\n\n\<wbr>tBUILDDIR=3D&quot;${TOPDIR}&quot; wic c=
reate &quot;$wks&quot; --vars &quot;${STAGING_DIR}/${MACHINE}/<wbr>imgdata/=
&quot; -e &quot;${IMAGE_BASENAME}&quot; -o &quot;$out/&quot; ${WIC_CREATE_E=
XTRA_ARGS}\n\tmv &quot;$out/$(basename &quot;${wks%.wks}&quot;)&quot;*.dire=
ct &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<wbr>\n\trm -rf &quot;$out/&quot=
;\n&#39;, varname=3D&#39;IMAGE_CMD&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
 =3D __expand_var_regexp__.sub(<wbr>varparse.var_sub, s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0try:<br>
=C2=A0 File &quot;/OE/build/oe-core/bitbake/<wbr>lib/bb/data_smart.py&quot;=
, line 111, in VariableParse.var_sub(match=3D&lt;_<wbr>sre.SRE_Match object=
; span=3D(43, 59), match=3D&#39;${WKS_FULL_PATH}&#39;&gt;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
ar =3D self.d.getVarFlag(key, &quot;_content&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.referenc=
es.add(key)<br>
=C2=A0 File &quot;/OE/build/oe-core/bitbake/<wbr>lib/bb/data_smart.py&quot;=
, line 773, in DataSmart.getVarFlag(var=3D&#39;WKS_<wbr>FULL_PATH&#39;, fla=
g=3D&#39;_content&#39;, expand=3DTrue, noweakdefault=3DFalse, parsing=3DFal=
se):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cachename =3D var + &quot;[&quot; + flag + &quot;]&quot;<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D self.=
expand(value, cachename)<br>
<br>
=C2=A0 File &quot;/OE/build/oe-core/bitbake/<wbr>lib/bb/data_smart.py&quot;=
, line 436, in DataSmart.expand(s=3D&quot;${@wks_<wbr>search(&#39;${WKS_FIL=
ES}&#39;.split(), &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;, varna=
me=3D&#39;WKS_FULL_PATH&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def expand(self, s, varname =3D None):<br=
>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.expandWithRefs(s,=
 varname).value<br>
<br>
=C2=A0 File &quot;/OE/build/oe-core/bitbake/<wbr>lib/bb/data_smart.py&quot;=
, line 426, in DataSmart.expandWithRefs(s=3D&quot;${<wbr>@wks_search(&#39;d=
irectdisk.wks core-image-tiny-initramfs.wks&#39;<wbr>.split(), &#39;/OE/bui=
ld/oe-core/<wbr>openembedded-core/meta/<wbr>recipes-core/images:${@&#39;:&#=
39;.<wbr>join(&#39;%s/wic&#39; % p for p in &#39;/OE/build/oe-core:${TMPDIR=
}:/<wbr>OE/build/oe-core/openembedded-<wbr>core/meta&#39;.split(&#39;:&#39;=
))}:${@&#39;:&#39;<wbr>.join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; %=
 l for l in &#39;/OE/build/oe-core:${TMPDIR}:/<wbr>OE/build/oe-core/openemb=
edded-<wbr>core/meta:/OE/build/oe-core/<wbr>openembedded-core&#39;.split(&#=
39;:&#39;))<wbr>}&#39;) or &#39;&#39;}&quot;, varname=3D&#39;WKS_FULL_PATH&=
#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Except=
ion as exc:<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
aise ExpansionError(varname, s, exc) from exc<br>
<br>
bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH, exp=
ression was ${@wks_search(&#39;directdisk.wks core-image-tiny-initramfs.wks=
&#39;<wbr>.split(), &#39;/OE/build/oe-core/<wbr>openembedded-core/meta/<wbr=
>recipes-core/images:${@&#39;:&#39;.<wbr>join(&#39;%s/wic&#39; % p for p in=
 &#39;/OE/build/oe-core:${TMPDIR}:/<wbr>OE/build/oe-core/openembedded-<wbr>=
core/meta&#39;.split(&#39;:&#39;))}:${@&#39;:&#39;<wbr>.join(&#39;%s/script=
s/lib/wic/<wbr>canned-wks&#39; % l for l in &#39;/OE/build/oe-core:${TMPDIR=
}:/<wbr>OE/build/oe-core/openembedded-<wbr>core/meta:/OE/build/oe-core/<wbr=
>openembedded-core&#39;.split(&#39;:&#39;))<wbr>}&#39;) or &#39;&#39;} whic=
h triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH, line 1)<b=
r>
<br>
<br>
Summary: There was 1 ERROR message shown, returning a non-zero exit code.<b=
r>
<br>
The strange part of this exception is the unexpanded ${TMPDIR} in the WKS_S=
EARCH_PATH value,<br>
that lead me to following 2 lines in conf/bblayers.conf:<br>
<br>
TMPDIR :=3D &quot;/OE/build/oe-core&quot;<br>
BBPATH =3D &quot;${TOPDIR}:${TMPDIR}&quot;<br>
<br>
I&#39;m not sure why it appears unexpanded in WKS_SEARCH_PATH, I see you do=
 some magick with all these<br>
WKS_* variables, especially in that anonymous python, but the exception is =
actually from<br>
expanding IMAGE_CMD_wic () function and it goes away if I remove following =
line from it:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks=3D&quot;${WKS_FULL_PATH}&quot;<br>
<br>
And it also goes away if I use immediate expansion when setting that BBPATH=
 in bblayers.conf.<br>
<br>
Interesting variables from bitbake -e with immediate expansion:<br>
# $BBPATH [4 operations]<br>
#=C2=A0 =C2=A0immediate /OE/build/oe-core/conf/<wbr>bblayers.conf:6<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${TOPDIR}:${TMPDIR}&quot;<br>
#=C2=A0 =C2=A0postdot /OE/build/oe-core/<wbr>openembedded-core/meta/conf/<w=
br>layer.conf:2<br>
#=C2=A0 =C2=A0 =C2=A0&quot;:${LAYERDIR}&quot;<br>
#=C2=A0 =C2=A0set data_smart.py:911 [expandVarref]<br>
#=C2=A0 =C2=A0 =C2=A0&quot;/OE/build/oe-core:/OE/build/<wbr>oe-core:/OE/bui=
ld/oe-core/<wbr>openembedded-core/meta&quot;<br>
#=C2=A0 =C2=A0set /OE/build/oe-core/<wbr>openembedded-core/meta/conf/<wbr>d=
ocumentation.conf:94<br>
#=C2=A0 =C2=A0 =C2=A0[doc] &quot;Used by BitBake to locate .bbclass and con=
figuration files. This variable is analogous to the PATH variable.&quot;<br=
>
# pre-expansion value:<br>
#=C2=A0 =C2=A0&quot;/OE/build/oe-core:/OE/build/<wbr>oe-core:/OE/build/oe-c=
ore/<wbr>openembedded-core/meta&quot;<br>
BBPATH=3D&quot;/OE/build/oe-core:/OE/<wbr>build/oe-core:/OE/build/oe-<wbr>c=
ore/openembedded-core/meta&quot;<br>
<br>
# $WKS_SEARCH_PATH<br>
#=C2=A0 =C2=A0set? /OE/build/oe-core/<wbr>openembedded-core/meta/<wbr>class=
es/image_types_wic.<wbr>bbclass:10<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${THISDIR}:${@&#39;:&#39;.join(&#39;%s/<wbr>wic&=
#39; % p for p in &#39;${BBPATH}&#39;.split(&#39;:&#39;))}:${@&#39;:<wbr>&#=
39;.join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; % l for l in &#39;${B=
BPATH}:${COREBASE}&#39;.split(<wbr>&#39;:&#39;))}&quot;<br>
WKS_SEARCH_PATH=3D&quot;/OE/build/oe-<wbr>core/openembedded-core/meta/<wbr>=
recipes-core/images:/OE/build/<wbr>oe-core/wic:/OE/build/oe-core/<wbr>wic:/=
OE/build/oe-core/<wbr>openembedded-core/meta/wic:/<wbr>OE/build/oe-core/scr=
ipts/lib/<wbr>wic/canned-wks:/OE/build/oe-<wbr>core/scripts/lib/wic/canned-=
<wbr>wks:/OE/build/oe-core/<wbr>openembedded-core/meta/<wbr>scripts/lib/wic=
/canned-wks:/<wbr>OE/build/oe-core/openembedded-<wbr>core/scripts/lib/wic/c=
anned-<wbr>wks&quot;<br>
<br>
# $WKS_FULL_PATH<br>
#=C2=A0 =C2=A0set /OE/build/oe-core/<wbr>openembedded-core/meta/<wbr>classe=
s/image_types_wic.<wbr>bbclass:11<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wbr>split(=
), &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;<br>
WKS_FULL_PATH=3D&quot;/OE/build/oe-<wbr>core/openembedded-core/<wbr>scripts=
/lib/wic/canned-wks/<wbr>directdisk.wks&quot;<br>
<br>
And the same without immediate expansion, but with &#39;wks=3D&quot;${WKS_F=
ULL_PATH}&quot;&#39; line removed so that it doesn&#39;t fail to parse:<br>
# $BBPATH [4 operations]<br>
#=C2=A0 =C2=A0set /OE/build/oe-core/conf/<wbr>bblayers.conf:6<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${TOPDIR}:${TMPDIR}&quot;<br>
#=C2=A0 =C2=A0postdot /OE/build/oe-core/<wbr>openembedded-core/meta/conf/<w=
br>layer.conf:2<br>
#=C2=A0 =C2=A0 =C2=A0&quot;:${LAYERDIR}&quot;<br>
#=C2=A0 =C2=A0set data_smart.py:911 [expandVarref]<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${TOPDIR}:${TMPDIR}:/OE/<wbr>build/oe-core/opene=
mbedded-<wbr>core/meta&quot;<br>
#=C2=A0 =C2=A0set /OE/build/oe-core/<wbr>openembedded-core/meta/conf/<wbr>d=
ocumentation.conf:94<br>
#=C2=A0 =C2=A0 =C2=A0[doc] &quot;Used by BitBake to locate .bbclass and con=
figuration files. This variable is analogous to the PATH variable.&quot;<br=
>
# pre-expansion value:<br>
#=C2=A0 =C2=A0&quot;${TOPDIR}:${TMPDIR}:/OE/<wbr>build/oe-core/openembedded=
-<wbr>core/meta&quot;<br>
BBPATH=3D&quot;/OE/build/oe-core:/OE/<wbr>build/oe-core-glibc:/OE/build/<wb=
r>oe-core/openembedded-core/<wbr>meta&quot;<br>
<br>
# $WKS_SEARCH_PATH<br>
#=C2=A0 =C2=A0set? /OE/build/oe-core/<wbr>openembedded-core/meta/<wbr>class=
es/image_types_wic.<wbr>bbclass:10<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${THISDIR}:${@&#39;:&#39;.join(&#39;%s/<wbr>wic&=
#39; % p for p in &#39;${BBPATH}&#39;.split(&#39;:&#39;))}:${@&#39;:<wbr>&#=
39;.join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39; % l for l in &#39;${B=
BPATH}:${COREBASE}&#39;.split(<wbr>&#39;:&#39;))}&quot;<br>
WKS_SEARCH_PATH=3D&quot;/OE/build/oe-<wbr>core/openembedded-core/meta/<wbr>=
recipes-core/images:/OE/build/<wbr>oe-core/wic:/OE/build/oe-core-<wbr>glibc=
/wic:/OE/build/oe-core/<wbr>openembedded-core/meta/wic:/<wbr>OE/build/oe-co=
re/scripts/lib/<wbr>wic/canned-wks:/OE/build/oe-<wbr>core-glibc/scripts/lib=
/wic/<wbr>canned-wks:/OE/build/oe-core/<wbr>openembedded-core/meta/<wbr>scr=
ipts/lib/wic/canned-wks:/<wbr>OE/build/oe-core/openembedded-<wbr>core/scrip=
ts/lib/wic/canned-<wbr>wks&quot;<br>
<br>
# $WKS_FULL_PATH<br>
#=C2=A0 =C2=A0set /OE/build/oe-core/<wbr>openembedded-core/meta/<wbr>classe=
s/image_types_wic.<wbr>bbclass:11<br>
#=C2=A0 =C2=A0 =C2=A0&quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wbr>split(=
), &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;<br>
WKS_FULL_PATH=3D&quot;/OE/build/oe-<wbr>core/openembedded-core/<wbr>scripts=
/lib/wic/canned-wks/<wbr>directdisk.wks&quot;<br>
<br>
Let me know if sharing &quot;bitbake -e core-image-tiny-initramfs&quot; fro=
m these 2 tests would be useful for you.<br>
<br>
Regards,<br>
&gt;<br>
&gt; On Thu, Feb 09, 2017 at 09:39:30AM +0100, Martin Jansa wrote:<br>
&gt; &gt; Running e.g. bitbake -e busybox with latest oe-core triggers this=
 badly<br>
&gt; &gt; looking exception:<br>
&gt; &gt;<br>
&gt; &gt; Can we add some weak assignment for people who don&#39;t care abo=
ut wic<br>
&gt; &gt; or core-image-tiny-initramfs to continue using oe-core?<br>
&gt; &gt;<br>
&gt; &gt; ERROR: ExpansionError during parsing /OE/oe-core/meta/recipes-cor=
e/<wbr>images/<br>
&gt; &gt; <a href=3D"http://core-image-tiny-initramfs.bb" rel=3D"noreferrer=
" target=3D"_blank">core-image-tiny-initramfs.bb</a><br>
&gt; &gt; Traceback (most recent call last):<br>
&gt; &gt;=C2=A0 =C2=A0File &quot;/OE/bitbake/lib/bb/data_<wbr>smart.py&quot=
;, line 412, in<br>
&gt; &gt; DataSmart.expandWithRefs(s=3D&#39;\<wbr>tout=3D&quot;${IMGDEPLOYD=
IR}/${IMAGE_<wbr>NAME}&quot;\n\twks=3D&quot;${WKS_FULL_<wbr>PATH}&quot;\n\t=
if<br>
&gt; &gt; [ -z &quot;$wks&quot; ]; then\n\t\tbbfatal &quot;No kickstart fil=
es from WKS_FILES were<br>
&gt; &gt; found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES<br>
&gt; &gt; appropriately.&quot;\n\tfi\n\n\<wbr>tBUILDDIR=3D&quot;${TOPDIR}&q=
uot; wic create &quot;$wks&quot; --vars<br>
&gt; &gt; &quot;${STAGING_DIR}/${MACHINE}/<wbr>imgdata/&quot; -e &quot;${IM=
AGE_BASENAME}&quot; -o &quot;$out/&quot;<br>
&gt; &gt; ${WIC_CREATE_EXTRA_ARGS}\n\tmv &quot;$out/$(basename &quot;${wks%=
.wks}&quot;)&quot;*.direct<br>
&gt; &gt; &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<wbr>\n\trm -rf &quot;$ou=
t/&quot;\n&#39;, varname=3D&#39;IMAGE_CMD&#39;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try=
:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 s =3D __expand_var_regexp__.sub(<wbr>varparse.var_sub, s)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 try:<br>
&gt; &gt;=C2=A0 =C2=A0File &quot;/OE/bitbake/lib/bb/data_<wbr>smart.py&quot=
;, line 111, in<br>
&gt; &gt; VariableParse.var_sub(match=3D&lt;_<wbr>sre.SRE_Match object; spa=
n=3D(43, 59),<br>
&gt; &gt; match=3D&#39;${WKS_FULL_PATH}&#39;&gt;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 els=
e:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 var =3D self.d.getVarFlag(key, &quot;_content&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.references.add(key)<br>
&gt; &gt;=C2=A0 =C2=A0File &quot;/OE/bitbake/lib/bb/data_<wbr>smart.py&quot=
;, line 773, in<br>
&gt; &gt; DataSmart.getVarFlag(var=3D&#39;WKS_<wbr>FULL_PATH&#39;, flag=3D&=
#39;_content&#39;, expand=3DTrue,<br>
&gt; &gt; noweakdefault=3DFalse, parsing=3DFalse):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cachename =3D var + &quot;[&quot; + flag + &quot;]&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
value =3D self.expand(value, cachename)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0File &quot;/OE/bitbake/lib/bb/data_<wbr>smart.py&quot=
;, line 436, in<br>
&gt; &gt; DataSmart.expand(s=3D&quot;${@wks_<wbr>search(&#39;${WKS_FILES}&#=
39;.split(),<br>
&gt; &gt; &#39;${WKS_SEARCH_PATH}&#39;) or &#39;&#39;}&quot;, varname=3D&#3=
9;WKS_FULL_PATH&#39;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def expand(self, s, varname =3D=
 None):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.ex=
pandWithRefs(s, varname).value<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0File &quot;/OE/bitbake/lib/bb/data_<wbr>smart.py&quot=
;, line 426, in<br>
&gt; &gt; DataSmart.expandWithRefs(s=3D&quot;${<wbr>@wks_search(&#39;direct=
disk.wks<br>
&gt; &gt; core-image-tiny-initramfs.wks&#39;<wbr>.split(),<br>
&gt; &gt; &#39;/OE/oe-core/meta/recipes-<wbr>core/images:${@&#39;:&#39;.joi=
n(&#39;%s/<wbr>wic&#39; % p for p in<br>
&gt; &gt; &#39;/OE:${TMPDIR}:/OE/oe-core/<wbr>meta&#39;.split(&#39;:&#39;))=
}:${@&#39;:&#39;.<wbr>join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39;<br>
&gt; &gt; % l for l in &#39;/OE:${TMPDIR}:/OE/oe-core/<wbr>meta:/OE/oe-core=
&#39;.split(&#39;:&#39;))}<wbr>&#39;) or<br>
&gt; &gt; &#39;&#39;}&quot;, varname=3D&#39;WKS_FULL_PATH&#39;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc=
ept Exception as exc:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 raise ExpansionError(varname, s, exc) from exc<br>
&gt; &gt;<br>
&gt; &gt; bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL=
_PATH,<br>
&gt; &gt; expression was ${@wks_search(&#39;directdisk.wks<br>
&gt; &gt; core-image-tiny-initramfs.wks&#39;<wbr>.split(),<br>
&gt; &gt; &#39;/OE/oe-core/meta/recipes-<wbr>core/images:${@&#39;:&#39;.joi=
n(&#39;%s/<wbr>wic&#39; % p for p in<br>
&gt; &gt; &#39;/OE:${TMPDIR}:/OE/oe-core/<wbr>meta&#39;.split(&#39;:&#39;))=
}:${@&#39;:&#39;.<wbr>join(&#39;%s/scripts/lib/wic/<wbr>canned-wks&#39;<br>
&gt; &gt; % l for l in &#39;/OE:${TMPDIR}:/OE/oe-core/<wbr>meta:/OE/oe-core=
&#39;.split(&#39;:&#39;))}<wbr>&#39;) or<br>
&gt; &gt; &#39;&#39;} which triggered exception SyntaxError: invalid syntax=
 (WKS_FULL_PATH,<br>
&gt; &gt; line 1)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; Regards,<br>
&gt; Ed<br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div>

--001a1148f03a1e950405490d6217--
