Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8y2G-0002Le-Bb
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 19:35:08 +0200
Received: by ywf7 with SMTP id 7so7742859ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=LmXe45KW4wLyVWQDk3sMw4/ou9ro5RPT3zhxvBoNNJM=;
	b=ho2DNUBGOUMfMz50HhYa6wtLWnqwZcDE00Sesy6EEL3mJhfnaUlqZJrMrNICeaReVc
	14RPtz5mZF2eq9Z+t026nPbckw3lRBxU08ebouzeRPfQXufiiuLpVPSeq+jmBfh0WxxE
	77QRYdytGnc9dRimARlHBYzuzDrjP6C5l2DBI=
Received: by 10.236.156.67 with SMTP id l43mr39991977yhk.10.1317230976728;
	Wed, 28 Sep 2011 10:29:36 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id p8sm39155247yhe.17.2011.09.28.10.29.34
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 10:29:35 -0700 (PDT)
Message-ID: <4E835979.7070104@gmail.com>
Date: Wed, 28 Sep 2011 10:29:29 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
	<1316971012.8185.30.camel@ted>
	<CAMKF1sphSpMstEoqqQmhF9NeHnAuJBvc3F5vcewB3ALwSA7o2w@mail.gmail.com>
	<4E8356B5.7000901@intel.com>
In-Reply-To: <4E8356B5.7000901@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 28 Sep 2011 17:35:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/2011 10:17 AM, Saul Wold wrote:
> On 09/25/2011 05:22 PM, Khem Raj wrote:
>> On Sun, Sep 25, 2011 at 10:16 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Sat, 2011-09-24 at 17:11 -0700, Khem Raj wrote:
>>>> Fixes the error like below
>>>>
>>>> | configure: error: GNU gettext tools not found; required for intltool
>>>> | + bbfatal 'oe_runconf failed'
>>>> | + echo 'ERROR: oe_runconf failed'
>>>> | ERROR: oe_runconf failed
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> meta/recipes-devtools/intltool/intltool.inc | 2 +-
>>>> meta/recipes-devtools/intltool/intltool_0.40.6.bb | 2 +-
>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/intltool/intltool.inc
>>>> b/meta/recipes-devtools/intltool/intltool.inc
>>>> index 23a1ee9..1e54feb 100644
>>>> --- a/meta/recipes-devtools/intltool/intltool.inc
>>>> +++ b/meta/recipes-devtools/intltool/intltool.inc
>>>> @@ -12,7 +12,7 @@ DEPENDS_virtclass-native =
>>>> "libxml-parser-perl-native"
>>>> RRECOMMENDS_${PN} = "perl-modules"
>>>> RRECOMMENDS_${PN}_virtclass-native = ""
>>>>
>>>> -inherit autotools pkgconfig perlnative
>>>> +inherit autotools pkgconfig perlnative gettext
>>>>
>>>> export PERL = "${bindir}/env perl"
>>>> PERL_virtclass-native = "/usr/bin/env nativeperl"
>>>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>> b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>> index e9871fc..eae2b85 100644
>>>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>>> @@ -1,7 +1,7 @@
>>>> require intltool.inc
>>>> LICENSE="GPLv2"
>>>> LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>>> -PR = "r5"
>>>> +PR = "r6"
>>>>
>>>> SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
>>>> ${NATIVEPATCHES} \
>>>
>>> I investigated this one and intltool requires gettext at runtime, not
>>> build time. Which package did you see the above error from as I suspect
>>> it wasn't intltool itself but something using it?
>>
>> It was intltool itself. The situation happens during rebuild when
>> intltool and gettext-native both are to be rebuilt
>> and other deps are already there. it doesnt usually happen since we
>> build gettext-native pretty early.
>
> Khem,
>
> I verified this, and I also noted that if I did a cleansstate on
> intltool and gettext-native, that gettext-native would be rebuilt, but I
> also checked bitbake -b intltool and it completed successfully with no
> errors, so the dependency is buried in one of intltool's dependencies,
> thus getting built.
>
> So there is no direct dependency on gettext-native by intltool.

yes intltool has runtime dependency on gettext-native but not buildtime
AFAICT. I dont have those logs any more so cant go back and check.

Hold on to this patch for now. i will remove it locally and do a rebuild
and see if I hit it again

>
>
> Sau!
>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



