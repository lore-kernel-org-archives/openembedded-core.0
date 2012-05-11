Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SStSV-0002nm-Um
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:16:52 +0200
Received: by yhjj56 with SMTP id j56so3020682yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=PQeUJT4wNp5oiAirxR8qsRzIuqWWlck5WSkOoW11Ga8=;
	b=q4RCy0XuFBTzFfHrhqBhrQmQlWXtbRHp+K6PDl7kOh/qAn6B5izJBpJUv99n/brIUJ
	fbSmydxgxSJNarUwRIGrXykVIye6iG/KIP8JOgSlbzWvMMTvvUcLk0U9AeoRTP/4e9hG
	0vcLkLhz+djlGNiom3zekVrNBBFL83Jm9gLkdqX7A3xRPnd5/c5ZIWRF+dvwRi5y7X4c
	3ILlBCxeznInN+2KQCJ6156paZI2F0japbZ9jznXxuflnB3rJ6TrQrKcW4mE92OT3HlI
	It4WJQcPeXcLXzgXqJyLbenHRcaGWruUVwlmJxMRIsmblsXxbBGsCP6PEsSwbY+cfkaz
	mrEw==
MIME-Version: 1.0
Received: by 10.50.104.133 with SMTP id ge5mr2106805igb.21.1336756015665; Fri,
	11 May 2012 10:06:55 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Fri, 11 May 2012 10:06:55 -0700 (PDT)
In-Reply-To: <4FAD45F2.9030908@linux.intel.com>
References: <CAF6bG8dwwV-WymFvuZ9FXLb3wziR0mj9PfzP4qA31i79r_81wg@mail.gmail.com>
	<4FAD45F2.9030908@linux.intel.com>
Date: Fri, 11 May 2012 20:06:55 +0300
Message-ID: <CAF6bG8e18hOJBGUwwgyetuxwViXfMOS5tYOj06sSghaam+nV9A@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: update to upstream version 1.16.3
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
X-List-Received-Date: Fri, 11 May 2012 17:16:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 May 2012 20:01, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/04/2012 03:59 PM, Marko Lindqvist wrote:
>>
>> From: Marko Lindqvist<cazfi74@gmail.com>
>> Date: Sat, 5 May 2012 00:02:06 +0300
>> Subject: [PATCH] dpkg: update to upstream version 1.16.3
>>
>
> Marko,
>
> Are you going to resend this and the apt patch in an uncorrupted format?
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!

 Working on them.
 Either one is causes image build problems. I've now managed to fetch
old dpkg and apt versions from mirror, and image build with them (+
patch not to consider advanced dependency marker as version number)
success. So the problems I'm encountering with new dpkg+apt do not
exist with old ones.


 - ML


