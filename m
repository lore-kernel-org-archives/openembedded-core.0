Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E94AB766DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 22:02:49 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 35DD337AEF;
	Sat, 22 Aug 2015 00:02:32 +0200 (CEST)
Message-ID: <55D7A008.5010501@pseudoterminal.org>
Date: Sat, 22 Aug 2015 00:02:48 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>	<55D79ECC.9070308@pseudoterminal.org>
	<CAP9ODKqcyRt_Yc=aO=7dN0hreYnwHXOEE-FiuSbG0dPDqecMVQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqcyRt_Yc=aO=7dN0hreYnwHXOEE-FiuSbG0dPDqecMVQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 0/2] gstreamer1.0: Add patches for Gstreamer 1.4.5
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
X-List-Received-Date: Fri, 21 Aug 2015 22:02:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 2015-08-22 um 00:01 schrieb Otavio Salvador:
> On Fri, Aug 21, 2015 at 6:57 PM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> These are backports, so I do not see a problem with them. However, keep in
>> mind that GStreamer 1.6 will be out in a few days, so I recommend hold off
>> any patches that are not backports. I have recipes prepared for 1.5.90 (=
>> 1.6 release candidate) that I will then send to the mailing list. New
>> patches should be applied on top of that, not 1.4.5.
> In this case it is better to not merge those and wait for 1.5.90 to be
> send. This allow for testing and also FSL checking for any other
> pending fixes.
>
>

Yes. In fact, several of the present non-backport patches no longer 
apply. I had to delete them because fixing them was a nontrivial task, 
and should better be done by the original authors. I already sent a 
heads up about this to them.

