Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id BEE836011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:12:16 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id e65so49873740pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 12:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=o5289AQ3JAt9y4cHwP4ToqMINreONjZqSW8xFDxKtbc=;
	b=rCwWTt6B8MUidm3mg9V24AHFkZZ7eS4f7lrYPdBttbU8d4iH0fGNSlbu9cXSROfdeA
	WjhS4BWuZayCHwFvus0oD7FONAmJe+eEAHBG9d2QpsgWt85SqLVAHbKW9vwLuDo1AaBk
	EcmXSBKXRI8RyUe1g06pGjUmQyDGDak86fxeFu6rDaOtr7G1ASmeY7M7ZcH94SHg2HxQ
	1wLdQQ6AcuR+tdlRwmEaBAA4+0p/GRKSHsiWOtai+Du/S/gayuQxoHMP4NKR1X31qSL+
	5wfdA3gEAtUbJ0XhW6Rddkfo1v3lY6M3p84B86EpFcFZvBwIsvTtcFxq7xgV8GekJSYS
	COow==
X-Received: by 10.98.15.207 with SMTP id 76mr28901856pfp.60.1452543137299;
	Mon, 11 Jan 2016 12:12:17 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	r66sm25139034pfr.59.2016.01.11.12.12.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 12:12:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=W7e9GTjpY6-_ryzFz50oNwWj0Z7J-qjKu8xtzAs+ia+g@mail.gmail.com>
Date: Mon, 11 Jan 2016 12:12:12 -0800
Message-Id: <8651587C-FF80-4B9A-8287-3DD5AD06AE76@gmail.com>
References: <1452357775.7598.159.camel@linuxfoundation.org>
	<CAJ86T=WraHEDTL7v7dSCYr4Dwj0xrmu_rLQWTNbotNWCrytOFg@mail.gmail.com>
	<DD2F7F62-3F3D-4456-9C39-6A36CE797CE1@gmail.com>
	<CAJ86T=W7e9GTjpY6-_ryzFz50oNwWj0Z7J-qjKu8xtzAs+ia+g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] sstate: Switch from tgz to tar.xz for sstate
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
X-List-Received-Date: Mon, 11 Jan 2016 20:12:17 -0000
X-Groupsio-MsgNum: 75870
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EFFD4664-C709-4287-B0FB-278C0CC8A713";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EFFD4664-C709-4287-B0FB-278C0CC8A713
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 11, 2016, at 12:00 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Mon, Jan 11, 2016 at 11:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Jan 11, 2016, at 11:05 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> On Sat, Jan 9, 2016 at 8:42 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> xz compresses with a better compression ratio than gz with similar =
speed
>>>> for compression and decompression.
>>>=20
>>> When you measured compression speed to be similar, was that with
>>> parallel compression? If so, with how many CPU cores?
>>>=20
>>> A quick test of plain single threaded "tar -cz" -vs- "tar -cJ" on my
>>> laptop seems to indicate that xz is _significantly_ slower:
>>>=20
>>> $ time tar -czf /tmp/jjj.tgz
>>> tmp/work/cortexa15hf-neon-rdk-linux-gnueabi/glibc/2.22-r0/git
>>>=20
>>> real    0m4.708s
>>> user    0m4.682s
>>> sys    0m0.477s
>>>=20
>>> $ time tar -cJf /tmp/jjj.tar.xz
>>> tmp/work/cortexa15hf-neon-rdk-linux-gnueabi/glibc/2.22-r0/git
>>>=20
>>> real    0m56.491s
>>> user    0m56.489s
>>> sys    0m0.744s
>>=20
>>=20
>> on 8-core machine with pixz it is recovered a bit but still is slow =
tried a small load
>>=20
>>=20
>> tar -cJf /tmp/xx.tar.xz   21.14s user 0.36s system 102% cpu 21.061 =
total
>>=20
>> tar -czf /tmp/xx.tar.gz   2.35s user 0.19s system 109% cpu 2.320 =
total
>>=20
>> tar -Ipixz -cf /tmp/xx.tar.xz   27.14s user 0.88s system 490% cpu =
5.708 total
>>=20
>> When changing the compression level to -3 ( it gets a bit faster )
>>=20
>> pixz -3 /tmp/xx.tar /tmp/xx.tar.xz  17.58s user 0.18s system 606% cpu =
2.927 total
>>=20
>=20
> For a fair comparison, we should probably be testing parallel gzip
> against parallel xz.

its not about speed, all this additional tooling is to achieve more =
compression in same time.

