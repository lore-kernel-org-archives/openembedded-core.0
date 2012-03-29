Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SDKc7-00072l-I8
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 21:02:27 +0200
Received: by qafl39 with SMTP id l39so741443qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8W3dSW6tKqFvWWIR+XkGBWQ0GotzRfM1BkfKshEmY08=;
	b=WtbqMlApwfvIBbK9vbTucXejTTohTKycGvkfoIv4wRN5tbXaNvKxk1CpoeFB8TFLwE
	zNenJYL9slHdyccKmUfbSXU49wFf+ShtMODeuydO6R9cs3Zm/zDk2VL96rdcT0Rd+h3g
	wzRxC2svuO8233EGLyhas17qSxpqqmPw9uVOv+Lg1PKnJwLxtxgJNMYFmpJc49BcB6Zb
	LJRu5TE4xZNg4FItTYsDQDF3FjoOXV1tAjIwVA2BDdnPFX49j7u465YSmIFbZaZe30QG
	Ia41oilN5bfbiYpjQisxvMk8/G9D0Qt+4jwyIG6NONqG+l/pYwbpoRK7FXiMxnqT3IsG
	aRww==
MIME-Version: 1.0
Received: by 10.224.180.14 with SMTP id bs14mr1737478qab.54.1333047203597;
	Thu, 29 Mar 2012 11:53:23 -0700 (PDT)
Received: by 10.229.158.4 with HTTP; Thu, 29 Mar 2012 11:53:23 -0700 (PDT)
In-Reply-To: <4F74AC6F.5040009@windriver.com>
References: <CAGDS+nnR4it2-C0FM1CeJBSakt9HmVizKQSO1wkc5EqxQKh22Q@mail.gmail.com>
	<4F74AC6F.5040009@windriver.com>
Date: Thu, 29 Mar 2012 11:53:23 -0700
Message-ID: <CAGDS+nnEOMQs+OXtchFWq-Jr+zVxhGd4KTtaK3PBS4JYJVGG-g@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Seebach, Peter" <Peter.Seebach@windriver.com>
Subject: Re: pseudo failing with cc1: error: unrecognized command line option '-m32'
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
X-List-Received-Date: Thu, 29 Mar 2012 19:02:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 11:39 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> It appears you are trying to build pseudo for the target right?
>
> We've not really validated pseudo on non-x86 hosts. =A0I'm guessing a pat=
ch to
> remove the -m32/-m64 hard coded flags may be necessary.
>
> (I've cc'd the pseudo maintainer...)

Yes, I figured it would be interesting to see what would happen with
task-self-hosted on arm :-)

Clearly not something a sane person would do . . .

Steve

