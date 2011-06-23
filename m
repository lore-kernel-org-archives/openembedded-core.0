Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZmnA-0000PF-Nn
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 18:30:09 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QZmji-0005Iw-Im from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 09:26:34 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 23 Jun 2011 09:26:34 -0700
Received: from [172.30.80.156] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 23 Jun 2011 09:26:33 -0700
Message-ID: <4E036937.4040002@mentor.com>
Date: Thu, 23 Jun 2011 09:26:31 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308706423.git.raj.khem@gmail.com>	<1308758279.20015.79.camel@rex>	<4E0235DA.8060200@windriver.com>
	<4E025052.6070300@windriver.com>	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>	<1308783588.20015.104.camel@rex>	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>	<4E027AC4.1090905@mentor.com>
	<BANLkTimxc0yvPrtTu2NP69Pb_ByAzf_Wxg@mail.gmail.com>
In-Reply-To: <BANLkTimxc0yvPrtTu2NP69Pb_ByAzf_Wxg@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 23 Jun 2011 16:26:34.0344 (UTC)
	FILETIME=[513F9680:01CC31C2]
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
X-List-Received-Date: Thu, 23 Jun 2011 16:30:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 06/22/2011 09:13 PM, Khem Raj wrote:
> On Wed, Jun 22, 2011 at 4:29 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> On 06/22/2011 04:22 PM, Khem Raj wrote:
>>> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
>>>>> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>>> On 6/22/11 1:35 PM, Mark Hatle wrote:
>>>>>>> Since applying this update, I'm not longer getting an rpc/rpc.h file, which
>>>>>>> breaks various things like busybox mount.
>>>>>>>
>>>>>>> Is anyone else seeing this behavior?
>>>>>>
>>>>>> Reverting:
>>>>>>
>>>>>> 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
>>>>>> 190a946e9a4213944e3ee675c4b3e18701698e87
>>>>>>
>>>>>> fixed the problem for me.  So there is definitely a problems in the upgrade.
>>>>>>
>>>>>
>>>>> onward looking rpc is now maintained with libtirpc starting glibc 2.14 rpc is
>>>>> not to be used from bundled code in glibc. If we dont have recipes for libtirpc
>>>>> then I will add that.
>>>>
>>>> There looks to be more than this wrong with this update. A quick
>>>> comparison shows the following changes in the list of files being
>>>> installed from do_install:
>>>>
>>>> -./lib/libmemusage.so
>>>> -./lib/libnss_hesiod-2.13.so
>>>> -./lib/libnss_nisplus-2.13.so
>>>> -./lib/libutil-2.13.so
>>>> -./lib/libresolv-2.13.so
>>>> -./lib/libm-2.13.so
>>>> -./lib/libnsl-2.13.so
>>>> -./lib/libnss_compat-2.13.so
>>>> -./lib/libnss_nis-2.13.so
>>>> -./lib/libnss_dns-2.13.so
>>>> -./lib/libanl-2.13.so
>>>> -./lib/libBrokenLocale-2.13.so
>>>> -./lib/libcrypt-2.13.so
>>>> -./etc/rpc
>>>> -./usr/lib/libnss_compat_pic.a
>>>> -./usr/lib/libnss_dns_pic.a
>>>> -./usr/lib/libnss_nisplus_pic.a
>>>> +./usr/lib/audit/sotruss-lib.so
>>>> -./usr/lib/libutil_pic.map
>>>> -./usr/lib/libBrokenLocale_pic.a
>>>> -./usr/lib/libBrokenLocale.a
>>>> -./usr/lib/libBrokenLocale_pic.map
>>>> -./usr/lib/libm.a
>>>> -./usr/lib/libnss_dns_pic.map
>>>> -./usr/lib/libm_pic.map
>>>> -./usr/lib/libnss_hesiod_pic.map
>>>> -./usr/lib/librpcsvc.a
>>>> -./usr/lib/libutil.a
>>>> -./usr/lib/libnss_compat_pic.map
>>>> -./usr/lib/libcrypt.a
>>>> -./usr/lib/libutil_pic.a
>>>> -./usr/lib/libanl.a
>>>> -./usr/lib/libnsl_pic.a
>>>> -./usr/lib/libresolv.a
>>>> -./usr/lib/libnss_hesiod_pic.a
>>>> -./usr/lib/libm_pic.a
>>>> -./usr/lib/libnsl_pic.map
>>>> -./usr/lib/libnss_nis_pic.map
>>>> -./usr/lib/libanl_pic.a
>>>> -./usr/lib/libcrypt_pic.map
>>>> -./usr/lib/libcrypt_pic.a
>>>> -./usr/lib/libnss_nis_pic.a
>>>> -./usr/lib/libresolv_pic.map
>>>> -./usr/lib/libresolv_pic.a
>>>> -./usr/lib/libanl_pic.map
>>>> -./usr/lib/libnss_nisplus_pic.map
>>>> -./usr/lib/libnsl.a
>>>> -./usr/bin/rpcgen
>>>> -./usr/bin/gencat
>>>> +./usr/bin/sotruss
>>>> -./usr/bin/localedef
>>>> -./usr/bin/locale
>>>> -./usr/sbin/rpcinfo
>>>> -./usr/sbin/nscd
>>>>
>>>> Some of these are rpc related but there are other issues too.
>>>>
>>>> I've reverted the upgrade itself for now until we have something in
>>>> place to address the issues and its actually had some testing...
>>>>
>>>
>>> some of these are due to rpc and others are due to nss being removed
>>> I need to backport the nss db re-implementation then most of it should
>>> be resolved
>>> I guess I will post 2.14 as additional recipes rather than replacement for 2.13
>>> that way we will get some soak time.
>>
>> Neither of those would explain the locale problem Otavio and I have seen:
> 
> $ find ../../eglibc-2.14-r0+svnr14285/packages-split/ -name "*wae*"
> ../../eglibc-2.14-r0+svnr14285/packages-split/locale-base-wae-ch
> ../../eglibc-2.14-r0+svnr14285/packages-split/eglibc-localedata-wae-ch
> ../../eglibc-2.14-r0+svnr14285/packages-split/eglibc-localedata-wae-ch/usr/share/i18n/locales/wae_CH
> 
> so don't know whats the problem you are having.

Well, in my case it's a brand new checkout of oe-core + meta-oe in
'distro-less' mode.  Otavio saw the same thing with his custom distro
which just uses the default bits for libc features.

-- 
Tom Rini
Mentor Graphics Corporation


