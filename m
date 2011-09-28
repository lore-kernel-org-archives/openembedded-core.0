Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8y87-0002Pl-Vs
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 19:41:12 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 10:35:41 -0700
Received: by wwn22 with SMTP id 22so1925170wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 10:35:40 -0700 (PDT)
Received: by 10.227.58.84 with SMTP id f20mr2431580wbh.9.1317231339694;
	Wed, 28 Sep 2011 10:35:39 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id j18sm41468357wbo.6.2011.09.28.10.35.37
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 10:35:39 -0700 (PDT)
Message-ID: <4E835AE7.9070005@intel.com>
Date: Wed, 28 Sep 2011 10:35:35 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
	<1316971012.8185.30.camel@ted>
	<CAMKF1sphSpMstEoqqQmhF9NeHnAuJBvc3F5vcewB3ALwSA7o2w@mail.gmail.com>
	<4E8356B5.7000901@intel.com> <4E835979.7070104@gmail.com>
In-Reply-To: <4E835979.7070104@gmail.com>
Subject: Re: [PATCH] intltool: inherit gettext to add missing dependency on gettext
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
X-List-Received-Date: Wed, 28 Sep 2011 17:41:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2011 10:29 AM, Khem Raj wrote:
> On 9/28/2011 10:17 AM, Saul Wold wrote:
>> On 09/25/2011 05:22 PM, Khem Raj wrote:
>>> On Sun, Sep 25, 2011 at 10:16 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Sat, 2011-09-24 at 17:11 -0700, Khem Raj wrote:
>>>>> Fixes the error like below
>>>>>
>>>>> | configure: error: GNU gettext tools not found; required for intltool
>>>>> | + bbfatal 'oe_runconf failed'
>>>>> | + echo 'ERROR: oe_runconf failed'
>>>>> | ERROR: oe_runconf failed
>>>>>
>>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>> ---
>>>>> meta/recipes-devtools/intltool/intltool.inc | 2 +-
>>>>> meta/recipes-devtools/intltool/intltool_0.40.6.bb | 2 +-
>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/intltool/intltool.inc
>>>>> b/meta/recipes-devtools/intltool/intltool.inc
>>>>> index 23a1ee9..1e54feb 100644
>>>>> --- a/meta/recipes-devtools/intltool/intltool.inc
>>>>> +++ b/meta/recipes-devtools/intltool/intltool.inc
>>>>> @@ -12,7 +12,7 @@ DEPENDS_virtclass-native =
>>>>> "libxml-parser-perl-native"
>>>>> RRECOMMENDS_${PN} = "perl-modules"
>>>>> RRECOMMENDS_${PN}_virtclass-native = ""
>>>>>
>>>>> -inherit autotools pkgconfig perlnative
>>>>> +inherit autotools pkgconfig perlnative gettext
>>>>>
>>>>> export PERL = "${bindir}/env perl"
>>>>> PERL_virtclass-native = "/usr/bin/env nativeperl"
>>>>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>>> b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>>> index e9871fc..eae2b85 100644
>>>>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>>> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>>> @@ -1,7 +1,7 @@
>>>>> require intltool.inc
>>>>> LICENSE="GPLv2"
>>>>> LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>>>> -PR = "r5"
>>>>> +PR = "r6"
>>>>>
>>>>> SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
>>>>> ${NATIVEPATCHES} \
>>>>
>>>> I investigated this one and intltool requires gettext at runtime, not
>>>> build time. Which package did you see the above error from as I suspect
>>>> it wasn't intltool itself but something using it?
>>>
>>> It was intltool itself. The situation happens during rebuild when
>>> intltool and gettext-native both are to be rebuilt
>>> and other deps are already there. it doesnt usually happen since we
>>> build gettext-native pretty early.
>>
>> Khem,
>>
>> I verified this, and I also noted that if I did a cleansstate on
>> intltool and gettext-native, that gettext-native would be rebuilt, but I
>> also checked bitbake -b intltool and it completed successfully with no
>> errors, so the dependency is buried in one of intltool's dependencies,
>> thus getting built.
>>
>> So there is no direct dependency on gettext-native by intltool.
>
> yes intltool has runtime dependency on gettext-native but not buildtime
> AFAICT. I dont have those logs any more so cant go back and check.
>
Sorry, I meant no direct buildtime above

> Hold on to this patch for now. i will remove it locally and do a rebuild
> and see if I hit it again
>
OK will hold it.

Sau!


>>
>>
>> Sau!
>>
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



