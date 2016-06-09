Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 0EDE2606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:08:17 +0000 (UTC)
Received: (qmail 28508 invoked by uid 1003); 9 Jun 2016 14:08:17 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.10.138)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 Jun 2016 14:08:17 -0000
To: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
Date: Thu, 9 Jun 2016 10:08:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 14:08:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 06/09/2016 06:28 AM, Alexander Kanavin wrote:
> Hello,
> 
> I'd like to propose the removal of Vala recipe and support for
> generating Vala bindings from oe-core. The only software that is written
> in Vala and makes sense in embedded environment is Rygel (an

It seems that there are use cases beyond just embedded systems for
OpenEmbedded, so this logic is not really valid. See:

http://openxt.org/

And yes, I think it is useful for openembedded-core to have as broad an
audience as possible.

That said, what other layers use vala? If it leaves core, is there a
layer that can host it and support other layers using it without to much
trouble?

Philip

> implementation of various UPnP AV services), and even that can be
> compiled from intermediate C sources without a need for Vala compiler or
> bindings. The only benefit from compiling from Vala source would be that
> Rygel could be more easily patched - and I think that doesn't really
> justify maintaining the full Vala stack.
> 
> Thoughts?
> 
> Alex

