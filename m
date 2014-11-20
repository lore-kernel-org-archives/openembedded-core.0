Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 389906AC95
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 02:13:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAK2DMcY016176
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 19 Nov 2014 18:13:22 -0800 (PST)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 19 Nov 2014 18:13:22 -0800
Message-ID: <546D4DC1.7040900@windriver.com>
Date: Thu, 20 Nov 2014 10:11:13 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>	<1415958217-16545-4-git-send-email-jian.liu@windriver.com>
	<CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com>
In-Reply-To: <CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] logrotate: files will be over written when updating using rpm
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
X-List-Received-Date: Thu, 20 Nov 2014 02:13:33 -0000
Content-Type: multipart/alternative;
	boundary="------------060906010205060105070809"

--------------060906010205060105070809
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


于 2014年11月20日 01:54, Dan McGregor 写道:
> On 14 November 2014 03:43, Jian Liu <jian.liu@windriver.com> wrote:
>> If there is no %config micro before the file in the spec file,
>> this file will be over-written after updating this package
>> using rpm.
>> This will make our settings lost.
>>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>> ---
>>   meta/recipes-extended/logrotate/logrotate_3.8.7.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
>> index faa8e02..8b39602 100644
>> --- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
>> +++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
>> @@ -54,3 +54,5 @@ do_install(){
>>       install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
>>       touch ${D}${localstatedir}/lib/logrotate.status
>>   }
>> +
>> +CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"
> Part of me thinks this shouldn't be an installed file at all; instead
> it should be created by a post install script if it doesn't already
> exist. Thoughts?
It does be contained in rpm package and generated during installation 
though it is empty.
It is not created when logrotate is running.
I test it on our WRL6.0 and WRL7.0

So if you update logrotate, logrotate.status will be overwritten during 
installation.
All previous status may be lost.

//Liu Jian
>
>> --
>> 1.8.5.2.233.g932f7e4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


--------------060906010205060105070809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">于 2014年11月20日 01:54, Dan McGregor 写道:<br>
    </div>
    <blockquote
cite="mid:CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com"
      type="cite">
      <pre wrap="">On 14 November 2014 03:43, Jian Liu <a class="moz-txt-link-rfc2396E" href="mailto:jian.liu@windriver.com">&lt;jian.liu@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">If there is no %config micro before the file in the spec file,
this file will be over-written after updating this package
using rpm.
This will make our settings lost.

Signed-off-by: Jian Liu <a class="moz-txt-link-rfc2396E" href="mailto:jian.liu@windriver.com">&lt;jian.liu@windriver.com&gt;</a>
---
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index faa8e02..8b39602 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -54,3 +54,5 @@ do_install(){
     install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
     touch ${D}${localstatedir}/lib/logrotate.status
 }
+
+CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"
</pre>
      </blockquote>
      <pre wrap="">
Part of me thinks this shouldn't be an installed file at all; instead
it should be created by a post install script if it doesn't already
exist. Thoughts?</pre>
    </blockquote>
    It does be contained in rpm package and generated during
    installation though it is 
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    empty. <br>
    It is not created when logrotate is running. <br>
    I test it on our WRL6.0 and WRL7.0<br>
    <br>
    So if you update logrotate, logrotate.status will be overwritten
    during installation. <br>
    All previous status may be lost.<br>
    <br>
    //Liu Jian<br>
    <blockquote
cite="mid:CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">--
1.8.5.2.233.g932f7e4

--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">

</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jian Liu
Email: <a class="moz-txt-link-abbreviated" href="mailto:jian.liu@windriver.com">jian.liu@windriver.com</a>
Office Phone: 86-10-84778539</pre>
  </body>
</html>

--------------060906010205060105070809--
