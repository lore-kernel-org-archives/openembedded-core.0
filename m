Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB7C66AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:32:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2015 08:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; 
	d="scan'208,217";a="575486115"
Received: from rrodrig1-mobl1.amr.corp.intel.com (HELO [10.252.254.238])
	([10.252.254.238])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 08:32:49 -0700
Message-ID: <555F4C21.9030907@linux.intel.com>
Date: Fri, 22 May 2015 10:32:49 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
	<d2900c9f672ce2901dcc464f25434987189e5337.1432199284.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LYpzyy9gQ0-UZhCyQk=QnZHO3gqhJr_JAaHz3VYJGQzJQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYpzyy9gQ0-UZhCyQk=QnZHO3gqhJr_JAaHz3VYJGQzJQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] python3-pip: Adds recipe for python3-pip
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
X-List-Received-Date: Fri, 22 May 2015 15:32:51 -0000
Content-Type: multipart/alternative;
	boundary="------------090004030709070901020207"

--------------090004030709070901020207
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/05/15 18:38, Burton, Ross wrote:
>
> On 21 May 2015 at 10:15, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     PIP is installed by default since python 3.4, due to issues with the
>     autobuilders, its default installation had to be disabled, this
>     creates
>     a recipe for it, it brings a lot of new dependencies so it is
>     chosen not
>     to be installed by default along with python3-core.
>
>
> Missing dependencies?
>
> ERROR: Function failed: do_compile (log file is located at 
> /data/poky-master/tmp/work/corei7-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121)
> ERROR: Logfile of failure stored in: 
> /data/poky-master/tmp/work/corei7-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Traceback (most recent call last):
> |   File "setup.py", line 6, in <module>
> |     from setuptools import setup, find_packages
> | ImportError: No module named 'setuptools'
> | ERROR: python3 setup.py build_ext execution failed.
> | WARNING: exit code 1 from a shell command.
>
> Ross

Hmm weird, this should not have happened, apparently there's a missing 
dependency to python3-setuptools, but I thought I had listed that


--------------090004030709070901020207
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 21/05/15 18:38, Burton, Ross wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYpzyy9gQ0-UZhCyQk=QnZHO3gqhJr_JAaHz3VYJGQzJQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 21 May 2015 at 10:15, Alejandro
            Hernandez <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span
                class="">PIP</span> is installed by default since python
              3.4, due to issues with the<br>
              autobuilders, its default installation had to be disabled,
              this creates<br>
              a recipe for it, it brings a lot of new dependencies so it
              is chosen not<br>
              to be installed by default along with python3-core.</blockquote>
          </div>
          <br>
          Missing dependencies?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">
          <div class="gmail_extra">ERROR: Function failed: do_compile
            (log file is located at
/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121)</div>
          <div class="gmail_extra">ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121</div>
          <div class="gmail_extra">Log data follows:</div>
          <div class="gmail_extra">| DEBUG: Executing shell function
            do_compile</div>
          <div class="gmail_extra">| Traceback (most recent call last):</div>
          <div class="gmail_extra">|   File "setup.py", line 6, in
            &lt;module&gt;</div>
          <div class="gmail_extra">|     from setuptools import setup,
            find_packages</div>
          <div class="gmail_extra">| ImportError: No module named
            'setuptools'</div>
          <div class="gmail_extra">| ERROR: python3 setup.py build_ext
            execution failed.</div>
          <div class="gmail_extra">| WARNING: exit code 1 from a shell
            command.</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
        </div>
      </div>
    </blockquote>
    <br>
    Hmm weird, this should not have happened, apparently there's a
    missing dependency to python3-setuptools, but I thought I had listed
    that<br>
    <br>
  </body>
</html>

--------------090004030709070901020207--
