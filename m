Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXr5v-0000BH-HT
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 11:46:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2012 02:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="104200857"
Received: from dell-desktop (HELO [10.237.104.69]) ([10.237.104.69])
	by AZSMGA002.ch.intel.com with ESMTP; 25 May 2012 02:35:49 -0700
Message-ID: <4FBF53DC.9000201@intel.com>
Date: Fri, 25 May 2012 12:41:48 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1337868781.git.radu.moisan@intel.com>
	<eb1e7a0ded7e26ab8f79017f20ce139de82810b0.1337868781.git.radu.moisan@intel.com>
	<20120525085103.GB3138@jama.jama.net> <4FBF5141.1070908@intel.com>
In-Reply-To: <4FBF5141.1070908@intel.com>
Subject: Re: [PATCH 2/3] mtd-utils: Update to version 1.5.0
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
X-List-Received-Date: Fri, 25 May 2012 09:46:04 -0000
Content-Type: multipart/alternative;
	boundary="------------090609080107030905080505"

--------------090609080107030905080505
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

one more thing about mtd-utils, is there a way I can test this package 
so that I can be sure the correct version was built?

Thanks,
Radu

On 05/25/2012 12:30 PM, Radu Moisan wrote:
> your're right, I'll prepare a new patch for that.
>
> Thanks,
> Radu
>
> On 05/25/2012 11:51 AM, Martin Jansa wrote:
>> On Fri, May 25, 2012 at 11:50:56AM +0300, Radu Moisan wrote:
>>> Signed-off-by: Radu Moisan<radu.moisan@intel.com>
>>> ---
>>>   .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
>>>   .../mtd/{mtd-utils_1.4.9.bb =>  mtd-utils_1.5.0.bb} |    2 +-
>>>   2 files changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 =>  mtd-utils-1.5.0}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
>>>   rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb =>  mtd-utils_1.5.0.bb} (98%)
>>>
>>> diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mkfs-jffs2-git-2.patch
>>> rename to meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
>>> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>> similarity index 98%
>>> rename from meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
>>> rename to meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>> index 4228b51..be71efe 100644
>>> --- a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
>>> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf
>>>
>>>   S = "${WORKDIR}/git/"
>>>
>>> -PR = "r1"
>>> +PR = "r0"
>>>
>>>   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
>> does it really update version?
>> SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b
>> wasn't changed, so I guess the sources are the same.
>>
>> Cheers,
>>
>>>
>>> -- 
>>> 1.7.9.5
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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

--------------090609080107030905080505
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    one more thing about mtd-utils, is there a way I can test this
    package so that I can be sure the correct version was built?<br>
    <br>
    Thanks,<br>
    Radu<br>
    <br>
    On 05/25/2012 12:30 PM, Radu Moisan wrote:
    <blockquote cite="mid:4FBF5141.1070908@intel.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      your're right, I'll prepare a new patch for that.<br>
      <br>
      Thanks,<br>
      Radu<br>
      <br>
      On 05/25/2012 11:51 AM, Martin Jansa wrote:
      <blockquote cite="mid:20120525085103.GB3138@jama.jama.net"
        type="cite">
        <pre wrap="">On Fri, May 25, 2012 at 11:50:56AM +0300, Radu Moisan wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Signed-off-by: Radu Moisan <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.9.bb =&gt; mtd-utils_1.5.0.bb} |    2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 =&gt; mtd-utils-1.5.0}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb =&gt; mtd-utils_1.5.0.bb} (98%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
similarity index 98%
rename from meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
rename to meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index 4228b51..be71efe 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf
 
 S = "${WORKDIR}/git/"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
</pre>
        </blockquote>
        <pre wrap="">does it really update version?
SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b
wasn't changed, so I guess the sources are the same.

Cheers,

</pre>
        <blockquote type="cite">
          <pre wrap=""> 
-- 
1.7.9.5


_______________________________________________
Openembedded-core mailing list
<a moz-do-not-send="true" class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a moz-do-not-send="true" class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
        </blockquote>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
        <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a moz-do-not-send="true" class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a moz-do-not-send="true" class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
  </body>
</html>

--------------090609080107030905080505--
