Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 50F3760172
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:15:45 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7CC60F811E0; Mon, 24 Feb 2014 06:15:46 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 91A62F811F0;
	Mon, 24 Feb 2014 06:15:45 -0700 (MST)
Message-ID: <530B4609.7070307@mlbassoc.com>
Date: Mon, 24 Feb 2014 06:15:53 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
In-Reply-To: <CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 13:15:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-24 05:49, Nicolas Dechesne wrote:
> On Mon, Feb 24, 2014 at 12:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>> hmm. do you get any error message?
>>
>> Nope, I have been using this construction for several weeks now. The
>> local and bblayer samples have been extracted properly into the build
>> folder, so in that sense, there is no infrastructural change
>> introduced in here, just yet another file added in the folder.
> 
> well, i don't see what can possibly go wrong then... especially if
> layers.conf.sample and bblayer sample files work fine... maybe adding
> "set -x" in the script would reveal something..

I just tried this with the latest master and it is only looking in
the meta-yocto layer even though there is a conf-notes.txt in one of
my local layers as well.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

