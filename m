Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB8F975546
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 01:16:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7E1Gv64011216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 18:16:57 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 13 Aug 2018 18:16:56 -0700
To: akuster808 <akuster808@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <1534150507-171031-1-git-send-email-changqing.li@windriver.com>
	<b936607d-dd70-47a1-826e-b245a57a7c79@gmail.com>
	<CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com>
	<57f1ea3f-5bba-1daf-723e-e1d2b9feb06b@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <009562bc-25c7-67af-f545-3da4e8cbc1fe@windriver.com>
Date: Tue, 14 Aug 2018 09:16:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <57f1ea3f-5bba-1daf-723e-e1d2b9feb06b@gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: upgrade 9.11.4 -> 9.13.2
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
X-List-Received-Date: Tue, 14 Aug 2018 01:16:57 -0000
Content-Type: multipart/alternative;
	boundary="------------FDE513DA448503C5D2C361A2"
Content-Language: en-US

--------------FDE513DA448503C5D2C361A2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 08/13/2018 11:58 PM, akuster808 wrote:
>
>
>
> On 08/13/2018 07:59 AM, Alexander Kanavin wrote:
>> However, for the upcoming YP release, it's better to settle on
>> something that expires later than 2020. How is 9.12.x currently?
> I stand corrected. its 2021.
>
> Here are our current ESV versions and their EOL dates:
>
>   * BIND 9.9 Extended Support Version will be supported until June, 2018
>   * BIND 9.11 is an Extended support version, and will be supported
>     until December, 2021
>
> BIND 9.16 will be our next ESV, followed by BIND 9.20, and every 
> second stable version after that will be ESV.
>
>
> Please see : https://www.isc.org/downloads/software-support-policy/ if 
> you want more details. The reasoning was noted during the update to 
> 9.10 -> 9.13 -> 9.11 emails/patches a few months back.
>
> - armin

Thanks.  Then let's keep at 9.11.4.
>> Alex
>>
>> 2018-08-13 16:37 GMT+02:00 akuster808<akuster808@gmail.com>:
>>> On 08/13/2018 01:55 AM,changqing.li@windriver.com  wrote:
>>>> From: Changqing Li<changqing.li@windriver.com>
>>>>
>>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> Is there a reason why this version was selected? 9.13 is still under
>>> development and ISC in not recommending  this version for production.
>>> 9.11 EOL is 2020.
>>>
>>> We should keep one long term version around if you need bleeding edge.
>>>
>>> - armin
>>>> ---
>>>>   meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.13.2.bb} | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>   rename meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.13.2.bb} (97%)
>>>>
>>>> diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.13.2.bb
>>>> similarity index 97%
>>>> rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
>>>> rename to meta/recipes-connectivity/bind/bind_9.13.2.bb
>>>> index 7522fdb..08ebd24 100644
>>>> --- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
>>>> +++ b/meta/recipes-connectivity/bind/bind_9.13.2.bb
>>>> @@ -19,8 +19,8 @@ SRC_URI ="https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \ 
>>>> file://0001-lib-dns-gen.c-fix-too-long-error.patch \ "
>>>>
>>>> -SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
>>>> -SRC_URI[sha256sum] = "595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617"
>>>> +SRC_URI[md5sum] = "01d0524016ac15ea3f4b6c77d99db0b2"
>>>> +SRC_URI[sha256sum] = "6c044e9ea81add9dbbd2f5dfc224964cc6b6e364e43a8d6d8b574d9282651802"
>>>>
>>>>   UPSTREAM_CHECK_URI ="https://ftp.isc.org/isc/bind9/"
>>>>   UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


--------------FDE513DA448503C5D2C361A2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/13/2018 11:58 PM, akuster808
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:57f1ea3f-5bba-1daf-723e-e1d2b9feb06b@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">On 08/13/2018 07:59 AM, Alexander
        Kanavin wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com">
        <pre wrap="">However, for the upcoming YP release, it's better to settle on
something that expires later than 2020. How is 9.12.x currently?</pre>
      </blockquote>
      I stand corrected. its 2021.<br>
      <br>
      <p>Here are our current ESV versions and their EOL dates:</p>
      <ul>
        <li>BIND 9.9 Extended Support Version will be supported until
          June, 2018</li>
        <li>BIND 9.11 is an Extended support version, and will be
          supported until December, 2021</li>
      </ul>
      <p>BIND 9.16 will be our next ESV, followed by BIND 9.20, and
        every second stable version after that will be ESV.</p>
      <br>
      Please see : <a class="moz-txt-link-freetext"
        href="https://www.isc.org/downloads/software-support-policy/"
        moz-do-not-send="true">https://www.isc.org/downloads/software-support-policy/</a>
      if you want more details. The reasoning was noted during the
      update to 9.10 -&gt; 9.13 -&gt; 9.11 emails/patches a few months
      back.<br>
      <br>
      - armin<br>
    </blockquote>
    <br>
    Thanks.  Then let's keep at 9.11.4.<br>
    <blockquote type="cite"
      cite="mid:57f1ea3f-5bba-1daf-723e-e1d2b9feb06b@gmail.com">
      <blockquote type="cite"
cite="mid:CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com">
        <pre wrap="">
Alex

2018-08-13 16:37 GMT+02:00 akuster808 <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com" moz-do-not-send="true">&lt;akuster808@gmail.com&gt;</a>:
</pre>
        <blockquote type="cite">
          <pre wrap="">
On 08/13/2018 01:55 AM, <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
</pre>
          </blockquote>
          <pre wrap="">Is there a reason why this version was selected? 9.13 is still under
development and ISC in not recommending  this version for production.
9.11 EOL is 2020.

We should keep one long term version around if you need bleeding edge.

- armin
</pre>
          <blockquote type="cite">
            <pre wrap="">---
 meta/recipes-connectivity/bind/{bind_9.11.4.bb =&gt; bind_9.13.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.4.bb =&gt; bind_9.13.2.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.13.2.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
rename to meta/recipes-connectivity/bind/bind_9.13.2.bb
index 7522fdb..08ebd24 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.13.2.bb
@@ -19,8 +19,8 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://ftp.isc.org/isc/bind9/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz%5Cfile://0001-lib-dns-gen.c-fix-too-long-error.patch%5C" moz-do-not-send="true">"https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
 "</a>

-SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
-SRC_URI[sha256sum] = "595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617"
+SRC_URI[md5sum] = "01d0524016ac15ea3f4b6c77d99db0b2"
+SRC_URI[sha256sum] = "6c044e9ea81add9dbbd2f5dfc224964cc6b6e364e43a8d6d8b574d9282651802"

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://ftp.isc.org/isc/bind9/" moz-do-not-send="true">"https://ftp.isc.org/isc/bind9/"</a>
 UPSTREAM_CHECK_REGEX = "(?P&lt;pver&gt;9(\.\d+)+(-P\d+)*)/"
</pre>
          </blockquote>
          <pre wrap="">
--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
+861084778653</pre>
  </body>
</html>

--------------FDE513DA448503C5D2C361A2--
