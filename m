Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6995360670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 01:33:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1D1X4GJ020944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 12 Feb 2017 17:33:05 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 12 Feb 2017 17:33:04 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
	<a7a0e642035a2eae2e606dfd54857c1abf11d43a.1486622006.git.hongxu.jia@windriver.com>
	<CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <91c8715a-6c71-30f1-ca6e-1fb295fa842c@windriver.com>
Date: Mon, 13 Feb 2017 09:33:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Mon, 13 Feb 2017 01:33:13 -0000
Content-Type: multipart/alternative;
	boundary="------------6B826EEA9AAC3B6C7D6B7A51"

--------------6B826EEA9AAC3B6C7D6B7A51
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年02月10日 18:57, Burton, Ross wrote:
>
> On 9 February 2017 at 06:45, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>
>
> This upgrade is failing all over the autobuilder.  I'm guessing it's 
> due to this new warning in the configure log:
>
>     checking $CC variable... broken
>     configure: WARNING: your environment misuses the CC variable to
>     hold CFLAGS/CPPFLAGS options
>
>
> Because later on:
>
>     checking for getcwd... no
>     checking for getegid... no
>     checking for geteuid... no
>     checking for getopt... no
>     checking for poll... no
>     checking for putenv... no
>     checking for select... no
>     ...
>     configure: error: getopt is required for building programs
>
>
> I'm pretty sure those failures are not accurate!
>

OK, I will fix it.

//Hongxu

> Ross



--------------6B826EEA9AAC3B6C7D6B7A51
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2017年02月10日 18:57, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 February 2017 at 06:45, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:10f" class="gmail-a3s gmail-aXjCH
                gmail-m15a219f563974ac7">Signed-off-by: Hongxu Jia &lt;<a
                  moz-do-not-send="true"
                  href="mailto:hongxu.jia@windriver.com"><a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a></a>&gt;<br>
              </div>
            </blockquote>
          </div>
          <br>
          This upgrade is failing all over the autobuilder.  I'm
          guessing it's due to this new warning in the configure log:<br>
          <br>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">checking
            $CC variable... broken<br>
            configure: WARNING: your environment misuses the CC variable
            to hold CFLAGS/CPPFLAGS options</blockquote>
          <br>
          Because later on:<br>
          <br>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">checking
            for getcwd... no<br>
            checking for getegid... no<br>
            checking for geteuid... no<br>
            checking for getopt... no<br>
            checking for poll... no<br>
            checking for putenv... no<br>
            checking for select... no<br>
            ...<br>
            configure: error: getopt is required for building programs</blockquote>
        </div>
        <div class="gmail_extra"><br>
          I'm pretty sure those failures are not accurate!</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I will fix it.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6B826EEA9AAC3B6C7D6B7A51--
