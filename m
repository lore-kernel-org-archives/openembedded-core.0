Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZZHJ-0007rV-4b
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 05:08:54 +0200
Received: by eaal1 with SMTP id l1so1553958eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 19:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=XvRIHjxbgFDn5vOx+hdjMJX3HIWoiKvoH30NZhn5jM8=;
	b=jrGJL06AzZ46+AVfsilJihF7Obnutf8N2VTIdHgHMYpBhoUgEFOBufKiuvefdcf9Gp
	Y0303JWzyY5P5/DuO+eQrpRGPtLydLTOwkCaTtHAyfybrt65ju5pkuyXX9h+WLUu70z5
	dTvKt4G4hYbTMckHHIb/MXakFKoai21PHbiabFcRUeEy1FQuCLlrDf+7aLYujc40Xb11
	O/yP637iOdwHhsXKRYZ+WNE8zo8TP6dvFaU3fChCohBSb7P7oZm4X9XzagiXWWvTTRfB
	lQW+/2EEwiFLmpDayLW2EOQ2sCtzfvR27nBChNQzlWL5qxXjFBpi6lCREm0k/sdqzZDK
	I3Ng==
Received: by 10.14.95.1 with SMTP id o1mr5198220eef.77.1338346714708; Tue, 29
	May 2012 19:58:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 29 May 2012 19:58:04 -0700 (PDT)
In-Reply-To: <3B761AC4-FE90-45BB-912C-4114A3214843@gmail.com>
References: <3B761AC4-FE90-45BB-912C-4114A3214843@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2012 19:58:04 -0700
Message-ID: <CAMKF1sr4y=0ohuQKwhR8pxNUvBa1pE0zNDevgTYKY4iox4Xx6Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-ti: ERROR: Unable to parse /tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
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
X-List-Received-Date: Wed, 30 May 2012 03:08:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2012 at 1:18 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> Hi,
> =C2=A0 =C2=A0 =C2=A0When building with the latest meta-ti layer, I get th=
e following error:
>
> ERROR: Unable to analyse format of PR variable: b =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =C2=A000:01:18
> ERROR: Unable to parse /tool/yocto/meta-ti/recipes-bsp/powervr-drivers/om=
ap3-sgx-modules_4.05.00.03.bb
> Traceback (most recent call last):
> =C2=A0File "/tool/yocto/poky/bitbake/lib/bb/parse/ast.py", line 381, in m=
ulti_finalize(fn=3D'/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-s=
gx-modules_4.05.00.03.bb', d=3D<bb.data_smart.DataSmart object at 0x337efd0=
>):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0finalize(fn, d)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.parse.SkipPackage as e:
> =C2=A0File "/tool/yocto/poky/bitbake/lib/bb/parse/ast.py", line 323, in f=
inalize(fn=3D'/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-mod=
ules_4.05.00.03.bb', d=3D<bb.data_smart.DataSmart object at 0x337efd0>, var=
iant=3DNone):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code.append("%s(d)" % funcname)
> =C2=A0 =C2=A0> =C2=A0 =C2=A0bb.utils.simple_exec("\n".join(code), {"d": d=
})
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.update_data(d)
> =C2=A0File "/tool/yocto/poky/bitbake/lib/bb/utils.py", line 274, in simpl=
e_exec(code=3D'__anon_119__tool_yocto_poky_meta_classes_staging_bbclass(d)\=
n__anon_540__tool_yocto_poky_meta_classes_base_bbclass(d)\n__anon_176__tool=
_yocto_poky_meta_classes_package_bbclass(d)\n__anon_1106__tool_yocto_poky_m=
eta_classes_package_rpm_bbclass(d)\n__anon_736__tool_yocto_poky_meta_classe=
s_insane_bbclass(d)\n__anon_20__tool_yocto_poky_meta_classes_debian_bbclass=
(d)\n__anon_52__tool_yocto_poky_meta_classes_sstate_bbclass(d)', context=3D=
{'d': <bb.data_smart.DataSmart object at 0x337efd0>}):
> =C2=A0 =C2=A0 def simple_exec(code, context):
> =C2=A0 =C2=A0> =C2=A0 =C2=A0exec(code, _context, context)
>
> =C2=A0File "<string>", line 2, in <module>
> =C2=A0File "__anon_540__tool_yocto_poky_meta_classes_base_bbclass", line =
75, in __anon_540__tool_yocto_poky_meta_classes_base_bbclass(d=3D<bb.data_s=
mart.DataSmart object at 0x337efd0>)
> AttributeError: 'NoneType' object has no attribute 'group'
>
> ERROR: Command execution failed: Traceback (most recent call last):
> =C2=A0File "/tool/yocto/poky/bitbake/lib/bb/command.py", line 84, in runA=
syncCommand
> =C2=A0 =C2=A0self.cooker.updateCache()
> =C2=A0File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1202, in upd=
ateCache
> =C2=A0 =C2=A0if not self.parser.parse_next():
> =C2=A0File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1671, in par=
se_next
> =C2=A0 =C2=A0self.virtuals +=3D len(result)
> UnboundLocalError: local variable 'result' referenced before assignment
>
>

seems like its some dependency on other layers in meta-ti probably
asking meta-ti@yoctoproject.org would be right

>
> best regards,
>
> Elvis Dowson
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


