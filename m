Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id B997D74536;
	Wed, 30 May 2018 13:19:12 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id a6-v6so16295906oia.2;
	Wed, 30 May 2018 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2pSij9fvXC7hYU3ySjYcwQfDzJHVpA3k43LcJx8pFpY=;
	b=nF+5Tq8Dnt4yPQRVrgvylLtIzrjDkqBrRahgjzFy8FPdz3EnjcqZAHchIS6DKWrtn7
	ldzhTUfuF/2jNU6Sa2SozBjvQXxR5twH/VsDjOVvhMDR3NpmKX0PrpKiUyIOlYscuJoF
	J4tne7SCSz+HfknIE+0G3uJMfWD51dMFrlSdBQYAbLfM0uT4SJ+Y6gUI2lY9fqjATa1W
	uUO6wUwjA218AST2kHKYx1yD3VBUFkJXNSUMa0ympmBD2/GGYvXwR/Tq5a5XIrFUpCXV
	+VGi6WgL2weGn+7JKe3bxtKOPcQlQjK9TpHldOmik/yXGS5UzX4a6Pe6ZcTkYFQbsIO8
	1J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2pSij9fvXC7hYU3ySjYcwQfDzJHVpA3k43LcJx8pFpY=;
	b=fGBACOkrjsY+yzTwQQOaDrDO0DxmB9laKeMq3V7q/Bkm7l/1vOH/Z/RbsxZMtKPJAw
	YhEtnQsve/5oN8qQ64zjQKuGfYgBWZ29PGMpFHlLLxFWs6rQgYNZCPsyDWFYSl2/1ZOg
	R/MKCnt6OmV0H14g15bkb8rjkhb/+WFFvwVChD84cGMle9IMfru2InYJO0UAUMkqNpal
	IMTeDaswP1wnPmtQ1W/VWJAiIRJKxGimED+HPXPnthUQPg7cIkJEjZltvlegciXAFlBA
	D5iOsnln1qTsBOahxz9dGHKAPDY9aqPO6ZT5BXHr95OrTUitTBmgc3H6dvR5lK9heEMT
	hYdA==
X-Gm-Message-State: APt69E1Bku/ts17OiGxNglPD9G1WXbJrMUXvLzC8ayDk93pnATh0jgV9
	3i1ssS874IS1BFDQKkvKokF2tCbV7GyPv5Kgrw==
X-Google-Smtp-Source: ADUXVKKqbokHtFysk0FeORmiUi21XABoPhIe1vd0pYrFhLOY9rcuv8DB3ZCWPjLqa2EdWqeGWM45YY4PwAwnlf3gAfI=
X-Received: by 2002:aca:3689:: with SMTP id
	d131-v6mr1619067oia.70.1527686353438; 
	Wed, 30 May 2018 06:19:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4d02:0:0:0:0:0 with HTTP; Wed, 30 May 2018 06:19:12
	-0700 (PDT)
In-Reply-To: <CA+chaQfsqr6opc79LGEswd48uodj2ergv_8Lfb1A8iGPXQgqTw@mail.gmail.com>
References: <20180530130016.18864-1-george.mccollister@gmail.com>
	<CA+chaQfsqr6opc79LGEswd48uodj2ergv_8Lfb1A8iGPXQgqTw@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 30 May 2018 08:19:12 -0500
Message-ID: <CAFSKS=NAcDnZFjEy7qFC-NXiTftT7Y0mWeqf7hyY5LQhhxxNcg@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2018 13:19:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This doesn't just rely on SRCREV (bitbake fetcher would be complaining if
> the SRCREV isn't found in the branch used in SRC_URI), it relies on this
> SRCREV to be in master branch (which is the default branch for git fetcher):

Okay, point taken.

>
> docker-shr @ ~/projects/protobuf $ git branch -a --contains
> b04e5cba356212e4e8c66c61bbe0c3a20537c5b9
> * master

Since it's in master the patch should work fine anyway. Should I
update the commit message and add branch=master or just leave it as
is?

>   remotes/origin/3.5.1.1
>   remotes/origin/3.5.x
>   remotes/origin/3.6.x
>   remotes/origin/HEAD -> origin/master
>   remotes/origin/cython_protobuf
>   remotes/origin/master
>   remotes/origin/php-generated-dev
>   remotes/origin/python-wheel
>   remotes/origin/python_deps
>
>
> On Wed, May 30, 2018 at 3:01 PM George McCollister
> <george.mccollister@gmail.com> wrote:
>>
>> The 3.4.x branch was removed upstream but the commit referenced in
>> SRCREV is the 3.4.1 release and is still available:
>> https://github.com/google/protobuf/releases/tag/v3.4.1
>>
>> Drop branch=3.4.x from SRC_URI and just rely on SRCREV.
>>
>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> index fae7c18a1..fe28f475a 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>>
>>  PV = "3.4.1+git${SRCPV}"
>>
>> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
>> +SRC_URI = "git://github.com/google/protobuf.git"
>>
>>  EXTRA_OECONF += " --with-protoc=echo"
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Regards,
George

