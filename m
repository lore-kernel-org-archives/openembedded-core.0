Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 947F36FF93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5605; q=dns/txt; s=iport;
	t=1462875678; x=1464085278;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=8yOFHHqB+mjBxzv946U/fmnNtkNPB3oTkXwn+SeGWbs=;
	b=GI9vnBQ8HdqaT7xN8q2pt+dbKUaiw/NRNHM9oKZqc80RjWSD39MKgJ8L
	Y2ej8+iKWSMX1K5LxDNF6g4g9l+5KhrRSphWVaG/4ceDENY0Qkq/tmUJz
	gbneY+o2+5UvSsgfqkMC5O1BPQd+k/+2Svu+JcePu1or9lJMolikqIUiw M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BFHwBztDFX/xbLJq1chA19tC6DWoMgF?=
	=?us-ascii?q?wEMhSIQOgKCAAEBAQEBAWYnhEEBAQEDAQEBASBLCgEQCxgJFgsCAgkDAgECARU?=
	=?us-ascii?q?BLwYNBgIBAYgfCA6lYJB6AQEBAQEBAQEBAQEBAQEBAQEBAReGIIRMhDKDDYJZB?=
	=?us-ascii?q?Y5PiViFfoUxgm6BaU6EAYMHhViPPmKDbjkyBYdJgTwBAQE?=
X-IronPort-AV: E=Sophos;i="5.24,604,1454976000"; 
	d="scan'208,217";a="637391684"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2016 10:21:16 +0000
Received: from [10.61.82.194] (ams3-vpn-dhcp4803.cisco.com [10.61.82.194])
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id u4AALFjC021157;
	Tue, 10 May 2016 10:21:15 GMT
To: Khem Raj <raj.khem@gmail.com>
References: <1462712432-6214-1-git-send-email-marex@denx.de>
	<81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <5731B61B.8050606@cisco.com>
Date: Tue, 10 May 2016 13:21:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake: Oldest kernel for nios2 is 3.19
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
X-List-Received-Date: Tue, 10 May 2016 10:21:18 -0000
Content-Type: multipart/alternative;
	boundary="------------060105070206010207020705"

--------------060105070206010207020705
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/08/2016 08:06 PM, Khem Raj wrote:
>> On May 8, 2016, at 6:00 AM, Marek Vasut <marex@denx.de> wrote:
>>
>> The oldest kernel version for nios2 is 3.19.0, set it so, otherwise
>> qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
>> message from glibc.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> meta/conf/bitbake.conf | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 1c4175f..2f5db22 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -405,6 +405,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>>
>> OLDEST_KERNEL = "2.6.32"
>> OLDEST_KERNEL_aarch64 = "3.14"
>> +OLDEST_KERNEL_nios2 = “3.19"
> if you don’t need it on krogoth, then I would suggest to hold this patch for master since
> I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x minimum
>
> see
>
> https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce158db29954bc6dabe

Could you please keep 2.6.32 for i386/x86_64? Glibc commit
http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5fc
says that Linux v3.2 is required except on x86 / x86_64.
Currently we build OE and use SDK on x86_64 hosts and some of them
run Linux based on kernel 2.6.32 so we would like to still have ability
to use OE/SDK on such machines

Thanks,
Ruslan

>
>> STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
>> STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
>>
>> --
>> 2.7.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------060105070206010207020705
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 05/08/2016 08:06 PM, Khem Raj wrote:<br>
    </div>
    <blockquote
      cite="mid:81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">On May 8, 2016, at 6:00 AM, Marek Vasut <a class="moz-txt-link-rfc2396E" href="mailto:marex@denx.de">&lt;marex@denx.de&gt;</a> wrote:

The oldest kernel version for nios2 is 3.19.0, set it so, otherwise
qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
message from glibc.

Signed-off-by: Marek Vasut <a class="moz-txt-link-rfc2396E" href="mailto:marex@denx.de">&lt;marex@denx.de&gt;</a>
Cc: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
meta/conf/bitbake.conf | 1 +
1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c4175f..2f5db22 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -405,6 +405,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"

OLDEST_KERNEL = "2.6.32"
OLDEST_KERNEL_aarch64 = "3.14"
+OLDEST_KERNEL_nios2 = “3.19"
</pre>
      </blockquote>
      <pre wrap="">
if you don’t need it on krogoth, then I would suggest to hold this patch for master since
I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x minimum

see

<a class="moz-txt-link-freetext" href="https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce158db29954bc6dabe">https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce158db29954bc6dabe</a></pre>
    </blockquote>
    <br>
    Could you please keep 2.6.32 for i386/x86_64? Glibc commit <br>
<a class="moz-txt-link-freetext" href="http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5fc">http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5fc</a><br>
    says that Linux v3.2 is required except on x86 / x86_64.<br>
    Currently we build OE and use SDK on x86_64 hosts and some of them<br>
    run Linux based on kernel 2.6.32 so we would like to still have
    ability<br>
    to use OE/SDK on such machines<br>
    <br>
    Thanks,<br>
    Ruslan<br>
    <br>
    <blockquote
      cite="mid:81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"

--
2.7.0

--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------060105070206010207020705--
