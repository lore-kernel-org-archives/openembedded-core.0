Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsEAi-0008JV-7O
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 16:27:12 +0200
Received: by lbol5 with SMTP id l5so4941260lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=7f+SzOummx6bCFe63kYgUdKiZJJLMzEWJLgsrLHG37o=;
	b=eKUNv4yLwbi66BlV3DeRR8I9FshxYoeBQ2kl72R7bgD1AWoNFmlLgvgT23dVd4SCte
	nHJqmp0Ju4S2osgUJZ3RQocWBi4zAgNHz9+9MwePNLHYa63vRNnhsIJIyJj/8YGJ+3Zm
	Zp0TwDXBF6MsYcfJayP84jR+f9GpEfMdoQJ4y1RKwi6LJXAsPG2FO8bLO7vka/p7bsqp
	42b8iB7izS/ramqHh7MP2WGaMtAlxU5P+TykW+6AofRMFetcloONPvsW29nP8iYJ6YNT
	hZ9jjn3Msvq8bm9psyCe89G50Phgy59ba79z9W5iw5AU2SiIf5hxKVcgTZImXSAadNwH
	VEnQ==
Received: by 10.112.11.38 with SMTP id n6mr3020474lbb.82.1342793748985; Fri,
	20 Jul 2012 07:15:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Fri, 20 Jul 2012 07:15:28 -0700 (PDT)
In-Reply-To: <1342793560.21788.27.camel@ted>
References: <20120720093208.GD3534@jama.jama.net>
	<1342792561.21788.17.camel@ted>
	<CABcZANkMioYyrY-+eMbkT5Dbsfs5LJEJQaHj31mgv8jd0Z2qiw@mail.gmail.com>
	<1342793560.21788.27.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 Jul 2012 07:15:28 -0700
X-Google-Sender-Auth: XKX_Cl89Lzb3gMmIa8XBygJCT1U
Message-ID: <CABcZANm_becV-qGHud3=kbyoBMuG9xqcTTLNdT5RCu-MZMGn1g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 14:27:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 20, 2012 at 7:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-07-20 at 06:57 -0700, Chris Larson wrote:
>> On Fri, Jul 20, 2012 at 6:56 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Fri, 2012-07-20 at 11:32 +0200, Martin Jansa wrote:
>> >> Now we have horrible mixture of whitespaces (tabs and space) only in
>> >> recipe files, because yocto style guide recommends tabs in shell
>> >> functions. So if recipe has e.g. do_install_append as well as
>> >> populate_packages_prepend (not so uncommon combination as tabs fixing
>> >> patches show), then according to yocto style guide it should look like
>> >> this:
>> >>
>> >> do_install_append() {
>> >>       foo
>> >> }
>> >> python populate_packages_prepend () {
>> >>     libdir = bb.data.expand('${libdir}', d)
>> >>     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
>> >> }
>> >>
>> >> especially with default tab width 8 spaces it's ugly and because it
>> >> is inconsistent, many devs used spaces in shell functions too. Now when
>> >> someone accidentaly use tab also in python function it will show warning
>> >> or fail to parse. Some devs are using mix of tabs and spaces even on the
>> >> same line (e.g. to indent SRC_URI multiline entries).
>> >
>> > We've said tabs for shell functions for *years*. I'm sure if I were to
>> > look at the mailing list archives, that would be clear.
>> >
>> > In summary, I agree we need to make the style guides consistent and have
>> > one version of them. I disagree with spaces for everything though,m
>> > particularly as we have said to use tabs for as long and many of the
>> > recipes do this (certainly more than use spaces).
>>
>> I don't think history is a particularly good reason to keep our
>> metadata inconsistent, especially with bitbake becoming picky about
>> it.
>
> I don't see it as inconsistent. I think python needed some special
> handling since the language itself uses whitespace for structure and
> we're now following standard python practise and have a way to ensure
> some kinds of bugs don't creep in in future. It was already the agreed
> convention, it just wasn't getting well followed, or we had some issues
> migrating old mixed code to any one format without enforcing one.


If you don't see two different types of indentation in one file as
inconsistent, I think you need to look up consistency in a dictionary.
-- 
Christopher Larson