>=20
> In general, I'm not really convinced about this change though. Disk
> space is cheap and always getting cheaper, but builds can never be
> fast enough. Is it really worthwhile to trade off build performance
> for a reduction in sstate disk usage?

if you use sstate mirrors over network then its just not disk but also =
network load involved.
but if the build speed is impacted due to slower comp/decomp then it =
needs to optional rather than default. Since it will not be
a one time thing but will impact every build that a developer/user is =
going to do.

>=20
> Perhaps the sstate compression algorithm should be configurable so
> that people low on disk space can opt into slower builds?
>=20
>=20
>>>=20
>>>> It therefore makes sense to switch
>>>> to it for the sstate objects.
>>>>=20
>>>> As an example, the gcc-cross populate_sysroot object goes from
>>>> 79,509,871 to 53,031,752 bytes which is a significant improvement.
>>>>=20
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>=20
>>>> diff --git a/meta/classes/buildhistory.bbclass =
b/meta/classes/buildhistory.bbclass
>>>> index 4153e58..734303c 100644
>>>> --- a/meta/classes/buildhistory.bbclass
>>>> +++ b/meta/classes/buildhistory.bbclass
>>>> @@ -537,7 +537,7 @@ python buildhistory_get_extra_sdkinfo() {
>>>>        filesizes =3D {}
>>>>        for root, _, files in =
os.walk('${SDK_OUTPUT}/${SDKPATH}/sstate-cache'):
>>>>            for fn in files:
>>>> -                if fn.endswith('.tgz'):
>>>> +                if fn.endswith('.tar.xz'):
>>>>                    fsize =3D =
int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
>>>>                    task =3D fn.rsplit(':', 1)[1].split('_', =
1)[1].split('.')[0]
>>>>                    origtotal =3D tasksizes.get(task, 0)
>>>> diff --git a/meta/classes/populate_sdk_ext.bbclass =
b/meta/classes/populate_sdk_ext.bbclass
>>>> index 3a65c07..4ff5e9e 100644
>>>> --- a/meta/classes/populate_sdk_ext.bbclass
>>>> +++ b/meta/classes/populate_sdk_ext.bbclass
>>>> @@ -189,7 +189,7 @@ python copy_buildsystem () {
>>>>    # We don't need sstate do_package files
>>>>    for root, dirs, files in os.walk(sstate_out):
>>>>        for name in files:
>>>> -            if name.endswith("_package.tgz"):
>>>> +            if name.endswith("_package.tar.xz"):
>>>>                f =3D os.path.join(root, name)
>>>>                os.remove(f)
>>>> }
>>>> diff --git a/meta/classes/sstate.bbclass =
b/meta/classes/sstate.bbclass
>>>> index 9bef212..d9adf01 100644
>>>> --- a/meta/classes/sstate.bbclass
>>>> +++ b/meta/classes/sstate.bbclass
>>>> @@ -294,8 +294,8 @@ def sstate_installpkg(ss, d):
>>>>        oe.path.remove(dir)
>>>>=20
>>>>    sstateinst =3D d.expand("${WORKDIR}/sstate-install-%s/" % =
ss['task'])
>>>> -    sstatefetch =3D d.getVar('SSTATE_PKGNAME', True) + '_' + =
ss['task'] + ".tgz"
>>>> -    sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['task'] =
+ ".tgz"
>>>> +    sstatefetch =3D d.getVar('SSTATE_PKGNAME', True) + '_' + =
ss['task'] + ".tar.xz"
>>>> +    sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['task'] =
+ ".tar.xz"
>>>>=20
>>>>    if not os.path.exists(sstatepkg):
>>>>        pstaging_fetch(sstatefetch, sstatepkg, d)
>>>> @@ -372,7 +372,7 @@ python sstate_hardcode_path_unpack () {
>>>> def sstate_clean_cachefile(ss, d):
>>>>    import oe.path
>>>>=20
>>>> -    sstatepkgfile =3D d.getVar('SSTATE_PATHSPEC', True) + "*_" + =
ss['task'] + ".tgz*"
>>>> +    sstatepkgfile =3D d.getVar('SSTATE_PATHSPEC', True) + "*_" + =
ss['task'] + ".tar.xz*"
>>>>    bb.note("Removing %s" % sstatepkgfile)
>>>>    oe.path.remove(sstatepkgfile)
>>>>=20
>>>> @@ -555,7 +555,7 @@ def sstate_package(ss, d):
>>>>    tmpdir =3D d.getVar('TMPDIR', True)
>>>>=20
>>>>    sstatebuild =3D d.expand("${WORKDIR}/sstate-build-%s/" % =
ss['task'])
>>>> -    sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + =
".tgz"
>>>> +    sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + =
".tar.xz"
>>>>    bb.utils.remove(sstatebuild, recurse=3DTrue)
>>>>    bb.utils.mkdirhier(sstatebuild)
>>>>    bb.utils.mkdirhier(os.path.dirname(sstatepkg))
>>>> @@ -677,14 +677,14 @@ sstate_create_package () {
>>>>       # Need to handle empty directories
>>>>       if [ "$(ls -A)" ]; then
>>>>               set +e
>>>> -               tar -czf $TFILE *
>>>> +               tar -cJf $TFILE *
>>>>               ret=3D$?
>>>>               if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
>>>>                       exit 1
>>>>               fi
>>>>               set -e
>>>>       else
>>>> -               tar -cz --file=3D$TFILE --files-from=3D/dev/null
>>>> +               tar -cJ --file=3D$TFILE --files-from=3D/dev/null
>>>>       fi
>>>>       chmod 0664 $TFILE
>>>>       mv -f $TFILE ${SSTATE_PKG}
>>>> @@ -703,7 +703,7 @@ sstate_create_package () {
>>>> # Will be run from within SSTATE_INSTDIR.
>>>> #
>>>> sstate_unpack_package () {
>>>> -       tar -xmvzf ${SSTATE_PKG}
>>>> +       tar -xmvJf ${SSTATE_PKG}
>>>>       # Use "! -w ||" to return true for read only files
>>>>       [ ! -w ${SSTATE_PKG} ] || touch --no-dereference =
${SSTATE_PKG}
>>>>       [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || =
touch --no-dereference ${SSTATE_PKG}.sig
>>>> @@ -716,7 +716,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, =
sq_hashfn, d, siginfo=3DFalse):
>>>>=20
>>>>    ret =3D []
>>>>    missed =3D []
>>>> -    extension =3D ".tgz"
>>>> +    extension =3D ".tar.xz"
>>>>    if siginfo:
>>>>        extension =3D extension + ".siginfo"
>>>>=20
>>>> @@ -821,11 +821,11 @@ def sstate_checkhashes(sq_fn, sq_task, =
sq_hash, sq_hashfn, d, siginfo=3DFalse):
>>>>        evdata =3D {'missed': [], 'found': []};
>>>>        for task in missed:
>>>>            spec, extrapath, tname =3D getpathcomponents(task, d)
>>>> -            sstatefile =3D d.expand(extrapath + =
generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz")
>>>> +            sstatefile =3D d.expand(extrapath + =
generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tar.xz")
>>>>            evdata['missed'].append( (sq_fn[task], sq_task[task], =
sq_hash[task], sstatefile ) )
>>>>        for task in ret:
>>>>            spec, extrapath, tname =3D getpathcomponents(task, d)
>>>> -            sstatefile =3D d.expand(extrapath + =
generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz")
>>>> +            sstatefile =3D d.expand(extrapath + =
generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tar.xz")
>>>>            evdata['found'].append( (sq_fn[task], sq_task[task], =
sq_hash[task], sstatefile ) )
>>>>        bb.event.fire(bb.event.MetadataEvent("MissedSstate", =
evdata), d)
>>>>=20
>>>> @@ -914,7 +914,7 @@ python sstate_eventhandler() {
>>>>    d =3D e.data
>>>>    # When we write an sstate package we rewrite the SSTATE_PKG
>>>>    spkg =3D d.getVar('SSTATE_PKG', True)
>>>> -    if not spkg.endswith(".tgz"):
>>>> +    if not spkg.endswith(".tar.xz"):
>>>>        taskname =3D d.getVar("BB_RUNTASK", True)[3:]
>>>>        spec =3D d.getVar('SSTATE_PKGSPEC', True)
>>>>        swspec =3D d.getVar('SSTATE_SWSPEC', True)
>>>> @@ -922,7 +922,7 @@ python sstate_eventhandler() {
>>>>            d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
>>>>            d.setVar("SSTATE_EXTRAPATH", "")
>>>>        sstatepkg =3D d.getVar('SSTATE_PKG', True)
>>>> -        bb.siggen.dump_this_task(sstatepkg + '_' + taskname + =
".tgz" ".siginfo", d)
>>>> +        bb.siggen.dump_this_task(sstatepkg + '_' + taskname + =
".tar.xz" ".siginfo", d)
>>>> }
>>>>=20
>>>> SSTATE_PRUNE_OBSOLETEWORKDIR =3D "1"
>>>> diff --git a/meta/lib/oeqa/selftest/signing.py =
b/meta/lib/oeqa/selftest/signing.py
>>>> index c33662b..4d545ad 100644
>>>> --- a/meta/lib/oeqa/selftest/signing.py
>>>> +++ b/meta/lib/oeqa/selftest/signing.py
>>>> @@ -111,13 +111,13 @@ class Signing(oeSelfTest):
>>>>        bitbake('-c cleansstate %s' % test_recipe)
>>>>        bitbake(test_recipe)
>>>>=20
>>>> -        recipe_sig =3D glob.glob(sstatedir + =
'/*/*:ed:*_package.tgz.sig')
>>>> -        recipe_tgz =3D glob.glob(sstatedir + =
'/*/*:ed:*_package.tgz')
>>>> +        recipe_sig =3D glob.glob(sstatedir + =
'/*/*:ed:*_package.tar.xz.sig')
>>>> +        recipe_txz =3D glob.glob(sstatedir + =
'/*/*:ed:*_package.tar.xz')
>>>>=20
>>>>        self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig =
file.')
>>>> -        self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz =
file.')
>>>> +        self.assertEqual(len(recipe_txz), 1, 'Failed to find =
.tar.xz file.')
>>>>=20
>>>> -        ret =3D runCmd('gpg --homedir %s --verify %s %s' % =
(self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
>>>> +        ret =3D runCmd('gpg --homedir %s --verify %s %s' % =
(self.gpg_dir, recipe_sig[0], recipe_txz[0]))
>>>>        # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using =
RSA key ID 61EEFB30
>>>>        # gpg: Good signature from "testuser (nocomment) =
<testuser@email.com>"
>>>>        self.assertIn('gpg: Good signature from', ret.output, =
'Package signed incorrectly.')
>>>> diff --git a/meta/lib/oeqa/selftest/sstatetests.py =
b/meta/lib/oeqa/selftest/sstatetests.py
>>>> index 512cb4f..73e5132 100644
>>>> --- a/meta/lib/oeqa/selftest/sstatetests.py
>>>> +++ b/meta/lib/oeqa/selftest/sstatetests.py
>>>> @@ -55,15 +55,15 @@ class SStateTests(SStateBase):
>>>>        bitbake(['-ccleansstate'] + targets)
>>>>=20
>>>>        bitbake(targets)
>>>> -        tgz_created =3D self.search_sstate('|'.join(map(str, [s + =
'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
>>>> -        self.assertTrue(tgz_created, msg=3D"Could not find sstate =
.tgz files for: %s" % ', '.join(map(str, targets)))
>>>> +        txz_created =3D self.search_sstate('|'.join(map(str, [s + =
'.*?\.tar.xz$' for s in targets])), distro_specific, distro_nonspecific)
>>>> +        self.assertTrue(txz_created, msg=3D"Could not find sstate =
.tar.xz files for: %s" % ', '.join(map(str, targets)))
>>>>=20
>>>>        siginfo_created =3D self.search_sstate('|'.join(map(str, [s =
+ '.*?\.siginfo$' for s in targets])), distro_specific, =
distro_nonspecific)
>>>>        self.assertTrue(siginfo_created, msg=3D"Could not find =
sstate .siginfo files for: %s" % ', '.join(map(str, targets)))
>>>>=20
>>>>        bitbake(['-ccleansstate'] + targets)
>>>> -        tgz_removed =3D self.search_sstate('|'.join(map(str, [s + =
'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
>>>> -        self.assertTrue(not tgz_removed, msg=3D"do_cleansstate =
didn't remove .tgz sstate files for: %s" % ', '.join(map(str, targets)))
>>>> +        txz_removed =3D self.search_sstate('|'.join(map(str, [s + =
'.*?\.tar.xz$' for s in targets])), distro_specific, distro_nonspecific)
>>>> +        self.assertTrue(not txz_removed, msg=3D"do_cleansstate =
didn't remove .tar.xz sstate files for: %s" % ', '.join(map(str, =
targets)))
>>>>=20
>>>>    @testcase(977)
>>>>    def test_cleansstate_task_distro_specific_nonspecific(self):
>>>> @@ -87,8 +87,8 @@ class SStateTests(SStateBase):
>>>>        bitbake(['-ccleansstate'] + targets)
>>>>=20
>>>>        bitbake(targets)
>>>> -        self.assertTrue(self.search_sstate('|'.join(map(str, [s + =
'.*?\.tgz$' for s in targets])), distro_specific=3DFalse, =
distro_nonspecific=3DTrue) =3D=3D [], msg=3D"Found distro non-specific =
sstate for: %s" % ', '.join(map(str, targets)))
>>>> -        file_tracker_1 =3D self.search_sstate('|'.join(map(str, [s =
+ '.*?\.tgz$' for s in targets])), distro_specific=3DTrue, =
distro_nonspecific=3DFalse)
>>>> +        self.assertTrue(self.search_sstate('|'.join(map(str, [s + =
'.*?\.tar.xz$' for s in targets])), distro_specific=3DFalse, =
distro_nonspecific=3DTrue) =3D=3D [], msg=3D"Found distro non-specific =
sstate for: %s" % ', '.join(map(str, targets)))
>>>> +        file_tracker_1 =3D self.search_sstate('|'.join(map(str, [s =
+ '.*?\.tar.xz$' for s in targets])), distro_specific=3DTrue, =
distro_nonspecific=3DFalse)
>>>>        self.assertTrue(len(file_tracker_1) >=3D len(targets), msg =3D=
 "Not all sstate files ware created for: %s" % ', '.join(map(str, =
targets)))
>>>>=20
>>>>        self.track_for_cleanup(self.distro_specific_sstate + "_old")
>>>> @@ -97,7 +97,7 @@ class SStateTests(SStateBase):
>>>>=20
>>>>        bitbake(['-cclean'] + targets)
>>>>        bitbake(targets)
>>>> -        file_tracker_2 =3D self.search_sstate('|'.join(map(str, [s =
+ '.*?\.tgz$' for s in targets])), distro_specific=3DTrue, =
distro_nonspecific=3DFalse)
>>>> +        file_tracker_2 =3D self.search_sstate('|'.join(map(str, [s =
+ '.*?\.tar.xz$' for s in targets])), distro_specific=3DTrue, =
distro_nonspecific=3DFalse)
>>>>        self.assertTrue(len(file_tracker_2) >=3D len(targets), msg =3D=
 "Not all sstate files ware created for: %s" % ', '.join(map(str, =
targets)))
>>>>=20
>>>>        not_recreated =3D [x for x in file_tracker_1 if x not in =
file_tracker_2]
>>>> @@ -146,18 +146,18 @@ class SStateTests(SStateBase):
>>>>            if not sstate_arch in sstate_archs_list:
>>>>                sstate_archs_list.append(sstate_arch)
>>>>            if target_config[idx] =3D=3D target_config[-1]:
>>>> -                target_sstate_before_build =3D =
self.search_sstate(target + '.*?\.tgz$')
>>>> +                target_sstate_before_build =3D =
self.search_sstate(target + '.*?\.tar.xz$')
>>>>            bitbake("-cclean %s" % target)
>>>>            result =3D bitbake(target, ignore_status=3DTrue)
>>>>            if target_config[idx] =3D=3D target_config[-1]:
>>>> -                target_sstate_after_build =3D =
self.search_sstate(target + '.*?\.tgz$')
>>>> +                target_sstate_after_build =3D =
self.search_sstate(target + '.*?\.tar.xz$')
>>>>                expected_remaining_sstate +=3D [x for x in =
target_sstate_after_build if x not in target_sstate_before_build if not =
any(pattern in x for pattern in ignore_patterns)]
>>>>            self.remove_config(global_config[idx])
>>>>            self.remove_recipeinc(target, target_config[idx])
>>>>            self.assertEqual(result.status, 0, msg =3D "build of %s =
failed with %s" % (target, result.output))
>>>>=20
>>>>        runCmd("sstate-cache-management.sh -y --cache-dir=3D%s =
--remove-duplicated --extra-archs=3D%s" % (self.sstate_path, =
','.join(map(str, sstate_archs_list))))
>>>> -        actual_remaining_sstate =3D [x for x in =
self.search_sstate(target + '.*?\.tgz$') if not any(pattern in x for =
pattern in ignore_patterns)]
>>>> +        actual_remaining_sstate =3D [x for x in =
self.search_sstate(target + '.*?\.tar.xz$') if not any(pattern in x for =
pattern in ignore_patterns)]
>>>>=20
>>>>        actual_not_expected =3D [x for x in actual_remaining_sstate =
if x not in expected_remaining_sstate]
>>>>        self.assertFalse(actual_not_expected, msg=3D"Files should =
have been removed but ware not: %s" % ', '.join(map(str, =
actual_not_expected)))
>>>>=20
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_EFFD4664-C709-4287-B0FB-278C0CC8A713
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUDJ8ACgkQuwUzVZGdMxQsMACfTAzxgKaVGTwx51HDh2AnDmCA
WXAAn0qpfNMPixFFey/BXjee6qJct8x8
=VGmL
-----END PGP SIGNATURE-----

--Apple-Mail=_EFFD4664-C709-4287-B0FB-278C0CC8A713--
