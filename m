Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0C2860232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 02:13:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t982DtS2014840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Oct 2015 19:13:55 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Oct 2015 19:13:54 -0700
To: <petter@technux.se>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
	<fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
	<CAJTo0LYiW1X+kZi0ra0JUMeywQVu4w492ULyRXcytpYFWiiwng@mail.gmail.com>
	<7d91e0a2a4abbb2e84558856e1c2fa6a@technux.se>
	<CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
	<f6560c7a3f9ffd90e5a8bd754ce9e70a@technux.se>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5615D160.6050709@windriver.com>
Date: Thu, 8 Oct 2015 10:13:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <f6560c7a3f9ffd90e5a8bd754ce9e70a@technux.se>
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Thu, 08 Oct 2015 02:14:01 -0000
Content-Type: multipart/alternative;
	boundary="------------020509020309080602030805"

--------------020509020309080602030805
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月06日 23:30, Petter Mabäcker wrote:
>
> 2015-10-06 16:08 skrev Burton, Ross:
>
>>
>> On 6 October 2015 at 14:43, Petter Mabäcker <petter@technux.se 
>> <mailto:petter@technux.se>> wrote:
>>
>>     Great. As you will notice also when formatted properly it will
>>     not apply due to that readline63-001 and readline63-002 isn't
>>     applied so  'patchlevel' is incorrect. That makes me wondering
>>     what the patching strategy is? In my opinion we should consider
>>     adding the official readline-6.3 patches as well. Should I add a
>>     bug report for that or leave it as is (depending on the strategy...)?
>>
>>
>> Adding the rest of the patches would have been a sensible thing to 
>> do.  Right now, we're frozen as we're about to release 2.0, but a bug 
>> or patches post-release would be much appreciated.
>> Ross
> I have created a defect and assigned myself 
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=8451) and will send 
> something up when the normal integration is open again.
> BR Petter

Sorry for late reply that we had The National Day vacation. I can help 
for this defect if you please.

-- 
Regards,
Neil | Kai Kang


--------------020509020309080602030805
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年10月06日 23:30, Petter Mabäcker
      wrote:<br>
    </div>
    <blockquote cite="mid:f6560c7a3f9ffd90e5a8bd754ce9e70a@technux.se"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p>2015-10-06 16:08 skrev Burton, Ross:</p>
      <blockquote type="cite" style="padding-left:5px;
        border-left:#1010ff 2px solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignored --><!-- meta ignored -->
        <div dir="ltr">
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On 6 October 2015 at 14:43, Petter
              Mabäcker <span>&lt;<a moz-do-not-send="true"
                  href="mailto:petter@technux.se">petter@technux.se</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin: 0 0 0 .8ex;
                border-left: 1px #ccc solid; padding-left: 1ex;">
                <p>Great. As you will notice also when formatted
                  properly it will not apply due to that readline63-001
                  and readline63-002 isn't applied so  'patchlevel' is
                  incorrect. That makes me wondering what the patching
                  strategy is? In my opinion we should consider adding
                  the official readline-6.3 patches as well. Should I
                  add a bug report for that or leave it as is (depending
                  on the strategy...)?</p>
                <div class="gmail_extra"> </div>
              </blockquote>
            </div>
            <br>
            Adding the rest of the patches would have been a sensible
            thing to do.  Right now, we're frozen as we're about to
            release 2.0, but a bug or patches post-release would be much
            appreciated.</div>
          <div class="gmail_extra"> </div>
          <div class="gmail_extra">Ross</div>
          <div class="gmail_extra"> </div>
          <div class="gmail_extra"> </div>
        </div>
      </blockquote>
      <div class="gmail_extra">I have created a defect and assigned
        myself (<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=8451">https://bugzilla.yoctoproject.org/show_bug.cgi?id=8451</a>)
        and will send something up when the normal integration is open
        again.</div>
      <div class="gmail_extra"> </div>
      <div class="gmail_extra">BR Petter</div>
    </blockquote>
    <br>
    <font size="+1">Sorry for late reply that we had The National Day
      vacation. I can help for this defect if you please.</font><br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------020509020309080602030805--
