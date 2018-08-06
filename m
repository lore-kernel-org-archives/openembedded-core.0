Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE1675421
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 11:51:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h15-v6so12077241wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=dTOqFAuI9mrbL4UgLAYhWgC9JCnLiH0vzEjHASnyTKw=;
	b=h8SVzWf4quPdF/m6Pl7EsYQS2XiIkiw/iNGEUN4nKbrSq0t0rv6lfxwoABg0guTNM0
	/1OLNYW0nJDf5+x4nijht9rKH7+LQPBMoXl/157K1TMeJoKlbvk6aDrFRU60OX9n02/c
	g+l+DFYB4N2IoQm/WlvPwmN87GAcF92f5KlIZJNaXoyZQEJko7ltrCaNB0/pDPTV0LjZ
	1Ro0TP246ItUC6LI40vI1AoOY9/N5INYui6VoK34ykiZBfEBy4p/lWjy43m6VyrE+/vv
	sBiIaNlirBe3yKri8oSQ6ZIcsaaDHfomtBC/0M8yKY6D4Nmim5IcZxMXt16Y3QQIzwKM
	J05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=dTOqFAuI9mrbL4UgLAYhWgC9JCnLiH0vzEjHASnyTKw=;
	b=Iz/vXgCMnOZrnIXzDA8iJvOho+RPsDcejH3ea3zFAQGCrFfgNXe1UnpLXH4mJbyiDq
	ItGj1jIUJ7Ij6nsP4JU0nlp6INuPl6mXkGkBJyxQ08oUC1iMgdaZbZ6m/Y5NrPbKbKD5
	eWjyuNOrJrwEMZPNh7kJid9vypniloikWkbunw+ho9auzv0aWnNDLakRdospaFOxDLrE
	gnlVftrwkvcZsnjZ0Y5892SlTWGilAYHQn177KnbrJt+oIpHNuEg1Sbg3dGskhS2ankH
	mFnaJQnLcz0S+5VXtG6q+y0FWrG1vEYk1emQc39D4DfYKsCgiQZHy5nJtQHwDm1ATOUm
	NWAw==
X-Gm-Message-State: AOUpUlFBed8buyS2OJGq3JGVL6fNZEQBNXOHT93cEZFnLC5ix8RlsAfI
	SG9wudZyzmB0gs/gQ1vfC2jq35ZOBNAM79CXGSde6ME=
X-Google-Smtp-Source: AAOMgpcJyGu3r0yyZXs3XEjh+z5kGTudpBpK9Tg34J6k9PgfLWL0CdVGEPJnMN86lM19Tb//n6xKUEmz3mXr25r7jV0=
X-Received: by 2002:a5d:5641:: with SMTP id
	j1-v6mr9797765wrw.209.1533556303022; 
	Mon, 06 Aug 2018 04:51:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e719:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 04:51:42 -0700 (PDT)
In-Reply-To: <20180806113257.13841.9729@do.openembedded.org>
References: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
	<20180806113257.13841.9729@do.openembedded.org>
From: Paulo Neves <ptsneves@gmail.com>
Date: Mon, 6 Aug 2018 13:51:42 +0200
Message-ID: <CAJO0J4iJube2+fJYJtLm7cvhonsL+h8PCttzAtvkbT09p87KjA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbbWV0YS1vZSx2Ml0gY29udGV4dC5weTogRG8gbm8uLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Mon, 06 Aug 2018 11:51:42 -0000
Content-Type: text/plain; charset="UTF-8"

Can anybody help me sort out this changeset?
As this was my second attempt at submitting my changes with errors on
not using the correct mailing list I checked the patchtest-oe and I
saw that I would need to split my series into 3 mailing lists
[oe-core, doc, poky]. The splitting would need the commit to be broken
and it would also lead to quite strange singular commit patches in the
different mailing lists. For example the context code[oe-core] which
invokes controllers in meta-yocto-bsp would not work. Are some of the
changes I made forbidden?

On Mon, Aug 6, 2018 at 1:32 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: "[meta-oe,v2] context.py: Do no..." and 3 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13399/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Patch            [meta-oe,v2,1/4] context.py: Do not mask exceptions needlessly.
>  Issue             Series sent to the wrong mailing list [test_target_mailing_list]
>   Suggested fix    Check the project's README (meta-oe,v2,1/4) and send the patch to the indicated list
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 1c4d9f46d5)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>

