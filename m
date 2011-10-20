Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwMY-0007LW-6e
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:25:02 +0200
Received: from mail-qy0-f173.google.com ([209.85.216.173])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:19:07 -0700
Received: by qyk10 with SMTP id 10so5892552qyk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:19:06 -0700 (PDT)
Received: by 10.68.35.1 with SMTP id d1mr1686064pbj.63.1319131146165;
	Thu, 20 Oct 2011 10:19:06 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id jm5sm20861393pbc.1.2011.10.20.10.19.04
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:19:05 -0700 (PDT)
Message-ID: <4EA05807.3090506@intel.com>
Date: Thu, 20 Oct 2011 10:19:03 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E9DCCE8.8090009@linux.intel.com>
In-Reply-To: <4E9DCCE8.8090009@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH] insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM
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
X-List-Received-Date: Thu, 20 Oct 2011 17:25:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 12:00 PM, Darren Hart wrote:
> Currently only the basename is printed when os.path.isfile() returns a failure
> for the license file. If the file is present, but in the wrong directory, this
> can be non-obvious to debug. Use the full path instead.
>
> Make a minor grammatical correction in the error message while we're at it.
>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> ---
>   meta/classes/insane.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b861e85..017f7be 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -330,7 +330,7 @@ def package_qa_check_license(workdir, d):
>           (type, host, path, user, pswd, parm) = bb.decodeurl(url)
>           srclicfile = os.path.join(srcdir, path)
>           if not os.path.isfile(srclicfile):
> -            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to invalid file: " + path)
> +            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
>
>           if 'md5' not in parm:
>               bb.error(pn + ": md5 checksum is not specified for ", url)

Merged into OE-Core

Thanks
	Sau!



