Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EFE6678466
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:38:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 07:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; 
	d="scan'208,217";a="134069636"
Received: from svurgun-mobl.amr.corp.intel.com (HELO [10.254.20.139])
	([10.254.20.139])
	by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2017 07:38:25 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1500914447.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbPzRM1dqQzZMD-iqA+a4zKevm0qiZzEvp4HXOUeMv9-g@mail.gmail.com>
From: "Sandoval Gonzalez, Leonardo"
	<leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <90c4a1a0-a7cb-0113-b569-a812a4e5d135@linux.intel.com>
Date: Mon, 31 Jul 2017 09:38:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbPzRM1dqQzZMD-iqA+a4zKevm0qiZzEvp4HXOUeMv9-g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] python-3.5-manifest: move python3.5-config script into the dev package
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
X-List-Received-Date: Mon, 31 Jul 2017 14:38:25 -0000
Content-Type: multipart/alternative;
	boundary="------------503C4D6465EC793A21E76048"
Content-Language: es-ES

--------------503C4D6465EC793A21E76048
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



El 7/29/2017 a las 8:48 AM, Burton, Ross escribió:
> The first line of the python-3.5-manifest.inc:
>
> # WARNING: This file is AUTO GENERATED: Manual edits will be lost next 
> time I regenerate the file.
>
> You'll need to edit the script and then regenerate the manifest.
Auch, right.

I will send a v2 including the line truncation fix.

Leo
>
> Might be worth patching the script to wrap long lines instead of 
> writing 1000 character lines to save the line length problem in the 
> future too.
>
> Ross
>
> On 24 July 2017 at 17:44, <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     From: Leonardo Sandoval
>     <leonardo.sandoval.gonzalez@linux.intel.com
>     <mailto:leonardo.sandoval.gonzalez@linux.intel.com>>
>
>     The following changes since commit
>     a4f2bf37b7eac888f37f11cd4d4606436909c507:
>
>       mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES (2017-07-17 15:14:27
>     +0100)
>
>     are available in the git repository at:
>
>       git://git.yoctoproject.org/poky-contrib
>     <http://git.yoctoproject.org/poky-contrib>
>     lsandov1/python3-config-multilib
>     http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/python3-config-multilib
>     <http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/python3-config-multilib>
>
>     Leonardo Sandoval (1):
>       python-3.5-manifest: move python3.5-config script into the dev
>     package
>
>      meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     --
>     2.12.3
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------503C4D6465EC793A21E76048
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">El 7/29/2017 a las 8:48 AM, Burton,
      Ross escribió:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbPzRM1dqQzZMD-iqA+a4zKevm0qiZzEvp4HXOUeMv9-g@mail.gmail.com">
      <div dir="ltr">The first line of the python-3.5-manifest.inc:
        <div><br>
          <div># WARNING: This file is AUTO GENERATED: Manual edits will
            be lost next time I regenerate the file.<br>
          </div>
        </div>
        <div><br>
        </div>
        <div>You'll need to edit the script and then regenerate the
          manifest.</div>
      </div>
    </blockquote>
    Auch, right.<br>
    <br>
    I will send a v2 including the line truncation fix.<br>
    <br>
    Leo<br>
    <blockquote type="cite"
cite="mid:CAJTo0LbPzRM1dqQzZMD-iqA+a4zKevm0qiZzEvp4HXOUeMv9-g@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Might be worth patching the script to wrap long lines
          instead of writing 1000 character lines to save the line
          length problem in the future too.</div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 24 July 2017 at 17:44, <span
            dir="ltr">&lt;<a
              href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
              target="_blank" moz-do-not-send="true">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Leonardo Sandoval &lt;<a
              href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
              moz-do-not-send="true">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
            <br>
            The following changes since commit
            a4f2bf37b7eac888f37f11cd4d4606<wbr>436909c507:<br>
            <br>
              mpc8315e-rdb: add wic.bmap to IMAGE_FSTYPES (2017-07-17
            15:14:27 +0100)<br>
            <br>
            are available in the git repository at:<br>
            <br>
              git://<a href="http://git.yoctoproject.org/poky-contrib"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.yoctoproject.org/<wbr>poky-contrib</a>
            lsandov1/python3-config-<wbr>multilib<br>
              <a
href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/python3-config-multilib"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://git.yoctoproject.org/<wbr>cgit.cgi/poky-contrib/log/?h=<wbr>lsandov1/python3-config-<wbr>multilib</a><br>
            <br>
            Leonardo Sandoval (1):<br>
              python-3.5-manifest: move python3.5-config script into the
            dev package<br>
            <div class="HOEnZb">
              <div class="h5"><br>
                 meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc
                | 4 ++--<br>
                 1 file changed, 2 insertions(+), 2 deletions(-)<br>
                <br>
              </div>
            </div>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.12.3<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------503C4D6465EC793A21E76048--
