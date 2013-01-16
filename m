Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvIcY-0002Fv-4s
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 03:20:58 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so866357lab.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 18:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=U4iq4nDPw/vh3bip91YmIJraqg5U7oaOYe+kPP4enP8=;
	b=Dd0OJUUBjQ/P/Ug8ZSKqbfo/AVGvXlxmHXae9+7YrJqahZ3z02NhaN/VzzMH8RfN0J
	16ndPy7HspqqhFX1Ljvcj8e/K7GyWRv8PjeDm3MXkZc9Xizo9RkeOCb/KpEJkZFviMuC
	OPAweTKpsiLDTks7HdV1ARpxQEETxveK/UeH1B2Sz1OJJvE5CcTEzStLv92+0/8o9Gr6
	TUDCDNjgV4+toESUK9Z6XQr4IXeg3hMe6Y6G+m5eFUNFkwIXOUEuUk6tTdSekE46Y1WI
	Pj0JLnLmKjMJZIF7fHpE5ciIODUyHJvxdSVCVb3BOmvhb9//vFfyP5VzeWkbr0+3x+RU
	loKw==
Received: by 10.112.99.2 with SMTP id em2mr28876170lbb.11.1358301921083; Tue,
	15 Jan 2013 18:05:21 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Tue, 15 Jan 2013 18:05:01 -0800 (PST)
In-Reply-To: <40692.10.7.202.59.1358299786.squirrel@linux.intel.com>
References: <40692.10.7.202.59.1358299786.squirrel@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 15 Jan 2013 19:05:01 -0700
X-Google-Sender-Auth: ivpaROWHDqzyfx-6R4bJbfhA1_k
Message-ID: <CABcZANn9xdKo5a1a3mAHiXtgfGcScTZRQxx96TZ5ipRbcCRB8g@mail.gmail.com>
To: kevin.strasser@linux.intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: archiver.bbclass: what is the purpose of create_diff_gz?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 02:21:03 -0000
Content-Type: multipart/alternative; boundary=f46d0401f9718102c904d35e4ff9

--f46d0401f9718102c904d35e4ff9
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 15, 2013 at 6:29 PM, <kevin.strasser@linux.intel.com> wrote:

> In it's current state, the source archiver creates a diff.gz file
> containing everything found in 'S'. I am wondering if this was really the
> intended behavior, as 'S' usually contains things like object and binary
> files. If anything, I would expect that this file should represent all
> changes made to the original sources.
>

I was wondering about that too. It doesn't seem particularly useful today.
I'd think after do_patch would be best (and change recipes to do their
general source modifications before then, or via pre/postfuncs).
-- 
Christopher Larson

--f46d0401f9718102c904d35e4ff9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jan 15, 2013 at 6:29 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
evin.strasser@linux.intel.com" target=3D"_blank">kevin.strasser@linux.intel=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1se">In it&#39;s current state, =
the source archiver creates a diff.gz file<br>
containing everything found in &#39;S&#39;. I am wondering if this was real=
ly the<br>
intended behavior, as &#39;S&#39; usually contains things like object and b=
inary<br>
files. If anything, I would expect that this file should represent all<br>
changes made to the original sources.</div></blockquote></div><br>I was won=
dering about that too. It doesn&#39;t seem particularly useful today. I&#39=
;d think after do_patch would be best (and change recipes to do their gener=
al source modifications before then, or via pre/postfuncs).<br>

-- <br>Christopher Larson</div></div>

--f46d0401f9718102c904d35e4ff9--
