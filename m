Return-Path: <jandryuk@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 76EC07C11A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 17:11:07 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id s5-v6so9170475ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1hUkQJ+BrcldwaspU40cAXdVcfar/gAe7VEWkA+NhQo=;
	b=hMZEPPU5xk9rvbYiCc4Rj8d63cREZvPAXXHYp+9TBq1297me2Utv7Q3cs5OSTUOHZv
	etJTxg+ne6m6W1mcbT7RnAfxCZ+gp9fEolmy26AJ+CDGsZYrRH5uGL4vArBwItmDuzdy
	fNdWk6LovEiqxKm2IYC0lQ6wBqSQc02CDKVgDrOCV1/DWaFGYzNbQpHeF3T/i/XNehO2
	xEKYiMsZdfnTSLGO+biJ9ckxa9cefqwuqB96bPY5mQZkCLFPPXrMxyIe+ZzTwAUZaujb
	IR96z27SVQT9qrrS8syek0dcmSy4Ohdb6KEaYSJTZrtRsz6JpHsf6xuCubkW6EEdJ4lD
	bCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1hUkQJ+BrcldwaspU40cAXdVcfar/gAe7VEWkA+NhQo=;
	b=Ijhkauz1rUBpQM/mfr3WAapiWouNrkRvm8/SLgdEJMA1MURog1xf4f76s4yWz6XfOy
	eA3813ZvcGf5hkZEd9tfJUJf5ZuS3kvRFl1XQxTCLmAVTVq6x+5ZZSKo0MNq1agJHora
	6Upt6XwOxgprbzbvayYzM8MytIwKVRKXDz1kM0XX+z7dpVgk5JmecHFN4K3/5pzMM+bA
	iu9awzIgZU87u9JOk7iIvwX8vtW1Vx6SpC3GtMTlwe7oaEMIYzK4OHXIZa+MoRL7KpIj
	kDV6sraxAceJKYxyNqO/1ejnxJ98iUg44agAs9DOyY6So8Td1Z1bM/TirmxxfSyOqlRo
	wGDA==
X-Gm-Message-State: AJcUukd5fIjeTwrCXGUawFTxXl9NOCqHeerGFRGtFpOs5T/93ubziOCF
	S/IQPoZkgWp19D3cXlBp2OEHa9rWQap3VCnx9vM6kyLE
X-Google-Smtp-Source: ALg8bN4nsgKrWwyWxUOFFyek0xRa6UZzTVmVby9/Pv0516cOma12HhG3b18IscBcXtjl6Ci3SCXcbXYamEc1111Ld+k=
X-Received: by 2002:a2e:b00a:: with SMTP id
	y10-v6mr9981405ljk.109.1547745067666; 
	Thu, 17 Jan 2019 09:11:07 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
	<a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
	<CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
	<731530484e0135bb200df4da388982b2a7957ea1.camel@linuxfoundation.org>
	<CAKf6xpv2UAGbBr5wOqQdZNgNe5Hra6+bF+OWy_tTD5v3wyobhw@mail.gmail.com>
	<26b33c4efb48aaae0bd4662b88bfdfd428b95478.camel@linuxfoundation.org>
	<CAKf6xpvj7gLodcqWAXLL7vW_5Cqep_gLpr+5+7_V-e1z29L5BQ@mail.gmail.com>
	<9ed6a0a740a04f9ecc88659051a107ac6f4bd2c4.camel@linuxfoundation.org>
	<CAKf6xpvtQL+PXokJKWLHgRchrGdaXi7kMOuBfYTTfELEAzr-ng@mail.gmail.com>
	<a2d2f4a2b54ec7dac3691dff0cc17c5df33d63e7.camel@linuxfoundation.org>
In-Reply-To: <a2d2f4a2b54ec7dac3691dff0cc17c5df33d63e7.camel@linuxfoundation.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 17 Jan 2019 12:10:55 -0500
Message-ID: <CAKf6xpubLVvZ9ZQHKdRX34xLnoLSbufutFjg0qDw6MtA00Jt6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Thu, 17 Jan 2019 17:11:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 16, 2019 at 3:28 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The data is in the codeparser cache which is first populated at parse
> time so its enough just to parse the machine+recipe in question, not
> build it. I think that explains the answer to a ew of your questions
> above.

Yes, thanks.

> Sorry for asking so many questions btw, I'd just really love to be able
> to reproduce this issue! Thanks for trying to help answer them too!
>
> Is the bitbake-cookerdeamon.log file still there for this build (in the
> top level build directory)?

