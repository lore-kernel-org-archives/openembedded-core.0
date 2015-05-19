Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 5C47370338
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 15:43:47 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B7C09F811E6; Tue, 19 May 2015 09:43:48 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4D81CF811E3;
	Tue, 19 May 2015 09:43:48 -0600 (MDT)
Message-ID: <555B5A3F.2070103@mlbassoc.com>
Date: Tue, 19 May 2015 09:43:59 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <555B53AB.2010804@mlbassoc.com>
	<CAP71WjyCqH34ULgHUmGx4S6bx0fm4gu2dNnOiLmZUZ0mQ4oM8A@mail.gmail.com>
In-Reply-To: <CAP71WjyCqH34ULgHUmGx4S6bx0fm4gu2dNnOiLmZUZ0mQ4oM8A@mail.gmail.com>
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: media player (gtk-play)
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
X-List-Received-Date: Tue, 19 May 2015 15:43:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-19 09:34, Nicolas Dechesne wrote:
> On Tue, May 19, 2015 at 5:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> Do you know if there is a way to tell gtk-play what gstreamer
>> back-end(s) to use?  In particular, for my i.MX6 board, it is
>> not choosing the video plugin I think it should and it would be
>> nice to test if it does the right thing if the correct plugin
>> is used.
>
> by video plugin, you mean the decoder or the video sink?
>
> if it's the sink:
>
> gst-play --videosink <foo> --audiosink <bar>

This is what I'm looking for except I need to send these to gtk-play,
the GUI front-end.

>
> if it's the decoder, you can't choose on the command line, the
> application will just rely on playbin, so you need to configure your
> plugins (and their priorities) so that playbin would pick the most
> appropriate plugin.
>
> cheers.
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

