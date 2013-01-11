Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TtUGs-0002Ml-UJ
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 03:23:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0B27mIE024465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 18:07:48 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 10 Jan 2013 18:07:46 -0800
Message-ID: <50EF740B.9060803@windriver.com>
Date: Fri, 11 Jan 2013 10:08:11 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <50EF1470.3010600@felipetonello.com>
In-Reply-To: <50EF1470.3010600@felipetonello.com>
X-Forwarded-Message-Id: <50EF1470.3010600@felipetonello.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [poky] [PATCH] initscripts: added save-rtc to runlevel S
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
X-List-Received-Date: Fri, 11 Jan 2013 02:23:10 -0000
Content-Type: multipart/alternative;
	boundary="------------000209040606040000080409"

--------------000209040606040000080409
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit




-------- Original Message --------
Subject: 	Re: [poky] [PATCH] initscripts: added save-rtc to runlevel S
Date: 	Thu, 10 Jan 2013 11:20:16 -0800
From: 	Felipe Ferreri Tonello <eu@felipetonello.com>
To: 	ChenQi <Qi.Chen@windriver.com>



Chen

Can you please send this email to the mailing list, so we can discuss there?

Thank you,
Felipe

On 01/09/2013 06:23 PM, ChenQi wrote:
> On 01/10/2013 01:57 AM, Felipe Ferreri Tonello wrote:
>> Hi Chen,
>>
>> Thank you for your answer.
>>
>> On 01/09/2013 12:16 AM, ChenQi wrote:
>>> On 01/09/2013 01:35 PM, Felipe Ferreri Tonello wrote:
>>>> Hi Chen,
>>>>
>>>> On 01/08/2013 06:16 PM, ChenQi wrote:
>>>>> On 01/09/2013 08:18 AM, eu@felipetonello.com wrote:
>>>>>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>>>>>
>>>>>> It is necessary to add save-rtc.sh to runlevel S so the system is
>>>>>> updated when
>>>>>> it boots up.
>>>>> Hi ftonello,
>>>>> What do you mean by "system is updated"?
>>>> I meant system clock.
>>>>
>>>> What is happening now is that when you turn off the device, without
>>>> system halt, the next time the device is booted up the system clock is
>>>> not in sync with the rtc.
>>> Hi Felipe,
>>>
>>> I'm sorry, but I really don't see why this patch works.
>>> Below is my understanding for the system clock, hardware clock and
>>> /etc/timestamp.
>>> (The file name 'save-rtc.sh' is somewhat misleading, 'save-timestamp.sh'
>>> would be a more reasonable one.)
>>>
>>> /etc/timestamp is used to provide a reasonable reference for system
>>> time.
>>> The initial contents in this file is the building time of the image.
>>>
>>> The system clock should always be in sync with the rtc as long as the
>>> /etc/init.d/hwclock.sh is present, whose main purpose is to sync system
>>> clock and hardware clock.
>>> No matter whether the system is shutdown normally or crashes, the system
>>> clock is according to the hardware clock by hwclock.sh.
>>
>> Is there anything special to enable hwclock.sh?
>>
> In the current project, hwclock.sh is invoked in bootmisc.sh if
> /etc/init.d/hwclock.sh exists.
>
> Although there are symlinks in /etc/rc[2345].d/ like "Sxxhwclock.sh ->
> ../init.d/hwclock.sh", they have no real effect! This is a bug scheduled
> to be solved. For more details, refer to
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3612.
>
> For a temporary workaround, change the link names from 'hwclock.sh' to
> 'hwclock'.
>
> This bug will be solved soon :)
>
> Cheers,
> Chen Qi
>
>> I understand what you say, but here that patch was the only way to
>> have system clock (down to minutes, also, or even seconds, don't
>> recall) sync up with the rtc.
>>
>> Btw, this patch I did few months ago. So I don't remember exactly what
>> was happening.
>>
>> Do you know by the top of your mind how is this process? Because, as I
>> remember, save-rtc.sh was never been called. I'm not sure.
>
>>
>> Felipe
>>
>




--------------000209040606040000080409
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-forward-container"><br>
      <br>
      -------- Original Message --------
      <table class="moz-email-headers-table" border="0" cellpadding="0"
        cellspacing="0">
        <tbody>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Subject:
            </th>
            <td>Re: [poky] [PATCH] initscripts: added save-rtc to
              runlevel S</td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Date: </th>
            <td>Thu, 10 Jan 2013 11:20:16 -0800</td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">From: </th>
            <td>Felipe Ferreri Tonello <a class="moz-txt-link-rfc2396E" href="mailto:eu@felipetonello.com">&lt;eu@felipetonello.com&gt;</a></td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">To: </th>
            <td>ChenQi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>Chen

