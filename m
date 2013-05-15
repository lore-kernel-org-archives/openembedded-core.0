Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Uched-0002rX-D7
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 21:47:30 +0200
Received: by mail-oa0-f51.google.com with SMTP id f4so2698881oah.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=rSCW+R8biG2Z4NslB3if+BBBuq6gfUDguGp5lCHndBM=;
	b=naIBFNn2vYfa2MXXGxJjg8BNUNLXW0WXInI/v01ewNAbGVOx2lzP9pVB7oPr+kpN+1
	DXjcs2TcWe+P1joByb2MAQnJeSmRzuH8XxweifynvCY9Wg+vSil4yTNJW9qI0rlHB54E
	HJTScYMmpiyuOtzhKgzrpBsWCyRd2yo5fieR8d23nkEUG/kGwhxM4+j+emRXWrj2RvI2
	iTP4aj9L+cnsWovEomywa/+kwmyFtgxp0JWPkbYCseD/RM+S/i0ylSmb3xNlmCXz/SAi
	LgVJFEd85i1IqSQbc/CQ1UrSNEB/s77Qoz4MYjetMKiPpoO8ojtDpT1Bc7kn+UW9mko2
	EKTw==
MIME-Version: 1.0
X-Received: by 10.60.35.100 with SMTP id g4mr8880217oej.53.1368646093683; Wed,
	15 May 2013 12:28:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 15 May 2013 12:28:13 -0700 (PDT)
In-Reply-To: <1671648.4UWfFTD1eS@helios>
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
	<1671648.4UWfFTD1eS@helios>
Date: Wed, 15 May 2013 16:28:13 -0300
X-Google-Sender-Auth: y4GH65gXUtx9sYRC8VWbzKnBK40
Message-ID: <CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 19:47:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 3:24 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 15 May 2013 14:36:16 Otavio Salvador wrote:
>> On Wed, May 15, 2013 at 2:30 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > I'd ask that we give trying to make this work from OE-Core a fair try.
>> >
>> > If in say 3 months from now OE-Core is causing clutter users pain we can
>> > look again at the problem. Equally, if nobody has sent me any clutter
>> > patches in the next three months, I wouldn't consider than a fair try.
>>
>> No, this is not fair. If you wish to keep it you need to do the work
>> or find someone to make it. Tomas is willing to work in meta-clutter
>> and he has the right to work in his solution.
>
> Nobody's suggesting Tomas can't work on meta-clutter. This is an open source
> project, people are pretty much free to contribute as they see fit. For my
> part, I will try to make sure the clutter recipes in OE-Core are better
> maintained in future.
>
> However, I do think it's important for us to try to work together for the
> benefit of everyone, and when it comes to OE-Core and other central pieces of
> the OE ecosystem, that means trying to understand the bigger picture outside
> of the day-to-day requirements that we all have on the projects we work on
> individually.

I agree but it seems it hadn't succeed in this specific case until
now. I personally think Clutter will benefit from getting a specific
place to look at and it does seem multiple people has been adding
Clutter recipes in their internal layers (Phil for example, Guacamayo
project and so on).

People did group in Guacamayo community and got it working in some
platforms, it might have been backported to OE-Core by Yocto team as
it is important for the test coverage but it didn't happen until now.
So far, meta-clutter seems to be the way to go for me.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


