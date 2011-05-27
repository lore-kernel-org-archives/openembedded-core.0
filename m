Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QQ2Rv-00057b-L6
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 21:11:55 +0200
Received: by bwz5 with SMTP id 5so1733127bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lRmFsxbbjGf3T0hwZ/JMIK6jTYb7pNaXvmCqBiFzHb4=;
	b=EobVe8/L0va0CvplNxwmn53B0ZZ2xBKIIUSvHAlf6LObsCfj2GVfH1ZAKL4CwBKGVm
	XN/Db1sGzbZSkUkXbaixDe4OdSJoy7JePhnAbsnLVJZWNcpgijB8uJwTzohldpGkgMwl
	I/L5FpW7BAMY6bDEJl7HnSsbPLLKzBt9PncOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=OZNJtpKC9kvAis3u1yUmUdonZhI7EqohicW5Yo8Uo8Pngp4kpruw3oXmRuDkiora2n
	GLrUswTGIMzMQrF9fwD6GGdvGgaFVY4uFrhaoMqdy+pI1q3/vepKyFTTXJEHPaDjnuRX
	xPRmvMCOqZYgXIsTag5GH2sph+WQssmJ+zwjg=
MIME-Version: 1.0
Received: by 10.204.154.194 with SMTP id p2mr1994690bkw.58.1306523330185; Fri,
	27 May 2011 12:08:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Fri, 27 May 2011 12:08:50 -0700 (PDT)
In-Reply-To: <7DC6724C-BF20-4EA1-A87D-32FBEEECDA3B@dominion.thruhere.net>
References: <cover.1306477652.git.lianhao.lu@intel.com>
	<1306515635.27470.284.camel@rex>
	<7DC6724C-BF20-4EA1-A87D-32FBEEECDA3B@dominion.thruhere.net>
Date: Fri, 27 May 2011 19:08:50 +0000
X-Google-Sender-Auth: -5hgqw-meNRzohyaFHC5OXMfqsI
Message-ID: <BANLkTi=1oT=af2XGiQ2CNrJXJRZ3OhGhmw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Add PR service and integrate PKGV/PKGR from OE
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
X-List-Received-Date: Fri, 27 May 2011 19:11:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Same here.

On Fri, May 27, 2011 at 18:48, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>
> Op 27 mei 2011, om 19:00 heeft Richard Purdie het volgende geschreven:
>
>> Hi Lianhao,
>>
>> On Fri, 2011-05-27 at 14:31 +0800, Lianhao Lu wrote:
>>> =A0git://git.pokylinux.org/poky-contrib llu/PR-service
>>> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dllu/PR-servi=
ce
>>>
>>> Lianhao Lu (11):
>>> =A0Added the PR service.
>>> =A0conf/bitbake.conf: Added variables for PR service.
>>> =A0meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
>>> =A0classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
>>> =A0classes/package_xxx.class: Use PKGE/PKGV/PKGR.
>>> =A0udev: use EXTENDPKGV instead of EXTENDPV.
>>> =A0xcb: use EXTENDPKGV instead of EXTENDPV.
>>> =A0xorg-proto: use EXTENDPKGV instead of EXTENDPV.
>>> =A0xorg-util/util-macros: use EXTENDPKGV instead of EXTENDPV.
>>> =A0linux-libc-headers: use EXTENDPKGV instead of EXTENDPV.
>>> =A0conf/bitbake.conf: Removed EXTENDPV and EXTENDPEVER.
>>
>> I merged this but I did make some tweaks to both the patch series and
>> one of the patches. The changes I made were:
>>
>> a) Squash the EXTENDPV and EXTENDPEVER changes into the base patch
>> making all the associated changes in one go.
>>
>> b) Not include the DISTRO_PR variable for now
>>
>> c) Not change the default signature handler to basichash.
>>
>> For c), I'd suggest a follow up patch changing the default in poky.conf
>> in meta-yocto and we'll test this there. This should wait until the
>> PACKAGE_ARCH =3D "all" sstate issues we've been seeing are addressed
>> though.
>
> On Fedora 14 I get this when trying to rebuild console-image:
>
> ERROR: (file: 'package_get_auto_pr', lineno: 4, function: package_get_aut=
o_pr)
> ERROR: Function 'package_get_auto_pr' failed
> ERROR: Logfile of failure stored in: /home/koen/angstrom-core/build/tmp-a=
ngstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/dbus-1.4.1-r5/temp=
/log.do_package.24742
> Log data follows:
> | ERROR: Error executing a python function in /home/koen/angstrom-core/so=
urces/openembedded-core/meta/recipes-core/dbus/dbus_1.4.1.bb:
> | ImportError: No module named xmlrpc
> |
> | ERROR: The stack trace of python calls that resulted in this exception/=
failure was:
> | ERROR: =A0 File "package_get_auto_pr", line 11, in <module>
> | ERROR:
> | ERROR: =A0 File "package_get_auto_pr", line 4, in package_get_auto_pr
> | ERROR:
> | ERROR: =A0 File "prserv.bbclass", line 8, in prserv_get_pr_auto
> | ERROR:
> | ERROR: =A0 File "prserv.bbclass", line 2, in prserv_make_conn
> | ERROR:
> | ERROR: =A0 File "/home/koen/angstrom-core/sources/bitbake/lib/prserv/se=
rv.py", line 6, in <module>
> | ERROR: =A0 =A0 import bb.server.xmlrpc
> | ERROR:
> | ERROR: The code that was being executed was:
> | ERROR: =A0 =A0 =A00007: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return
> | ERROR: =A0 =A0 =A00008: =A0 =A0 =A0 =A0 =A0 =A0 d.setVar('PRAUTO',str(a=
uto_pr))
> | ERROR: =A0 =A0 =A00009:
> | ERROR: =A0 =A0 =A00010:
> | ERROR: =A0*** 0011:package_get_auto_pr(d)
> | ERROR: =A0 =A0 =A00012:
> | ERROR: (file: 'package_get_auto_pr', lineno: 11, function: <module>)
> | ERROR: =A0 =A0 =A00001:
> | ERROR: =A0 =A0 =A00002:def package_get_auto_pr(d):
> | ERROR: =A0 =A0 =A00003: =A0 =A0 if d.getVar('USE_PR_SERV', True):
> | ERROR: =A0*** 0004: =A0 =A0 =A0 =A0 =A0 =A0 auto_pr=3Dprserv_get_pr_aut=
o(d)
> | ERROR: =A0 =A0 =A00005: =A0 =A0 =A0 =A0 =A0 =A0 if auto_pr is None:
> | ERROR: =A0 =A0 =A00006: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.fata=
l("Can NOT get auto PR revision from remote PR service")
> | ERROR: =A0 =A0 =A00007: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return
> | ERROR: =A0 =A0 =A00008: =A0 =A0 =A0 =A0 =A0 =A0 d.setVar('PRAUTO',str(a=
uto_pr))
> | ERROR: (file: 'package_get_auto_pr', lineno: 4, function: package_get_a=
uto_pr)
> | ERROR: Function 'package_get_auto_pr' failed
>
> It doesn't seem to trigger on my debian box, though
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


