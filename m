Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E34FC6B259
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 23:34:11 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2013 16:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,697,1367996400"; d="scan'208";a="270326932"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2013 16:34:11 -0700
Message-ID: <51E87B73.2010006@linux.intel.com>
Date: Thu, 18 Jul 2013 16:34:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
	<a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
	<64f18573660b81394357d27a13ca89856fa94536.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
	<CABcZAN=hPQ4Q+wT0JNkVQ6Pa93sZ_AsLEoy5HFyh_2gTbErt8w@mail.gmail.com>
In-Reply-To: <CABcZAN=hPQ4Q+wT0JNkVQ6Pa93sZ_AsLEoy5HFyh_2gTbErt8w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/11] chkconfig-alternatives-native: add git token in package version
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
X-List-Received-Date: Thu, 18 Jul 2013 23:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2013 03:05 PM, Chris Larson wrote:
> On Thu, Jul 18, 2013 at 7:16 AM, Emilia Ciobanu
> <emilia.maria.silvia.ciobanu@intel.com
> <mailto:emilia.maria.silvia.ciobanu@intel.com>> wrote:
>
>     Git packages should have the following format:
>          version+gitAUTOINC[r|-]+revision
>
>     Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com
>     <mailto:emilia.maria.silvia.ciobanu@intel.com>>
>
>
> Just as an FYI, in case you didn't consider it, this may well result in
> package versions going backwards. Not in this case, but the general one,
> depending on the SRCREV.

I did ask her to verify that these would not, I believe that she did that.

Sau!

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

