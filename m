Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuOBh-00009K-Kp for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:33:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QDLdTq021534
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:21:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21246-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:21:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QDLUaT021528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:21:31 +0100
Message-ID: <1343308890.29991.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 14:21:30 +0100
In-Reply-To: <CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
References: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
	<CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q6QDLdTq021534
Subject: Re: autoconf broken? (was [oe] gtk+-native configure fails)
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
X-List-Received-Date: Thu, 26 Jul 2012 13:33:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-26 at 14:59 +0200, Andreas M=C3=BCller wrote:
> On Thu, Jul 26, 2012 at 1:24 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > I think it is not gtk+-native specific but some autoconf trouble. I
> > tried a build from scratch and get:
> >
> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in li=
brary
> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in=
 library
> > | autoreconf: running:
> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoco=
nf
> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-na=
tive-2.2.0-r3/atk-2.2.0/m4/
> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/us=
r/share/aclocal-1.12
> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-na=
tive-2.2.0-r3/atk-2.2.0/aclocal-copy/
> > --force --warnings=3Dcross
> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
> > |       If this token and others are legitimate, please use m4_patter=
n_allow.
> > |       See the Autoconf documentation.
> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETT=
EXT
> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/=
usr/bin/autoconf
> > failed with exit status: 1
> > | ERROR: autoreconf execution failed.
> > | ERROR: Function failed: do_configure (see
> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r=
3/temp/log.do_configure.24422
> > for further information)
> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
> >
> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in li=
brary
> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in=
 library
> > | autoreconf: running:
> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoco=
nf
> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-na=
tive-2.2.0-r3/atk-2.2.0/m4/
> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/us=
r/share/aclocal-1.12
> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-na=
tive-2.2.0-r3/atk-2.2.0/aclocal-copy/
> > --force --warnings=3Dcross
> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
> > |       If this token and others are legitimate, please use m4_patter=
n_allow.
> > |       See the Autoconf documentation.
> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETT=
EXT
> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/=
usr/bin/autoconf
> > failed with exit status: 1
> > | ERROR: autoreconf execution failed.
> > | ERROR: Function failed: do_configure (see
> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r=
3/temp/log.do_configure.24422
> > for further information)
> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
> >
> > Suggestions?
> >
> > Andreas
>=20
> FYI I reverted the autoconf 2.68 -> 2.69 patch
> (effb75d42098b3e367d393215fd5d52a0191e954) / start build from scratch
> but the error is still same.

A missing glib-2-0-native dependency for atk-native?

Cheers,

Richard



