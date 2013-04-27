Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>)
	id 1UW89h-0001Hg-Hu; Sat, 27 Apr 2013 18:39:32 +0200
Received: by mail-oa0-f44.google.com with SMTP id h1so4914893oag.17
	for <multiple recipients>; Sat, 27 Apr 2013 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Q+hGlENPheo1hV+qLbAcTIojlMU2GD0xceNZ9ih2Mas=;
	b=krOnCaYcFjxjunC4qdC/uwWe7uoUEkM88rzBPFVEnAH7eqe0os7A20lTB0UyrtjgGz
	j+IMp8t5buOTvMdfSZm7k7Q5m+nIQDz+xuKAtsC4UrIgnoqII0NuSaZO3/i4qWd4ugxD
	lW7NuqaL2qmQjNX7tONQTinvemhC0YUgbiA6QrVeupqdzAFous1La18wMjCpPYZjTphD
	sNcFgxJtTY9tKY8Ay4Uus9e+YLnLC4A1xpyLtu9H96xp3NfiTDa1WiwhguNuPPD6/QIz
	yocYGXtNwjBCmR1ofdZcOVgICTe1c7A0C280Oa7AoRWIKoVX0cHUcwltRwQZJl2EAlnD
	ltdw==
MIME-Version: 1.0
X-Received: by 10.182.166.10 with SMTP id zc10mr20283151obb.80.1367079694245; 
	Sat, 27 Apr 2013 09:21:34 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.2.72 with HTTP; Sat, 27 Apr 2013 09:21:34 -0700 (PDT)
In-Reply-To: <20130427113554.GC3199@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
	<20130427113554.GC3199@jama>
Date: Sat, 27 Apr 2013 17:21:34 +0100
X-Google-Sender-Auth: 3XZZMth7nrKR6SSitHWINTaiJ5k
Message-ID: <CANyK_8dLQgOUeLRcD8neNGR_4Md+NjAJTt9_qkReFPLhb+hWuw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Sat, 27 Apr 2013 16:39:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 April 2013 12:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Apr 27, 2013 at 12:23:19PM +0100, Paul Eggleton wrote:
>> On Saturday 27 April 2013 12:54:00 Martin Jansa wrote:
>> > common (8):
>> >   I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to
>> > nonworking
>>
>> If we have this number of recipes failing, I think we need to do more than
>> just move them to nonworking. Could we perhaps try to have an organised effort
>> to fix up these broken recipes? I'll be happy to help out.
>
> I was hoping that people who care about them will step up and fix them
> to build at least in default configuration - that's why I started to
> send "state of bitbake world" emails.
>
> Stuff being broken for long time should at least be marked as known to
> be nonworking (that's why the git mv), so that new comers won't be
> wondering why it is failing for them.
>
> You can see that I've fixed a lot of recipes built by world since
> starting this jenkins and a lot more QA issues from world - all of
> them I never used, stuff which I was normally building for  SHR feeds
> was fixed a lot sooner...
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