I don't seem to have this file in any of my OpenXT builds.

I still have the "bad" bb_codeparser.dat file.  It is 30MB whereas the
new one is only 6.5MB.  I thought it may be excessively large, but I
actually have an 80MB one in a different build directory.

Anyway, it has 4 different entries that look like core2-32
python-async do_install()-s

3c6fe664c51d2f793f8fd0eb103d68cb - reproduces currently
3df9018676de219bb3e46e88eea09c98 - one matching binutils core2-64 do_install
382871fb17743ba9635d7efc4db7d993
ee6850bdcf70ba63dea37e09c78c599f

They all have
frozenset({'[', 'mv', 'test',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python',
'sed', 'install', 'bbfatal_log', 'find', 'rm', 'rmdir'})

Eyeballing distutils_do_install, I don't see what could produce so
many variations.

Going into the new, clean build container, I can see those last two
hashes with different entries:
>>> d['ee6850bdcf70ba63dea37e09c78c599f']
frozenset({'tr', 'rm', 'sed', 'ln', 'cd', 'oe_multilib_header',
'autotools_do_install', 'echo', 'basename', 'install'})
>>> d['382871fb17743ba9635d7efc4db7d993']
frozenset({'tr', 'rm', 'sed', 'ln', 'cd', 'oe_multilib_header',
'autotools_do_install', 'echo', 'basename', 'install'})

and the expected core2-32 python-async do_install
>>> d['3c6fe664c51d2f793f8fd0eb103d68cb']
frozenset({'bbfatal_log', 'rm', 'test', 'sed', '[', 'rmdir',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python',
'find', 'install', 'mv'})

I've only run one core2-32 build in the fresh container, so no 64bit
binutils at the original collision 3df9018676de219bb3e46e88eea09c98

Ok, I hacked up a script to check two bb_codeparser.dat files for
collisions.  Compare the current one with the "bad" one:
$ ./pickle-cmp.py cache/bb_codeparser.dat cache/bb_codeparser.dat.old-bad-one
Collision ee6850bdcf70ba63dea37e09c78c599f
frozenset({'echo', 'rm', 'autotools_do_install', 'tr',
'oe_multilib_header', 'cd', 'basename', 'sed', 'ln', 'install'})
frozenset({'find', 'test', 'rm', 'bbfatal_log', '[', 'sed', 'mv',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python',
'rmdir', 'install'})
Collision 382871fb17743ba9635d7efc4db7d993
frozenset({'echo', 'rm', 'autotools_do_install', 'tr',
'oe_multilib_header', 'cd', 'basename', 'sed', 'ln', 'install'})
frozenset({'find', 'test', 'rm', 'bbfatal_log', '[', 'sed', 'mv',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python',
'rmdir', 'install'})
Collision 5254083eac08e32fc68bc9421d7df287
frozenset({'autotools_do_install', 'rm', 'sed', 'touch', 'install'})
frozenset({'/etc/init.d/xenclient-boot-sound', 'true', ':', '['})
Collision d0701fd5c05175aeafc06d8ce34d3532
frozenset({'create-cracklib-dict', 'autotools_do_install'})
frozenset({'/etc/init.d/gateone', 'true', ':', '['})
Collision ec332415bd96520823ba383494e7a9a7
frozenset({'ln', 'popd', ':', 'pushd'})
frozenset({'DEPLOY_DIR', 'useradd_preinst', 'perform_useradd', 'PKGD',
'PKGDEST', 'pkg_preinst', 'MLPREFIX', 'perform_groupadd', 'PN',
'perform_groupmems', 'PACKAGES', 'NOAUTOPACKAGEDEBUG',
'USERADD_PACKAGES', 'WORKDIR'})
Collision 3df9018676de219bb3e46e88eea09c98
frozenset({'echo', 'rm', 'autotools_do_install', 'tr',
'oe_multilib_header', 'cd', 'basename', 'sed', 'ln', 'install'})
frozenset({'find', 'test', 'rm', 'bbfatal_log', '[', 'sed', 'mv',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python',
'rmdir', 'install'})
Collision 0aa15eb469ad8854cda0b0675217b8f6
frozenset({'find', 'test', 'rm', 'bbfatal_log', '[', 'sed', 'mv',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-mock/2.0.0-r0/recipe-sysroot-native/usr/bin/python-native/python',
'rmdir', 'install'})
frozenset({'oe_runmake', 'find', 'true', 'test', 'echo', 'chmod',
'rm', 'mkdir', '[', 'oe_multilib_header', 'cd', 'lnr', 'basename',
'continue', 'mv', 'ln', 'local', 'install'})

