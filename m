Return-Path: <jc@vtkloud.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 798F06028B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 14:54:30 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so4275061vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 07:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=G2Pew9vde/laVMffsPhrisGXV5xnW9V2iOtNkZtb0VU=;
	b=eM/WnnbTML3YWFOPVT3JT6rnOt/pSezYS0skLoU+dl4PdJ/0DbNKCmzcNozn3Qn5S+
	U332t5rXeOW8ibBGQKXQmZ/F84Vy6V+MpOr0IrH/lNuLaZV8h3KdCOgYJDb27sBNYx1y
	nOzht6ieagjQdvThfN84hVWW1lgBbHcVz9ZCSsbnlY6jnTeiYe0unP0zY1lYqBLnxuiJ
	fBOdsnGWpB+jHBRZ067cEbbDCSwo+Uf/o/7twBuSRzQwkWrGE1AV8rGbWYDr9rINyrnW
	zUrz+hiKB9fMqalO/S+Bw04VrskQU4mRIOFuyrbymguhvOyss61kE0STjkjq5V+/yl3J
	vm0g==
X-Gm-Message-State: ALoCoQmF42fm3SWugCinnx9Z/wKH96YZPYkorcbjRRa1Lgg5yuIYwF8vjkgLUhPGghWgQm7/G8OL
X-Received: by 10.220.3.78 with SMTP id 14mr598166vcm.44.1379429672414;
	Tue, 17 Sep 2013 07:54:32 -0700 (PDT)
Received: from [128.31.34.121] (31-34-121.wireless.csail.mit.edu.
	[128.31.34.121])
	by mx.google.com with ESMTPSA id yi8sm21601756veb.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 07:54:31 -0700 (PDT)
Message-ID: <52386CA6.8070206@vtkloud.com>
Date: Tue, 17 Sep 2013 10:52:22 -0400
From: JC <jc@vtkloud.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
	<CANyK_8dVMs0gt59z7fL0Woa-zjKW2M6p+qczQBBjJXSibhsNQg@mail.gmail.com>
	<2046387.NLfZYpzpll@helios>
In-Reply-To: <2046387.NLfZYpzpll@helios>
Cc: JC Verdie <jc.verdie@innotis.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Integration of former (deprecated?) libao recipe from https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb
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
X-List-Received-Date: Tue, 17 Sep 2013 14:54:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2013 09:18, Paul Eggleton wrote:
>
> Right. A few other things:
>
> 1) Since nothing in OE-Core needs this at the moment, this should really be
> added to meta-multimedia (within the meta-openembedded repository) and sent to
> the openembedded-devel mailing list marked with [meta-multimedia] in the
> subject.
>
> 2) Please use ${BP} in SRC_URI rather than ${P} so that multilib builds can
> work
>
> 3) It would be nice to have SUMMARY and HOMEPAGE set in the recipe (and
> possibly also DESCRIPTION if you have a longer description).
>
> Cheers,
> Paul
>

I sent a new one trying to comply with your reco. But I could not work 
on head anymore, since it's broken (at least for me). I'm afraid the 
patch appears to belong to "dylan" but I'm not a git guru enough to 
check how to commit it at the right place (I mean, I could simply use my 
non working git clone of HEAD and commit it untested but I'm not sure 
that's the way to go).

I'm not sure how to add the [meta-multimedia] tag to the git send-mail, 
also. Sorry for being dumb :(


Jay


