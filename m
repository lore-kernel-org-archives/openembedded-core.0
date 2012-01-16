Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RmrGc-0007Qp-7a
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 19:26:50 +0100
Received: by obcwo8 with SMTP id wo8so2159991obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 10:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=miz1xLu5VzzpXkfzYzPwnhn2i/ANNYQSRJg3fC79MQQ=;
	b=cpL7r9gkTpvC2Dc7bkH59mar/3qEnW7IQCkNc6rqJEVaGMb/yVCbePA/xkAiTV/PVp
	FbyA2lYK1VW3D0Odfr5QRGRBhQgc2lUUy2bS4H88DegxicaQAIG6l9S8jvKxaWQ0dPsh
	3gfecEgsXtWya872thkJPRSGVAoaFL4Q2Duh8=
MIME-Version: 1.0
Received: by 10.182.75.2 with SMTP id y2mr5472512obv.54.1326737953048; Mon, 16
	Jan 2012 10:19:13 -0800 (PST)
Received: by 10.60.34.138 with HTTP; Mon, 16 Jan 2012 10:19:12 -0800 (PST)
In-Reply-To: <1326737165.2933.7.camel@ted>
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
	<1326737165.2933.7.camel@ted>
Date: Mon, 16 Jan 2012 10:19:12 -0800
Message-ID: <CAGDS+n=HwjOz-QKMDyGy6qKf74WESsUFR-mCUT1HV+qaOzcCfg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2012 18:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2012 at 10:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-01-12 at 20:17 +0100, Koen Kooi wrote:
>> This is needed for e.g. gnome-session:
>>
>> gnome-session[424]: WARNING: Failed to run gconf-sanity-check-2:
>> Failed to execute child process
>> "/usr/libexec/gconf-sanity-check-2" (No such file or directory)
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> =A0meta/recipes-gnome/gnome/gconf_3.2.3.bb | =A0 20 +++++++++++---------
>> =A01 files changed, 11 insertions(+), 9 deletions(-)
>
> This broke OE-Core since gtk+ depends on pango, pango depends on gconf
> and gconf depends on gtk+.
>
> Why wasn't this tested? I can only assume there are things in meta-oe
> masking pieces of OE-Core and this shows how harmful they can be.

My tested-by was indeed performed with the meta-oe layer enabled.

In the future I will make clear what layers were used in my testing.

I fear that this kind of thing is going to bite us repeatedly :-(

> Since this was breaking things for pretty much everyone who does use
> OE-Core, I pushed a patch changing pango to inherit gnomebase instead of
> gnome.bbclass which resolves the circular dependency.

This seems like a reasonable fix.

Steve


