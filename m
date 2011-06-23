Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZoHT-0003Eh-Ew
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 20:05:31 +0200
Received: by pvf24 with SMTP id 24so1372724pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=INfIMk4IM4IqVijpuFRhzgq6uD6hcJd1lmSHBMJkup8=;
	b=mdpUsqx9cT3WkuE/qXH5F+t/dfKPqcxpgt7o6kDvZzfdFszozFAkDBkbG+a/bwqz1b
	JCTj8qVyenqPzp5AUq2N76yOYcOveJy1XjPPLqr0D6EMf8GJAlM5zLGTIEfmwBKPlRrg
	SvO7IPX04Sl2ociC6QCndGlIet6LrhcFQXczM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=C27e4rMVB0yZmmCDeTNvBmMcQik4dJ91XoRbTR3ej5sH79C7GT8piNNhOb7TdwyL1v
	3CVoFoalFFSk/FtjKQJcn6M4Bwnwzy3SU72AZolK3osBFjsZV3WtQLn5jgJn2NlQeNfJ
	tkrpst5lBxV45FJz6KlhYVevWiyMlRo9Bq5fQ=
Received: by 10.68.36.234 with SMTP id t10mr1312309pbj.361.1308852114905; Thu,
	23 Jun 2011 11:01:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Thu, 23 Jun 2011 11:01:22 -0700 (PDT)
In-Reply-To: <4E036937.4040002@mentor.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex>
	<4E0235DA.8060200@windriver.com> <4E025052.6070300@windriver.com>
	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>
	<1308783588.20015.104.camel@rex>
	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
	<4E027AC4.1090905@mentor.com>
	<BANLkTimxc0yvPrtTu2NP69Pb_ByAzf_Wxg@mail.gmail.com>
	<4E036937.4040002@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jun 2011 11:01:22 -0700
