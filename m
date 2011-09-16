Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4byY-0001Y3-DV
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:13:18 +0200
Received: by wwf27 with SMTP id 27so4294635wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DST1U8RrlcZs97NWdMywLrLM6hXTzhjjwINASgHYMxg=;
	b=UiBrHsHLRkv0NRRWnibfa/ihuyOsdLwlcNwT8rdqeBONbtG4vhwsX4Jd6IRKoYYrx5
	cM9dIyHNT9ByMo3uhrhVPnA7KFDaxCuOQ//IWj0oTdUJydnrV2puFptedyZ5RiPxka1G
	DEgcmnTGBlwt5yKeyghzr0+UMbDL4gD+qJAgc=
MIME-Version: 1.0
Received: by 10.216.93.81 with SMTP id k59mr79024wef.30.1316192885318; Fri, 16
	Sep 2011 10:08:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Fri, 16 Sep 2011 10:08:04 -0700 (PDT)
In-Reply-To: <1316191921.20858.43.camel@ted>
References: <1316177653.20858.23.camel@ted>
	<CAP9ODKor_37hXUvXv3GOYkF1ugkC_sWK4i4SW7tiU8ekJYu6Dw@mail.gmail.com>
	<1316191921.20858.43.camel@ted>
Date: Fri, 16 Sep 2011 14:08:04 -0300
X-Google-Sender-Auth: TlgMhMB19RTgvrkAI2eqiVXVrWQ
Message-ID: <CAP9ODKrdQNa09B7o_Vv6h=OJwuBU_CWRMVnYRmCU_4gOMww9LQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core release process
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
X-List-Received-Date: Fri, 16 Sep 2011 17:13:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 13:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-09-16 at 10:29 -0300, Otavio Salvador wrote:
>> On Fri, Sep 16, 2011 at 09:54, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > Its been mentioned to me that we perhaps haven't made it really clear
>> > what is happening with OE-Core at the moment. When we started this off=
,
>> > we agreed to try and get on a roughly six month release cadence so
>> > people had some idea of what to expect from the project and when. We
>> > decided to put that in sync with what Yocto was doing since it was fel=
t
>> > OE-Core would equally benefit from the QA and bug fixing Yocto does as
>> > part of its release process.
>>
>> I fully agree on that and I do think this will gonna be good for both
>> projects; what I dislike is that Yocto people keep using Poky to their
>> development instead of OE-Core and this it is quite boring to share
>> patches between both until you have =A0cherry-pick them.
>>
>> This should be change in my point of view and people ought to use
>> oe-core for hacking so we all share same base tree.
>
> The shr people keep using their shr scripts and tree and angstrom do the
> same to pick two examples. No, we're not all going to use OE-Core alone,
> that was never the point. So why should we single out poky either? Ok, a
> lot of patches are coming from there but that's good, right? :)
>
> I've yet to refuse a bug report on the grounds of "not OE-Core alone"
> and don't plan to start :)

I disagree on that.

I see shr and angstrom as not the same to Yocto mostly because it
takes, or is suppose to take, oe-core as is and merge it with bitbake,
meta-yocto and be done with it. In this case it seems logical to the
patches go directly to oe-core and Yocto merge from it avoiding a lot
of hassle for you and making contribution easy.

More then once I wanted to pick a patch that was in poky and not yet
merged into oe-core and it wasn't that easy to split it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


