Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ST1jg-0005TJ-MG
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 04:07:08 +0200
Received: by obhx4 with SMTP id x4so4450743obh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 18:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Ays6S41GKblWEmTLilkte2XX0Z0f4pfZmT1hKyVPvMo=;
	b=NvguiPlTi8D2IRL38+ucPqrn/XUFBOYYzud2U3+H7AvtOF7+NnXh8dJfA0GEZendQU
	2S4VCxE8Z6YU9gY7G1nunOx4fyJ3o3JjdEN6YhNfNSB5BUvz6Ueo8TEQ7S1lLSeXgxUk
	dNF5fukOquLNIGRJWd9ts0/Bs46t39Y32YFCj8c2brCvAs1z9VfaK4Z2HYMbC8toylCp
	5zbfKnGApB28jH9o5cyKx9bk66SLoxYV4pisgErG3LHr5+zdWbxFDr/UeEtQXcTIbo52
	dd5WQ9uHl0cMhqPtnbYBZ/DuzaCQ0vMRA8AJjBC3OhpJ2yxOeLrcH+RWfswVLAmEE1j0
	PI6w==
MIME-Version: 1.0
Received: by 10.50.104.133 with SMTP id ge5mr84298igb.21.1336787831697; Fri,
	11 May 2012 18:57:11 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Fri, 11 May 2012 18:57:11 -0700 (PDT)
In-Reply-To: <CAF6bG8e18hOJBGUwwgyetuxwViXfMOS5tYOj06sSghaam+nV9A@mail.gmail.com>
References: <CAF6bG8dwwV-WymFvuZ9FXLb3wziR0mj9PfzP4qA31i79r_81wg@mail.gmail.com>
	<4FAD45F2.9030908@linux.intel.com>
	<CAF6bG8e18hOJBGUwwgyetuxwViXfMOS5tYOj06sSghaam+nV9A@mail.gmail.com>
Date: Sat, 12 May 2012 04:57:11 +0300
Message-ID: <CAF6bG8dX21Q44Zq05Wtih7T1jCGcEtEj5o9NrD5TPtorOk=DnA@mail.gmail.com>
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
X-List-Received-Date: Sat, 12 May 2012 02:07:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 May 2012 20:06, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 11 May 2012 20:01, Saul Wold <sgw@linux.intel.com> wrote:
>> On 05/04/2012 03:59 PM, Marko Lindqvist wrote:
>>>
>>> From: Marko Lindqvist<cazfi74@gmail.com>
>>> Date: Sat, 5 May 2012 00:02:06 +0300
>>> Subject: [PATCH] dpkg: update to upstream version 1.16.3
>>>
>>
>> Marko,
>>
>> Are you going to resend this and the apt patch in an uncorrupted format?
>>
>> Thanks
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
> =C2=A0Working on them.
> =C2=A0Either one is causes image build problems. I've now managed to fetc=
h
> old dpkg and apt versions from mirror, and image build with them (+
> patch not to consider advanced dependency marker as version number)
> success. So the problems I'm encountering with new dpkg+apt do not
> exist with old ones.

 Reverting dpkg update (but leaving apt update in place) works. I'll
resend apt patch soon.

 I'm not entirely sure if problems I'm seeing in image building are
caused by bugs in new dpkg, or bugs that dpkg update just uncovers in
packaged components.


 - ML


