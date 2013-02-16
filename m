Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6i4B-0004Mq-PJ
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 14:44:36 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so4416541obb.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 05:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7lMlF9yfQKsCziF0F/Rv3aVpp0WoYqgG9VjPyaQdu1g=;
	b=kB+NCGV1bb0H9VwDclGbzzQUjbAMZq2nCwXOnah/YW5mmbfBT1hNoY98ofutQNt1kp
	cMXhgc8M68bGNNLn84nX1sRSFvHzEftRE+tr67hH4CVEu2orkjrtQMp7LdbuxPJMSI2n
	MXi+Osn3K4FkvTqoDZLALOtjN9pl6K+MrJ/XocIVNVJ7pqqH9/zFd9qnJ9WXOumzhw8J
	80rv/BHT1n2C8ys5UBLDcc/cRJ4KrDeg4aiieJswPUKIdMIHkNCzoTf58PgFf5x09jut
	Qq3Y43GzTc+6m/rAKABQofji7NUC2eF9d9PDFNHk/iCPzt99RWif54KfFGA/Pojqa5Vz
	ih5g==
MIME-Version: 1.0
X-Received: by 10.182.231.39 with SMTP id td7mr3662183obc.86.1361021310022;
	Sat, 16 Feb 2013 05:28:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 16 Feb 2013 05:28:29 -0800 (PST)
In-Reply-To: <1361018098.31795.33.camel@ted>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361018098.31795.33.camel@ted>
Date: Sat, 16 Feb 2013 11:28:29 -0200
X-Google-Sender-Auth: vJSDcPwUBalU5H6sji988T9FgD8
Message-ID: <CAP9ODKqTYjNA4ona8K3n=EsHh8PCB=-LswAdq-5wvMVLqxR6oA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sat, 16 Feb 2013 13:44:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 16, 2013 at 10:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-02-16 at 12:57 +0100, Enrico Scholz wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> >> it would be nice when the decision to make the init manager a distribution
>> >> feature will be reverted to the old oe-meta mechanism.
>> >
>> > The trouble is that by making it an "image feature", people will
>> > expect *everything* to work properly and to be able to have fully
>> > functional sysvinit and systemd variants of images.
>>
>> I do not see an obvious reason why fully functional sysvinit, systemd and
>> perhaps upstart image variants based on the same distribution/package set
>> are impossible.
>>
>> Of course, not "everything" will work.  But initmgr being a distribution
>> feature makes some things completely impossible.
>>
>> > We already see this expectation.
>>
>> IMO, removal of features just to lower expectations is the completely
>> wrong way.
>
> meta-oe earned a *horrendous* reputation because of the way systemd was
> implemented there. I believe (as do a number of others) that it has
> damaged OE's reputation and usability and actively hurts new users. Yes,
> the people who use systemd and meta-oe were happy. People who didn't
> want systemd were not. There continues to be a fairly toxic mix of
> distro policy mingled in with the recipes in there although good
> progress is being made in fixing that and I'm grateful to the people
> who've noticed and taken on that work (and done previous work like the
> separation of meta-systemd).

In the begging yes. This has been fixed in meta-oe/meta-systemd split
and it allowed for both Worlds to be in peace again.

> It was clear systemd needed to move into the core but also become more
> configurable to work for everyone. I don't want to remove features, I do
> want to talk about whether there is a better way we can fulfil certain
> uses cases, particularly with a focus on usability.

Agreed; but removing the -systemd packages this removed features and
broke upgrade path for everyone using it. Plus it enforces the
deployment of systemd things in every image so now we cannot have
images with sysv OR systemd anymore.

>> > Trying to explain to people what the limitations are, what is expected
>> > to work and what isn't will be difficult.
>>
>> OpenEmbedded is not an end-user distribution but for people who are
>> willing to invest some learning effort.  Trying to limit ourself on the
>> lowest common ground is not desirable imo.
>
> I did not say we're not going to support your use case. I'm asking if we
> can summarise exactly what the problem is and whether there is another
> way we can get there which isn't going to surprise as many people and be
> easier to use.
>
> I'm actually moderately annoyed that throughout the various discussions
> about systemd and how we'd get it into OE-Core nobody actually mentioned
> these specific requirements until very late in the implementation.

Sorry Richard, I talked to people about it. If you check the first
version of patchset I complained about it but it was ignored.

> At the bare minimum, we actually need to document the usecases people
> are using and require. Yes, you know your usecase but you need to take
> some responsibility for ensuring its documented and known about else it
> will continue to get broken time and time again.

The use-case were covered by meta-oe/meta-systemd very well. So it was
documented and working.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


