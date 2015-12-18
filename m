Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79AE670022
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:31:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI3VqCA007671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Dec 2015 19:31:52 -0800 (PST)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 17 Dec 2015 19:31:51 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
	<CAJTo0LYTKAg_oiwxyOzDYPZvRBYs7MEd9qzvPK1fW-jUc4wT_Q@mail.gmail.com>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <56737E20.6000201@windriver.com>
Date: Fri, 18 Dec 2015 11:31:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTKAg_oiwxyOzDYPZvRBYs7MEd9qzvPK1fW-jUc4wT_Q@mail.gmail.com>
X-Originating-IP: [128.224.162.169]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Fri, 18 Dec 2015 03:31:53 -0000
Content-Type: multipart/alternative;
	boundary="------------010406040905060708000009"

--------------010406040905060708000009
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,

I test this patch. I seem to have no relationship with my issue. This 
patch just optimizes some tasks.

My problem seems to be gotten around by a patch 
523e4f6a6913b64453579d27a02467e14f7df42e submitted by Bruce.
"bareclone=1" is removed from SRC_URI. So kernel source is not a bare 
repo any more.

I do not know why "bareclone=1" is removed. This option seems to have no 
side effect on kernel.
So I thinks this should be a hidden trouble.

Do you have any ideas?

Thanks!

Jian

On 2015年12月17日 06:29, Burton, Ross wrote:
>
> On 2 November 2015 at 06:23, Jian Liu <jian.liu@windriver.com 
> <mailto:jian.liu@windriver.com>> wrote:
>
>     The repo of kernel is bare git repository and we need to checkout
>     to get
>     the source code.
>
>
> A recent patch to archiver ("fix previous issue regarding work-shared 
> for linux-yocto") claims to fix this, can you confirm if that fixes 
> this problem or if this fixes more edge cases regarding the kernel.
>
> Cheers,
> Ross


--------------010406040905060708000009
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Ross,<br>
    <br>
    I test this patch. I seem to have no relationship with my issue.
    This patch just optimizes some tasks.<br>
    <br>
    My problem seems to be gotten around by a patch
    523e4f6a6913b64453579d27a02467e14f7df42e submitted by Bruce.<br>
    "bareclone=1" is removed from SRC_URI. So kernel source is not a
    bare repo any more.<br>
    <br>
    I do not know why "bareclone=1" is removed. This option seems to
    have no side effect on kernel.<br>
    So I thinks this should be a hidden trouble. <br>
    <br>
    Do you have any ideas?<br>
    <br>
    Thanks!<br>
    <br>
    Jian<br>
    <br>
    <div class="moz-cite-prefix">On 2015年12月17日 06:29, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYTKAg_oiwxyOzDYPZvRBYs7MEd9qzvPK1fW-jUc4wT_Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 2 November 2015 at 06:23, Jian Liu
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jian.liu@windriver.com" target="_blank">jian.liu@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":v3" class="a3s" style="overflow:hidden">The repo
                of kernel is bare git repository and we need to checkout
                to get<br>
                the source code.<br>
              </div>
            </blockquote>
          </div>
          <br>
          A recent patch to archiver ("fix previous issue regarding
          work-shared for linux-yocto") claims to fix this, can you
          confirm if that fixes this problem or if this fixes more edge
          cases regarding the kernel.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Cheers,</div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010406040905060708000009--
