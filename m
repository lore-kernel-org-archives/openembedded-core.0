Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U10qp-0007MC-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 21:35:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Jan 2013 12:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="197206672"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jan 2013 12:19:30 -0800
Message-ID: <510AD1D2.7060106@linux.intel.com>
Date: Thu, 31 Jan 2013 12:19:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <1359659480-8210-1-git-send-email-sgw@linux.intel.com>
	<CABcZAN=FjHhd6Xp8758qzq2pPS=tQn8yd+EXUha=G3YsjnYD9g@mail.gmail.com>
	<CABcZAN=Q=HYZ94QUahweLDHuiZDC7xd98F4nEbmMgZ5ze4tJhA@mail.gmail.com>
In-Reply-To: <CABcZAN=Q=HYZ94QUahweLDHuiZDC7xd98F4nEbmMgZ5ze4tJhA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache: Fix rdepends construction
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 20:35:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2013 11:50 AM, Chris Larson wrote:
>
> On Thu, Jan 31, 2013 at 12:50 PM, Chris Larson <clarson@kergoth.com
> <mailto:clarson@kergoth.com>> wrote:
>
>     On Thu, Jan 31, 2013 at 12:11 PM, Saul Wold <sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>> wrote:
>
>         -        rdepends = d.getVar('RDEPENDS_%s' % pkg, True)
>         -        rdepends = rdepends + ' ' + d.getVar('MLPREFIX') +
>         "hicolor-icon-theme"
>         -        d.setVar('RDEPENDS_%s' % pkg, rdepends)
>         +        rdepends = ' ' + d.getVar('MLPREFIX') +
>         "hicolor-icon-theme"
>         +        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>
>
>     The new version isn't using a getVar of the old rdepends at all, so
>     it's just replacing it every time. Is that really what you intended
>     here? Wouldn't a getVar() or '' be a better approach? Further, the
>     '' + d.getVar('MLPREFIX') is pointless if you aren't including the
>     original value, as it adds a separator to the beginning when there's
>     nothing to separate.
>
>
> Erm, ignore this, I'm apparently blind as a bat if I can't see
> 'appendVar' :)

No problem, I have had those days also.

Sau!

> --
> Christopher Larson


