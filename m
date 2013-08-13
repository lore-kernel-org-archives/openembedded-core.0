Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 024CC6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:37:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7DHbJWg019218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:37:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 10:37:19 -0700
Message-ID: <520A6ECF.8000002@windriver.com>
Date: Tue, 13 Aug 2013 12:37:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <520A6CE6.3010000@mlbassoc.com>
In-Reply-To: <520A6CE6.3010000@mlbassoc.com>
Subject: Re: Enabling x264 support in gstreamer
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
X-List-Received-Date: Tue, 13 Aug 2013 17:37:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/13 12:29 PM, Gary Thomas wrote:
> I see that some of the gstreamer recipes have changed so that x264
> is now a PACKAGECONFIG option.  However, I don't see anything that
> enables this option anywhere.
>
> How do I get x264 support back - it was working with Poky/Yocto
> just a few weeks back...
>
> Note: I have imported meta-oe/recipes-multimedia/x264 from meta-openembedded
> into my layers for this [library] package.

I havn't worked with this myself, but my guess is.  In your distribution.conf 
file (or your local.conf):

PACKAGECONFIG_gst-plugins-ugly = "x264"

or

PACKAGECONFIG_gstreamer1.0-plugins-ugly = "a52dec lame mad mpeg2dec x264"

> Thanks
>


