Return-Path: <george.mccollister@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDC2749F7;
	Wed, 30 May 2018 13:34:15 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id h6-v6so2057143otj.0;
	Wed, 30 May 2018 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lIER6ZUWdV37n1ECtMuuK+S10I4B5T2B+FHnJ/jHpAE=;
	b=rHjYUxMzJMN+RtegBDCQCnQTK4UN5ED1wsrOJ2s+SfHUDPgs3V7Dj2lL+KhxkUcHEs
	CNFGhaNOQKFli1ZOnN6NmjLx/s4DovTBk8/QXfB4SpBFOBqTBguMeM2zxB5qHZYXhcMY
	nwJyfEAwOabGA4qlkRmeKLiUoYrSqbejIa9ItaARjARYbMCsEJcuzrcPRxKT0hjuRXE5
	lhFVQbC/MskHBG6JxONMyYjdQhsvyZyU7cLC8gL5J3iFJD1SfaQpfzOd3IRtwEutv9XT
	5hFgI/IiUda0AHGONhZ7dsur0H28FDFKDIK19mtFHDh35aU2pnnQylc8sZOFg0FOIvZb
	0k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lIER6ZUWdV37n1ECtMuuK+S10I4B5T2B+FHnJ/jHpAE=;
	b=MmKoXo/3Q3bbcUkxbrRH8lw8n8hF4ZfLwAzs9XASTPZCgoUiBv2Wu0ZTI6+L8Ez6sQ
	FnDX5DivD9LMG964YLqaTh0ufIV0ga8JVF1JdchuGbib9rAbewBu9SKbI7lX7DOtifDo
	OaAbGuaB3OazqaUAhGnQmIcFC/JJFZGP016CxfMW0EUpPDvyNOnFjfEfAuMPKZA+zLLw
	QxoSJpUUEUNPr64QamQJ1getUJ6oxu25WDP52cTkKAgHUqhPm+gY+SKHgB6rsI7JbPhq
	6GLdPhWW8xljYp3B8HMsdlHDhlem7qyrqtGXXwuBZjwW9QN8Cs8WgbQjhPxejteHPH+j
	RlFQ==
X-Gm-Message-State: APt69E090hRy/2+IPDY4KmD5cJQIJGYJpVgYvEKU2o6PeWOfBEaNuCTO
	vFRkp5Z2t4URF+YAq+mNYV7D/HUBTMQrzMHmoQ==
X-Google-Smtp-Source: ADUXVKJX19lESX/MvMepNcwzSHOqMZsbNJ8RX2ercv7D9DxXTkXV/Ra76O9KfHtrvjlEPBWoqW5kNiYzCXJm83K1r9E=
X-Received: by 2002:a9d:de3:: with SMTP id 90-v6mr1839979ots.117.1527687256266;
	Wed, 30 May 2018 06:34:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4d02:0:0:0:0:0 with HTTP; Wed, 30 May 2018 06:34:15
	-0700 (PDT)
In-Reply-To: <CA+chaQdPWd7aikLRiQYBWuUfG-4n+RTPfbqzJZ5eim8OggNh0Q@mail.gmail.com>
References: <20180530130016.18864-1-george.mccollister@gmail.com>
	<CA+chaQfsqr6opc79LGEswd48uodj2ergv_8Lfb1A8iGPXQgqTw@mail.gmail.com>
	<CAFSKS=NAcDnZFjEy7qFC-NXiTftT7Y0mWeqf7hyY5LQhhxxNcg@mail.gmail.com>
	<CA+chaQdPWd7aikLRiQYBWuUfG-4n+RTPfbqzJZ5eim8OggNh0Q@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 30 May 2018 08:34:15 -0500
Message-ID: <CAFSKS=NNAVVXFxexdaSeDqSxRK8oqNcgyXwkur8yqkWSc5+q=g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][rocko][PATCH] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 13:34:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 8:27 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> The change itself is OK, but you should update the commit message so that
> other people won't get bad idea about how the fetcher works.

Sounds good, I agree.

>
> Also please don't send meta-oe patches to both lists, it should go just to
> openembedded-devel (to prevent both patchwork instances picking this
> change).

I specifically sent it to both lists because the original discussion
was on openembedded-core while I knew the correct place to send the
patch is openembedded-devel. Next time I won't send it to the wrong
list, I'll just send a separate reply to the thread stating I have
sent a patch to the correct list.

>
> On Wed, May 30, 2018 at 3:19 PM George McCollister
> <george.mccollister@gmail.com> wrote:
>>
>> On Wed, May 30, 2018 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > This doesn't just rely on SRCREV (bitbake fetcher would be complaining
>> > if
>> > the SRCREV isn't found in the branch used in SRC_URI), it relies on this
>> > SRCREV to be in master branch (which is the default branch for git
>> > fetcher):
>>
>> Okay, point taken.
>>
>> >
>> > docker-shr @ ~/projects/protobuf $ git branch -a --contains
>> > b04e5cba356212e4e8c66c61bbe0c3a20537c5b9
>> > * master
>>
>> Since it's in master the patch should work fine anyway. Should I
>> update the commit message and add branch=master or just leave it as
>> is?
>>
>> >   remotes/origin/3.5.1.1
>> >   remotes/origin/3.5.x
>> >   remotes/origin/3.6.x
>> >   remotes/origin/HEAD -> origin/master
>> >   remotes/origin/cython_protobuf
>> >   remotes/origin/master
>> >   remotes/origin/php-generated-dev
>> >   remotes/origin/python-wheel
>> >   remotes/origin/python_deps
>> >
>> >
>> > On Wed, May 30, 2018 at 3:01 PM George McCollister
>> > <george.mccollister@gmail.com> wrote:
>> >>
>> >> The 3.4.x branch was removed upstream but the commit referenced in
>> >> SRCREV is the 3.4.1 release and is still available:
>> >> https://github.com/google/protobuf/releases/tag/v3.4.1
>> >>
>> >> Drop branch=3.4.x from SRC_URI and just rely on SRCREV.
>> >>
>> >> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>> >> ---
>> >>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> >> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> >> index fae7c18a1..fe28f475a 100644
>> >> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> >> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>> >>
>> >>  PV = "3.4.1+git${SRCPV}"
>> >>
>> >> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
>> >> +SRC_URI = "git://github.com/google/protobuf.git"
>> >>
>> >>  EXTRA_OECONF += " --with-protoc=echo"
>> >>
>> >> --
>> >> 2.11.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> Regards,
>> George

