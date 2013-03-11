Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UF8MS-00021k-Ls
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 20:26:33 +0100
Received: by mail-ob0-f172.google.com with SMTP id tb18so3719708obb.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=XnWkV4H8CrMz0M+qBbkR/nbS5OORBaKKHJq0VeSsdIs=;
	b=jfLfrmgY1iI5Up/QgPqhq8/fb9wtOkETw8in212TKyUfndsLcJksFJuxYd0nHabR8w
	zsfufX2QCfnczHUhKPozuIVqFXAgjI1tnqLvZZvM+zvb/HMAuaM1SlwIyLNRa+ikNpsK
	aLAUqh9n81WOu37Dt+liD78+SzO768sWY/F1xx8Q5E5a6YJeG8QsSt9qu4fAeyBgeB8D
	VQj9yKv/TeQ3jje5tMerR0YWn+ZAQjlK7ODf2p8Q/TOesMcGljcU0oZaXmp2ihrB60bU
	ShyNrIEhAT03ZoqkdM5wsyHwGI6L7MStdw5ZTeLdUOetPWbRgkEjpzRzn65YiXH52xd+
	7G9A==
MIME-Version: 1.0
X-Received: by 10.182.0.111 with SMTP id 15mr9890434obd.27.1363028977872; Mon,
	11 Mar 2013 12:09:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 11 Mar 2013 12:09:37 -0700 (PDT)
In-Reply-To: <20130311185242.GA31635@denix.org>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
	<CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
	<CAP9ODKrnp4VHmvOyq-D=k1oy62VT0R18Xk1KS80kAD+4JfqLJQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101594532C3@DLEE12.ent.ti.com>
	<CAP9ODKog6e+3BbDT+pLy1a8GsEuKtyZmuuoHGoc3tOX20OvLpg@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED10159453E63@DLEE12.ent.ti.com>
	<20130311185242.GA31635@denix.org>
