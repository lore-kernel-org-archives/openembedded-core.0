Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1Rib8H-00056i-KM; Thu, 05 Jan 2012 01:24:37 +0100
Received: by qabg14 with SMTP id g14so14555qab.6
	for <multiple recipients>; Wed, 04 Jan 2012 16:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=f+vCXR8JNFT82hnGvFHpcNlgIBvW5B3n6FqVMpKoDKs=;
	b=gTljYBwjgZ246lKBrx4iIpxW58EflJskRRJILFPOpJouZ6OZMW20ADdgzliojj/hEW
	zYr7XIGHKVs9clEeMsOWJiSEi0yUlVzDD6HH84UoAaK2Rfj5N1e++EyiqLK1J44vGwMS
	UpO7xv5r019Xn71rGCyhsYuQvr4vl0GmqC+is=
Received: by 10.224.34.202 with SMTP id m10mr70117943qad.62.1325722633208;
	Wed, 04 Jan 2012 16:17:13 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Wed, 4 Jan 2012 16:16:51 -0800 (PST)
In-Reply-To: <20120104220245.GE587@denix.org>
References: <20120104181400.GD587@denix.org>
	<CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
	<CAMKF1sqCETomiuAx=9zQf2kLYCO8SMxi5=UUwOQ3LGj4RRJXTg@mail.gmail.com>
	<20120104220245.GE587@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Jan 2012 17:16:51 -0700
X-Google-Sender-Auth: sMHFIGG7U-_K1uu2GAfhtN2KH6E
Message-ID: <CABcZAN=vt=z-wCTaYkEPJ_CjAmizE9_Qd-oXFUqR_+vVG5YdUQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] BlueZ old releases have new checksums
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
X-List-Received-Date: Thu, 05 Jan 2012 00:24:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 3:02 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Jan 04, 2012 at 12:53:25PM -0800, Khem Raj wrote:
>> On Wed, Jan 4, 2012 at 12:14 PM, Chris Larson <clarson@kergoth.com> wrote:
>> > On Wed, Jan 4, 2012 at 11:14 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> >> The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally
>> >> re-appeared after missing for long time since kernel.org compromise.
>> >> Unfortunately, all previous tarballs have new checksums, breaking builds for
>> >> anyone w/o previous copy cached. Old copies were also extensively mirrored,
>> >> so you never know which one you fetch next time...
>> >
>> > Heh, checksums changing after a security compromise, that's worrisome
>> > :) should diff their contents to see what's going on, or whether its
>> > just a gzip timestamp change or something.
>>
>> exactly. Make sure the tars are sane
>
> Well, according to BlueZ maintainer[1], he gave the correct tarballs to
> kernel.org people, but for some reason they untarred and re-packed them.
> There's only 4 bytes difference, presumably timestamp...

/me thinks maintainers should tar -cvO | gzip -n if they're going to use gzip ;)

But then, we see it from a rather different perspective than upstreams tend to..
-- 
Christopher Larson


