Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmDLo-0004gz-0C
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:17:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QmDHi-0002UK-AA from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:13:02 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 16:10:12 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 27 Jul 2011 16:13:01 -0700
Message-ID: <4E309B77.1050703@mentor.com>
Date: Wed, 27 Jul 2011 16:12:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311806842.git.nitin.a.kamble@intel.com>
	<368d4cd746ace1a99c7eced1e00275e0eec27573.1311806842.git.nitin.a.kamble@intel.com>
In-Reply-To: <368d4cd746ace1a99c7eced1e00275e0eec27573.1311806842.git.nitin.a.kamble@intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Jul 2011 23:10:12.0015 (UTC)
	FILETIME=[56266BF0:01CC4CB2]
Subject: Re: [PATCH 2/4] siteinfo.bbclass: add entries for new x86_64 ABI targets
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
X-List-Received-Date: Wed, 27 Jul 2011 23:17:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/27/2011 04:09 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/siteinfo.bbclass |   14 +++++++++++++-
>  1 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> index 9dacd58..daa7946 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -42,12 +42,15 @@ def siteinfo_data(d):
>          "sh4": "endian-little bit-32 sh-common",
>          "sparc": "endian-big bit-32",
>          "viac3": "endian-little bit-32 ix86-common",
> -        "x86_64": "endian-little bit-64",
> +        "x86_64": "endian-little", # bitinfo specified in targetinfo
>      }
>      osinfo = {
>          "darwin": "common-darwin",
>          "darwin9": "common-darwin",
>          "linux": "common-linux common-glibc",
> +        "linux-gnu32": "common-linux common-glibc",
> +        "linux-gnux32": "common-linux common-glibc",
> +        "linux-gnu64": "common-linux common-glibc",
>          "linux-gnueabi": "common-linux common-glibc",
>          "linux-gnuspe": "common-linux common-glibc",
>          "linux-uclibc": "common-linux common-uclibc",
> @@ -68,6 +71,15 @@ def siteinfo_data(d):
>          "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
>          "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
>          "powerpc64-linux": "powerpc-linux",
> +        "x86_64-cygwin": "bit-64",
> +        "x86_64-darvin": "bit-64",
> +        "x86_64-darvin9": "bit-64",

dar_v_in? :)

Slightly more seriously, lets drop out ones we can't / aren't using, wrt
hosts, until we're going to do them for real.

-- 
Tom Rini
Mentor Graphics Corporation


