Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id B8CB56E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:29:11 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id y10so1692843pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 05:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Ja9UNTm8eSQxDraTOA4Fm8g4MKHIOE5kQUgjx6+/0Js=;
	b=mGy+VkkU+AwY2P0v3x02/aSXRbN00wd/Hlq08QANYdx+0ziBuINKautuasl8kW1oRT
	FLmFr2dI0f8ZrtkBcj1fA0OxSXNJW1kZLrbaAdvXCB2AigwyFqvDBnw5IHmw/uUZJqMa
	l0gS+Ty6xBxNi7FhYMosc9nDBQZlJXm2QD9pun+Cmr4rBGvdsmrZ28vpiiinbGRmjJdG
	/sRrWizM5RkkGWkGfKImbjXuhqrWGO+faQO9t1b8IKTSZ6iVKD82Hw08vzdhIQtuzj6z
	TOVcmukZAoQRzUvvfmrKjss5rtpaCfC8BeDlhUkBgTmO1kPH66Om5Xy+C1YFIC4gadPD
	MHTQ==
X-Gm-Message-State: ALoCoQlhC1sTLq17WPtC8Nvka46pGvwvZskxluej34ToaOe2LBJHHhxD04Wr2iSLTUHGqPnJeHjN
MIME-Version: 1.0
X-Received: by 10.66.138.40 with SMTP id qn8mr8039236pab.154.1391002152599;
	Wed, 29 Jan 2014 05:29:12 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 05:29:12 -0800 (PST)
In-Reply-To: <1391001183.24655.72.camel@ted>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999973.24655.64.camel@ted>
	<CAOMwXhNLza+hr=Df7dYfQh33wgWezHFtc5Grs9p1vUMiNkHx3w@mail.gmail.com>
	<1391001183.24655.72.camel@ted>
Date: Wed, 29 Jan 2014 13:29:12 +0000
X-Google-Sender-Auth: iSjGJVHgNkFE4_YbiQfspBvDYLs
Message-ID: <CAOMwXhNCLhO6tgrkn3APKMrFy6gdQig8ig2E8sXeNbjLcBGHPQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jan 2014 13:29:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 29, 2014 at 1:13 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-01-29 at 12:59 +0000, Laszlo Papp wrote:
>> On Wed, Jan 29, 2014 at 12:52 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>
>> > By having a default of /home/root/ we can catch software that has issues
>> > with relocation of that.
>>
>> I am not sure what you mean. Could you please elaborate?
>
> As you mention, "/root" is more standard. It therefore becomes hard to
> spot software that assumes this rather than using the directory we
> configure it to if the default is also /root.
>
> By having a slightly more unusual default choice, we quickly find the
> software that doesn't adapt to our variable.

You seem to be referring to testing rather than forcing a test case
for the software, and hence majority. There are two better
alternatives IMHO to address this:

a) QA team defines such a test case.

b) In addition to a), you would get reports from users who set it to
/home/root if there are issues. Although, I am certainly questioning
that if more than 10-20% was setting it to "/home/root" at all, or
even much less.

Daniel in the CC also wrote an issue on IRC that it could lead to a
non-loginable system if the /home does not get mounted which would
better not be mandatory without setting it explicitly IMHO.

>> > Having the writeable user data in one directory like this is useful
>> for several classes of embedded style devices.
>>
>> Could you please provide any examples?
>
> One that springs to mind is the Sharp Zaurus series of PDAs have
> separate /home partitions in flash. You can reflash a new rootfs without
> overwriting the user config data.

I addressed this issue in my initial email, but I will reiterate this
concern with two solutions:

a) You can do package update rather than reflashing.

b) Even if a) does not work, as written in my initial email, you can
have a /root partition.

Still, the fact that you can only mention one use here, is somewhat
also self-explanatory that it is not the majority.

>> > So to be honest I don't see a pressing reason to change this.
>>
>> I do, because the earlier it is done, the fewer users that may have
>> incompatible changes. As the time goes ahead, more and more users will
>> stick to it as "default". I believe this means those who do not care
>> about proper Unix separation.
>
> Its been like this for years and seems to work perfectly fine for
> people.

I do not see it perfectly fine that if the majority of the people get
the extra work rather than the minority. I saw this several times now
in the history that it was done manually on the end-users side, and
since it is not just me, I thought I would bring this topic up.

I would rather prefer to ease the end users' work wherever it is possible.

> You can configure it just fine. As I said previously, I see no
> pressing reason to change it.

As written before, you could configure the other way around, too. The
question boils down to that: who should configure it on its own?

* The person who tries to follow the unix philosophy and the generic
behavior on most of the Unix systems out there?

* The person who follows some rare use case?

My opinion is the former.

