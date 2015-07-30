Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6EAC73237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 02:06:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U26Dco025917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jul 2015 19:06:13 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 29 Jul 2015 19:05:55 -0700
Message-ID: <55B9866A.8080300@windriver.com>
Date: Thu, 30 Jul 2015 10:05:30 +0800
From: "Zhou, Li" <li.zhou@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1438134558-7785-1-git-send-email-li.zhou@windriver.com>
	<CAJTo0LYkVtGiWfH-yf0T7PWREdk=ZyoMU3LyV1OEQpqWCiy2pg@mail.gmail.com>
In-Reply-To: <CAJTo0LYkVtGiWfH-yf0T7PWREdk=ZyoMU3LyV1OEQpqWCiy2pg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add marking for config files in recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 02:06:17 -0000
Content-Type: multipart/alternative;
	boundary="------------030605090106000306090305"

--------------030605090106000306090305
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

I have setup up poky as below doc described:
http://www.yoctoproject.org/docs/1.8/yocto-project-qs/yocto-project-qs.html

      $ git clone http://git.yoctoproject.org/git/poky
      $ cd poky
      $ git checkout -b fido origin/fido
      $ source oe-init-build-env

Do you mean that I should use branch master instead of fido? Has fido 
been abandoned?
Thanks.

On 07/29/2015 08:26 PM, Burton, Ross wrote:
>
> On 29 July 2015 at 02:49, Li Zhou <li.zhou@windriver.com 
> <mailto:li.zhou@windriver.com>> wrote:
>
>      meta/recipes-extended/tzdata/tzdata.inc |    2 ++
>
>
> This inc file was removed last month, please rebase to master.
>
> Ross

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------030605090106000306090305
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I have setup up poky as below doc described:<br>
<a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/1.8/yocto-project-qs/yocto-project-qs.html">http://www.yoctoproject.org/docs/1.8/yocto-project-qs/yocto-project-qs.html</a><br>
    <pre class="literallayout">     $ git clone <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/git/poky">http://git.yoctoproject.org/git/poky</a>
     $ cd poky
     $ git checkout -b fido origin/fido
     $ source oe-init-build-env</pre>
    Do you mean that I should use branch master instead of fido? Has
    fido been abandoned?<br>
    Thanks.<br>
    <br>
    <div class="moz-cite-prefix">On 07/29/2015 08:26 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYkVtGiWfH-yf0T7PWREdk=ZyoMU3LyV1OEQpqWCiy2pg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 29 July 2015 at 02:49, Li Zhou <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:li.zhou@windriver.com" target="_blank">li.zhou@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2g1" class="a3s" style="overflow:hidden"> meta/recipes-extended/tzdata/tzdata.inc
                |    2 ++<br>
              </div>
            </blockquote>
          </div>
          <br>
          This inc file was removed last month, please rebase to master.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511</pre>
  </body>
</html>

--------------030605090106000306090305--
