Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E21C574AF8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 02:47:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w442lGSY024286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 May 2018 19:47:16 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 3 May 2018 19:47:16 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1525337490.git.Qi.Chen@windriver.com>
	<a1456696a2f7a5f2dcafb9c12c725d05ee38380d.1525337490.git.Qi.Chen@windriver.com>
	<CAJTo0Lbb9nLZbh7w_52LQAsiTOHc7DpYwzhLtahdYyHP6XP84A@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2fc298b8-0295-1e2f-20e4-0f795c729770@windriver.com>
Date: Fri, 4 May 2018 10:48:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbb9nLZbh7w_52LQAsiTOHc7DpYwzhLtahdYyHP6XP84A@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] testsdk.bbclass: set PREMIRRORS for kernel to speed up test
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
X-List-Received-Date: Fri, 04 May 2018 02:47:16 -0000
Content-Type: multipart/alternative;
	boundary="------------1F11E96C3797A3EAE1F7BB08"

--------------1F11E96C3797A3EAE1F7BB08
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2018 10:38 PM, Burton, Ross wrote:
> On 3 May 2018 at 09:52, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     +     f.write('PREMIRRORS_prepend = "
>     git://git.yoctoproject.org/.* <http://git.yoctoproject.org/.*>
>     git://%s/git2/git.yoctoproject.org.BASENAME;protocal=file \\n "\n'
>     % test_data.get('DL_DIR'))
>
>
> protocal?
>
> We could turn on BB_GENERATE_SOURCE_MIRRORS by default.  What's the 
> overhead?
>
> Ross

Hi Ross,

I didn't test the overhead.

The reference manual says that this variable is only useful when users 
want to generate a source mirror.

Some related info from bitbake/Changelog
"""
         - Add BB_GENERATE_MIRROR_TARBALLS option, set to 0 to make git 
fetches
           faster at the expense of not creating mirror tarballs.
"""

Besides, testsdkext is a task to verify correctness. It does not affect 
the generated eSDK that the users actually use. I'm not sure if I should 
change some default value merely to speed it up. I'd rather do some 
tweaks to this task instead of doing some change which could affect the 
building results.

That's why I chose not to change its default value.

I've removed the 'protocol=file' and sent out V2.

Best Regards,
Chen Qi



--------------1F11E96C3797A3EAE1F7BB08
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 05/03/2018 10:38 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lbb9nLZbh7w_52LQAsiTOHc7DpYwzhLtahdYyHP6XP84A@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 3 May 2018 at 09:52, Chen Qi <span dir="ltr">&lt;<a
            moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com"
            target="_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+       
                  f.write('PREMIRRORS_prepend = " git://<a
                moz-do-not-send="true"
                href="http://git.yoctoproject.org/.*" rel="noreferrer"
                target="_blank">git.yoctoproject.org/.*</a>
              git://%s/git2/git.<wbr>yoctoproject.org.BASENAME;<wbr>protocal=file
              \\n "\n' % test_data.get('DL_DIR'))<br>
            </blockquote>
            <div><br>
            </div>
            <div>protocal? </div>
            <div><br>
            </div>
            <div>We could turn on BB_GENERATE_SOURCE_MIRRORS by
              default.  What's the overhead?</div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    I didn't test the overhead. <br>
    <br>
    The reference manual says that this variable is only useful when
    users want to generate a source mirror. <br>
    <br>
    Some related info from bitbake/Changelog<br>
    """<br>
            - Add BB_GENERATE_MIRROR_TARBALLS option, set to 0 to make
    git fetches <br>
              faster at the expense of not creating mirror tarballs.<br>
    """<br>
    <br>
    Besides, testsdkext is a task to verify correctness. It does not
    affect the generated eSDK that the users actually use. I'm not sure
    if I should change some default value merely to speed it up. I'd
    rather do some tweaks to this task instead of doing some change
    which could affect the building results.<br>
    <br>
    That's why I chose not to change its default value.<br>
    <br>
    I've removed the 'protocol=file' and sent out V2.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <br>
  </body>
</html>

--------------1F11E96C3797A3EAE1F7BB08--
