Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZbM0-0003lQ-CZ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 06:17:20 +0200
Received: by pvf24 with SMTP id 24so985404pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 21:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=gtD/9ecZgQSFS7FyoNP6VpD1Jt8uzc7joq96xmYWDD0=;
	b=v3xrgn33N5WfLlCguvX3X5e4hUUOEieoYsD2YFMFjpQFYhl3ZDzCftUBiNJ9ZFPPks
	bBu9dJewniqH/+MsapkXt0NMQ0iZsCnsUrCp8P5K/q3yj048BvFKWSwIMu6R1b4L3l3V
	Qm1BGggXwTzUj11QmG65GnuLLxm6KHxmh5poM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FNdJ2cQM0T0vqLnU7u4VH0sdpU8r/MpcVXpVm52NtW9fwEmNzvlHDXbBemFRFEmfTB
	A53Gzy0A85IFDZzC+4DBXOWRQPgU4sojd3ehCgZSRBfQy9Mxq8A0Tpt51AYKpGzUVmB2
	wH9b7JMNuT7lT2JuQo/rSknqDrihxaQraFJWo=
Received: by 10.68.32.66 with SMTP id g2mr977612pbi.26.1308802424060; Wed, 22
	Jun 2011 21:13:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Wed, 22 Jun 2011 21:13:14 -0700 (PDT)
In-Reply-To: <4E027AC4.1090905@mentor.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex>
	<4E0235DA.8060200@windriver.com> <4E025052.6070300@windriver.com>
	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>
	<1308783588.20015.104.camel@rex>
	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
	<4E027AC4.1090905@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jun 2011 21:13:14 -0700
Message-ID: <BANLkTimxc0yvPrtTu2NP69Pb_ByAzf_Wxg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Thu, 23 Jun 2011 04:17:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 4:29 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 06/22/2011 04:22 PM, Khem Raj wrote:
>> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
>>>> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.com>=
 wrote:
>>>>> On 6/22/11 1:35 PM, Mark Hatle wrote:
>>>>>> Since applying this update, I'm not longer getting an rpc/rpc.h file=
, which
>>>>>> breaks various things like busybox mount.
>>>>>>
>>>>>> Is anyone else seeing this behavior?
>>>>>
>>>>> Reverting:
>>>>>
>>>>> 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
>>>>> 190a946e9a4213944e3ee675c4b3e18701698e87
>>>>>
>>>>> fixed the problem for me. =C2=A0So there is definitely a problems in =
the upgrade.
>>>>>
>>>>
>>>> onward looking rpc is now maintained with libtirpc starting glibc 2.14=
 rpc is
>>>> not to be used from bundled code in glibc. If we dont have recipes for=
 libtirpc
>>>> then I will add that.
>>>
>>> There looks to be more than this wrong with this update. A quick
>>> comparison shows the following changes in the list of files being
>>> installed from do_install:
>>>
>>> -./lib/libmemusage.so
>>> -./lib/libnss_hesiod-2.13.so
>>> -./lib/libnss_nisplus-2.13.so
>>> -./lib/libutil-2.13.so
>>> -./lib/libresolv-2.13.so
>>> -./lib/libm-2.13.so
>>> -./lib/libnsl-2.13.so
>>> -./lib/libnss_compat-2.13.so
>>> -./lib/libnss_nis-2.13.so
>>> -./lib/libnss_dns-2.13.so
>>> -./lib/libanl-2.13.so
>>> -./lib/libBrokenLocale-2.13.so
>>> -./lib/libcrypt-2.13.so
>>> -./etc/rpc
>>> -./usr/lib/libnss_compat_pic.a
>>> -./usr/lib/libnss_dns_pic.a
>>> -./usr/lib/libnss_nisplus_pic.a
>>> +./usr/lib/audit/sotruss-lib.so
>>> -./usr/lib/libutil_pic.map
>>> -./usr/lib/libBrokenLocale_pic.a
>>> -./usr/lib/libBrokenLocale.a
>>> -./usr/lib/libBrokenLocale_pic.map
>>> -./usr/lib/libm.a
>>> -./usr/lib/libnss_dns_pic.map
>>> -./usr/lib/libm_pic.map
>>> -./usr/lib/libnss_hesiod_pic.map
>>> -./usr/lib/librpcsvc.a
>>> -./usr/lib/libutil.a
>>> -./usr/lib/libnss_compat_pic.map
>>> -./usr/lib/libcrypt.a
>>> -./usr/lib/libutil_pic.a
>>> -./usr/lib/libanl.a
>>> -./usr/lib/libnsl_pic.a
>>> -./usr/lib/libresolv.a
>>> -./usr/lib/libnss_hesiod_pic.a
>>> -./usr/lib/libm_pic.a
>>> -./usr/lib/libnsl_pic.map
>>> -./usr/lib/libnss_nis_pic.map
>>> -./usr/lib/libanl_pic.a
>>> -./usr/lib/libcrypt_pic.map
>>> -./usr/lib/libcrypt_pic.a
>>> -./usr/lib/libnss_nis_pic.a
>>> -./usr/lib/libresolv_pic.map
>>> -./usr/lib/libresolv_pic.a
>>> -./usr/lib/libanl_pic.map
>>> -./usr/lib/libnss_nisplus_pic.map
>>> -./usr/lib/libnsl.a
>>> -./usr/bin/rpcgen
>>> -./usr/bin/gencat
>>> +./usr/bin/sotruss
>>> -./usr/bin/localedef
>>> -./usr/bin/locale
>>> -./usr/sbin/rpcinfo
>>> -./usr/sbin/nscd
>>>
>>> Some of these are rpc related but there are other issues too.
>>>
>>> I've reverted the upgrade itself for now until we have something in
>>> place to address the issues and its actually had some testing...
>>>
>>
>> some of these are due to rpc and others are due to nss being removed
>> I need to backport the nss db re-implementation then most of it should
>> be resolved
>> I guess I will post 2.14 as additional recipes rather than replacement f=
or 2.13
>> that way we will get some soak time.
>
> Neither of those would explain the locale problem Otavio and I have seen:

