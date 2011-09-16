Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4fSN-0007GH-Pd
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 22:56:20 +0200
Received: by bke11 with SMTP id 11so7375090bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 13:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LQg59ayJaUe55LPF1wQd0DRlZpUKu9S9RJXQuLCfPM0=;
	b=PAq8cEhMxlaVXs+jz81zi0Q+NytcO94kVy+OGHdlL8J25QWRveyyoHmOncom34CQa3
	GZ4uualWY0uhcDpxGWccdvyCuXKuHviQYx0fssAg4bYt80t8VkrRyLtHnBQvp9a6KL6e
	nB070pt1fB4R/St4q+eaJOMkfAsAfiyDMEHzM=
MIME-Version: 1.0
Received: by 10.204.7.144 with SMTP id d16mr21250bkd.62.1316206265579; Fri, 16
	Sep 2011 13:51:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Fri, 16 Sep 2011 13:51:05 -0700 (PDT)
In-Reply-To: <4E73A769.9070903@windriver.com>
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
	<201109161849.52647.paul.eggleton@linux.intel.com>
	<CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
	<4E73A769.9070903@windriver.com>
Date: Fri, 16 Sep 2011 17:51:05 -0300
X-Google-Sender-Auth: O_a5954IQ2x_DvyCaFze3C0sYZU
Message-ID: <CAP9ODKrN1vVqT+OVB2KeHHtJV_3YjqZ=mQJkq5afJTvG8wcMcw@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2011 20:56:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 16:45, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/16/11 2:06 PM, Otavio Salvador wrote:
>> On Fri, Sep 16, 2011 at 14:49, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>> On Friday 16 September 2011 18:18:43 you wrote:
>>>> They all ended up in oe-core the problem is when they're not yet
>>>> merged but I want to merge them into my tree for use, test or
>>>> anything.
>>>
>>> Ah, so what you mean is not that the patches were in poky, but that the=
re
>>> sometimes were pull requests pointing to a branch that was on top of po=
ky. The
>>> thing is, the patches are exactly the same.
>>
>> Yes but not pullable directly into oe-core tree.
>
> I mix and match for all of my development. =A0What I do is use the git re=
mote and
> include multiple remotes.. poky, github, etc..
>
> When I find patches I want I cherry-pick them into my tree.
>
> Your mileage may vary, works for me at least..

Yes, works but seems easier to track one only and have it
automatically merge into the Yocto one.

This is specifically the idea behind the combo-layer creation and
would make life much easier to all people working at oe-core.

>>>> The combo-layer was one example. It was made available on poky contrib
>>>> tree and I had to manually export the patches instead of pulling it
>>>> into a branch for testing.
>>>
>>> Git makes this almost trivially easy though, and in the combo-layer exa=
mple it
>>> was only a few patches.
>>>
>>> Personally, I always post my OE-core pull requests on top of an OE-core
>>> branch; doing that means *I* have to manually bring the patches across =
as files
>>> and use git-am to apply them onto a branch of OE-core though. I think t=
hose of
>>> us working on Poky know this is the accepted practice and try to do it =
all of
>>> the time, occasionally someone might forget or feel that for an RFC pat=
ch it's
>>> not worth the effort; but I think that's the exception rather than the =
rule.
>>
>> Yes I know but wouldn't be better if you could base your work on
>> oe-core and avoid doing this?
>
> For submitting to oe-core for pull requests, basing work off of oe-core i=
s "best
> practice". =A0However, forcing people who are working on a specific distr=
ibution
> to do this isn't reasonable. =A0It can be requested of them, but IMHO tha=
ts as far
> as it will go.

For sporadic work I fully agree but for people working daily and that
sends pull-request very ofthenly seems sensible that the suggested
workflow to be done this way.

> I'm not going to stop anyone from developing in the way that suits them b=
est,
> all I can request is the interchange to me be at least reasonable. =A0(gi=
t and
> cherry-pick is "reasonable" to me at least.)

Sure; i am not saying to us to block anything but at least suggest the
best workflow.

> Note, I do about 70% development in oe-core and 30% in Poky. =A0Depends w=
here the
> bugs are found and what it takes to reproduce them. =A0I always cherry-pi=
ck/rebase
> as appropriate to send pull requests to the appropriate place, but my
> work-in-progress tree is whatever works for me at the time. =A0I suspect =
others
> are like that as well.

If oe-core is kept in sync, use oe-core just makes things easier from
my point of view.

As I said the idea is not force something but advice to make it easier
to everyone.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


