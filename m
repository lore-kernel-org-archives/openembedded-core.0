Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 72C217BDB3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 16:08:05 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id w13so3706139oiw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 08:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=MS85EPz0mF2SGfFoFwBfMtvBEsWAdCA0j5SavalSNJc=;
	b=CAJVKYV+/nCh5hrq6L9q7cONeXCXbHJ369/npoQjdZxceARfsDZF/a1E3qUP5chATH
	dUVC7SXun8PBxFFOg3DecOF6S25js0OwBrqpRcY4q6S7rzbUaCy30GSxBgplLVFyswQH
	R+KEvQkSgQoUYKE6gu/8tszuypyzG+afchJrEetLQV6X23H58vchP6INH57CQo9cSXyR
	ow0leOlkTAPppYoHo0QhUkysdqt3ianCyb5kZx+kqAeJMoEospjJZUKFxnfXjPYU7YJh
	DUi0iW5MMa8JHGLh4ny9/dKRljiAnBSs2+iezZ+dISjCBXY7acpu5lSQ7izPQyFOZtTI
	uRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=MS85EPz0mF2SGfFoFwBfMtvBEsWAdCA0j5SavalSNJc=;
	b=ddhddLbcy7ceT8ohDZUS6QuqZ+jDQ0+PBnAn8eHRpulJry3TcT6jSXprbs3plSBSWm
	YTx68VvGR2vTl1Ram2+DeLZzfl1vD7BQDn7BtBDKYsUOyXPc7IDtQ2+BplDngjWl8wRU
	48Fl3TrVR244U0tzJmE/sgaHrkF1NN2dStTbS8WwhcNKWvIPR5A/JmFvrL5HDmyFDa2i
	CBkYRftKCQegpWmW6IYOB3nQskJbnvX8ao5TZ6jQ9raLqWZWpUydOZc2J1Y//uFBJvce
	6K/AFfxVekHErA/jsfU5YzKvtNfXPp/ou4xshBCPswqpsiKUZjCipEbbOGTjYJ8ddM+M
	AhOg==
X-Gm-Message-State: AJcUukdyb7cwCXwSJ4o67jVrZ7aisA8mpz7m+/kPKStHatW8DjwCxK2K
	hRwzNjTiaO3QbKgwATVbZdRG2mQDLd2Y2Gc4ttVDDMAW
X-Google-Smtp-Source: ALg8bN6WnSuMyGX5NTUBefzMC9Xf/nDSMSCFc3RqHZZ5CRgIn1Sox/u4pdGyvlLlzCG9z6P3cN2K90dbciDl+t2treI=
X-Received: by 2002:aca:51c6:: with SMTP id f189mr1425288oib.281.1546963686289;
	Tue, 08 Jan 2019 08:08:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546961583.git.alex.kanavin@gmail.com>
	<20190108160320.2332.42157@do>
In-Reply-To: <20190108160320.2332.42157@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Jan 2019 17:07:55 +0100
Message-ID: <CANNYZj-4ssPPsWOdC=jjFC+L8SXa4sO+REqnzqB6j_4OayVRLg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlaW1wbGVtZW50IHBlcmwgcmVjaXBlIHVzaW5nIHBlcmwtY3Jvc3MgYW5kIHVwZGF0ZSBwZXJsIHRvIDUuMjguMQ==?=
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
X-List-Received-Date: Tue, 08 Jan 2019 16:08:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 17:03, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 65c419b8c4)

This is probably because the patches contain too long lines that were
mangled by smtp. Take them directly from
poky-contrib:akanavin/perl-sanity.
(I had to tell git send-email to send them anyway).

> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file (meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch)

Fixed in the above branch:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity

Alex

