Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo04.lge.com (lgeamrelo04.lge.com [156.147.1.127])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAC5757E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 05:59:15 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.178.22.190)
	by 156.147.1.127 with ESMTP; 2 Jun 2015 14:59:15 +0900
X-Original-SENDERIP: 10.178.22.190
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: =?UTF-8?Q?'Jo=C3=A3o_Henrique_Ferreira_de_Freit?=
	=?UTF-8?Q?as'?= <joaohf@gmail.com>
References: <20150312143521.GD2338@jama>	<5501D4CA.2090209@r-finger.com>	<08f401d08df0$aba9be00$02fd3a00$@lge.com>	<CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>	<CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>	<CALbNGRQzOdn8mGX-8E+7f9RLttmnESqjBw86v2pV4KOJhxpEmQ@mail.gmail.com>	<0ba801d09359$ec479130$c4d6b390$@lge.com>
	<556874C3.2050304@gmail.com>
In-Reply-To: <556874C3.2050304@gmail.com>
Date: Tue, 2 Jun 2015 14:59:21 +0900
Message-ID: <02e101d09cf9$458099b0$d081cd10$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFJJzd33wMNl4fFEeoeYEhR/UHxBgHlFIsNAvfvmBMB68tUHQDnnVY9Am5MtZ8BvSizpQEGePGTnkCQvfA=
Cc: =?UTF-8?B?7J2066qF6rWs?= <myonggu.lee@lge.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Tue, 02 Jun 2015 05:59:17 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: ko

Hi, I changed forked repo to https://github.com/meta-gir/meta-gir and =
changed some components matched with dizzy.

Please test again with latest version.

Thanks
Changhyeok

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of =
Joao Henrique Ferreira de Freitas
Sent: Friday, May 29, 2015 11:17 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] meta-gir issues and maintenance


Hi Changhyeok,

Did you get this error when using meta-gir? In my case I am setting my =
recipe to inherit the g-ir class.

| checking for python script directory... (cached)
${prefix}/lib/python2.7/site-packages
| checking for python extension module directory... (cached)
${exec_prefix}/lib/python2.7/site-packages
| checking for python module thread... yes checking whether to enable=20
| threading in pygobject... yes
|=20
/srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0.4-r0/=
pygobject-3.0.4/configure:=20
line 15892: ./libtool: No such file or directory
| checking for i586-poky-linux-pkg-config...=20
/srv/yocto/build/fido/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.16... yes checking for GLIB=20
| - version >=3D 2.24.0... cross compiling; assumed OK...
| yes (version 2.42.1)
| checking for ffi... checking for FFI... yes checking for GIO... yes=20
| checking for GI... no
| configure: error: Package requirements (glib-2.0 >=3D 2.24.0
|     gobject-introspection-1.0 >=3D 1.29.0
| ) were not met:
|
| No package 'gobject-introspection-1.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you=20
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables GI_CFLAGS and=20
| GI_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to aid
debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0.4-r0/=
temp/log.do_configure.13915)
ERROR: Task 233
(/home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-pygobj=
ect/python-pygobject_3.0.4.bb,
do_configure) failed with exit code '1'
WARNING: QA Issue: libgirepository: configure was passed unrecognised
options: --disable-schemas-install [unknown-configure-option]
WARNING: QA Issue: g-ir-tools-native: configure was passed unrecognised
options: --disable-schemas-install [unknown-configure-option]
NOTE: Tasks Summary: Attempted 2578 tasks of which 2524 didn't need to =
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
/home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-pygobje=
ct/python-pygobject_3.0.4.bb,
do_configure


I am working to build mypaint (http://mypaint.intilinux.com/) which is=20
hugely based on GI. Now I get lost.

Thanks.

On 20/05/2015 21:06, Changhyeok Bae wrote:
> I forked meta-gir to https://github.com/locust2001/meta-gir and start =
working from next week.
>
> -----Original Message-----
> From: Andreas M=C3=BCller [mailto:schnitzeltony@googlemail.com]
> Sent: Monday, May 18, 2015 8:46 PM
> To: Burton, Ross
> Cc: Changhyeok Bae; OE-core
> Subject: Re: [OE-core] meta-gir issues and maintenance
>
> On Mon, May 18, 2015 at 1:00 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>> On 18 May 2015 at 09:00, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com>
>> wrote:
>>> I would appreciate to have the gintrospection more central - this
>>> would give us a chance to get the gtk stuff out of stone age..
>>
>> Well, oe-core already has GTK+ 3, so we're "just" missing the =
bindings
>> to Python and JavaScript.
> Sorry - I meant gnome not gtk.
>> Changhyeok, you're welcome to fork meta-gir to your own repository =
and
>> work on it independently.  If you can update it so that it works with
>> oe-core master then you're the new maintainer. :)
>>
> Andreas
>
> This email has been protected by YAC (Yet Another Cleaner) =
http://www.yac.mx

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

This email has been protected by YAC (Yet Another Cleaner) http://www.yac.mx

