Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoIzZ-0008Uu-Ez
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 20:47:29 +0200
Received: from mail205-ch1-R.bigfish.com (10.43.68.244) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jul 2012 18:18:56 +0000
Received: from mail205-ch1 (localhost [127.0.0.1])	by
	mail205-ch1-R.bigfish.com (Postfix) with ESMTP id A912F200193;
	Mon,  9 Jul 2012 18:18:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zz98dI9371I936eI1432I9a6kzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail205-ch1 (localhost.localdomain [127.0.0.1]) by mail205-ch1
	(MessageSwitch) id 1341857934799752_25357;
	Mon,  9 Jul 2012 18:18:54 +0000 (UTC)
Received: from CH1EHSMHS025.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail205-ch1.bigfish.com (Postfix) with ESMTP id
	B709B2C004D;	Mon,  9 Jul 2012 18:18:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS025.bigfish.com
	(10.43.70.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jul 2012 18:18:54 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Mon, 9 Jul 2012 13:20:58 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 0/3] u-boot recipe updates
Thread-Index: AQHNXf+VGpDDRd3rXUmQP9Focp4BrQ==
Date: Mon, 9 Jul 2012 18:20:57 +0000
Message-ID: <CAEsOVNfV7Ny2hqb25U4ki+AFkE2ipeL9xxfsc7QXYrXGM8GDQw@mail.gmail.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
	<20120704150005.GD1817@windriver.com>
	<1341415765.20265.30.camel@phil-desktop>
	<20120705161402.GA2309@windriver.com>
	<1341849720.20265.64.camel@phil-desktop>
In-Reply-To: <1341849720.20265.64.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 09 Jul 2012 18:47:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6D177329CCA29741979372001C720BFA@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 9, 2012 at 11:01 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2012-07-05 at 12:14 -0400, Paul Gortmaker wrote:
>> > On Wed, 2012-07-04 at 11:00 -0400, Paul Gortmaker wrote:
>> > > > On a related note, is it possible to fix the mailing list so that =
it
>> > > > does not strip To/Cc information and Message-ID strings?  [I'd hav=
e to
>> > > > check -- maybe it is (also) inserting a needless Reply-To: header =
that
>> > > > messes things up.]
>>
>> Your mail suffers the exact same problem.  My address is nowhere to be
>> seen on the To/Cc:  I only happened to see it since I told mutt to
>> show me all archived poky/oe mails with u-boot in the subject.
>> Otherwise your message would have been lost in the noise, perhaps seen
>> next week when I return from OOO.
>>
>> And when I hit reply, it won't go to you unless I tell mutt to ignore
>> the broken Reply-To line.  It is the line right at the bottom:
>
> Ah, I see.  So, just to be clear, the mailing list isn't stripping
> anything: the reason that your address doesn't appear in To/Cc is, as
> you suggest, purely because the Reply-to: header which mailman inserts
> tends to cause replies to be sent only to the list.
>
> I tend to agree with you that the Reply-to header is a bad idea and it
> would be better off disabled, but this is a list policy decision and
> Richard, as the administrator, would need to decide whether he wants to
> disable it or not.
>
> For what it's worth, you can partially defeat this behaviour by
> inserting your own Reply-to header in messages that you send to the
> list.  If you tell mutt to add:
>
> Reply-to: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> then mailman will translate this to:
>
> Reply-to: Paul Gortmaker <paul.gortmaker@windriver.com>,
> openembedded-core@lists.openembedded.org
>
> which will probably produce more or less the effect that you are looking
> for.  I realise that this is still somewhat annoying but you might find
> it better than the behaviour you are getting at present.
>
> p.

I really wish this worked like 99% of other mailing lists....

-M=



