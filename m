Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwJeB-0007pu-3S
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:01:59 +0200
Received: by yia28 with SMTP id 28so1117814yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jR1lKUhMvHXltjKlTabXF6hyak8AjIg70ProWYrf0+E=;
	b=odv2ZCNnyEZ9Z/3lsVQKTBCcd7nHCGPj67s15UaZTtOp1HFKPe2OGk/qvy4MYqhsbr
	wyu8aooDoe7k7gjIXU01CInTNIyQ/Ucs5Xuhb4AWG9FCTu07ZE6i6Jj9cExg62QJuqfT
	tE4gvZpIFIyoHP5nsvKy0bA8r7yW2/Kw4h/qM=
Received: by 10.52.20.228 with SMTP id q4mr5158501vde.498.1314215832109; Wed,
	24 Aug 2011 12:57:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 12:56:52 -0700 (PDT)
In-Reply-To: <4E555700.1090907@gmail.com>
References: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
	<4E555700.1090907@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Aug 2011 12:56:52 -0700
X-Google-Sender-Auth: u2D9hqqtuLGI3dz0MMWM4YCU42s
Message-ID: <CABcZANkG-BZPqz-vBkq2oTcCFQYyn02=V-5Z5W7XNvbwMKJURg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [ANNOUNCE] Devshell Usage Change
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
X-List-Received-Date: Wed, 24 Aug 2011 20:01:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 8/24/2011 12:49 PM, Chris Larson wrote:
>>
>> Saul reminded me that I never sent a proper email to let people know abo=
ut
>> the
>> usability change to devshell, so only those who reviewed the commits
>> know about it.
>>
>> In the new implementation, a single OE_TERMINAL variable controls the
>> behavior.
>>
>> When using 'auto', or requesting an unsupported terminal, we attempt to
>> spawn
>> them in priority order until we get one that's available on this system
>> (and
>> in the case of the X terminals, has DISPLAY defined). =C2=A0The 'none' v=
alue is
>
> is it 'none' or 'noop' ?

Erm, yes, none is correct. Thanks.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