$ find ../../eglibc-2.14-r0+svnr14285/packages-split/ -name "*wae*"
../../eglibc-2.14-r0+svnr14285/packages-split/locale-base-wae-ch
../../eglibc-2.14-r0+svnr14285/packages-split/eglibc-localedata-wae-ch
../../eglibc-2.14-r0+svnr14285/packages-split/eglibc-localedata-wae-ch/usr/=
share/i18n/locales/wae_CH

so don't know whats the problem you are having.

> NOTE: generating locale wae_CH (UTF-8)
> NOTE: cmd:
> NOTE:
> PATH=3D"/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_6=
4-linux/usr/bin/i586-oe-linux.gcc-cross-intermediate:/home/trini/work/tmp/o=
e-core-template/build-eglibc/sysroots/x86_64-linux/usr/bin/i586-oe-linux:/h=
ome/trini/work/tmp/oe-core-template/build-eglibc/sysroots/qemux86/usr/bin/c=
rossscripts:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86=
_64-linux/usr/sbin:/home/trini/work/tmp/oe-core-template/build-eglibc/sysro=
ots/x86_64-linux/usr/bin:/home/trini/work/tmp/oe-core-template/build-eglibc=
/sysroots/x86_64-linux/sbin:/home/trini/work/tmp/oe-core-template/build-egl=
ibc/sysroots/x86_64-linux//bin:/home/trini/work/tmp/oe-core-template/oe-cor=
e/scripts:/home/trini/work/tmp/oe-core-template/bitbake/bin:/home/trini/bin=
:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/h=
ome/trini/bin:/home/trini/work/tmp/oe-core-template/oe-core/scripts"
> I18NPATH=3D"/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-=
oe-linux/eglibc-2.14-r0+svnr14285/locale-tree/usr/share/i18n"
> GCONV_PATH=3D"/home/trini/work/tmp/oe-core-template/build-eglibc/work/i58=
6-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree/iconvdata"
> cross-localedef =C2=A0--uint32-align=3D4 --little-endian =C2=A0--force --=
old-style
> --no-archive
> --prefix=3D/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-o=
e-linux/eglibc-2.14-r0+svnr14285/locale-tree
> --inputfile=3D/home/trini/work/tmp/oe-core-template/build-eglibc/work/i58=
6-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree//usr/share/i18n/locales/wae=
_CH
> --charmap=3DUTF-8
> /home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-oe-linux/egl=
ibc-2.14-r0+svnr14285/locale-tree/usr/lib/locale/wae_CH
> NOTE: stdout:
> NOTE:
> NOTE: stderr:
> NOTE: LC_ADDRESS: terminology language code `wae' not defined
> LC_ADDRESS: language abbreviation `wae' not defined
> ERROR: Function 'localedef returned an error' failed
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


