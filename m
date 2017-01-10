Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A76860777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 02:24:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0A2OYs6030669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 9 Jan 2017 18:24:34 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 9 Jan 2017 18:24:33 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1483945688.git.Qi.Chen@windriver.com>
	<98f949d52acc91f155bbc79bbea80a964b2300f0.1483945688.git.Qi.Chen@windriver.com>
	<CAJTo0LZoa9zpwiMVyR0ZDk8aOHztjUgYrp20k3YiRUTtDvc1Gw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a2497776-da8b-fe44-3e21-013d4adc7dda@windriver.com>
Date: Tue, 10 Jan 2017 10:24:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZoa9zpwiMVyR0ZDk8aOHztjUgYrp20k3YiRUTtDvc1Gw@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] selftest/buildoptions.py: do not hardcode 'tmp' for TMPDIR
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
X-List-Received-Date: Tue, 10 Jan 2017 02:24:36 -0000
Content-Type: multipart/alternative;
	boundary="------------35581D87F3584F40507CC142"

--------------35581D87F3584F40507CC142
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2017 06:35 PM, Burton, Ross wrote:
>
> On 9 January 2017 at 07:09, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     -        pkgs_path = g.glob(str(self.builddir) +
>     "/tmp/deploy/sources/allarch*/xcurs*")
>     +        tmp_dir = get_bb_var('TMPDIR')
>     +        pkgs_path = g.glob(str(tmp_dir) +
>     "/deploy/sources/allarch*/xcurs*")
>
>
> I think you meant DEPLOY_DIR_SRC :)
>
> Ross


Thanks.

I've sent out a new patchset. The title is "[PATCH 0/2] selftest: fix 
path assumption".

And the remote branch is also changed to:

   git://git.pokylinux.org/poky-contrib ChenQi/selftest-path-assumption
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/selftest-path-assumption


Best Regards,

Chen Qi


--------------35581D87F3584F40507CC142
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/09/2017 06:35 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZoa9zpwiMVyR0ZDk8aOHztjUgYrp20k3YiRUTtDvc1Gw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 January 2017 at 07:09, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:gu" class="gmail-a3s gmail-aXjCH
                gmail-m159820fbc12f9764">-        pkgs_path =
                g.glob(str(self.builddir) +
                "/tmp/deploy/sources/allarch*/<wbr>xcurs*")<br>
                +        tmp_dir = get_bb_var('TMPDIR')<br>
                +        pkgs_path = g.glob(str(tmp_dir) +
                "/deploy/sources/allarch*/<wbr>xcurs*")<br>
              </div>
            </blockquote>
          </div>
          <br>
          I think you meant DEPLOY_DIR_SRC :)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks.</p>
    <p>I've sent out a new patchset. The title is "[PATCH 0/2] selftest:
      fix path assumption".</p>
    <p>And the remote branch is also changed to:</p>
    <p>  git://git.pokylinux.org/poky-contrib
      ChenQi/selftest-path-assumption<br>
       
<a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/selftest-path-assumption">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/selftest-path-assumption</a></p>
    <p><br>
    </p>
    <p>Best Regards,</p>
    <p>Chen Qi<br>
    </p>
  </body>
</html>

--------------35581D87F3584F40507CC142--
