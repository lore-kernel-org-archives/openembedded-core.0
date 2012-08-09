Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SzMOj-0005IA-43
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 08:39:09 +0200
Received: by obc16 with SMTP id 16so199259obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=z4lNb4gFhq4bSBrxEeUKQ+ERZrbQE1jRUGNdi0KzON4=;
	b=cMdc3yAWoQ7/NATS4riasBxTIzj/DcEjJ3ngYtey13dvfKEyn3mSeKRQfDJOh30Wi9
	TGX0eDI1dI6uRJcrgangOsEEjD6EbFTKN2KLk+fHCRaJwY+md3wXRTmgsryek4ylmpit
	VnukPWuxnImGgMt2rsFEH1PiCll1iCIZ/ewugwmrApMVE2Wra4PctjfAAkj0XginHCjp
	2mh25TBq4/U3gZJjVqgommRk9+IZ3ndVf+qxpMXfjAlvicit1YB/3Aq8qaiAMOM1/eA0
	GOReqMZTySh8vgR11Pj2dK0AOTJkktQkZd7wmjB5FA7mNawVhDxxWMQCqKzDTEuK8KqK
	LXyQ==
MIME-Version: 1.0
Received: by 10.50.242.103 with SMTP id wp7mr5910igc.24.1344493640257; Wed, 08
	Aug 2012 23:27:20 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Wed, 8 Aug 2012 23:27:20 -0700 (PDT)
In-Reply-To: <20120808213143.GC2854@jama.jama.net>
References: <CAGiJk9d7sCukgAiM=vdEJm3RKOP=6yqTW6HAGGiBb4oqBj0LqA@mail.gmail.com>
	<20120808213143.GC2854@jama.jama.net>
Date: Thu, 9 Aug 2012 08:27:20 +0200
Message-ID: <CAGiJk9cVC2aR9DUd1AjQL5Yvkci1Gvq7ydxW+a6Rh-T8cVg_Nw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt test cases (was: Re: Replacing Web in Sato with Midori)
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
X-List-Received-Date: Thu, 09 Aug 2012 06:39:09 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/8 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Aug 08, 2012 at 06:14:00PM +0200, Samuel Stirtzel wrote:
>> 2012/8/8 Paul Eggleton <paul.eggleton@linux.intel.com>:
>> > On Wednesday 08 August 2012 17:04:16 Samuel Stirtzel wrote:
>> >> > On Wednesday 08 August 2012 16:47:05 Koen Kooi wrote:
>> >> >> Op 8 aug. 2012, om 16:03 heeft Paul Eggleton
>> >> >> <paul.eggleton@linux.intel.com>>
>> >> > het volgende geschreven:
>> >>
>> >> > And? KDE is far more demanding upon Qt than most Qt-based applications. We
>> >> > had to make specific changes to our Qt recipes just to accommodate it.
>> >>
>> >> If you're talking about adding accessibility and session management to
>> >> configure -> these are set by default by Qt.
>> >> Don't know why they where unset in oe-core though.
>> >
>> > Not specifically, I was mainly referring to changes such as providing qt4-
>> > native; we did not need to do that before.
>>
>> While this is true, meta-kde is also the only layer using qt-mobility (AFAIK).
>> So you implicitly want to say that Koen is right because _there are no
>> other testcases_ for these recipes.
>
> monav now in meta-oe is also using qt-mobility

That is good news, since I don't use master I didn't know about it.
IMO plasma-active is way out of scope for a qt-mobility test case,
good that there is at least one other recipe using qt-mobility..



(Unrelated to your post)
How would an automatic Qt test look in oe-core?
Qt ships a lot examples with the sources, are they sufficient for testing?
They cannot cover everything, but it depends on to what extend we want to test.

For the qt4-native recipe IMO kdelibs4-native isn't a bad test.
Since only a few binaries out of the huge project will be built it
shouldn't be too special or "too big".



Off topic: Do we want to support Qt5 parallel with Qt4 when it is
released soon [1]?

[1] http://qt-project.org/wiki/Qt_5.0#d50ae403cb49a205bdf789f377f5cfe6


-- 
Regards
Samuel