Message-ID: <BANLkTinn8vOoJ7O2hmovRQniCqXpG1Vvig@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jun 2011 18:05:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2011 at 9:26 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 06/22/2011 09:13 PM, Khem Raj wrote:
>> On Wed, Jun 22, 2011 at 4:29 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>> On 06/22/2011 04:22 PM, Khem Raj wrote:
>>>> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
>>>>>> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.co=
m> wrote:
>>>>>>> On 6/22/11 1:35 PM, Mark Hatle wrote:
>>>>>>>> Since applying this update, I'm not longer getting an rpc/rpc.h fi=
le, which
>>>>>>>> breaks various things like busybox mount.
>>>>>>>>
>>>>>>>> Is anyone else seeing this behavior?
>>>>>>>
>>>>>>> Reverting:
>>>>>>>
>>>>>>> 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
>>>>>>> 190a946e9a4213944e3ee675c4b3e18701698e87
>>>>>>>
>>>>>>> fixed the problem for me. =C2=A0So there is definitely a problems i=
n the upgrade.
>>>>>>>
>>>>>>
>>>>>> onward looking rpc is now maintained with libtirpc starting glibc 2.=
14 rpc is
>>>>>> not to be used from bundled code in glibc. If we dont have recipes f=
or libtirpc
>>>>>> then I will add that.
>>>>>
>>>>> There looks to be more than this wrong with this update. A quick
>>>>> comparison shows the following changes in the list of files being
>>>>> installed from do_install:
>>>>>
>>>>> -./lib/libmemusage.so
>>>>> -./lib/libnss_hesiod-2.13.so
>>>>> -./lib/libnss_nisplus-2.13.so
>>>>> -./lib/libutil-2.13.so
>>>>> -./lib/libresolv-2.13.so
>>>>> -./lib/libm-2.13.so
>>>>> -./lib/libnsl-2.13.so
>>>>> -./lib/libnss_compat-2.13.so
>>>>> -./lib/libnss_nis-2.13.so
>>>>> -./lib/libnss_dns-2.13.so
>>>>> -./lib/libanl-2.13.so
>>>>> -./lib/libBrokenLocale-2.13.so
>>>>> -./lib/libcrypt-2.13.so
>>>>> -./etc/rpc
>>>>> -./usr/lib/libnss_compat_pic.a
>>>>> -./usr/lib/libnss_dns_pic.a
>>>>> -./usr/lib/libnss_nisplus_pic.a
>>>>> +./usr/lib/audit/sotruss-lib.so
>>>>> -./usr/lib/libutil_pic.map
>>>>> -./usr/lib/libBrokenLocale_pic.a
>>>>> -./usr/lib/libBrokenLocale.a
>>>>> -./usr/lib/libBrokenLocale_pic.map
>>>>> -./usr/lib/libm.a
>>>>> -./usr/lib/libnss_dns_pic.map
>>>>> -./usr/lib/libm_pic.map
>>>>> -./usr/lib/libnss_hesiod_pic.map
>>>>> -./usr/lib/librpcsvc.a
>>>>> -./usr/lib/libutil.a
>>>>> -./usr/lib/libnss_compat_pic.map
>>>>> -./usr/lib/libcrypt.a
>>>>> -./usr/lib/libutil_pic.a
>>>>> -./usr/lib/libanl.a
>>>>> -./usr/lib/libnsl_pic.a
>>>>> -./usr/lib/libresolv.a
>>>>> -./usr/lib/libnss_hesiod_pic.a
>>>>> -./usr/lib/libm_pic.a
>>>>> -./usr/lib/libnsl_pic.map
>>>>> -./usr/lib/libnss_nis_pic.map
>>>>> -./usr/lib/libanl_pic.a
>>>>> -./usr/lib/libcrypt_pic.map
>>>>> -./usr/lib/libcrypt_pic.a
>>>>> -./usr/lib/libnss_nis_pic.a
>>>>> -./usr/lib/libresolv_pic.map
>>>>> -./usr/lib/libresolv_pic.a
>>>>> -./usr/lib/libanl_pic.map
>>>>> -./usr/lib/libnss_nisplus_pic.map
>>>>> -./usr/lib/libnsl.a
>>>>> -./usr/bin/rpcgen
>>>>> -./usr/bin/gencat
>>>>> +./usr/bin/sotruss
>>>>> -./usr/bin/localedef
>>>>> -./usr/bin/locale
>>>>> -./usr/sbin/rpcinfo
>>>>> -./usr/sbin/nscd
>>>>>
>>>>> Some of these are rpc related but there are other issues too.
>>>>>
>>>>> I've reverted the upgrade itself for now until we have something in
>>>>> place to address the issues and its actually had some testing...
>>>>>
>>>>
>>>> some of these are due to rpc and others are due to nss being removed
>>>> I need to backport the nss db re-implementation then most of it should
>>>> be resolved
>>>> I guess I will post 2.14 as additional recipes rather than replacement=
 for 2.13
>>>> that way we will get some soak time.
>>>
>>> Neither of those would explain the locale problem Otavio and I have see=
n:
>>
>> $ find ../../eglibc-2.14-r0+svnr14285/packages-split/ -name "*wae*"
>> ../../eglibc-2.14-r0+svnr14285/packages-split/locale-base-wae-ch
>> ../../eglibc-2.14-r0+svnr14285/packages-split/eglibc-localedata-wae-ch
>> ../../eglibc-2.14-r0+svnr14285/packages-split/eglibc-localedata-wae-ch/u=
sr/share/i18n/locales/wae_CH
>>
>> so don't know whats the problem you are having.
>
> Well, in my case it's a brand new checkout of oe-core + meta-oe in
> 'distro-less' mode. =C2=A0Otavio saw the same thing with his custom distr=
o
> which just uses the default bits for libc features.
>

OK this a a new locale introduced in 2.14 but I checked the bits and
they all seem correct
to me. I will try to reproduce it but may not be this week.
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


