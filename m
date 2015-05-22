Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2416AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:36:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 08:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; 
	d="scan'208,217";a="575487827"
Received: from rrodrig1-mobl1.amr.corp.intel.com (HELO [10.252.254.238])
	([10.252.254.238])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 08:36:22 -0700
Message-ID: <555F4CF7.2030507@linux.intel.com>
Date: Fri, 22 May 2015 10:36:23 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
	<ba1bfb4332910bd53dd08bfa81e8c240dbc1e617.1432199284.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0Lb+0izLpS5TOevHAa0QtzxnKzz60uzEGPfobp68v3t8Qw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb+0izLpS5TOevHAa0QtzxnKzz60uzEGPfobp68v3t8Qw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] python3-distribute: Upgrade to python3-setuptools 15.2
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
X-List-Received-Date: Fri, 22 May 2015 15:36:23 -0000
Content-Type: multipart/alternative;
	boundary="------------030003040206010109030200"

--------------030003040206010109030200
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/05/15 18:47, Burton, Ross wrote:
>
> On 21 May 2015 at 10:15, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     python3-distribute was merged back to python3-setuptools in 2013,
>     and it is no longer being maintained, this upgrade also provides
>     functionality that will be needed for python3-pip.
>
>
> ERROR: The recipe python3-setuptools is trying to install files into a 
> shared area when those files already exist. Those files and their 
> manifest location are:
>  /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/site.py
>  Matched in manifest-intel-corei7-64-python3-distribute.populate_sysroot
>  /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/setuptools.pth
>  Matched in manifest-intel-corei7-64-python3-distribute.populate_sysroot
>  /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/__pycache__/site.cpython-34.pyc
>  Matched in manifest-intel-corei7-64-python3-distribute.populate_sysroot
>
> Urgh, this again.  We either live with this and tell people to delete 
> their tmp/, or bump the tmp ABI and provide a migration path.  Or 
> improve bitbake to handle files moving between recipes in the sysroot 
> and doing the right thing...
>
> Ross
>
>
I think this is because the package name is different, before it was 
python3-distribute and now its python3-setuptools but they do install 
the same files, so for this case in specific; a bitbake 
python3-distribtue -c cleanall should be done befooore merging? so the 
python3-distribute recipe actually exists or clean the /tmp manually.

Alejandro


--------------030003040206010109030200
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 21/05/15 18:47, Burton, Ross wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lb+0izLpS5TOevHAa0QtzxnKzz60uzEGPfobp68v3t8Qw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 21 May 2015 at 10:15, Alejandro
            Hernandez <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":22y" class="" style="overflow:hidden">python3-distribute
                was merged back to python3-setuptools in 2013,<br>
                and it is no longer being maintained, this upgrade also
                provides<br>
                functionality that will be needed for python3-<span
                  class="">pip</span>.</div>
            </blockquote>
          </div>
          <br>
          <div class="gmail_extra">ERROR: The recipe python3-setuptools
            is trying to install files into a shared area when those
            files already exist. Those files and their manifest location
            are:</div>
          <div class="gmail_extra"> 
 /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/site.py</div>
          <div class="gmail_extra"> Matched in
            manifest-intel-corei7-64-python3-distribute.populate_sysroot</div>
          <div class="gmail_extra"> /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/setuptools.pth</div>
          <div class="gmail_extra"> Matched in
            manifest-intel-corei7-64-python3-distribute.populate_sysroot</div>
          <div class="gmail_extra"> /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/__pycache__/site.cpython-34.pyc</div>
          <div class="gmail_extra"> Matched in
            manifest-intel-corei7-64-python3-distribute.populate_sysroot</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Urgh, this again.  We either live
            with this and tell people to delete their tmp/, or bump the
            tmp ABI and provide a migration path.  Or improve bitbake to
            handle files moving between recipes in the sysroot and doing
            the right thing...</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra"><br>
          </div>
        </div>
      </div>
    </blockquote>
    I think this is because the package name is different, before it was
    python3-distribute and now its python3-setuptools but they do
    install the same files, so for this case in specific; a bitbake
    python3-distribtue -c cleanall should be done befooore merging? so
    the python3-distribute recipe actually exists or clean the /tmp
    manually.<br>
    <br>
    Alejandro<br>
    <br>
  </body>
</html>

--------------030003040206010109030200--
