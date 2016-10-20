Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B46D571976
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 23:29:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 20 Oct 2016 16:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,521,1473145200"; d="scan'208";a="775265314"
Received: from swang16-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.202])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2016 16:29:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Olaf Mandel <o.mandel@menlosystems.com>
Date: Fri, 21 Oct 2016 12:29:55 +1300
Message-ID: <1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 20 Oct 2016 23:29:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Olaf,

On Wed, 19 Oct 2016 10:05:12 Olaf Mandel wrote:
> I ran into QA issues when inadvertently replacing OEs LICENSE with
> Yoctos LICENSE file. Why should recipes depend on the license for
> the complete collection of layers? At least for "normal" recipes
> that generate target device packages, this makes no sense to me.
> 
> I patched out the global LICENSE file from all those recipes that
> are short enough and where I feel reasonably confident of not
> having actually changed the claimed license terms in any way.

Agreed, doing this cleanup makes sense to me. We should especially discourage
others from referring to this file in their own recipes, and we start by
showing a good example.

> There are additional recipes that reference the global LICENSE
> file, but where I am not sure if a less blanket license declaration
> is appropriate or not. Especially for meta-toolchain and
> build-appliance-image, the global LICENSE is probably correct.
> Any comments?

For images and other recipes that don't pull in anything by themselves, there
shouldn't be a need for LIC_FILES_CHKSUM (or indeed LICENSE) to be set at all
- in order to understand the license for the result the appropriate place to
look is the license manifest that represents everything that goes into the
image. In fact, in master / morty, if SRC_URI is empty then LIC_FILES_CHKSUM
is no longer verified [1]. Thus, for such recipes we can remove the setting of
LIC_FILES_CHKSUM (and LICENSE, if possible) altogether.

Cheers,
Paul

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=c269547ae8e90a78349f6003385137e4145e145f

-- 

Paul Eggleton
Intel Open Source Technology Centre

