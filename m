Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4896760EA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 08:06:55 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 6D212213D2;
	Mon, 30 Sep 2013 10:06:56 +0200 (CEST)
Message-ID: <52493149.3030403@pseudoterminal.org>
Date: Mon, 30 Sep 2013 10:07:37 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <5248A04E.3060804@pseudoterminal.org>
	<969F26A8BAB325438E7EB80D3C3134FB16C43C69@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C43C69@IRSMSX105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about Orc and GStreamer
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
X-List-Received-Date: Mon, 30 Sep 2013 08:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Yes, thats Orc. It is part of meta-oe , but really should be in OE-core. 
I think there was a discussion about this in OE-core months ago, and I 
didn't see an opinion against it.
Can the GStreamer upgrade be included in the dora branch after release? 
I remember seeing package upgrades in the dylan happening after its 
release. In other words, package upgrades aren't just restricted to the 
master branch, correct?

On 2013-09-30 10:02, Iorga, Cristian wrote:
> Hello Carlos,
>
> Is this Orc?
> http://code.entropywave.com/orc/
>
> In this phase of the release cycle, is no longer possible to include orc into dora YP release.
> Also, package upgrades are no longer integrated in this phase of the release cycle.
>
> However, for both packages, patches will be welcome after dora is released into the wild.
>
> Regards,
> Cristian
>
> Cristian Iorga
> Linux Software Engineer
> Open Source Technology Center, Intel
>
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Carlos Rafael Giani
> Sent: Monday, September 30, 2013 12:49 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] Questions about Orc and GStreamer
>
> Hello,
>
> I have noticed that Orc is still not part of OE-core.
> Is it still possible to move it into Dora? It would be useful for GStreamer and other projects that seem to be using it.
>
> And, I am preparing patches for updating GStreamer 1.0 to version 1.2.
> I hope this update is still possible in the current M5 phase..
>
> cheers
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


