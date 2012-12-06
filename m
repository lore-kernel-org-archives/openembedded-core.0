Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1TgQgo-0005pJ-1g
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 02:55:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB61fOuQ024135
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2012 17:41:25 -0800 (PST)
Received: from [128.224.162.133] (128.224.162.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 5 Dec 2012 17:41:23 -0800
Message-ID: <50BFF7C0.3010706@windriver.com>
Date: Thu, 6 Dec 2012 09:41:20 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1354694264-23741-1-git-send-email-ming.liu@windriver.com>
	<50BFA0ED.2030303@linux.intel.com>
In-Reply-To: <50BFA0ED.2030303@linux.intel.com>
X-Originating-IP: [128.224.162.133]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V1] initscripts/urandom: create directory before staging into it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 01:55:53 -0000
Content-Type: multipart/alternative;
	boundary="------------030407060700090305020907"

--------------030407060700090305020907
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 03:30 AM, Saul Wold wrote:
> On 12/04/2012 11:57 PM, Ming Liu wrote:
>> /etc/init.d/urandom fails to start/stop because it tries to save
>> random-seed into /var/lib/urandom folder which does not exist in the
>> file system.
>>
>> Fixed by creating /var/lib/urandom at do_install time.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb 
>> b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index d25838b..39be9a8 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system 
>> startup initialization scrip
>>   SECTION = "base"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> -PR = "r137"
>> +PR = "r138"
>>
>>   INHIBIT_DEFAULT_DEPS = "1"
>>
>> @@ -133,4 +133,6 @@ do_install () {
>>       fi
>>
>>       install -m 0755        ${WORKDIR}/device_table.txt 
>> ${D}${sysconfdir}/device_table
>> +    # Holds state information pertaining to urandom
>> +    install -d ${D}/var/lib/urandom
>
> I thought this would go in volatiles, not here.
Yes, it's a alternative solution or maybe better.
I was going to put it into volatiles, but considering it's a urandom 
specific directory, so I eventually put it here.
OK, I will send the V2 as you suggest.
>
> Sau!
>
>>   }
>>
>
>


--------------030407060700090305020907
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 12/06/2012 03:30 AM, Saul Wold
      wrote:<br>
    </div>
    <blockquote cite="mid:50BFA0ED.2030303@linux.intel.com" type="cite">On
      12/04/2012 11:57 PM, Ming Liu wrote:
      <br>
      <blockquote type="cite">/etc/init.d/urandom fails to start/stop
        because it tries to save
        <br>
        random-seed into /var/lib/urandom folder which does not exist in
        the
        <br>
        file system.
        <br>
        <br>
        Fixed by creating /var/lib/urandom at do_install time.
        <br>
        <br>
        Signed-off-by: Ming Liu <a class="moz-txt-link-rfc2396E" href="mailto:ming.liu@windriver.com">&lt;ming.liu@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
        <br>
        &nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb
        b/meta/recipes-core/initscripts/initscripts_1.0.bb
        <br>
        index d25838b..39be9a8 100644
        <br>
        --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
        <br>
        +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
        <br>
        @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic
        system startup initialization scrip
        <br>
        &nbsp; SECTION = "base"
        <br>
        &nbsp; LICENSE = "GPLv2"
        <br>
        &nbsp; LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe">"file://COPYING;md5=751419260aa954499f7abaabaa882bbe"</a>
        <br>
        -PR = "r137"
        <br>
        +PR = "r138"
        <br>
        <br>
        &nbsp; INHIBIT_DEFAULT_DEPS = "1"
        <br>
        <br>
        @@ -133,4 +133,6 @@ do_install () {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${WORKDIR}/device_table.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        ${D}${sysconfdir}/device_table
        <br>
        +&nbsp;&nbsp;&nbsp; # Holds state information pertaining to urandom
        <br>
        +&nbsp;&nbsp;&nbsp; install -d ${D}/var/lib/urandom
        <br>
      </blockquote>
      <br>
      I thought this would go in volatiles, not here.
      <br>
    </blockquote>
    Yes, <span style="color: rgb(0, 0, 0); font-family: arial, &#23435;&#20307;;
      font-size: 16px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 20px;
      orphans: 2; text-align: -webkit-auto; text-indent: 0px;
      text-transform: none; white-space: pre-wrap; widows: 2;
      word-spacing: 0px; -webkit-text-size-adjust: auto;
      -webkit-text-stroke-width: 0px; background-color: rgb(247, 247,
      247); display: inline !important; float: none; ">it's a
      alternative solution or maybe better.</span><br>
    I was going to put it into volatiles, but considering it's a urandom
    specific directory, so I eventually put it here.<br>
    OK, I will send the V2 as you suggest.<br>
    <span style="color: rgb(0, 0, 0); font-family: arial, &#23435;&#20307;; font-size:
      16px; font-style: normal; font-variant: normal; font-weight:
      normal; letter-spacing: normal; line-height: 20px; orphans: 2;
      text-align: -webkit-auto; text-indent: 0px; text-transform: none;
      white-space: pre-wrap; widows: 2; word-spacing: 0px;
      -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
      background-color: rgb(247, 247, 247); display: inline !important;
      float: none; "></span>
    <blockquote cite="mid:50BFA0ED.2030303@linux.intel.com" type="cite">
      <br>
      Sau!
      <br>
      <br>
      <blockquote type="cite">&nbsp; }
        <br>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------030407060700090305020907--
