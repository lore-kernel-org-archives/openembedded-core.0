Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A29C8609AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 15:30:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2014 08:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,957,1392192000"; d="scan'208";a="521505650"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO [10.255.12.167])
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 08:30:38 -0700
Message-ID: <538C989E.7010200@linux.intel.com>
Date: Mon, 02 Jun 2014 08:30:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA1C947B6@COSNADEXC23.usr.ingenico.loc>
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA1C947B6@COSNADEXC23.usr.ingenico.loc>
Subject: Re: [PATCH 1/4] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Mon, 02 Jun 2014 15:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 06/02/2014 12:03 AM, Matthieu CRAPET wrote:
> Hi,
>
> Should I rebase/repost this? Aside libav versions/pinning preferences, this single patch deserves to be commited.
>
Yes please, but I think you want to consider using 
bb.utils.contains_any() instead of your contains_one implementation.

Sau!

> Regards,
> Matthieu
>
>
> -----Message d'origine-----
> De : openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] De la part de Matthieu Crapet
> Envoyé : mercredi 21 mai 2014 13:38
> À : openembedded-core@lists.openembedded.org
> Objet : [OE-core] [PATCH 1/4] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
>
> Dropped libvorvis dependency because there is already a (better) builtin vorbis codec.
> Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using external library).
>
> Changes:
> - add --enable-nonfree when faac or openssl are used
> - add DESCRIPTION
> - sort PACKAGECONFIG entries
>
> Tested with libav-0.8.11 & libav-9.13.
>
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>   meta/recipes-multimedia/libav/libav.inc | 39 ++++++++++++++++++++++++++-------
>   1 file changed, 31 insertions(+), 8 deletions(-)
>
> [...]
>

