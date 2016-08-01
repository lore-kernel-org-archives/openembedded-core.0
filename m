Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 672 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Aug 2016 10:13:58 UTC
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id EF2EF731FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 10:13:58 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 5d86_867d_79e5a907_910e_4b81_8697_6ba59bbceb76;
	Mon, 01 Aug 2016 19:02:41 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E69CAC0057
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 19:02:41 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 3CC1334E;
	Mon,  1 Aug 2016 19:02:41 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 25F731E0088;
	Mon,  1 Aug 2016 19:02:41 +0900 (JST)
To: Stephen Arnold <stephen.arnold42@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1461215114-5062-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LZ8QS01A4eni=Ou5Yi_w7c=FZN0sRzaTaiaj5jQ5oEBEA@mail.gmail.com>
	<CAOLEWZUfn=oGHCLmwKneiDNp_xYQXUqWjNSZDGny5=Rku-GUSA@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <f432f95f-589a-c4df-5db5-c4e037a03622@jp.fujitsu.com>
Date: Mon, 1 Aug 2016 19:03:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAOLEWZUfn=oGHCLmwKneiDNp_xYQXUqWjNSZDGny5=Rku-GUSA@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 10:14:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2016年07月31日 07:47, Stephen Arnold wrote:
> No answer to this?  cups-filters would be kinda important for actual
> printing, especially since the existing ghostscript/cups/poppler
> packages have all been gutted of anything called *toraster.  The
> current state (on krogoth at least) is completely broken; is there
> something on another branch somewhere?  If so, I can't see it with
> google...
>
> Steve
>

Hi, Steve

I am working on this one. Actually I have created the cups-filters 
recipe file. But the cups-filters depends on qpdf.
Just now I sent the qpdf recipe file to mailing list and will send the 
cups-filters recipe files later.

Cheers,

Fan



