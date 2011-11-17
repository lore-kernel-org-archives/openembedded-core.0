Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RR7yX-00042y-T6
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 20:50:22 +0100
Received: by ggnh4 with SMTP id h4so1577041ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 11:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=v9ZW8zLTy7ke4DnKZn7iDhzJzvDDPwFfJb8DLmAVGB4=;
	b=AzL9VvkIOqQzGD1zy9S1o+gVaWkehxWwH4WUl9e+twkFhXArQ5cWMM0boqLdKY1BSD
	tISDsPV4UQtQGtcykqtbNwjQ93YO9M2h4ixipnO5MOhIz5LcRTMJfJkW/cxE/CaAtXby
	5v3GvfC9YzpVGSW4g4Vcv6Idr/3QsxCSlHCIU=
Received: by 10.50.203.70 with SMTP id ko6mr29531igc.19.1321559036164; Thu, 17
	Nov 2011 11:43:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.197.194 with HTTP; Thu, 17 Nov 2011 11:43:35 -0800 (PST)
In-Reply-To: <4EC562C6.8000905@windriver.com>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
	<20111117085730.GA4551@mail.familie-heinold.de>
	<1321521168.1264.43.camel@localhost.localdomain>
	<4EC562C6.8000905@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2011 12:43:35 -0700
X-Google-Sender-Auth: U1UHlrEgaGGQn3P4n9VeGGOny_8
Message-ID: <CABcZANmaGwMmKUkNoAg2C_nECa2AvXjfPYk_z-MA1Hj2YhW0Rg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 19:50:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2011 at 12:38 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 11/17/11 3:12 AM, Ni Qingliang wrote:
>>
>> I still think that the 'exclude" feature would be better.:)
>
> IMHO an exclude function would simply be an automated rm -f <list> at the
> end of the install process.
>
> It should be fairly easy to implement this if someone thinks it's a better
> idea then making individual recipes run a rm -f of their own.

I wonder if, in general, it'd be useful to implement glob exclusions.
In other words, our list of patterns could become more like a
.gitignore file:
/foo/*
!/foo/bar
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


