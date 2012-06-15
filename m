Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sfb4R-0000nc-FS
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:16:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2012 11:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158159127"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 11:05:50 -0700
Message-ID: <4FDB797D.9000200@linux.intel.com>
Date: Fri, 15 Jun 2012 11:05:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1338963552.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1338963552.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/5] pybootchartgui: make the build profiling in pictures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 18:16:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2012 02:34 AM, Robert Yang wrote:
> Note: Removed the patch details for PATCH 1/5 and 2/5 since they are too
>        big(bigger than 2M) to send via email, please fetch the patch via
>        the git repo
>
> // Robert
>
> The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:
>
>    ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/chart
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/chart
>
> Robert Yang (5):
>    pybootchartgui: add the original code
>    pybootchartgui: remove the original examples
>    pybootchartgui: make the build profiling in pictures
>    pybootchartgui: split the output chart into multiple ones
>    pybootchartgui: Fix the filename and add a default format
>
>   scripts/pybootchartgui/AUTHORS                     |   11 +
>   scripts/pybootchartgui/COPYING                     |  674 ++++++++++++++++++++
>   scripts/pybootchartgui/README                      |   36 +
>   scripts/pybootchartgui/pybootchartgui.py           |    7 +
>   scripts/pybootchartgui/pybootchartgui/batch.py     |   23 +
>   scripts/pybootchartgui/pybootchartgui/draw.py      |  408 ++++++++++++
>   scripts/pybootchartgui/pybootchartgui/gui.py       |  273 ++++++++
>   scripts/pybootchartgui/pybootchartgui/main.py      |   76 +++
>   scripts/pybootchartgui/pybootchartgui/parsing.py   |  264 ++++++++
>   .../pybootchartgui/pybootchartgui/process_tree.py  |  270 ++++++++
>   scripts/pybootchartgui/pybootchartgui/samples.py   |   93 +++
>   .../pybootchartgui/tests/parser_test.py            |   93 +++
>   .../pybootchartgui/tests/process_tree_test.py      |   78 +++
>   13 files changed, 2306 insertions(+), 0 deletions(-)
>   create mode 100644 scripts/pybootchartgui/AUTHORS
>   create mode 100644 scripts/pybootchartgui/COPYING
>   create mode 100644 scripts/pybootchartgui/README
>   create mode 100755 scripts/pybootchartgui/pybootchartgui.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/__init__.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/batch.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/draw.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/gui.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/main.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/parsing.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/process_tree.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/samples.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
>   create mode 100644 scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


