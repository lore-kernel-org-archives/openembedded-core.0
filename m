Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFwm8-0002RL-30
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 02:43:52 +0200
Received: by eaad12 with SMTP id d12so1371108eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 17:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iz6skTuaPiPFJWLXB9LAgmdlM2XrZA1jpKj8z2KToDo=;
	b=Q3JqfjTWHh374uc2E6jSU5ZP30dCmwyLaoGj1Hd8s3mwBrlccyHtpo4ovagtCYKFoe
	eEk5WYrEjc+++Wra12SC+Bn2JVaTubTsp6hSO8pZ1NgyDP8oi5+JF3W6jIqiJfUKRpTI
	Drs7TYsBPna2vSp9D0fu9e5Cy0Sw25aNBqSvVdUMPzF3gHPYENUoXR/Cm7VLitFHi/La
	rQGKRcT8mabPKURQVi8qjtP/Hkz8XKDuHCdbpzLNN+m6ocqEO3v53YwKV7yaWojCLwRj
	clKleyZNEKia2U5lNydWYTypMJkPqvPiPvWbC/GA22TP8ECuA8r6yx0YitjbriD46l92
	lftA==
Received: by 10.14.202.71 with SMTP id c47mr12944236eeo.42.1348446664962; Sun,
	23 Sep 2012 17:31:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sun, 23 Sep 2012 17:30:34 -0700 (PDT)
In-Reply-To: <1348422391.4444.238.camel@x121e.pbcl.net>
References: <1348331093.4444.218.camel@x121e.pbcl.net>
	<CAMKF1sr_zaF9B-kWwDexh6jwL8S2oKxnBMqg4BQ7eAdEh4X5vA@mail.gmail.com>
	<1348422391.4444.238.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 17:30:34 -0700
Message-ID: <CAMKF1sobXKK95M7PAHsOrGnGfEd81Pno5kw4OpnNEsO3Vkjd4A@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Ensure that ${sbindir} is respected
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
X-List-Received-Date: Mon, 24 Sep 2012 00:43:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 23, 2012 at 10:46 AM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2012-09-23 at 10:31 -0700, Khem Raj wrote:
>> On Sat, Sep 22, 2012 at 9:24 AM, Phil Blundell <philb@gnu.org> wrote:
>> > The configure script uses a hard-coded value for ${usrsbin_execdir},
>> > which is the path that we know as ${sbindir}.  Adjust configure to take
>> > this from the environment if it's set there, and have do_configure()
>> > pass it in.
>>
>> I think our expectation is same as what the configure is defining
>> which is sbin dir under exec_prefix
>
> Well, that might be your expectation, but it isn't necessarily what the
> user has configured.  There is no guarantee that ${sbindir} will be set
> to that particular value, and the recipes ought to respect what it is,
> in fact, set to.

then is it only sbindir or also bindir and so on that needs this kind
of patching and is it just util-linux or other some other packages as
well? Generally if you changed exec_prefix it was enough
to e.g. flatten out /usr and this case here will work without change
if you changed exec_prefix

>
> p.
>
>


