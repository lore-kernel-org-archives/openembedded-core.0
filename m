Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qrff7-00074F-Hw
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 02:31:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7C0RChL018103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 17:27:12 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 11 Aug 2011 17:27:11 -0700
Message-ID: <4E44735E.2050800@windriver.com>
Date: Thu, 11 Aug 2011 19:27:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1313107646.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313107646.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/1] fix RPM rootfs issue for ATTEMPTONLY
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
X-List-Received-Date: Fri, 12 Aug 2011 00:31:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I have a similar fix coming.  This one is close, but there are a few other
changes that are needed still.

--Mark

On 8/11/11 7:09 PM, Saul Wold wrote:
> Richard:
> 
> This issue was introduced with the recent IMAGE_FEATURES changes, 
> since the ATTEMPTONLY was not really being used it had not been updated 
> for some of the MultiLib changes, this fixes that situation.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
> 
>   gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 19:13:38 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (1):
>   package_rpm: fix up attemptonly code
> 
>  meta/classes/package_rpm.bbclass |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 



