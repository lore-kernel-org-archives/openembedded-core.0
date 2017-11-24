Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD7A278544
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 04:32:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAO4WuY7018235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 20:32:56 -0800 (PST)
Received: from [128.224.162.209] (128.224.162.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 20:32:56 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
	<CAJTo0LY=Wii9Ys1R1Ny3U3X1T-J=MgVCXXDA7d4HH6n5vLtqcw@mail.gmail.com>
	<CAJ86T=Wd0wCJbRAS+H3kDC2tg+51UsY_KwRjZKq46VEK+Y0NdA@mail.gmail.com>
	<CAJTo0LbAMCEPOwE9SHNbtuGuO=63GHP8wYh3O9jG27U3xJKNAA@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <5A17A0F6.9090904@windriver.com>
Date: Fri, 24 Nov 2017 12:32:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbAMCEPOwE9SHNbtuGuO=63GHP8wYh3O9jG27U3xJKNAA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: malloc: Add missing arena lock in malloc_info
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
X-List-Received-Date: Fri, 24 Nov 2017 04:32:57 -0000
Content-Type: multipart/alternative;
	boundary="------------090503020001030206090008"

--------------090503020001030206090008
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,
Is your meaning that I regenerate this patch based on 
poky-contrib:ross/mut2 branch?

Thanks.

On 2017年11月23日 19:58, Burton, Ross wrote:
> Thanks Andre.  There's a glibc 2.26 upgrade pending and this doesn't 
> apply on top of that, can you rebase?  poky-contrib:ross/mut2 is where 
> I'm staging the toolchain updates.
>
> Ross
>
> On 22 November 2017 at 00:50, Andre McCurdy <armccurdy@gmail.com 
> <mailto:armccurdy@gmail.com>> wrote:
>
>     On Tue, Nov 21, 2017 at 3:05 PM, Burton, Ross
>     <ross.burton@intel.com <mailto:ross.burton@intel.com>> wrote:
>     > What glibc release is this in?  We've an upgrade patch pending
>     that bumps it
>     > to 77f921dac17c5fa99bd9e926d926c327982895f7.
>
>     It's currently in the glibc master branch only (ie hasn't been
>     backported to the 2.26 release branch).
>
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


--------------090503020001030206090008
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Ross,<br>
    Is your meaning that I regenerate this patch based on
    poky-contrib:ross/mut2 branch?<br>
    <br>
    Thanks.<br>
    <br>
    <div class="moz-cite-prefix">On 2017年11月23日 19:58, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbAMCEPOwE9SHNbtuGuO=63GHP8wYh3O9jG27U3xJKNAA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Thanks Andre.  There's a glibc 2.26 upgrade pending
        and this doesn't apply on top of that, can you rebase?
         poky-contrib:ross/mut2 is where I'm staging the toolchain
        updates.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 22 November 2017 at 00:50, Andre
          McCurdy <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:armccurdy@gmail.com" target="_blank">armccurdy@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
              class="">On Tue, Nov 21, 2017 at 3:05 PM, Burton, Ross
              &lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;
              wrote:<br>
              &gt; What glibc release is this in?  We've an upgrade
              patch pending that bumps it<br>
              &gt; to 77f921dac17c5fa99bd9e926d926c3<wbr>27982895f7.<br>
              <br>
            </span>It's currently in the glibc master branch only (ie
            hasn't been<br>
            backported to the 2.26 release branch).<br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036
</pre>
  </body>
</html>

--------------090503020001030206090008--
