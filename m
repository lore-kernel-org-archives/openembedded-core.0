Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8wu7-00017K-2u
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:22:39 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 09:17:11 -0700
Received: by eyb6 with SMTP id 6so6705218eyb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 09:17:09 -0700 (PDT)
Received: by 10.216.14.91 with SMTP id c69mr1363581wec.81.1317226629509;
	Wed, 28 Sep 2011 09:17:09 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id n21sm41204502wbp.2.2011.09.28.09.17.07
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 09:17:08 -0700 (PDT)
Message-ID: <4E834881.30609@intel.com>
Date: Wed, 28 Sep 2011 09:17:05 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317157793.git.josh@linux.intel.com>
In-Reply-To: <cover.1317157793.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix building ghostcript variants on Ubuntu 11.10
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
X-List-Received-Date: Wed, 28 Sep 2011 16:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2011 02:12 PM, Joshua Lock wrote:
> Ubuntu 11.10 has moved sys/time.h such that the hard-coded test paths in
> ghostscripts configuration scripts fails.
>
> This patch works around that issue.
>
> Regards,
> Joshua
>
> The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:
>
>    libffi: really populate -dev package (2011-09-26 20:50:27 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/work
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work
>
> Joshua Lock (1):
>    ghostscript: disable check for time.h
>
>   .../ghostscript/ghostscript_9.02.bb                |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



