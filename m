Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id D1C5971DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:21:35 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w144so785270oiw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gK5dZD68c/DpAPeexvmYGEbfOe0EHRob8h65MuzlqLw=;
	b=d5ulpRY7TjHHQGZ25WTbEE0sGcxWw3fE/cobJAXezlRC/JDhL05ldvoL290wotDlgj
	gYxjIA2sraAjwkaz2l9w3fXswl52S0x1J/fXHSt5QGiRkL5WtpOmLbTippEUoPE2HK1g
	nKmt53jsTSePwBGa6pIuWzrCzkQedk0t+8/ggqhQ5Dh61h3c+RzeiWyvu4IXizDtZXpa
	9oD0mukBSFWBS2We7yNf9marM9PwE7qOfRDZdxRoFHzWP/x3jvFGZUeYI4ryThl0Kb09
	98sj+o95bY7CxqyXHJYc42dWNnuLmhTaFQzkP8QlY5Af7KjGB/2wEvaJmshywiehqbIe
	2cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gK5dZD68c/DpAPeexvmYGEbfOe0EHRob8h65MuzlqLw=;
	b=gKvsf1Uc7YzETOKEZ5KJGT3YuMcpLXcJtGQoGDDeDoZR0ElTbtLE8CFdtNNExmVDX6
	PdGlr6JW3APLkTxqZewoO1HPfviD27SbzYgdT97qU4Vhv9vvTeasscesSXJvdVY3BsEz
	xrU/SbHHG1nYMffG/nbVOvsvOT7KmmEndSP00c3pN1nJREu3qDKWtKMVg428/+haNKMd
	u/0MYqFgfYGCqKkt4YixDQnfxUgjx49C3nU2F2j6vuXKPgyiF2Bmc5S8pWzPnU3K4iwI
	1l9UUaxRRuEsL3DABbVgixYmcQOzR1P8Dn7XIOLg37J6QSh/RyvK6rFw1N/bqAqRJHXY
	83ww==
X-Gm-Message-State: AMke39lr+s42cDgCcw77ph5vnF9nzDXq0IUAiArmOa6auWc6Kypr27TMDmkSWpAcHIDSl8DSh25Qt3O2wshG8A==
X-Received: by 10.202.231.77 with SMTP id e74mr12342750oih.85.1487020895910;
	Mon, 13 Feb 2017 13:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.46.8 with HTTP; Mon, 13 Feb 2017 13:21:35 -0800 (PST)
In-Reply-To: <CAHiDW_GkT7n200+B2WnAb8QxvWi0bj_JZP0gnN-Ki1NkyJ9T1Q@mail.gmail.com>
References: <cover.1481043778.git.george.mccollister@gmail.com>
	<CAFSKS=NDQ_EDXishOScHEFt_Uf6s2vq8P7YooBM513CWbHFmTw@mail.gmail.com>
	<CAHiDW_GkT7n200+B2WnAb8QxvWi0bj_JZP0gnN-Ki1NkyJ9T1Q@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Mon, 13 Feb 2017 15:21:35 -0600
Message-ID: <CAFSKS=N5B5LADP8k1PLywEK5f2dixtJpV8bHGWcmgdybC-sZtQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 0/2] Resolve gdb-cross-canadian dependency on imp
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
X-List-Received-Date: Mon, 13 Feb 2017 21:21:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 2:46 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> On 8 February 2017 at 22:06, George McCollister
> <george.mccollister@gmail.com> wrote:
>>
>> Any chance we can get this applied to morty?
>
>
> You should add [morty] tag to subject and CC the maintainer
> (akuster808@gmail.com) to improve chances of this happening. I'm sure Armin
> would also appreciate explicit confirmation that the patches apply to morty
> branch.

[morty] was in the subject but I didn't CC the maintainer. Now I know
who the maintainer is.

>
> Before that some review though (sorry I missed this in Dec) ... it looks
> like the "Add imp to importlib" commit only modified manifest.inc: this is a
> generated file and your changes will be overwritten next time someone runs
> the generator. You should modify
> scripts/contrib/python/generate-manifest-3.5.py and run that to generate the
> new manifest.inc file.

Yes, I messed that up. Someone else fixed it in master here:
http://git.openembedded.org/openembedded-core/commit/scripts/contrib/python/generate-manifest-3.5.py?id=bfe1d948ab034017622110c8365be7026e139fbf

>
> It would be nice if we did not store noth the source and the generated files
> in git but that's how it's currently setup...

I'll resend my two patches with the patch that fixes
generate-manifest-3.5.py for morty.

>
> Jussi

