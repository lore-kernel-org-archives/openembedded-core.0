Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id F26096B5E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 19:44:20 +0000 (UTC)
Received: from [192.168.1.100] (blfd-4db136a0.pool.mediaWays.net
	[77.177.54.160])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 85E5B18404DE;
	Thu, 15 Aug 2013 21:44:20 +0200 (CEST)
Message-ID: <520D2F92.7030009@herbrechtsmeier.net>
Date: Thu, 15 Aug 2013 21:44:18 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
References: <1376470064-6391-1-git-send-email-stefan@herbrechtsmeier.net>
	<015801ce98e6$826796d0$8736c470$@oss.bmw-carit.de>
In-Reply-To: <015801ce98e6$826796d0$8736c470$@oss.bmw-carit.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake.bbclass: Don't use packages from the native	build machine
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
X-List-Received-Date: Thu, 15 Aug 2013 19:44:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Am 14.08.2013 14:05, schrieb Lukas Bulwahn:
> I have been working with this patch for quite some time on my
> OpenEmbedded-Core repository and I have not seen any problems, but I do not
> know if it breaks anything on the complete 'bitbake world'.
The only thing that should be used from the native build machine is the 
detection of the native compiler and this detection is already broken as 
the cmake module expect a CMAKE_C_COMPILER  and CMAKE_CXX_COMPILER 
compiler variable with full paths.

>> -----Ursprüngliche Nachricht-----
>> Von: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] Im
>> Auftrag von Stefan Herbrechtsmeier
>> Gesendet: Mittwoch, 14. August 2013 10:48
>> An: openembedded-core@lists.openembedded.org
>> Betreff: [OE-core] [PATCH] cmake.bbclass: Don't use packages from the
>> native build machine
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
>> ---
>>   meta/classes/cmake.bbclass |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass index
>> 310242e..8e579a7 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -49,6 +49,7 @@ set( CMAKE_CXX_LINK_FLAGS
>> "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )  # only search
>> in the paths provided so cmake doesnt pick  # up libraries and tools from
> the
>> native build machine  set( CMAKE_FIND_ROOT_PATH
>> ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR}
>> ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
>> ${EXTERNAL_TOOLCHAIN})
>> +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
>>   set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )  set(
>> CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )  set(
>> CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


