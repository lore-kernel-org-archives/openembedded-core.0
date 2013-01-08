Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TsaC2-0008VL-3M
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:30:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r08EF6Ne006215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 06:15:06 -0800 (PST)
Received: from [128.224.171.150] (128.224.171.150) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 8 Jan 2013 06:15:05 -0800
Message-ID: <50EC29E9.7000500@windriver.com>
Date: Tue, 8 Jan 2013 16:15:05 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <50EB3FF4.60601@windriver.com>
	<CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com>
	<50EBB80A.2090704@windriver.com>
In-Reply-To: <50EBB80A.2090704@windriver.com>
Subject: Re: alsaconf and bash
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
X-List-Received-Date: Tue, 08 Jan 2013 14:30:19 -0000
Content-Type: multipart/alternative;
	boundary="------------070900080407050201040502"

--------------070900080407050201040502
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Would you guys suggest we add bash as a dependency for alsa-utils?

On 01/08/2013 08:09 AM, Florin Sarbu wrote:
> On 01/08/2013 02:44 AM, Chris Larson wrote:
>> On Mon, Jan 7, 2013 at 2:36 PM, Florin Sarbu 
>> <florin.sarbu@windriver.com <mailto:florin.sarbu@windriver.com>> wrote:
>>
>>     in alsa-utils_1.0.25.bb <http://alsa-utils_1.0.25.bb>, I see this
>>     comment:
>>
>>     # We omit alsaconf, because
>>     # a) this is a bash script
>>     # b) it creates config files not suitable for OE-based distros
>>
>>     Trying out on master, I get a do_rootfs error because bash is not
>>     a rundep of alsa-utils, and there is nothing in the alsa-utils
>>     recipe that actually does the above mentioned removal of the
>>     alsaconf script. Looking in the git log, I only see that the
>>     comment has suddenly appeared in an older alsa-utils recipe and
>>     has been carried along since with every update to the recipe, and
>>     not left over there as an artifact of some older commit as I
>>     expected.
>>     Can anyone shed some light on this?
>>
>>
>>
>> From some quick git log -S commands in the old openembedded classic 
>> repository, it seems to have originated 
>> with 7653e980f66b4bd147df308f9b04d6b197382d6a from 2005, and the line 
>> below the comment was 'FILES_${PN} = ""', so presumably that was what 
>> left it out --- none of the files patterns matched it.
> Okay, so it seems that the comment actually said at that time that the 
> alsa-utils generated rpm won't contain alsaconf. And bellow, this bash 
> script gets into the alsa-utils-alsaconf rpm. Unfortunately, even 
> though there is this separation, the alsa-utils rpm depends on the 
> alsa-utils-alsaconf rpm so it's pretty much the same thing as 
> do_rootfs is concerned. (missing bash dependency). How would you guys 
> see this resolved upstream? Add bash as a dep, remove 
> alsa-utils-alsaconf as a dep or alsa-utils (as the comment says the 
> script is not suitable for OE-based distros) or check the alsaconf 
> script for bashisms and fix if any and make alsa-utils rely on a 
> busybox shell interpreter if possible (with the modification of the 
> !/bin/bash shabang from the alsaconf script to /bin/sh)?
>
> Florin
>
>> -- 
>> Christopher Larson
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070900080407050201040502
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Would you guys suggest we add bash as a
      dependency for alsa-utils?<br>
      <br>
      On 01/08/2013 08:09 AM, Florin Sarbu wrote:<br>
    </div>
    <blockquote cite="mid:50EBB80A.2090704@windriver.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div class="moz-cite-prefix">On 01/08/2013 02:44 AM, Chris Larson
        wrote:<br>
      </div>
      <blockquote
cite="mid:CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div class="gmail_extra">On Mon, Jan 7, 2013 at 2:36 PM,
            Florin Sarbu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:florin.sarbu@windriver.com" target="_blank">florin.sarbu@windriver.com</a>&gt;</span>
            wrote:<br>
            <div class="gmail_quote">
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                <div id=":10h">in <a moz-do-not-send="true"
                    href="http://alsa-utils_1.0.25.bb" target="_blank">alsa-utils_1.0.25.bb</a>,
                  I see this comment:<br>
                  <br>
                  # We omit alsaconf, because<br>
                  # a) this is a bash script<br>
                  # b) it creates config files not suitable for OE-based
                  distros<br>
                  <br>
                  Trying out on master, I get a do_rootfs error because
                  bash is not a rundep of alsa-utils, and there is
                  nothing in the alsa-utils recipe that actually does
                  the above mentioned removal of the alsaconf script.
                  Looking in the git log, I only see that the comment
                  has suddenly appeared in an older alsa-utils recipe
                  and has been carried along since with every update to
                  the recipe, and not left over there as an artifact of
                  some older commit as I expected.<br>
                  Can anyone shed some light on this?<br>
                </div>
              </blockquote>
            </div>
            <br>
            <br clear="all">
            <div style="">From some quick git log -S commands in the old
              openembedded classic repository, it seems to have
              originated with&nbsp;7653e980f66b4bd147df308f9b04d6b197382d6a
              from 2005, and the line below the comment was 'FILES_${PN}
              = ""', so presumably that was what left it out &#8212; none of
              the files patterns matched it.</div>
          </div>
        </div>
      </blockquote>
      Okay, so it seems that the comment actually said at that time that
      the alsa-utils generated rpm won't contain alsaconf. And bellow,
      this bash script gets into the alsa-utils-alsaconf rpm.
      Unfortunately, even though there is this separation, the
      alsa-utils rpm depends on the alsa-utils-alsaconf rpm so it's
      pretty much the same thing as do_rootfs is concerned. (missing
      bash dependency). How would you guys see this resolved upstream?
      Add bash as a dep, remove alsa-utils-alsaconf as a dep or
      alsa-utils (as the comment says the script is not suitable for
      OE-based distros) or check the alsaconf script for bashisms and
      fix if any and make alsa-utils rely on a busybox shell interpreter
      if possible (with the modification of the !/bin/bash shabang from
      the alsaconf script to /bin/sh)?<br>
      <br>
      Florin<br>
      <br>
      <blockquote
cite="mid:CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div class="gmail_extra"> -- <br>
            Christopher Larson</div>
        </div>
      </blockquote>
      <br>
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

--------------070900080407050201040502--
