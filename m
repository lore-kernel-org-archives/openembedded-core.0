Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 899F660043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 19:58:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Feb 2016 11:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,447,1449561600"; d="scan'208";a="884563109"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.221])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2016 11:58:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 08:58:16 +1300
Message-ID: <6385956.onRCuvi6ag@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <1455276973.16142.276.camel@linuxfoundation.org>
References: <1455276973.16142.276.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory: Fix regex to handle versions without spaces
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
X-List-Received-Date: Sun, 14 Feb 2016 19:58:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 12 Feb 2016 11:36:13 Richard Purdie wrote:
> Its valid to have dependencies like XXX (=2.1) without spaces, as injected
> by debian.bbclass. The code was breaking these into separate components
> and destroying them so improve the regex to handle them.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 32e096b..52a5f31 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -145,7 +145,7 @@ python buildhistory_emit_pkghistory() {
>              return None
> 
>      def sortpkglist(string):
> -        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+ [^ )]+\))?',
> string, 0) 
> +        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+(
> \([><=]+[^)]+\))?', string, 0) pkglist = [p.group(0) for p in pkgiter]
>          pkglist.sort()
>          return ' '.join(pkglist)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

