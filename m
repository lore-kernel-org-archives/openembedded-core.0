Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 810E771B42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 17 Oct 2016 08:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; 
	d="scan'208,217";a="773614091"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2016 08:15:05 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<5458be631bd0e452a6b05b09e9b86d6fbf567eeb.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <ad1b1d7c-9789-7560-283f-bdd6f36e5362@linux.intel.com>
Date: Mon, 17 Oct 2016 10:19:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] selftest: skip some devtool tests when distro is poky-tiny due to missing libx11
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:08 -0000
Content-Type: multipart/alternative;
	boundary="------------E3C0B590BDF457010EE58970"

--------------E3C0B590BDF457010EE58970
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/2016 06:42 AM, Burton, Ross wrote:
>
> On 14 October 2016 at 17:40, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>      def test_devtool_add_fetch_git(self):
>     -        # Fetch source
>     +        if self.distro == 'poky-tiny':
>     +            self.skipTest('libmatchbox2 is not buildable with
>     poky-tiny because it requires a libx11 provider')
>              tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>              self.track_for_cleanup(tempdir)
>              url = 'git://git.yoctoproject.org/libmatchbox
>     <http://git.yoctoproject.org/libmatchbox>'
>
>
> Changing the test to use a recipe that doesn't require a distro 
> feature that many distros disable seems like a more sustainable fix.
>
Which recipe do you think would be more generic?
> Ross


--------------E3C0B590BDF457010EE58970
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
    <div class="moz-cite-prefix">On 10/17/2016 06:42 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 October 2016 at 17:40, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
                target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1ch" class="a3s aXjCH m157c41168b5229f1">   
                 def test_devtool_add_fetch_git(<wbr>self):<br>
                -        # Fetch source<br>
                +        if self.distro == 'poky-tiny':<br>
                +            self.skipTest('libmatchbox2 is not
                buildable with poky-tiny because it requires a libx11
                provider')<br>
                         tempdir = tempfile.mkdtemp(prefix='<wbr>devtoolqa')<br>
                         self.track_for_cleanup(<wbr>tempdir)<br>
                         url = 'git://<a moz-do-not-send="true"
                  href="http://git.yoctoproject.org/libmatchbox"
                  rel="noreferrer" target="_blank">git.yoctoproject.org/<wbr>libmatchbox</a>'</div>
            </blockquote>
          </div>
          <br>
          Changing the test to use a recipe that doesn't require a
          distro feature that many distros disable seems like a more
          sustainable fix.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    Which recipe do you think would be more generic?<br>
    <blockquote
cite="mid:CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------E3C0B590BDF457010EE58970--
