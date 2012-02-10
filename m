Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Rvrqy-0003Kn-US
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 15:53:37 +0100
Received: by daln34 with SMTP id n34so2001912dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=50Ta+NNV4PoVRBpF9RAt31htlxLJDENbw+bThKr2riQ=;
	b=eSp58yQX13cSBFWdHtqUdDyzfkrqoO08Xj6u8PKmK4N08v+nPS9yqTuESskk1CZ0Ju
	cQvSrYWwemBQ/pfrNW7YCrrdBjkDqNPeXAxiFmB52/rIKh131bRCG2WwQ9Y3TesOA7kW
	hSNC+cWfH3RPPzRcc4ByRkw0LZr+rsYn8n15M=
MIME-Version: 1.0
Received: by 10.68.72.138 with SMTP id d10mr15955719pbv.15.1328885130038; Fri,
	10 Feb 2012 06:45:30 -0800 (PST)
Received: by 10.142.237.1 with HTTP; Fri, 10 Feb 2012 06:45:29 -0800 (PST)
In-Reply-To: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
Date: Fri, 10 Feb 2012 07:45:29 -0700
Message-ID: <CA+M6bXmHSqxSOFv37X7zZE7ctrRiej5Om8L5RRE4BV0Ui7gPUg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Fri, 10 Feb 2012 14:53:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 9, 2012 at 5:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> Just grepped for the occurances of disabled parallel make and I see
> around 40 cases on oe-core
>
> git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"
>
> If someone has time to kill then it would help to see if some of these
> are fixed by time or can be fixed
>
> it can help in paralleling the build a bit more.

Once we move to u-boot v2011.12 or later, that can die from the U-Boot recipes.

-- 
Tom


