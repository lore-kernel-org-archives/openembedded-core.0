Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwNF-0007Oz-JA
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:25:45 +0200
Received: from mail-qw0-f52.google.com ([209.85.216.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:19:43 -0700
Received: by qaea17 with SMTP id a17so4833279qae.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:19:42 -0700 (PDT)
Received: by 10.68.13.35 with SMTP id e3mr21446528pbc.31.1319131182659;
	Thu, 20 Oct 2011 10:19:42 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ko15sm20821573pbb.9.2011.10.20.10.19.40
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:19:40 -0700 (PDT)
Message-ID: <4EA0582B.2040408@intel.com>
Date: Thu, 20 Oct 2011 10:19:39 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318901607.git.raj.khem@gmail.com>
In-Reply-To: <cover.1318901607.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/3] gcc update and bug fix
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
X-List-Received-Date: Thu, 20 Oct 2011 17:25:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 06:38 PM, Khem Raj wrote:
> This patchset does two things for gcc
> 1. Updates to latest from FSF gcc-4_6-branch
> 2. Backport the fix for PR46934
>
> The changes that come from FSF gcc are listed here
> http://sakrah.homelinux.org/files/gcc-4.6-ChangeLog-r180099_r180099.txt
>
> 3. Bluez4 needed glib.h therefore depend on glib-2.0
>
> The following changes since commit 8bc098475f58b60bfb24ec0fd338e49ac2387c50:
>
>    gcc-4.6: Backport PR46934 fix (2011-10-17 18:00:29 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/gcc-update
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-update
>
> Khem Raj (3):
>    bluez4: Add glib-2.0 to DEPENDS
>    gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
>    gcc-4.6: Backport PR46934 fix
>
>   meta/recipes-connectivity/bluez/bluez4.inc      |    2 +-
>   meta/recipes-connectivity/bluez/bluez4_4.96.bb  |    2 +-
>   meta/recipes-devtools/gcc/gcc-4.6.inc           |    5 +-
>   meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch |  392 +++++++++++++++++++++++
>   4 files changed, 397 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
>
Merged into OE-Core

Thanks
	Sau!



