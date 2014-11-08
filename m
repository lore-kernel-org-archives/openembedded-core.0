Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 26D127200D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 09:20:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA89KHnk004687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Nov 2014 01:20:17 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 8 Nov 2014 01:20:17 -0800
Message-ID: <545DE04C.1010201@windriver.com>
Date: Sat, 8 Nov 2014 17:20:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<c9e08dddf533f34459fc1fbe15904a2293c98f81.1415346812.git.hongxu.jia@windriver.com>
	<CAJTo0LarBoyGukf_qbTJovfsHw9=TqdQ2LdnGXebAJ8ZyeZaNw@mail.gmail.com>
	<CAJTo0LaF0p=w5frUjMPzY7wh5MfTWbM8drCy-bV3snqajMEDgw@mail.gmail.com>
In-Reply-To: <CAJTo0LaF0p=w5frUjMPzY7wh5MfTWbM8drCy-bV3snqajMEDgw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] oprofileui: use oprofileui-viewer as oprofileui's provider
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
X-List-Received-Date: Sat, 08 Nov 2014 09:20:21 -0000
Content-Type: multipart/alternative;
	boundary="------------050704040600040408090302"

--------------050704040600040408090302
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2014 10:47 PM, Burton, Ross wrote:
>
> On 7 November 2014 12:06, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     On 7 November 2014 07:57, Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>> wrote:
>
>         The package oprofileui does not exist, so we use
>         oprofileui-viewer as
>         the provider. It avoids the do_rootfs failure while
>         IMAGE_INSTALL +=
>         "oprofileui"
>
>
>     Erm, meta/recipes-kernel/oprofile/oprofileui_git.bb
>     <http://oprofileui_git.bb>
>
>
> Sorry, my mistake at not reading properly.
>
> Looks like a better fix would be to fix the packaging and provide the 
> old name for compatibility.
>

You mean refer [PATCH 1/4] avahi, change the ${PN}-viewer to PN (which 
rprovides
${PN}-viewer for compatibility)?

Or I don't understand what  'fix the packaging' mean, modify 
package.bbclass?

//Hongxu


> Ross


--------------050704040600040408090302
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/07/2014 10:47 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaF0p=w5frUjMPzY7wh5MfTWbM8drCy-bV3snqajMEDgw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 7 November 2014 12:06, Burton,
            Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="gmail_extra"><span class="">
                  <div class="gmail_quote">On 7 November 2014 07:57,
                    Hongxu Jia <span dir="ltr">&lt;<a
                        moz-do-not-send="true"
                        href="mailto:hongxu.jia@windriver.com"
                        target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
                    wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                      <div style="overflow:hidden">The package
                        oprofileui does not exist, so we use
                        oprofileui-viewer as<br>
                        the provider. It avoids the do_rootfs failure
                        while IMAGE_INSTALL +=<br>
                        "oprofileui"<br>
                      </div>
                    </blockquote>
                  </div>
                  <br>
                </span>Erm, meta/recipes-kernel/<span class="il">oprofile</span>/<a
                  moz-do-not-send="true" href="http://oprofileui_git.bb"
                  target="_blank">oprofileui_git.bb</a></div>
            </blockquote>
          </div>
          <br>
          Sorry, my mistake at not reading properly.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Looks like a better fix would be to fix
          the packaging and provide the old name for compatibility.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    You mean refer [PATCH 1/4] avahi, change the ${PN}-viewer to PN
    (which rprovides<br>
    ${PN}-viewer for compatibility)?<br>
    <br>
    Or I don't understand what  'fix the packaging' mean, modify
    package.bbclass?<br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LaF0p=w5frUjMPzY7wh5MfTWbM8drCy-bV3snqajMEDgw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050704040600040408090302--
