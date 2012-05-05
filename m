Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQSgh-00056z-7i
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 02:17:27 +0200
Received: by lags15 with SMTP id s15so1246lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=vftyQ3I03XJLRq5URlSe0Ab9Nu0yXDEctuVELF0ySJw=;
	b=cvvVBa453xeBeehSNCC+YXbUAIaugCyDLxS+9XvmLCPuxiv53EGVZuznYelOk3AlRt
	2Omik1ineG5lmVfgaJLaJEsUAL/Sw34taJfDp7QMNm7LVKbGdULgrnDd1dSLt2zdbbhx
	I1I2qjyHardL2mjZ/UgDDDJY+pfzvgmCjUzWBd7VjKB6Mwt49um1wO5Ziu+W7bvG3qNk
	jaIGr16vN44kuQa+KjuARwMSrswQMXMZ+JdhYidXd9tIeM/o2L3Pu35A7GtAabt1bDvw
	L/I0h1dYX3Vh7NwjDdmOO+nEdQ/r75MGz1wgf7jdriHtXdKYsvI7UKbOZQeXqQvn3Z0o
	PRJg==
Received: by 10.112.100.170 with SMTP id ez10mr3891234lbb.15.1336176459810;
	Fri, 04 May 2012 17:07:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 17:07:09 -0700 (PDT)
In-Reply-To: <4FA4622C.1070809@linux.intel.com>
References: <cover.1335992192.git.raj.khem@gmail.com>
	<907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
	<4FA327A2.5040705@linux.intel.com>
	<20120504053258.GA3163@jama.jama.net>
	<20120504060931.GB3163@jama.jama.net>
	<4FA4622C.1070809@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 17:07:09 -0700
Message-ID: <CAMKF1spgKsayatg88ZgQuQ+b57YnCCQzUyRy8Yg-8sop++ODLQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/3] kmod: Add recipes
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
X-List-Received-Date: Sat, 05 May 2012 00:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2012 at 4:11 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/03/2012 11:09 PM, Martin Jansa wrote:
>>
>> On Fri, May 04, 2012 at 07:32:58AM +0200, Martin Jansa wrote:
>>>
>>> On Thu, May 03, 2012 at 05:49:38PM -0700, Saul Wold wrote:
>>>>
>>>> On 05/02/2012 01:58 PM, Khem Raj wrote:
>>>>>
>>>>> kmod is replacement for module-init-tools
>>>>>
>>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>> ---
>>>>> =C2=A0 meta/recipes-kernel/kmod/kmod-native_git.bb =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 14 +++++
>>>>> =C2=A0 meta/recipes-kernel/kmod/kmod.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 31 +++++++++++
>>>>> =C2=A0 meta/recipes-kernel/kmod/kmod/depmod-search.conf | =C2=A0 =C2=
=A06 ++
>>>>> =C2=A0 meta/recipes-kernel/kmod/kmod_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 62
>>>>> ++++++++++++++++++++++
>>>>> =C2=A0 4 files changed, 113 insertions(+), 0 deletions(-)
>>>>> =C2=A0 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
>>>>> =C2=A0 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
>>>>> =C2=A0 create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search=
.conf
>>>>> =C2=A0 create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
>>>>>
>>>>
>>>> I have been seeing build failures in the man section of kmod:
>>>>
>>>> | Making all in man
>>>> |
>>>>
>>>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/=
build/tmp/sysroots/x86_64-linux/usr/bin/xsltproc
>>>> --nonet --param funcsynopsis.style "'ansi'" \
>>>> |
>>>> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l
>>>> depmod.d.xml
>>>> |
>>>>
>>>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/=
build/tmp/sysroots/x86_64-linux/usr/bin/xsltproc
>>>> --nonet --param funcsynopsis.style "'ansi'" \
>>>> |
>>>> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l
>>>> modprobe.d.xml
>>>> | I/O error : Attempt to load network entity
>>>> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l
>>>> | warning: failed to load external entity
>>>>
>>>> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.x=
sl"
>>>> | cannot parse
>>>> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l
>>>> | make[2]: *** [depmod.d.5] Error 4
>>>> | make[2]: *** Waiting for unfinished jobs....
>>>> | I/O error : Attempt to load network entity
>>>> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l
>>>> | warning: failed to load external entity
>>>>
>>>> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.x=
sl"
>>>> | cannot parse
>>>> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xs=
l
>>>> | make[2]: *** [modprobe.d.5] Error 4
>>>> | make[1]: *** [all-recursive] Error 1
>>>> | make: *** [all] Error 2
>>>> | ERROR: oe_runmake failed
>>>>
>>>> Can you confirm this issue?
>>>
>>>
>>> I can from meta-oe version of kmod
>>>
>>>
>>> http://git.openembedded.org/meta-openembedded/commit/?id=3Df75e91c48cfc=
58f91dc8f70f80a154d97d2d6c60
>>>
>>> Not sure why khem haven't used this commit/patch.
>>
>>
>> I've filled https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2416 so
>> maybe someone will fix it properly.
>>
>
> There also seems to be an issue with kmod-native, should this be a generi=
c
> patch?

yes it should be applied to native recipe as well. I have done it and
pushed the to the tree