Compare the current one with the fresh one from the other container (build4):
$ ./pickle-cmp.py cache/bb_codeparser.dat build4-codeparser.dat
Collision d0701fd5c05175aeafc06d8ce34d3532
frozenset({'create-cracklib-dict', 'autotools_do_install'})
frozenset({'[', ':', '/etc/init.d/gateone', 'true'})
Collision 5254083eac08e32fc68bc9421d7df287
frozenset({'touch', 'install', 'sed', 'autotools_do_install', 'rm'})
frozenset({'[', '/etc/init.d/xenclient-boot-sound', ':', 'true'})

I figured I can reproduce the hash collisions for
d0701fd5c05175aeafc06d8ce34d3532, but I cannot.

gateone update-rc.d updatercd_prerm matches d0701fd5c05175aeafc06d8ce34d3532
Below, it should be a tab before /etc/init.d/gateone , but I can't
insert that because of gmail)
'''
# Begin section update-rc.d
if true && [ -z "$D" -a -x "/etc/init.d/gateone" ]; then
        /etc/init.d/gateone stop || :
fi
# End section update-rc.d
'''

cracklib do_install is only two lines, but I cannot reproduce.
(Below, it should be a tab before create-cracklib-dict)
$ sed -n '/^do_install/,/^}/p'
tmp-glibc/work/core2-32-oe-linux/cracklib/2.9.5-r0/temp/run.do_install
| head -n -7 | tail -n 2 | tee /dev/stderr | md5sum
    autotools_do_install
       create-cracklib-dict -o
/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/cracklib/2.9.5-r0/image/usr/share/cracklib/pw_dict
/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/cracklib/2.9.5-r0/image/usr/share/cracklib/cracklib-small
8ca3daacb394a11f38c851a8d71ed4de  -

#current
$ ./i-m-in-a-pickle.py cache/bb_codeparser.dat cracklib
3933316
'8ca3daacb394a11f38c851a8d71ed4de': frozenset({'create-cracklib-dict',
'autotools_do_install'})
5050048
'b50633e8f154817d7cc3ec94c6405379': frozenset({'create-cracklib-dict',
'autotools_do_install'})
5641024
'd0701fd5c05175aeafc06d8ce34d3532': frozenset({'create-cracklib-dict',
'autotools_do_install'})

#old bad
$ ./i-m-in-a-pickle.py cache/bb_codeparser.dat.old cracklib
13503349
'8ca3daacb394a11f38c851a8d71ed4de': frozenset({'autotools_do_install',
'create-cracklib-dict'})
39348111
'b50633e8f154817d7cc3ec94c6405379': frozenset({'autotools_do_install',
'create-cracklib-dict'})

#fresh
$ ./i-m-in-a-pickle.py build4-codeparser.dat cracklib
2085662
'8ca3daacb394a11f38c851a8d71ed4de': frozenset({'create-cracklib-dict',
'autotools_do_install'}),

b50633e8f154817d7cc3ec94c6405379 is the core2-64 cracklib do_install
$ sed -n '/^do_install/,/^}/p'
tmp-glibc/work/core2-64-oe-linux/cracklib/2.9.5-r0/temp/run.do_install
| head -n -7 | tail -n 2 | tee /dev/stderr | md5sum
    autotools_do_install
    create-cracklib-dict -o
/home/build/openxt-compartments/build/tmp-glibc/work/core2-64-oe-linux/cracklib/2.9.5-r0/image/usr/share/cracklib/pw_dict
/home/build/openxt-compartments/build/tmp-glibc/work/core2-64-oe-linux/cracklib/2.9.5-r0/image/usr/share/cracklib/cracklib-small
b50633e8f154817d7cc3ec94c6405379  -

But where did d0701fd5c05175aeafc06d8ce34d3532 come from?

When pickling the cache for writing to disk, could a dangling
pointer/index/reference be left such that a given hash's frozenset
entry changes?

An aside - entries include the standard linux utilities & shell
builtins, but those are always available.  If a given shell cache
entry only relies on those utilities, it could collide and still run.
It's only an issue when a shell function or special utility is needed.

Regards,
Jason

