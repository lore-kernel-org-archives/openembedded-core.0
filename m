Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwZKz-0006fY-TI
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 15:51:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2012 06:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="129227157"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2012 06:39:39 -0700
Message-ID: <50193205.7090906@intel.com>
Date: Wed, 01 Aug 2012 16:41:25 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343821320-21727-1-git-send-email-radu.moisan@intel.com>
	<20120801114409.GB16306@jama.jama.net>
In-Reply-To: <20120801114409.GB16306@jama.jama.net>
Subject: Re: [PATCH] liburcu: Upgrade to upstream 0.7.3
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
X-List-Received-Date: Wed, 01 Aug 2012 13:51:46 -0000
Content-Type: multipart/alternative;
	boundary="------------080909020105000408030008"

--------------080909020105000408030008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

there's  a typo there, LICENSE file has the date changed, otherwise this 
is just a regular package update.
I mentioned this to justify the change in md5sum
I'll correct that in another patch.

Radu
On 08/01/2012 02:44 PM, Martin Jansa wrote:
> On Wed, Aug 01, 2012 at 02:42:00PM +0300, Radu Moisan wrote:
>> LICENSE file has data changed.
> Without any change in package (tarball checksums)?
>
> This is follow up to:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025034.html
> right?
>
> Because this change alone doesn't make much sense.
>
> Cheers,
>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>   meta/recipes-support/liburcu/liburcu_0.7.3.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
>> index a28c3e6..86f29be 100644
>> --- a/meta/recipes-support/liburcu/liburcu_0.7.3.bb
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


--------------080909020105000408030008
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    there's&nbsp; a typo there, LICENSE file has the date changed, otherwise
    this is just a regular package update.<br>
    I mentioned this to justify the change in md5sum<br>
    I'll correct that in another patch.<br>
    <br>
    Radu<br>
    <div class="moz-cite-prefix">On 08/01/2012 02:44 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20120801114409.GB16306@jama.jama.net"
      type="cite">
      <pre wrap="">On Wed, Aug 01, 2012 at 02:42:00PM +0300, Radu Moisan wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">LICENSE file has data changed.
</pre>
      </blockquote>
      <pre wrap="">
Without any change in package (tarball checksums)?

This is follow up to:
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025034.html">http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025034.html</a>
right?

Because this change alone doesn't make much sense.

Cheers,

</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
---
 meta/recipes-support/liburcu/liburcu_0.7.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
index a28c3e6..86f29be 100644
--- a/meta/recipes-support/liburcu/liburcu_0.7.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://lttng.org/urcu">"http://lttng.org/urcu"</a>
 BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="http://lttng.org/project/issues">"http://lttng.org/project/issues"</a>
 
 LICENSE = "LGPLv2.1+ &amp; MIT-style"
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff\+LIC_FILES_CHKSUM=">"file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
+LIC_FILES_CHKSUM = "</a<a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89\file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9\file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42">"file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"</a>
 
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

--------------080909020105000408030008--
