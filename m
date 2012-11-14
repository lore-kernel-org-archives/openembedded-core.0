Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TYZW8-0001v3-9p
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 10:44:21 +0100
Received: by mail-ie0-f175.google.com with SMTP id c13so265358ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 01:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AIVMQDCTw2IlHv+0m+/i6oWJKR2NfWFDj3vwkJ2gdWc=;
	b=ayz4dv2jhwXMMIAfjqRdnH3Xy/Kd5RO7JUbj9zqqV1p562DIACKnsTGq5973HasKBX
	/G/ZiWLpq7WEA6BnH5Aac1cd+L7KVGAaHmrYizrdJAXz0LMKTPUUdfgJAbqN/bHQRHyj
	Cterui+SW5H+62M6rqkIfitg+sWRIlDsvha84J+0KjJKezv+ebWUGpV2+VzajZQLwGK1
	XaQBrUaWTXUojgLPq/b2THK7iZWXbpxXNscD/h+X2TGA3HfSVkt6LhnmxcL4cXWMjrkc
	KkcuZIzPEItRCEstb4KB3u9PDTEof+1jc+tHLxaw+22mwx05iyfe6STYOIXe9vgx4hSS
	uz9Q==
MIME-Version: 1.0
Received: by 10.42.147.74 with SMTP id m10mr23741258icv.0.1352885424516; Wed,
	14 Nov 2012 01:30:24 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Wed, 14 Nov 2012 01:30:24 -0800 (PST)
In-Reply-To: <CALbNGRR3cOLUR+HBKkfSqLMRL75sn7uzEace23KJLYy43F1Vtg@mail.gmail.com>
References: <CALbNGRR3cOLUR+HBKkfSqLMRL75sn7uzEace23KJLYy43F1Vtg@mail.gmail.com>
Date: Wed, 14 Nov 2012 10:30:24 +0100
Message-ID: <CALbNGRShXafNdCYR62h3tpQ4RLTXyZTgvrs0xBOhsn_Z57=sdg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 09:44:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 10:15 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Ciao,
>
> with latest layer HEADS and build from scratch I get:
>
> KeyError: 'getpwnam(): name not found: root'
>
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR:   File "fixup_perms", line 227, in <module>
> ERROR:
> ERROR:   File "fixup_perms", line 155, in fixup_perms
> ERROR:
> ERROR:   File "fixup_perms", line 32, in __init__
> ERROR:
> ERROR:   File "fixup_perms", line 42, in _setdir
> ERROR:
> ERROR:   File "fixup_perms", line 66, in _procuid
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0223:                    each_file =3D os.path.join(root, f)
> ERROR:      0224:                    fix_perms(each_file,
> fs_perms_table[dir].fmode, fs_perms_table[dir].fuid,
> fs_perms_table[dir].fgid, dir)
> ERROR:      0225:
> ERROR:      0226:
> ERROR:  *** 0227:fixup_perms(d)
> ERROR:      0228:
> ERROR: [From file: 'fixup_perms', lineno: 227, function: <module>]
> ERROR:      0151:    for path in target_path_vars:
> ERROR:      0152:        dir =3D d.getVar(path, True) or ""
> ERROR:      0153:        if dir =3D=3D "":
> ERROR:      0154:            continue
> ERROR:  *** 0155:        fs_perms_table[dir] =3D
> fs_perms_entry(bb.data.expand("%s 0755 root root false - - -" % (dir),
> d))
> ERROR:      0156:
> ERROR:      0157:    # Now we actually load from the configuration files
> ERROR:      0158:    for conf in get_fs_perms_list(d).split():
> ERROR:      0159:        if os.path.exists(conf):
> ERROR: [From file: 'fixup_perms', lineno: 155, function: fixup_perms]
> ERROR: Function failed: fixup_perms
> ERROR: Logfile of failure stored in:
> /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnue=
abi/util-macros-1_1.17-r0/temp/log.do_package.28653
> ERROR: Task 4450
> (/home/andreas/data/oe-core/sources/openembedded-core/meta/recipes-graphi=
cs/xorg-util/util-macros_1.17.bb,
> do_package) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3985 tasks of which 397 didn't need to
> be rerun and 1 failed.
>
> The only additional information I found up to now:
>
> * the code mentioned in error message is found in package.bbclass.
> * in sysroot/etc/passwd there is a line 'root::0:0:root:/home/root:/bin/s=
h'
>
> Any ideas?
>
Additional info: After running

bitbake -ccleansstate util-macros util-macros-native

the build continues as without issues. Some missing dependency race?

Andreas


