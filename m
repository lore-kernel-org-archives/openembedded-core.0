Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E808265D19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 02:05:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0C24xva015175
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 11 Jan 2015 18:04:59 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 11 Jan 2015 18:04:59 -0800
Message-ID: <54B32BBB.7050301@windriver.com>
Date: Mon, 12 Jan 2015 10:04:43 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1419823473.git.hongxu.jia@windriver.com>
	<CAJTo0LacBzaWR933BAViPfMqR5cc+6O-PJBwmjCV4PSjJhJXXw@mail.gmail.com>
In-Reply-To: <CAJTo0LacBzaWR933BAViPfMqR5cc+6O-PJBwmjCV4PSjJhJXXw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/4] Packages upgrade: groff and directfb
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
X-List-Received-Date: Mon, 12 Jan 2015 02:05:06 -0000
Content-Type: multipart/alternative;
	boundary="------------000101000504050701050407"

--------------000101000504050701050407
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2015 08:42 PM, Burton, Ross wrote:
>
> On 29 December 2014 at 05:47, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Hongxu Jia (4):
>       groff: upgrade 1.22.3
>       groff: fix native perl path
>       directfb: upgrade to 1.7.6
>       qt4-embedded: support c++0x stand for directfb
>
>
> I've merged all of these into MUT apart from "groff: fix native perl 
> path".  Adding a dependency on perl-native seems like a massive 
> overkill when the problem appears to me that we just need to ensure 
> that all Perl scripts in ${bindir} get fixed, or that we set PERL 
> appropriately.  Setting PERL seems to be the right solution but we 
> need it set for target builds only, so would this work?
>
> EXTRA_OECONF_append_class-target="PERL=${bindir}/perl"

Agree

//Hongxu

>
> Ross


--------------000101000504050701050407
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/09/2015 08:42 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LacBzaWR933BAViPfMqR5cc+6O-PJBwmjCV4PSjJhJXXw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 29 December 2014 at 05:47, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":b45" class="" style="overflow:hidden">Hongxu Jia
                (4):<br>
                  groff: upgrade 1.22.3<br>
                  groff: fix native perl path<br>
                  directfb: upgrade to 1.7.6<br>
                  qt4-embedded: support c++0x stand for directfb</div>
            </blockquote>
          </div>
          <br>
          I've merged all of these into MUT apart from "groff: fix
          native perl path".  Adding a dependency on perl-native seems
          like a massive overkill when the problem appears to me that we
          just need to ensure that all Perl scripts in ${bindir} get
          fixed, or that we set PERL appropriately.  Setting PERL seems
          to be the right solution but we need it set for target builds
          only, so would this work?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">EXTRA_OECONF_append_class-target="PERL=${bindir}/perl"</div>
      </div>
    </blockquote>
    <br>
    Agree<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LacBzaWR933BAViPfMqR5cc+6O-PJBwmjCV4PSjJhJXXw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000101000504050701050407--
