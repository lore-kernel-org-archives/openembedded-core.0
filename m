Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGGkU-0004UD-3i
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 22:58:58 +0200
Received: by iafi7 with SMTP id i7so1134452iaf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RRLs2wkbQNBqFfKGNUzGSF06WCJLpHkYUV1nEckaCEA=;
	b=gs6Uf1WL17p+nJRY1aN4AKi82IvzKQHrOiIo0ODKuCsMkOYWsuP1a4eC1LuGuN/J4p
	cYf9qqkvB47rx3+t5V6OvUr9xgY1r5Eb+EBD35CzfCNHJ/OW9W2K7of32UGD9y5jL092
	I37tuT/x16YeCzZmPN7AdltpHq6n3JogzDz24=
Received: by 10.231.50.204 with SMTP id a12mr1776647ibg.11.1318971186436;
	Tue, 18 Oct 2011 13:53:06 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id bu33sm8333543ibb.11.2011.10.18.13.53.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 13:53:05 -0700 (PDT)
Date: Tue, 18 Oct 2011 13:54:25 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018205425.GC27472@sakrah.homelinux.org>
References: <cover.1318968860.git.nitin.a.kamble@intel.com>
	<3e92600b78e184b9388ed75c91796aa5ee17a3fc.1318968860.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <3e92600b78e184b9388ed75c91796aa5ee17a3fc.1318968860.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/5] python-scons: upgrade from 2.0.1 to 2.1.0
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
X-List-Received-Date: Tue, 18 Oct 2011 20:58:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 13:15), nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  ...ative_2.0.1.bb => python-scons-native_2.1.0.bb} |    3 +--
>  ...python-scons_2.0.1.bb => python-scons_2.1.0.bb} |    6 +++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb => python-scons-native_2.1.0.bb} (89%)
>  rename meta/recipes-devtools/python/{python-scons_2.0.1.bb => python-scons_2.1.0.bb} (51%)
> 
> diff --git a/meta/recipes-devtools/python/python-scons-native_2.0.1.bb b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> similarity index 89%
> rename from meta/recipes-devtools/python/python-scons-native_2.0.1.bb
> rename to meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> index f7646a2..083ad15 100644
> --- a/meta/recipes-devtools/python/python-scons-native_2.0.1.bb
> +++ b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> @@ -2,5 +2,4 @@ require python-scons_${PV}.bb
>  inherit native
>  DEPENDS = "python-native"
>  RDEPENDS_${PN} = ""
> -PR = "r1"
> -
> +PR = "r0"
> diff --git a/meta/recipes-devtools/python/python-scons_2.0.1.bb b/meta/recipes-devtools/python/python-scons_2.1.0.bb
> similarity index 51%
> rename from meta/recipes-devtools/python/python-scons_2.0.1.bb
> rename to meta/recipes-devtools/python/python-scons_2.1.0.bb
> index 1c7939e..22df333 100644
> --- a/meta/recipes-devtools/python/python-scons_2.0.1.bb
> +++ b/meta/recipes-devtools/python/python-scons_2.1.0.bb
> @@ -1,15 +1,15 @@
>  DESCRIPTION = "A Software Construction Tool"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8481211ebbeaed9cdc7ad5a3b0c98aaf"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ab8b65435c2e520ed18e67459f1f9bb9"

a little commentary on what changed in license text would be nice here


