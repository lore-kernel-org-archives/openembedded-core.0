Received: from mail-qe0-f49.google.com ([209.85.128.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1URhwv-0002Nr-5w
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:51:58 +0200
Received: by mail-qe0-f49.google.com with SMTP id 6so2601158qeb.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=WGI5Ol/akMom8GFhyDe29JBJW/FP89N0wN+PSnKkkwM=;
	b=vxniz15628H6VXSflNDB3nJ2exHXGyNlMvNv7nQ/mk/vRA/b1ed3qM+JdVBqlybvGg
	LQnwEMzw86wCdQELFBxCozEh+yZ4MIKguZgYsT9L76QNew+0JT4vg4tmOanr/f1KQNfX
	fVVwbbjVMUYhGVdIcEjehfdqMsMU+wZw07rbUzmUgnmf4oYjoWIj43JVfhSAVngv3naL
	eV6TcOt0C6bVrjJhBVL3y3ZZlHKJmWo+sv8h47BiHBm/94o2TFRebdYK2mq+vbPxKh6q
	RutODPuSeg506cfHv5hnQ+0hUXK0c3IRu6CPhqN1ugJ4QVZf+RsRWg7JfpS6o3rIZMO+
	Jh1w==
MIME-Version: 1.0
X-Received: by 10.49.60.1 with SMTP id d1mr25486508qer.33.1366025664078; Mon,
	15 Apr 2013 04:34:24 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 15 Apr 2013 04:34:23 -0700 (PDT)
In-Reply-To: <1366025009.8670.25.camel@ted>
References: <CADV-EXFrm6O3x7mNEz4X87inG-jLd6Kb5UNDhszh4hLXGgOvXw@mail.gmail.com>
	<D36FF37C-5906-4F9E-AC08-57B159AEF560@dominion.thruhere.net>
	<CADV-EXHK9oo177UySi8kcpu4xrDx_Pw8q=S=0mXts3OyJrn28w@mail.gmail.com>
	<1366025009.8670.25.camel@ted>
Date: Mon, 15 Apr 2013 14:34:23 +0300
Message-ID: <CADV-EXF-_FHVhfXje=4z7ayCpEOYNCp74=3wVpxKR7UZufUH_A@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: Multiple *.bbappend files support
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
X-List-Received-Date: Mon, 15 Apr 2013 11:52:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/4/15 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Mon, 2013-04-15 at 13:37 +0300, Yevhen Kyriukha wrote:
>> Great, thanks!
>> Best regards,
>> Yevhen
>>
>>
>> 2013/4/15 Koen Kooi <koen@dominion.thruhere.net>:
>> >
>> > Op 15 apr. 2013, om 12:26 heeft Yevhen Kyriukha <kirgene@gmail.com> het volgende geschreven:
>> >
>> >> Is there a way to use multiple *.bbappend files in different layers?
>> >>
>> >> I'm using meta-raspberrypi and my own layer.
>> >> Both extend base-files with *.bbappend and both have PRINC = "1".
>> >> But only first of *.bbappend files applied (that is in meta-raspberrypi).
>> >> PR of base-files also increments by one (not by two).
>> >
>> > Yeah, try to make all bbappends use:
>> >
>> >         PRINC := "${@int(PRINC) + 1}"
>> >
>
> I'd just add that with the PR server now in use, the need to add this
> PRINC stuff should be removed...
>
> Cheers,
>
> Richard
>

And what does it mean? What do I need to write in bbappend instead of PRINC?

Best regards,
Yevhen


