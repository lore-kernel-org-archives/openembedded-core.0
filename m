Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id B104D60664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 19:26:14 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 92EA7F811DF; Tue, 13 Aug 2013 13:26:15 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id CCC73F811D8;
	Tue, 13 Aug 2013 13:26:14 -0600 (MDT)
Message-ID: <520A8864.4020803@mlbassoc.com>
Date: Tue, 13 Aug 2013 13:26:28 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <520A6CE6.3010000@mlbassoc.com> <20130813173641.GN17945@jama>
In-Reply-To: <20130813173641.GN17945@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 13 Aug 2013 19:26:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-08-13 11:36, Martin Jansa wrote:
> On Tue, Aug 13, 2013 at 11:29:10AM -0600, Gary Thomas wrote:
>> I see that some of the gstreamer recipes have changed so that x264
>> is now a PACKAGECONFIG option.  However, I don't see anything that
>> enables this option anywhere.
>>
>> How do I get x264 support back - it was working with Poky/Yocto
>> just a few weeks back...
>>
>> Note: I have imported meta-oe/recipes-multimedia/x264 from meta-openembedded
>> into my layers for this [library] package.
>
> Add x264 to PACKAGECONFIG in your .bbappend or distro config as
> PACKAGECONFIG_append_pn-gst-foo = " x264"

Thanks, although this seems very cumbersome to me.  Is this the only
(or at least expected) way for this to work?

I didn't find the section in the manual that discusses this to be very
enlightening.  It tells me *how* to use PACKAGECONFIG in a recipe but
not really *why* nor how to control it in a build/image/distro.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

