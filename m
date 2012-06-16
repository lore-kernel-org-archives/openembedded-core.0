Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Sfx64-0007Qt-3E
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 19:47:41 +0200
Received: by ggnp4 with SMTP id p4so2796411ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=si3Prs8+HSp98xM9vmomOMyuacpDxT9iF8izDUqENts=;
	b=XR3nk5isq2ARiu77PUptpDaCxkTzslHrzkONMJUA448xVsf8B4TQ5K8fHbrdvttw8i
	gyza8+VWKsgUupGoKbSXHue1xsEkhWUdeDL/BiPRC32Ghxn0w0lXylwunfh0QyxbMbL4
	KxlSVY1GIj8bumbQoVjplewF4JGWn8ikmYl5alPzVSvuGDaCUFJbkYTzeDAkyOLyRs5H
	gzbKWsUIF1bSEsWZY4VFbXPLY70EGtx0lxLhenD0q2wUVeO7ZIiOl47jyU0A167bLCZz
	rltRjy8MaA2if7lhHLk8YRf/SgXliIOb+1czksIazMvWiXeRIZGoNXiDuk7TH0c+1xHq
	Erfw==
MIME-Version: 1.0
Received: by 10.50.236.71 with SMTP id us7mr4857179igc.16.1339868219264; Sat,
	16 Jun 2012 10:36:59 -0700 (PDT)
Received: by 10.64.127.197 with HTTP; Sat, 16 Jun 2012 10:36:59 -0700 (PDT)
In-Reply-To: <4FDB9332.6010807@balister.org>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<4FDB57DB.5090407@gmail.com>
	<CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
	<CAK18fxGOAi40Tzduw99=fQMf_cn9sySqr=dvJzRncNCutjjyaw@mail.gmail.com>
	<4FDB9332.6010807@balister.org>
Date: Sat, 16 Jun 2012 20:36:59 +0300
Message-ID: <CAF6bG8dn4scUh_pWX84iEZH_6L4ZEzCX1VO=oa1+_G3AA-kakQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Sat, 16 Jun 2012 17:47:41 -0000
Content-Type: text/plain; charset=UTF-8

On 15 June 2012 22:55, Philip Balister <philip@balister.org> wrote:
> On 06/15/2012 02:55 PM, Andrei Gherzan wrote:
>> On Fri, Jun 15, 2012 at 9:08 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:
>>
>>> On Fri, Jun 15, 2012 at 12:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I think creating a networking layer is fine idea, alongside meta-oe,
>>>> as a separate layer in meta-openembedded repo. Reshuffling recipes
>>>> from meta-oe into different layers is fine. I would like to avoid copies.
>>>
>>> I'd prefer if it used another git repository; people needing to use it
>>> shouldn't be forced to clone whole meta-oe.
>>>
>>> This would be my proposal as well. To have this as a separate layer.
>
> meta-oe already hosts several layers. It is kind of nice not to have to
> clone a slowly increasing number of git repos. Rather clone a few and
> manage the layers within them.

 Need to clone many separate repos for building your own system
(bitbake, oe-core, oe-meta, oe-networking, your own sw) is a minor
annoyance in itself, but need to synchronize between them (what
revisions of the first repo are compatible with given revision of the
second) could lead to headaches for someone having additional
constraints of the production level system maintenance (i.e. when one
cannot simply take HEAD of everything).
 I do see both sides. Either some people need to clone bigger repo
than they absolutely need, or some other people are forced to clone
several repos. Depends on OE userbase which one would annoy more
people.


 - ML


