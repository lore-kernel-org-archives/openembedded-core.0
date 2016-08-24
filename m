Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 903A67318A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 3B8F31EE0ACD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:47:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id CTx49F9vxbXF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:47:18 +0200 (CEST)
Received: from [10.9.18.210] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id E4FAE1EE0ACC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:47:17 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9492b5e7b4b350b21762201a11f189e35c0cfb04.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LZfB-Lu75cvN9CBN3Xx9uqpLMEWdPMJZL5MFGSy0+bciw@mail.gmail.com>
	<CAJTo0LabeTgBw5Vqtt5LRLSvRG8y+bRWhbF2di7AyiFXoDPc=Q@mail.gmail.com>
	<b68ccb89-5f9c-f84d-cd1c-de63f41ab99f@smile.fr>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <d4eee64e-d5aa-938a-8d42-c47bb4953efb@smile.fr>
Date: Wed, 24 Aug 2016 09:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <b68ccb89-5f9c-f84d-cd1c-de63f41ab99f@smile.fr>
Subject: Re: [PATCH 7/8] [sanity] fix hardcoded references to gcc
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
X-List-Received-Date: Wed, 24 Aug 2016 07:47:17 -0000
Content-Type: multipart/alternative;
	boundary="------------36FB3E2D1E0D9AD277992C24"

--------------36FB3E2D1E0D9AD277992C24
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2016 17:40, Jérémy Rosen wrote:
>
>
>
> On 23/08/2016 17:11, Burton, Ross wrote:
>>
>> On 23 August 2016 at 15:53, Burton, Ross <ross.burton@intel.com 
>> <mailto:ross.burton@intel.com>> wrote:
>>
>>     I think this is because BUILD_CC by default contains whitespace,
>>     and bb.utils.which looks for "gcc ".  I added a strip() to
>>     check_app_exists and it passed, so can you please verify that
>>     your series doesn't regress when BUILD_CC isn't overridden?
>>
>>
>> Patch sent to fix check_app_exists().  It currently just strips 
>> whitespace and doesn't handle someone passing "foo --bar" to 
>> check_app_exists but this is still a step in the right direction.
>>
> will do, but rebuilding from scratch is always long... so not right 
> away :)

and... done. I do indeed need your patch to get this working, but it 
works correctly.
since I need to get a patch upstream in glibc V2 of this serie won't be 
here right away. Hopefully your patch will be accepted at that point 
(I'll check that before sending V2)
>> Ross
>>
>
>
>


--------------36FB3E2D1E0D9AD277992C24
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 23/08/2016 17:40, Jérémy Rosen
      wrote:<br>
    </div>
    <blockquote cite="mid:b68ccb89-5f9c-f84d-cd1c-de63f41ab99f@smile.fr"
      type="cite">
      <meta content="text/html; charset=windows-1252"
        http-equiv="Content-Type">
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">On 23/08/2016 17:11, Burton, Ross
        wrote:<br>
      </div>
      <blockquote
cite="mid:CAJTo0LabeTgBw5Vqtt5LRLSvRG8y+bRWhbF2di7AyiFXoDPc=Q@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On 23 August 2016 at 15:53, Burton,
              Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                  href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div class="gmail_extra">I think this is because
                  BUILD_CC by default contains whitespace, and
                  bb.utils.which looks for "gcc ".  I added a strip() to
                  check_app_exists and it passed, so can you please
                  verify that your series doesn't regress when BUILD_CC
                  isn't overridden?</div>
              </blockquote>
              <div><br>
              </div>
              <div>Patch sent to fix check_app_exists().  It currently
                just strips whitespace and doesn't handle someone
                passing "foo --bar" to check_app_exists but this is
                still a step in the right direction.</div>
              <div><br>
              </div>
            </div>
          </div>
        </div>
      </blockquote>
      will do, but rebuilding from scratch is always long... so not
      right away :)<br>
    </blockquote>
    <br>
    and... done. I do indeed need your patch to get this working, but it
    works correctly. <br>
    since I need to get a patch upstream in glibc V2 of this serie won't
    be here right away. Hopefully your patch will be accepted at that
    point (I'll check that before sending V2)<br>
    <blockquote cite="mid:b68ccb89-5f9c-f84d-cd1c-de63f41ab99f@smile.fr"
      type="cite">
      <blockquote
cite="mid:CAJTo0LabeTgBw5Vqtt5LRLSvRG8y+bRWhbF2di7AyiFXoDPc=Q@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div class="gmail_extra">
            <div class="gmail_quote">
              <div>Ross </div>
            </div>
            <br>
          </div>
        </div>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------36FB3E2D1E0D9AD277992C24--
