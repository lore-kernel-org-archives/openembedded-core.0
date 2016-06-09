Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACE770016
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:23:16 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 59A7F3050E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 16:23:16 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <57597BD3.8070104@pseudoterminal.org>
Date: Thu, 9 Jun 2016 16:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
Subject: Re: the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 14:23:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-09 12:28, Alexander Kanavin wrote:
> Hello,
>
> I'd like to propose the removal of Vala recipe and support for 
> generating Vala bindings from oe-core. The only software that is 
> written in Vala and makes sense in embedded environment is Rygel (an 
> implementation of various UPnP AV services), and even that can be 
> compiled from intermediate C sources without a need for Vala compiler 
> or bindings. The only benefit from compiling from Vala source would be 
> that Rygel could be more easily patched - and I think that doesn't 
> really justify maintaining the full Vala stack.
>
> Thoughts?
>
> Alex

The benefit of easy patching is considerable. If you only have the C 
sources, then the patches have to be done between versions of that 
generated C code. The resulting patches are often big and unreadable.

I was actually happy to see g-i added to OE-core so we can get rid of 
some custom C-source patches for Rygel and just patch the Vala code 
directly instead. Removing vala would nullify this benefit.

