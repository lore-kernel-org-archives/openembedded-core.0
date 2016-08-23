Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3C06673286
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 10BC11EE080B;
	Tue, 23 Aug 2016 17:40:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 4bTE5NfXtds2; Tue, 23 Aug 2016 17:40:11 +0200 (CEST)
Received: from [10.5.19.152] (bob75-2-81-56-46-209.fbx.proxad.net
	[81.56.46.209])
	by idris.smile.fr (Postfix) with ESMTPSA id D19361EE080C;
	Tue, 23 Aug 2016 17:40:11 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9492b5e7b4b350b21762201a11f189e35c0cfb04.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LZfB-Lu75cvN9CBN3Xx9uqpLMEWdPMJZL5MFGSy0+bciw@mail.gmail.com>
	<CAJTo0LabeTgBw5Vqtt5LRLSvRG8y+bRWhbF2di7AyiFXoDPc=Q@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <b68ccb89-5f9c-f84d-cd1c-de63f41ab99f@smile.fr>
Date: Tue, 23 Aug 2016 17:40:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LabeTgBw5Vqtt5LRLSvRG8y+bRWhbF2di7AyiFXoDPc=Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 23 Aug 2016 15:40:12 -0000
Content-Type: multipart/alternative;
	boundary="------------13DF9E45BEB217F96660CB7D"

--------------13DF9E45BEB217F96660CB7D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/08/2016 17:11, Burton, Ross wrote:
>
> On 23 August 2016 at 15:53, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     I think this is because BUILD_CC by default contains whitespace,
>     and bb.utils.which looks for "gcc ".  I added a strip() to
>     check_app_exists and it passed, so can you please verify that your
>     series doesn't regress when BUILD_CC isn't overridden?
>
>
> Patch sent to fix check_app_exists().  It currently just strips 
> whitespace and doesn't handle someone passing "foo --bar" to 
> check_app_exists but this is still a step in the right direction.
>
will do, but rebuilding from scratch is always long... so not right away :)
> Ross
>


--------------13DF9E45BEB217F96660CB7D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
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
              <div class="gmail_extra">I think this is because BUILD_CC
                by default contains whitespace, and bb.utils.which looks
                for "gcc ".  I added a strip() to check_app_exists and
                it passed, so can you please verify that your series
                doesn't regress when BUILD_CC isn't overridden?</div>
            </blockquote>
            <div><br>
            </div>
            <div>Patch sent to fix check_app_exists().  It currently
              just strips whitespace and doesn't handle someone passing
              "foo --bar" to check_app_exists but this is still a step
              in the right direction.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    will do, but rebuilding from scratch is always long... so not right
    away :)<br>
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
  </body>
</html>

--------------13DF9E45BEB217F96660CB7D--
