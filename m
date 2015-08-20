Return-Path: <brendan.le.foll@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DC34773E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:34:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 00:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772262157"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 00:34:10 -0700
Date: Thu, 20 Aug 2015 08:34:11 +0100
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20150820073410.GA18330@jupiter.iwi.intel.com>
References: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
	<1439991165-13121-3-git-send-email-brendan.le.foll@intel.com>
	<CABcZANnhYzCmt0yZHayQ4TxQMgQ1DPYwZRAXJMH-9sovCHY6mg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnhYzCmt0yZHayQ4TxQMgQ1DPYwZRAXJMH-9sovCHY6mg@mail.gmail.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.5.23+102 (2ca89bed6448) (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] toolchain-shar-extract.sh: better default install path for extensible SDK
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
X-List-Received-Date: Thu, 20 Aug 2015 07:34:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2015 at 06:52:49PM +0100, Christopher Larson wrote:
>    On Wed, Aug 19, 2015 at 6:32 AM, <[1]brendan.le.foll@intel.com> wrote:
> 
>    From: Brendan Le Foll <[2]brendan.le.foll@intel.com>
>    Extensible SDK cannot be installed as root so by default offer to
>    install it in
>    user's home directory under distro/distro_version replacing the normal
>    SDK
>    version '+' char with a '_' as that's a restricted character for
>    bitbake
>    Signed-off-by: Brendan Le Foll <[3]brendan.le.foll@intel.com>
> 
>    Why not use a metadata variable for the default, replacing with @@ as
>    with the other metadata variables, rather than hardcoding the default
>    in the .sh where it can't be easily overridden by the distro or user?

'~' seemed like a good option for all SDKs/distros seemed like a
decent 'default' to me and the rest is fairly customisable with
SDK_TITLE which has to be set anyways. Or do you mean a different var?

Thanks,
Brendan

