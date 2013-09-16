Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB7B60F9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 01:33:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8G1XV5M017479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Sep 2013 18:33:31 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 15 Sep 2013 18:33:31 -0700
Message-ID: <52365FE7.6000102@windriver.com>
Date: Mon, 16 Sep 2013 09:33:27 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1379132723.git.hongxu.jia@windriver.com>
	<9bafb39aaaf33a7a3eee1e20ca2beca8378df3c8.1379132723.git.hongxu.jia@windriver.com>
	<52361DFB.5090506@linux.intel.com>
In-Reply-To: <52361DFB.5090506@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python: fix failures of LSB python-runtime tests
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
X-List-Received-Date: Mon, 16 Sep 2013 01:33:31 -0000
Content-Type: multipart/alternative;
	boundary="------------070204000808050304040908"

--------------070204000808050304040908
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/16/2013 04:52 AM, Saul Wold wrote:
> On 09/13/2013 09:31 PM, Hongxu Jia wrote:
>> It has been fixed in:
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=e261c1760d8a660c13cd00039a4812d51f47f3df 
>>
>>
>> But there is a typo in:
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb 
>>
>> It missed to remove an extra "--with-wctype-functions" in EXTRA_OECONF
>>
>> [YOCTO #5154]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python.inc | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python.inc 
>> b/meta/recipes-devtools/python/python.inc
>> index 80609a8..fcfeda5 100644
>> --- a/meta/recipes-devtools/python/python.inc
>> +++ b/meta/recipes-devtools/python/python.inc
>> @@ -25,7 +25,6 @@ EXTRA_OECONF = "\
>>     --with-cyclic-gc \
>>     --without-cxx \
>>     --with-signal-module \
>> -  --with-wctype-functions \
> I think this needs to be protected with a linuxstdbase check.
>

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb
has done this, but missing to remove the extra ' --with-wctype-functions'

inherit autotools

+PYTHONLSBOPTS = "--with-wctype-functions"
+PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
+
  EXTRA_OECONF = "\
    --with-threads \
    --with-pymalloc \
@@ -24,14 +27,5 @@ EXTRA_OECONF = "\
    --with-signal-module \
    --with-wctype-functions \
    --enable-shared \
-"
-
-EXTRA_OECONF_linuxstdbase = "\
-  --with-threads \
-  --with-pymalloc \
-  --with-cyclic-gc \
-  --without-cxx \
-  --with-signal-module \
-  --enable-shared \
-  ac_cv_sizeof_off_t=8 \
+  ${PYTHONLSBOPTS} \
  "

//Hongxu



> Sau!
>
>>     --enable-shared \
>>     --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 
>> 'no', d)} \
>>     ${PYTHONLSBOPTS} \
>>


--------------070204000808050304040908
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/16/2013 04:52 AM, Saul Wold
      wrote:<br>
    </div>
    <blockquote cite="mid:52361DFB.5090506@linux.intel.com" type="cite">On
      09/13/2013 09:31 PM, Hongxu Jia wrote:
      <br>
      <blockquote type="cite">It has been fixed in:
        <br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=e261c1760d8a660c13cd00039a4812d51f47f3df">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=e261c1760d8a660c13cd00039a4812d51f47f3df</a>
        <br>
        <br>
        But there is a typo in:
        <br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb</a>
        <br>
        It missed to remove an extra "--with-wctype-functions" in
        EXTRA_OECONF
        <br>
        <br>
        [YOCTO #5154]
        <br>
        <br>
        Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/recipes-devtools/python/python.inc | 1 -
        <br>
        &nbsp; 1 file changed, 1 deletion(-)
        <br>
        <br>
        diff --git a/meta/recipes-devtools/python/python.inc
        b/meta/recipes-devtools/python/python.inc
        <br>
        index 80609a8..fcfeda5 100644
        <br>
        --- a/meta/recipes-devtools/python/python.inc
        <br>
        +++ b/meta/recipes-devtools/python/python.inc
        <br>
        @@ -25,7 +25,6 @@ EXTRA_OECONF = "\
        <br>
        &nbsp;&nbsp;&nbsp; --with-cyclic-gc \
        <br>
        &nbsp;&nbsp;&nbsp; --without-cxx \
        <br>
        &nbsp;&nbsp;&nbsp; --with-signal-module \
        <br>
        -&nbsp; --with-wctype-functions \
        <br>
      </blockquote>
      I think this needs to be protected with a linuxstdbase check.
      <br>
      <br>
    </blockquote>
    <br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=78ac027f2ac6c6663fff7080eabbd3d09c1241bb</a><br>
    has done this, but missing to remove the extra '
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    --with-wctype-functions'<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    inherit autotools<br>
    &nbsp;<br>
    +PYTHONLSBOPTS = "--with-wctype-functions"<br>
    +PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"<br>
    +<br>
    &nbsp;EXTRA_OECONF = "\<br>
    &nbsp;&nbsp; --with-threads \<br>
    &nbsp;&nbsp; --with-pymalloc \<br>
    @@ -24,14 +27,5 @@ EXTRA_OECONF = "\<br>
    &nbsp;&nbsp; --with-signal-module \<br>
    &nbsp;&nbsp; --with-wctype-functions \<br>
    &nbsp;&nbsp; --enable-shared \<br>
    -"<br>
    -<br>
    -EXTRA_OECONF_linuxstdbase = "\<br>
    -&nbsp; --with-threads \<br>
    -&nbsp; --with-pymalloc \<br>
    -&nbsp; --with-cyclic-gc \<br>
    -&nbsp; --without-cxx \<br>
    -&nbsp; --with-signal-module \<br>
    -&nbsp; --enable-shared \<br>
    -&nbsp; ac_cv_sizeof_off_t=8 \<br>
    +&nbsp; ${PYTHONLSBOPTS} \<br>
    &nbsp;"<br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <br>
    <blockquote cite="mid:52361DFB.5090506@linux.intel.com" type="cite">Sau!
      <br>
      <br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp; --enable-shared \
        <br>
        &nbsp;&nbsp;&nbsp; --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6',
        'yes', 'no', d)} \
        <br>
        &nbsp;&nbsp;&nbsp; ${PYTHONLSBOPTS} \
        <br>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------070204000808050304040908--
