Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Swoga-0001qa-AP
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 08:15:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2012 23:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="192329532"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2012 23:03:21 -0700
Message-ID: <501A1895.2020809@intel.com>
Date: Thu, 02 Aug 2012 09:05:09 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343829298-29238-1-git-send-email-radu.moisan@intel.com>
	<20120801140128.GI16306@jama.jama.net>
In-Reply-To: <20120801140128.GI16306@jama.jama.net>
Subject: Re: [PATCH v2] liburcu: Upgrade to upstream 0.7.3
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
X-List-Received-Date: Thu, 02 Aug 2012 06:15:04 -0000
Content-Type: multipart/alternative;
	boundary="------------070108050301040901000402"

--------------070108050301040901000402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

No it doesn't, just found Alex's patch.
Since Alex's patch is older and ongoing review, just forget about this one.

Radu

On 08/01/2012 05:01 PM, Martin Jansa wrote:
> On Wed, Aug 01, 2012 at 04:54:58PM +0300, Radu Moisan wrote:
>> LICENSE file has the date changed otherwise just a regular
>> package update.
> And does this resolve Saul's review comments?
>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>   .../liburcu/{liburcu_0.6.7.bb => liburcu_0.7.3.bb} |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-support/liburcu/{liburcu_0.6.7.bb => liburcu_0.7.3.bb} (77%)
>>
>> diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
>> similarity index 77%
>> rename from meta/recipes-support/liburcu/liburcu_0.6.7.bb
>> rename to meta/recipes-support/liburcu/liburcu_0.7.3.bb
>> index be73856..86f29be 100644
>> --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
>> +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://lttng.org/urcu"
>>   BUGTRACKER = "http://lttng.org/project/issues"
>>   
>>   LICENSE = "LGPLv2.1+ & MIT-style"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
>>                       file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
>>                       file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
>>   
>> @@ -11,8 +11,8 @@ PR = "r0"
>>   
>>   SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
>>   
>> -SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
>> -SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
>> +SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
>> +SRC_URI[sha256sum] = "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
>>   
>>   S = "${WORKDIR}/userspace-rcu-${PV}"
>>   CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070108050301040901000402
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    No it doesn't, just found Alex's patch.<br>
    Since Alex's patch is older and ongoing review, just forget about
    this one.<br>
    <br>
    Radu<br>
    <br>
    <div class="moz-cite-prefix">On 08/01/2012 05:01 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20120801140128.GI16306@jama.jama.net"
      type="cite">
      <pre wrap="">On Wed, Aug 01, 2012 at 04:54:58PM +0300, Radu Moisan wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">LICENSE file has the date changed otherwise just a regular
package update.
</pre>
      </blockquote>
      <pre wrap="">
And does this resolve Saul's review comments?

</pre>
      <blockquote type="cite">
        <pre wrap="">
Signed-off-by: Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
---
 .../liburcu/{liburcu_0.6.7.bb =&gt; liburcu_0.7.3.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.6.7.bb =&gt; liburcu_0.7.3.bb} (77%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
similarity index 77%
rename from meta/recipes-support/liburcu/liburcu_0.6.7.bb
rename to meta/recipes-support/liburcu/liburcu_0.7.3.bb
index be73856..86f29be 100644
--- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://lttng.org/urcu">"http://lttng.org/urcu"</a>
 BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="http://lttng.org/project/issues">"http://lttng.org/project/issues"</a>
 
 LICENSE = "LGPLv2.1+ &amp; MIT-style"
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff\+LIC_FILES_CHKSUM=">"file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
+LIC_FILES_CHKSUM = "</a<a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89\file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9\file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42">"file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"</a>
 
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2">"http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"</a>
 
-SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
-SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
+SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
+SRC_URI[sha256sum] = "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.9.5


_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070108050301040901000402--