> On 3/29/12 1:30 PM, Steve Sakoman wrote:
>>
>> The pseudo build fails on both 32 and 64 bit build machines. =A0I am
>> building for arm (omap).
>>
>> Not sure if this is related to the recent pseudo recipes changes, but
>> here are the details:
>>
>> NOTE: package pseudo-1.3-r7: task do_compile: Started
>> ERROR: Function failed: do_compile (see
>>
>> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/pseudo-1.3=
-r7/temp/log.do_compile.26657
>> for further information)
>> ERROR: Logfile of failure stored in:
>>
>> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/pseudo-1.3=
-r7/temp/log.do_compile.26657
>> Log data follows:
>> | ERROR: Function failed: do_compile (see
>>
>> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/pseudo-1.3=
-r7/temp/log.do_compile.26657
>> for further information)
>> | SQLite header for version 3007010 found.
>> | NOTE: make -j 8 -e MAKEFLAGS=3D
>> | mkdir -p lib/pseudo/lib
>> | ./makewrappers
>> | ./maketables enums/*.in
>> | mkdir -p bin
>> | enums/msg_type.in: type: msg_type_t (prefix 'PSEUDO_MSG_ENUM')
>> | =A0 =A0ping =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutdown =A0 =A0 =A0 =A0 =A0 o=
p =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ack
>> | =A0 =A0nak
>> |
>> | enums/op.in: type: op_t (prefix 'OP_ENUM')
>> | =A0 =A0chdir =A0 =A0 =A0 =A0 =A0 =A0 =A0chmod =A0 =A0 =A0 =A0 =A0 =A0 =
=A0chown =A0 =A0 =A0 =A0 =A0 =A0 =A0chroot
>> | =A0 =A0close =A0 =A0 =A0 =A0 =A0 =A0 =A0creat =A0 =A0 =A0 =A0 =A0 =A0 =
=A0dup =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fchmod
>> | =A0 =A0fchown =A0 =A0 =A0 =A0 =A0 =A0 fstat =A0 =A0 =A0 =A0 =A0 =A0 =
=A0link =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkdir
>> | =A0 =A0mknod =A0 =A0 =A0 =A0 =A0 =A0 =A0open =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 rename =A0 =A0 =A0 =A0 =A0 =A0 stat
>> | =A0 =A0unlink =A0 =A0 =A0 =A0 =A0 =A0 symlink =A0 =A0 =A0 =A0 =A0 =A0e=
xec =A0 =A0 =A0 =A0 =A0 =A0 =A0 may-unlink
>> | =A0 =A0did-unlink =A0 =A0 =A0 =A0 cancel-unlink
>> |
>> | enums/query_field.in: type: query_field_t (prefix 'PSQF_ENUM')
>> | =A0 =A0access =A0 =A0 =A0 =A0 =A0 =A0 client =A0 =A0 =A0 =A0 =A0 =A0 d=
ev =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fd
>> | =A0 =A0ftype =A0 =A0 =A0 =A0 =A0 =A0 =A0gid =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0id =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 inode
>> | =A0 =A0mode =A0 =A0 =A0 =A0 =A0 =A0 =A0 op =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 order =A0 =A0 =A0 =A0 =A0 =A0 =A0path
>> | =A0 =A0perm =A0 =A0 =A0 =A0 =A0 =A0 =A0 program =A0 =A0 =A0 =A0 =A0 =
=A0result =A0 =A0 =A0 =A0 =A0 =A0 severity
>> | =A0 =A0stamp =A0 =A0 =A0 =A0 =A0 =A0 =A0tag =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0text =A0 =A0 =A0 =A0 =A0 =A0 =A0 type
>> | =A0 =A0uid
>> |
>> | enums/query_type.in: type: query_type_t (prefix 'PSQT_ENUM')
>> | =A0 extra column: sql (default 'LITTLE BOBBY TABLES')
>> | =A0 =A0exact =A0 =A0 =A0 =A0 =A0 =A0 =A0less =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 greater =A0 =A0 =A0 =A0 =A0 =A0bitand
>> | =A0 =A0notequal =A0 =A0 =A0 =A0 =A0 like =A0 =A0 =A0 =A0 =A0 =A0 =A0 n=
otlike =A0 =A0 =A0 =A0 =A0 =A0sqlpat
>> |
>> | enums/res.in: type: res_t (prefix 'RESULT_ENUM')
>> | =A0 =A0succeed =A0 =A0 =A0 =A0 =A0 =A0fail =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 error
>> |
>> | enums/sev.in: type: sev_t (prefix 'SEVERITY_ENUM')
>> | =A0 =A0debug =A0 =A0 =A0 =A0 =A0 =A0 =A0info =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 warn =A0 =A0 =A0 =A0 =A0 =A0 =A0 error
>> | =A0 =A0critical
>> |
>> | Writing datatypes... done. =A0Cleaning up.
>> | ccache arm-poky-linux-gnueabi-gcc =A0-march=3Darmv7-a
>> -fno-tree-vectorize =A0 =A0 -mthumb-interwork -mfloat-abi=3Dsoftfp
>> -mfpu=3Dneon -mtune=3Dcortex-a8
>> --sysroot=3D/media/Work/yocto/tmp/sysroots/omap4-multi -O2 -pipe -g
>> -feliminate-unused-debug-types -pipe -std=3Dgnu99 -Wall -W -Wextra -fPIC
>> -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -m32 -DPSEUDO_PREFIX=3D'"/usr"'
>> -DPSEUDO_SUFFIX=3D'""' -DPSEUDO_BINDIR=3D'"bin"'
>> -DPSEUDO_LIBDIR=3D'"lib/pseudo/lib"'
>> -DPSEUDO_LOCALSTATEDIR=3D'"var/pseudo"' -DPSEUDO_VERSION=3D'"1.3"' -O2 -=
g
>> -L/media/Work/yocto/tmp/sysroots/omap4-multi/usr/lib
>> -I/media/Work/yocto/tmp/sysroots/omap4-multi/usr/include
>> -Wl,-R/media/Work/yocto/tmp/sysroots/omap4-multi/usr/lib -c -o
>> pseudo_tables.o pseudo_tables.c
>> | cc1: error: unrecognized command line option '-m32'
>> | make: *** [pseudo_tables.o] Error 1
>> | make: *** Waiting for unfinished jobs....
>> | Checking for old/new clone mechanics...New clone.
>> | ports/common/wrapfuncs.in: .......
>> | ports/linux/wrapfuncs.in:
>> .............................................................
>> | ports/unix/wrapfuncs.in:
>> .........................................................
>> | ports/uids_generic/wrapfuncs.in: ........................
>> | ports/linux/newclone/wrapfuncs.in: .
>> | Writing functions... Warning: lchown from linux overriding unix
>> | done. =A0Cleaning up.
>> | ERROR: oe_runmake failed
>> NOTE: package pseudo-1.3-r7: task do_compile: Failed
>> ERROR: Task 7
>> (/home/sakoman/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.3=
.bb,
>> do_compile) failed with exit code '1'
>>
>> Steve
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


