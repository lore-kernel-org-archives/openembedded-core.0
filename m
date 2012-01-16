Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rmegm-0000Sp-F6
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 06:01:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2012 20:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112623417"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2012 20:53:15 -0800
Message-ID: <4F13AD3B.50902@linux.intel.com>
Date: Sun, 15 Jan 2012 20:53:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326409412-15507-1-git-send-email-msm@freescale.com>
In-Reply-To: <1326409412-15507-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH 1/2] bitbake/fetch2: add support for wrapper command
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
X-List-Received-Date: Mon, 16 Jan 2012 05:01:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 03:03 PM, Matthew McClintock wrote:
> cc: bitbake-devel@lists.openembedded.org
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   bitbake/lib/bb/fetch2/__init__.py |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
> index 3af56e5..1d7d5c7 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -389,6 +389,8 @@ def runfetchcmd(cmd, d, quiet = False, cleanup = []):
>       Optionally remove the files/directories listed in cleanup upon failure
>       """
>
> +    cmd = "%s %s" % (bb.data.getVar("BB_FETCH_WRAPPER", d, True), cmd)
> +
I am guessing you really want a check here if BB_FETCH_WRAPPER is set, 
otherwise I am not sure this will work correctly, did you test without 
this new variable set?

Sau!

>       # Need to export PATH as binary could be in metadata paths
>       # rather than host provided
>       # Also include some other variables.