Can you please send this email to the mailing list, so we can discuss there?

Thank you,
Felipe

On 01/09/2013 06:23 PM, ChenQi wrote:
&gt; On 01/10/2013 01:57 AM, Felipe Ferreri Tonello wrote:
&gt;&gt; Hi Chen,
&gt;&gt;
&gt;&gt; Thank you for your answer.
&gt;&gt;
&gt;&gt; On 01/09/2013 12:16 AM, ChenQi wrote:
&gt;&gt;&gt; On 01/09/2013 01:35 PM, Felipe Ferreri Tonello wrote:
&gt;&gt;&gt;&gt; Hi Chen,
&gt;&gt;&gt;&gt;
&gt;&gt;&gt;&gt; On 01/08/2013 06:16 PM, ChenQi wrote:
&gt;&gt;&gt;&gt;&gt; On 01/09/2013 08:18 AM, <a class="moz-txt-link-abbreviated" href="mailto:eu@felipetonello.com">eu@felipetonello.com</a> wrote:
&gt;&gt;&gt;&gt;&gt;&gt; From: "Felipe F. Tonello" <a class="moz-txt-link-rfc2396E" href="mailto:ftonello@cercacor.com">&lt;ftonello@cercacor.com&gt;</a>
&gt;&gt;&gt;&gt;&gt;&gt;
&gt;&gt;&gt;&gt;&gt;&gt; It is necessary to add save-rtc.sh to runlevel S so the system is
&gt;&gt;&gt;&gt;&gt;&gt; updated when
&gt;&gt;&gt;&gt;&gt;&gt; it boots up.
&gt;&gt;&gt;&gt;&gt; Hi ftonello,
&gt;&gt;&gt;&gt;&gt; What do you mean by "system is updated"?
&gt;&gt;&gt;&gt; I meant system clock.
&gt;&gt;&gt;&gt;
&gt;&gt;&gt;&gt; What is happening now is that when you turn off the device, without
&gt;&gt;&gt;&gt; system halt, the next time the device is booted up the system clock is
&gt;&gt;&gt;&gt; not in sync with the rtc.
&gt;&gt;&gt; Hi Felipe,
&gt;&gt;&gt;
&gt;&gt;&gt; I'm sorry, but I really don't see why this patch works.
&gt;&gt;&gt; Below is my understanding for the system clock, hardware clock and
&gt;&gt;&gt; /etc/timestamp.
&gt;&gt;&gt; (The file name 'save-rtc.sh' is somewhat misleading, 'save-timestamp.sh'
&gt;&gt;&gt; would be a more reasonable one.)
&gt;&gt;&gt;
&gt;&gt;&gt; /etc/timestamp is used to provide a reasonable reference for system
&gt;&gt;&gt; time.
&gt;&gt;&gt; The initial contents in this file is the building time of the image.
&gt;&gt;&gt;
&gt;&gt;&gt; The system clock should always be in sync with the rtc as long as the
&gt;&gt;&gt; /etc/init.d/hwclock.sh is present, whose main purpose is to sync system
&gt;&gt;&gt; clock and hardware clock.
&gt;&gt;&gt; No matter whether the system is shutdown normally or crashes, the system
&gt;&gt;&gt; clock is according to the hardware clock by hwclock.sh.
&gt;&gt;
&gt;&gt; Is there anything special to enable hwclock.sh?
&gt;&gt;
&gt; In the current project, hwclock.sh is invoked in bootmisc.sh if
&gt; /etc/init.d/hwclock.sh exists.
&gt;
&gt; Although there are symlinks in /etc/rc[2345].d/ like "Sxxhwclock.sh -&gt;
&gt; ../init.d/hwclock.sh", they have no real effect! This is a bug scheduled
&gt; to be solved. For more details, refer to
&gt; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=3612">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3612</a>.
&gt;
&gt; For a temporary workaround, change the link names from 'hwclock.sh' to
&gt; 'hwclock'.
&gt;
&gt; This bug will be solved soon :)
&gt;
&gt; Cheers,
&gt; Chen Qi
&gt;
&gt;&gt; I understand what you say, but here that patch was the only way to
&gt;&gt; have system clock (down to minutes, also, or even seconds, don't
&gt;&gt; recall) sync up with the rtc.
&gt;&gt;
&gt;&gt; Btw, this patch I did few months ago. So I don't remember exactly what
&gt;&gt; was happening.
&gt;&gt;
&gt;&gt; Do you know by the top of your mind how is this process? Because, as I
&gt;&gt; remember, save-rtc.sh was never been called. I'm not sure.
&gt;
&gt;&gt;
&gt;&gt; Felipe
&gt;&gt;
&gt;

</pre>
      <br>
    </div>
    <br>
  </body>
</html>

--------------000209040606040000080409--