Date: Mon, 11 Mar 2013 16:09:37 -0300
X-Google-Sender-Auth: HUMAYtY4RF1KFghQPulJHRab3_Q
Message-ID: <CAP9ODKrxarzuTXX3v8es4nNMawwcMXwixuuh-dtuv+dxS4tP-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 19:26:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 11, 2013 at 3:52 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Mar 11, 2013 at 06:03:25PM +0000, Maupin, Chase wrote:
>> > -----Original Message-----
>> > From: otavio.salvador@gmail.com
>> > [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio Salvador
>> > Sent: Monday, March 11, 2013 11:24 AM
>> > To: Maupin, Chase
>> > Cc: Denys Dmytriyenko; Patches and discussions about the oe-core
>> > layer
>> > Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
>> > override order
>> >
>> > On Mon, Mar 11, 2013 at 11:49 AM, Maupin, Chase
>> > <chase.maupin@ti.com> wrote:
>> > >> -----Original Message-----
>> > >> From: otavio.salvador@gmail.com
>> > >> [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio
>> > Salvador
>> > >> Sent: Saturday, March 09, 2013 6:11 AM
>> > >> To: Maupin, Chase
>> > >> Cc: Denys Dmytriyenko; Patches and discussions about the oe-
>> > core
>> > >> layer
>> > >> Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
>> > >> override order
>> > >>
>> > >> On Fri, Mar 8, 2013 at 7:16 PM, Maupin, Chase
>> > >> <chase.maupin@ti.com> wrote:
>> > >> >> -----Original Message-----
>> > >> >> From: otavio.salvador@gmail.com
>> > >> >> [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio
>> > >> Salvador
>> > >> >> Sent: Friday, March 08, 2013 2:27 PM
>> > >> >> To: Denys Dmytriyenko
>> > >> >> Cc: Maupin, Chase; Patches and discussions about the oe-
>> > core
>> > >> >> layer
>> > >> >> Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
>> > >> >> override order
>> > >> >>
>> > >> >> On Fri, Mar 8, 2013 at 5:06 PM, Denys Dmytriyenko
>> > >> >> <denis@denix.org> wrote:
>> > >> >> > On Fri, Mar 08, 2013 at 03:52:57PM -0300, Otavio Salvador
>> > >> >> wrote:
>> > >> >> >> On Fri, Mar 8, 2013 at 2:51 PM, Chase Maupin
>> > >> >> <Chase.Maupin@ti.com> wrote:
>> > >> >> >> > * the current order has SOC_FAMILY settings, which are
>> > >> >> generic
>> > >> >> >> >   settings for a group of devices, overriding the
>> > machine
>> > >> >> specific
>> > >> >> >> >   settings.  For example:
>> > >> >> >> >
>> > >> >> >> >   KERNEL_DEVICETREE_ti33x = "xxxx"
>> > >> >> >> >   KERNEL_DEVICETREE_beaglebone = "yyyy"
>> > >> >> >> >
>> > >> >> >> >   Should yield "yyyy" when building for the beaglebone
>> > >> >> because
>> > >> >> >> >   that is a more specific device than ti33x.  However,
>> > >> >> without this
>> > >> >> >> >   change the result is that the value is set to "xxxx"
>> > >> >> meaning the
>> > >> >> >> >   more generic setting overrides the more specific
>> > >> setting.
>> > >> >> >> >
>> > >> >> >> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> > >> >> >>
>> > >> >> >> Maybe while on that you could look at supporting xx:yy
>> > as
>> > >> SoC
>> > >> >> family?
>> > >> >> >> like am37xx:am3715 ?
>> > >> >> >
>> > >> >> > Did you mean am3517? That's a slightly different variant
>> > of
>> > >> >> am35x/omap35x SoC.
>> > >> >>
>> > >> >> Yes; sorry ... what I meant was 'am35xx:am3517'
>> > >> >>
>> > >> >> > But if you really meant am3715 (as well as am3705, am3725
>> > >> and
>> > >> >> am3730), then
>> > >> >> > those are variants of am37x SoC, just with some
>> > subsystems,
>> > >> >> like SGX or DSP,
>> > >> >> > being absent or present. Having those variants handled by
>> > >> >> SOC_FAMILY would be
>> > >> >> > an overkill. Instead, we've started using
>> > MACHINE_FEATURES
>> > >> to
>> > >> >> distinguish
>> > >> >> > between those variants of the same SoC, by checking for
>> > >> "sgx"
>> > >> >> and/or "dsp"
>> > >> >> > flags there and pulling in needed software components
>> > >> >> accordingly.
>> > >> >>
>> > >> >> My main concern here is that COMPATIBLE_MACHINE also parses
>> > >> >> SOC_FAMILY
>> > >> >> however if you have two (as the 'am35xx:am3517') it is
>> > going
>> > >> to
>> > >> >> fail;
>> > >> >> it could split it and parse it individually.
>> > >> >
>> > >> > Sorry, I'm not sure if I'm following here.  Are you saying
>> > you
>> > >> would find it useful to have support for a MACHINE to have
>> > more
>> > >> than one SOC_FAMILY?  In the example above I would have
>> > expected
>> > >> that you would have a machine config file for am3517 which has
>> > an
>> > >> SOC_FAMILY of am35xx.  Why would you specify two SOC_FAMILY
>> > >> values per machine?
>> > >>
>> > >> We can have more generic to more specific combinations.
>> > >>
>> > >> > Or are you trying to build something like omap3->am35xx-
>> > >am3517
>> > >> where you can use omap3 as a more generic setting but still
>> > use
>> > >> am35xx for a slightly more restrictive group that is still
>> > >> grouping like parts, and finally you use am3517 for the exact
>> > >> part?
>> > >>
>> > >> Exactly so we avoid duplication stuff to boards or SoCs.
>> > Another
>> > >> example of use: imx -> mx6q -> mx6.
>> > >
>> > > I see.  This could be of some use and I'll play with it.  This
>> > should not be required though for this patch since right now I
>> > want to fix the order issue.  Any objection to the patch as is?
>> >
>> > No; not really. I just wanted to ask if you could look at it as
>> > well
>> > so we can have it working. It does make things much easier for
>> > all us.
>>
>> Sure.  Btw, I noticed a weirdness when looking at this where the
>> COMPATIBLE_MACHINE being evaluated evaulated/matched only has to be a
>> substring of the SOC family to work.  For example if I have:
>>
>> MACHINE = omap5-evm
>> SOC_FAMILY = omap-a15
>> COMPATIBLE_MACHINE = omap
>>
>> Then this will work because "omap" (the COMPATIBLE_MACHINE) is a substring
>> of SOC_FAMILY (and technically also a substring of omap5-evm)
>>
>> Even setting COMPATIBLE_MACHINE to omap- will work because that is a
>> substring of omap-a15.  So the "match" operation is not really precise
>> enough.  I'm wondering if this needs to be changed to do an exact match.
>
> COMPATIBLE_MACHINE is a regular expression and after thinking about it some
> more and digging around, I believe it was implemented that way on purpose, to
> be as inclusive as possible, so you can do things like "nokia(800|770)" or
> what I do in Arago - "(?!arago)". Or in case of COMPATIBLE_HOST it could be
> "^(i.86|x86_64|powerpc).*-linux". So, if you need an exact match, then specify
> it with the regular expression syntax:
>
> COMPATIBLE_MACHINE = "^omap$"
>
> The above won't match either of the examples you provided above, unless
> MACHINE or SOC_FAMILY are specifically set to "omap".
>
> For multiple entries in COMPATIBLE_MACHINE, use "^(omap|davinci)$"

The only change I think we need is to pass, for the parser, each value
of SOC_FAMILY, so the regexp is applied to each value.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


