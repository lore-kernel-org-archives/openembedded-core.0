Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6o0b-0008BS-Qa
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 21:05:26 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so4560208obc.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=k9IR+kTr9Cwjht6ZTsQwsNfa6D2dD74Ckxhw+swk1DM=;
	b=Mhi7pv9ygl4JRuV9sW1AvweWOT2pifWkhV2Hgk5Ugb2pRdtNXt07Rchmp5BlDGWL01
	OZwcNeiU6LoEGKwAz6ixBideVECpNK/VARvcg1qNSEVnghgFSoJlzus5LaK3YZ0OizbW
	dWjzGjkLGHlCI4Xs/LWD/AZzHEBJRUeDLP8U7EOBAqthljJJcX9FSmwg7KHqvQYMYl+5
	dhsLpVWUogrzYqFOlfVKvoNbBkcTKR+MXF8cN47pj7bJw4GAedl0s/26N+TGrrOOAxjL
	pcHtXia2DYxDc3bx8i4GRh+z5AuKkbsYLO3Q+qGsnTcSrR1gsX5U05GhYlrPs67wAO9o
	J0Xg==
MIME-Version: 1.0
X-Received: by 10.182.38.69 with SMTP id e5mr4000971obk.79.1361044151739; Sat,
	16 Feb 2013 11:49:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 16 Feb 2013 11:49:11 -0800 (PST)
In-Reply-To: <20130216194055.GB3300@jama>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361018098.31795.33.camel@ted> <20130216194055.GB3300@jama>
Date: Sat, 16 Feb 2013 17:49:11 -0200
X-Google-Sender-Auth: 9gs8kM8sS0zmwq0t18SpRhQPgcs
Message-ID: <CAP9ODKo3q=1KFSmP7n=h3MwpUsFYgT+99W6oHXbXyY1dL2_gPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 20:05:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 16, 2013 at 5:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Feb 16, 2013 at 12:34:58PM +0000, Richard Purdie wrote:
>> On Sat, 2013-02-16 at 12:57 +0100, Enrico Scholz wrote:
>> > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> > >> it would be nice when the decision to make the init manager a distribution
>> > >> feature will be reverted to the old oe-meta mechanism.
>> > >
>> > > The trouble is that by making it an "image feature", people will
>> > > expect *everything* to work properly and to be able to have fully
>> > > functional sysvinit and systemd variants of images.
>> >
>> > I do not see an obvious reason why fully functional sysvinit, systemd and
>> > perhaps upstart image variants based on the same distribution/package set
>> > are impossible.
>> >
>> > Of course, not "everything" will work.  But initmgr being a distribution
>> > feature makes some things completely impossible.
>> >
>> > > We already see this expectation.
>> >
>> > IMO, removal of features just to lower expectations is the completely
>> > wrong way.
>>
>> meta-oe earned a *horrendous* reputation because of the way systemd was
>> implemented there. I believe (as do a number of others) that it has
>> damaged OE's reputation and usability and actively hurts new users. Yes,
>> the people who use systemd and meta-oe were happy. People who didn't
>> want systemd were not. There continues to be a fairly toxic mix of
>> distro policy mingled in with the recipes in there although good
>> progress is being made in fixing that and I'm grateful to the people
>> who've noticed and taken on that work (and done previous work like the
>> separation of meta-systemd).
>
> I was using sysvinit images even with systemd in meta-oe, setting 2
> VIRTUAL_RUNTIME variables and 1 .bbappend was enough to keep sysvinit
> images working.
>
> I agree that we were missing documentation for that and new users
> weren't able to figure it out for themselves.
>
>> It was clear systemd needed to move into the core but also become more
>> configurable to work for everyone. I don't want to remove features, I do
>> want to talk about whether there is a better way we can fulfil certain
>> uses cases, particularly with a focus on usability.
>
> I was talking with Ross about systemd as DISTRO_FEATURE, I agreed that
> it's fine to have it as DISTRO_FEATURE but I didn't expect that it also
> means that he wants to move PN-systemd to PN without upgrade path and
> possibility to create image without PN-systemd packages.
>
> My expectation was that systemd in DISTRO_FEATURES will enable
> systemd.bbclass functionality (same functionality as
> meta-systemd/system.bbclass had), not that it will force systemd and
> only systemd.
>
> Like with "3g" in DISTRO_FEATURES we expect that DISTRO supports 3g but
> not that every possible image and MACHINE will provide 3g functionality.
>
> I can imagine distribution with sysvinit+upstart+systemd in
> DISTRO_FEATURES if they are careful enough to prepare images with only
> right packages.
>
>> > > Trying to explain to people what the limitations are, what is expected
>> > > to work and what isn't will be difficult.
>> >
>> > OpenEmbedded is not an end-user distribution but for people who are
>> > willing to invest some learning effort.  Trying to limit ourself on the
>> > lowest common ground is not desirable imo.
>>
>> I did not say we're not going to support your use case. I'm asking if we
>> can summarise exactly what the problem is and whether there is another
>> way we can get there which isn't going to surprise as many people and be
>> easier to use.
>>
>> I'm actually moderately annoyed that throughout the various discussions
>> about systemd and how we'd get it into OE-Core nobody actually mentioned
>> these specific requirements until very late in the implementation.
>
> I think we all replied on first patch to move from PN-systemd to PN.
>
>> At the bare minimum, we actually need to document the usecases people
>> are using and require. Yes, you know your usecase but you need to take
>> some responsibility for ensuring its documented and known about else it
>> will continue to get broken time and time again.
>>
>> > > For that reason I'd rather see this done in a different way, for
>> > > example blacklisting the problematic systemd dependencies at image
>> > > generation time with some kind of stronger BAD_RECOMMENDS code.
>> >
>> > Assuming we are able to break the hard dependencies, what is with package
>> > scripts which require programs, files or directories from these deps?  Do
>> > we need a way to differ between good and bad script failures then?
>>
>> At the technical level there is little difference from packaging these
>> things separately to avoid specific dependencies and explicitly telling
>> the package manager to avoid that dependency instead.
>>
>> Equally there are other cases where people do want to break specific
>> dependencies so this could help us in that area too.
>>
>> Perhaps there is a dependency we need to drop to a Recommends level,
>> then use BAD_RECOMMENDS to handy that. We do need to document why we do
>> that and how it is expected to be used.
>
> I think the problem Enrico describes is that systemctl calls were
> contained to PN-systemd postinst/prerm scripts, now with systemd support
> moved from PN-systemd to PN you have to move postinst/prerm too and if
> you allow runtime dependency on systemd package to be broken, then you
> need to wrap each postinst/prerm script with check to see if e.g. systemctl
> exists on target image.
>
>> > Sounds extremely hacky and fragile...
>>
>> It depends on the implementation.
>>
>> Having initscripts in individual packages and having to play tricks to
>> ensure the right sets of packages get installed is rather hacky and
>> fragile.
>
> Automatic RRECOMMENDS from systemd.class was working fine, only other
> place where you needed to make sure all bits are in place was
> packagegroup-core-boot.
>
> I wasn't even using automatic RRECOMMEND but small packagegroup recipe
> to pull only systemd support for packages where I wanted it. It was more
> flexible and allowed me for example to install only ntpdate without
> systemd support:
>
> ntpdate works fine for people who wants to occasionally sync their time
> ntpdate-systemd is better for people who want to sync on every boot

+1

Yocto/OpenEmbedded needs to give priority to flexibility not
simplicity. The default settings need to work for general use case but
drop power from users is the wrong route in my point of view.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


