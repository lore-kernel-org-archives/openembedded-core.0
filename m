Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 490 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 15:19:54 UTC
Received: from ptmx.org (unknown [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A18A460897
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:19:54 +0000 (UTC)
Received: from [10.1.14.248] (unknown [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 9838224F77
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 17:11:44 +0200 (CEST)
Message-ID: <536B9EB0.50704@pseudoterminal.org>
Date: Thu, 08 May 2014 17:11:44 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:19:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-08 16:48, Burton, Ross wrote:
> Hi all,
>
> Sorry for the cross-post but I want this to have a wide audience.
>
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.
>
> Everyone in agreement?  Should I expect any hate mail over this?
>
> Ross

I suppose it wouldn't be possible to rename the recipes as well? It 
would be cleaner to have them adopt the GStreamer 1.0 recipe naming 
convention. So, for example, no more gst-plugins-bad_1.0.23.bb , but 
gstreamer0.10-plugins-bad_1.0.23.bb for example.

I guess that this would break compatibility with some existing layers 
that still use 0.10.

