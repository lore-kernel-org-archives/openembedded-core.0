Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id CBF666D801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:11:44 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 4D8D140083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 05:43:00 +0100 (CET)
Message-ID: <52831821.2020400@oss.bmw-carit.de>
Date: Wed, 13 Nov 2013 07:11:45 +0100
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>	<1384245243-20247-3-git-send-email-tobias.henkel@oss.bmw-carit.de>
	<lyd2m5ubhs.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyd2m5ubhs.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH 2/9] icecc: Remove output on stderr when calling which
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
X-List-Received-Date: Wed, 13 Nov 2013 06:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 12:04 PM, Enrico Scholz wrote:
> -    return d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
> +    return d.getVar('ICECC_PATH') or os.popen("which icecc 2> /dev/null").read()[:-1]
>                                          ~~~~~~~~~~~~~~~~~~~~~~
>
> I think, this can/should be replaced by
>
>    bb.utils.which(os.getenv("PATH"), "icecc")
>
> Ditto the other locations.
Thank you for this point. I'll post this as a new patch as the other 
patches of this patch series already seem to be in master.

Best regards
Tobias

