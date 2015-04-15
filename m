Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 038BC73D47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 15:02:08 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7F5F5F811E5; Wed, 15 Apr 2015 09:02:09 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 229A1F811E5;
	Wed, 15 Apr 2015 09:02:09 -0600 (MDT)
Message-ID: <552E7D8C.9070704@mlbassoc.com>
Date: Wed, 15 Apr 2015 09:02:36 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <552E7098.9040304@gmx.com>
	<1429109475.6976.124.camel@linuxfoundation.org>
In-Reply-To: <1429109475.6976.124.camel@linuxfoundation.org>
Subject: Re: [PATCH] expect: install header files in usual location
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
X-List-Received-Date: Wed, 15 Apr 2015 15:02:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-15 08:51, Richard Purdie wrote:
> On Wed, 2015-04-15 at 10:07 -0400, Yocto User wrote:
>> This patch resolves [Bug 7552] where the headers for the expect library
>> were installed into the wrong location.
>
> Few minor comments/tweaks needed:
>
> The correct form for bug numbers is:
>
> [YOCTO #7552]
>
>>

Also, needs a Signed-off-by line (with a real name)

>> ---
>>    meta/recipes-devtools/expect/expect_5.45.bb |   12 ++++--------
>>    1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/expect/expect_5.45.bb
>> b/meta/recipes-devtools/expect/expect_5.45.bb
>> index 264f007..4129ab1 100644
>> --- a/meta/recipes-devtools/expect/expect_5.45.bb
>> +++ b/meta/recipes-devtools/expect/expect_5.45.bb
>> @@ -18,7 +18,7 @@ RDEPENDS_${PN} = "tcl"
>>
>>    inherit autotools
>>
>> -PR = "r1"
>> +PR = "r2"
>
> No need to bump PR now.
>
>>    SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>>               file://0001-configure.in.patch \
>> @@ -40,8 +40,7 @@ do_install_append() {
>>            sed -e 's|$dir|${libdir}|' -i
>> ${D}${libdir}/expect${PV}/pkgIndex.tcl
>>    }
>>
>> -EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
>> -                 --with-tcl=${STAGING_LIBDIR} \
>> +EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
>>                     --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
>>                     --enable-shared \
>>                     --enable-threads \
>> @@ -52,12 +51,9 @@ EXTRA_OEMAKE_install = " 'SCRIPTS=' "
>>    FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
>>                        ${libdir}/.debug \
>>                       "
>> +
>>    FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
>> -                   ${STAGING_INCDIR}/expect.h \
>> -                   ${STAGING_INCDIR}/expect_tcl.h \
>> -                   ${STAGING_INCDIR}/expect_comm.h \
>> -                   ${STAGING_INCDIR}/tcldbg.h \
>> -                   ${includedir}/*.h \
>> +                   ${includedir} \
>>                      "
>
> Isn't this included in FILES_${PN}-dev by default?
>
> Cheers,
>
> Richard
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

