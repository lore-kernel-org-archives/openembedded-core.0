Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 045DF6028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:39:16 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so1890568obc.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xhmkncGfbGux41/vA1pf5HNV0es9Gb1+dcbzqsMLTo0=;
	b=k60fbHvIvmeVBd12Lb79dwIXjIINWATy5YgT+J9fzhvh/fJEOwyLN2GyKDrf2Lk9Kw
	IJeCXe9Q5N71F8KY8VEIzbpV3nmVMktXMiKZPwm0FigISgLRA1hvjxQtUCqYCM0Bx0cp
	lNkjWA8S+1ACNRF6CBHszLGDUEntdDk5OevTS480eEEAAxZujnWhiFqne9oy4QQYhdA7
	gtgyIaNfrcUJJYo6NuvFexF+1xFflnOXTLf8UF67RawZdf4gX6qI259coAZjlekpOZg0
	c3VLvuThRQ+UXmWopY4Q5bJG8/5U2J33BqW4nsNLW/b3P6npN/dzbOKw+dVhbM9CB8h0
	+94w==
MIME-Version: 1.0
X-Received: by 10.182.27.74 with SMTP id r10mr33064898obg.63.1374705557127;
	Wed, 24 Jul 2013 15:39:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Wed, 24 Jul 2013 15:39:17 -0700 (PDT)
In-Reply-To: <CABcZAN=Kn_V82JE3e=781cHBd6WwH9=96wZx=o=u_z6X89Vg=w@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<CAP9ODKouv4sp08h5dnm4M=4bfhewoqSSqgPiTiQm=VyN7=gZCQ@mail.gmail.com>
	<CABcZAN=Kn_V82JE3e=781cHBd6WwH9=96wZx=o=u_z6X89Vg=w@mail.gmail.com>
Date: Wed, 24 Jul 2013 19:39:17 -0300
X-Google-Sender-Auth: R8pkUbKhymnVNSfONWSAPMOe6Ow
Message-ID: <CAP9ODKpWhvqvG0=UXhyQ_jyhE0Rrc0Ug9zv4p0nQvi=1kYQ-dg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 24 Jul 2013 22:39:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 24, 2013 at 7:34 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> On Wed, Jul 24, 2013 at 2:51 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> On Wed, Jul 24, 2013 at 3:54 PM, Chris Larson <clarson@kergoth.com> wrote:
>> ...
>> > The standalone systemd-tmpfiles recipe I've created has a fairly small
>> > set
>> > of dependencies: intltool-native, dbus, libcap. Given this, I'd like to
>> > propose transitioning away from populate-volatiles to systemd-tmpfiles,
>> > even
>> > for non-systemd images. I think that the update-tmpfiles shell script
>> > may be
>> > of use in a transition, but before we even begin discussing a transition
>> > path, I'd like to request comments on the notion of moving to it at all.
>>
>> I think it shouldn't be hard to make an C app or script which could
>> parse systemd-tmpfiles and use this for non-systemd systems. What do
>> you think?
>
>
> I considered this too, but systemd-tmpfiles supports quite a lot more than
> volatiles, for example restoring selinux labels. Maybe that sounds fun to
> you, but it sounded like more trouble than it was worth to me, given
> systemd-tmpfiles can be used without systemd :) But yes, it's definitely
> another option to consider.


--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

