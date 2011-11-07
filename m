Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNO7M-0003KV-1o
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 13:16:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA7C9k4u009635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 04:09:46 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 7 Nov 2011 04:09:46 -0800
Message-ID: <4EB7C969.8050606@windriver.com>
Date: Mon, 7 Nov 2011 20:04:57 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320664163.git.xiaofeng.yan@windriver.com>	<2a7edb60d8e4495033d7e938fa6a1e2930529a8f.1320664163.git.xiaofeng.yan@windriver.com>
	<D8A7C44A-5902-42ED-986A-C0944BC7D0E0@dominion.thruhere.net>
In-Reply-To: <D8A7C44A-5902-42ED-986A-C0944BC7D0E0@dominion.thruhere.net>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 1/2] libarchive: update to 2.8.5
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
X-List-Received-Date: Mon, 07 Nov 2011 12:16:00 -0000
Content-Type: multipart/alternative;
	boundary="------------070606080902010809020406"

--------------070606080902010809020406
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?11?07? 19:36, Koen Kooi wrote:
> Op 7 nov. 2011, om 12:13 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> libarchive: update to 2.8.5
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> ...rchive_2.8.4.yocto.1.bb =>  libarchive_2.8.5.bb} |    8 ++++----
>> 1 files changed, 4 insertions(+), 4 deletions(-)
>> rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb =>  libarchive_2.8.5.bb} (76%)
>>
>> diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
>> similarity index 76%
>> rename from meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
>> rename to meta/recipes-extended/libarchive/libarchive_2.8.5.bb
>> index 94d261b..1bc49e2 100644
>> --- a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
>> +++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
>> @@ -9,19 +9,19 @@ DEPENDS = "libxml2"
>>
>> # We need to repack the tarball due undistributable content on the upstream one.
>> # More details at http://code.google.com/p/libarchive/issues/detail?id=162
>> -SRC_URI = "http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz \
>> +SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
>>             file://0001-Patch-from-upstream-revision-1990.patch \
>>             file://0002-Patch-from-upstream-revision-1991.patch \
>> -           file://0003-Patch-from-upstream-rev-2516.patch \
> Why was only that patch removed? The commit message doesn't mention anything about it.
>
I have added description about the reason why removing this patch. 
Thanks for your review.
regards,
Yan
> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070606080902010809020406
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2011&#24180;11&#26376;07&#26085; 19:36, Koen Kooi wrote:
    <blockquote
      cite="mid:D8A7C44A-5902-42ED-986A-C0944BC7D0E0@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 7 nov. 2011, om 12:13 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>

libarchive: update to 2.8.5

Signed-off-by: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
---
...rchive_2.8.4.yocto.1.bb =&gt; libarchive_2.8.5.bb} |    8 ++++----
1 files changed, 4 insertions(+), 4 deletions(-)
rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb =&gt; libarchive_2.8.5.bb} (76%)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
similarity index 76%
rename from meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
rename to meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 94d261b..1bc49e2 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -9,19 +9,19 @@ DEPENDS = "libxml2"

# We need to repack the tarball due undistributable content on the upstream one.
# More details at <a class="moz-txt-link-freetext" href="http://code.google.com/p/libarchive/issues/detail?id=162">http://code.google.com/p/libarchive/issues/detail?id=162</a>
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz\+SRC_URI=">"http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz \
+SRC_URI = "</a><a class="moz-txt-link-freetext" href="http://libarchive.googlecode.com/files/libarchive-$">http://libarchive.googlecode.com/files/libarchive-$</a>{PV}.tar.gz \
           <a class="moz-txt-link-freetext" href="file://0001-Patch-from-upstream-revision-1990.patch">file://0001-Patch-from-upstream-revision-1990.patch</a> \
           <a class="moz-txt-link-freetext" href="file://0002-Patch-from-upstream-revision-1991.patch">file://0002-Patch-from-upstream-revision-1991.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0003-Patch-from-upstream-rev-2516.patch">file://0003-Patch-from-upstream-rev-2516.patch</a> \
</pre>
      </blockquote>
      <pre wrap="">
Why was only that patch removed? The commit message doesn't mention anything about it.

</pre>
    </blockquote>
    I have added description about the reason why removing this patch.
    Thanks for your review. <br>
    regards,<br>
    Yan <br>
    <blockquote
      cite="mid:D8A7C44A-5902-42ED-986A-C0944BC7D0E0@dominion.thruhere.net"
      type="cite">
      <pre wrap="">regards,

Koen

</pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070606080902010809020406--
