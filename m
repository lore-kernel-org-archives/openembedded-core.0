Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2367673CC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:12:20 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so25247774qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CJwEprjGKEeHK9qXLAqh0yAO4OeRNxlGByI2LvjyoLw=;
	b=POE4iPRw2iedPtRMFZHR6p0h+wjb5AO8kLf+2lozRwf+1d+kpTP0XbcdIOEVMXL1Zf
	ek2/ArFANsObbPOxopSdkDMraAxc3ynRMvCVUHvLZ4Cz8M15CC5+6fAE0ZAb6lydoC30
	/bbsLdhhafeiC1gLhHRv3YM39lcNvljjh5x/1tCQla/LyfAg0MAPTKhHMFTznTjMrLDw
	QVyOpBzz+nmIxfJvOvWIcuBaJvuLB0OIz/Fx60o2QM/JZlkVXZrljYOtymQibJHdMqph
	BPEmGK4cJ8POFmP/dRQMopW2hWVlhZeqfVoyiISG7Ml/Tdl9VfDNWJAoDaPYWG0zz2Ht
	IYEw==
X-Gm-Message-State: ALoCoQmC9j8XZXNziwiOpw9Vvzsv4yhfTEdSnIWIDtmuQrPHZE8L5o5bpZY6TUhjGUthDXD+niKA
X-Received: by 10.140.217.16 with SMTP id n16mr10481505qhb.82.1427832741760;
	Tue, 31 Mar 2015 13:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 13:12:01 -0700 (PDT)
In-Reply-To: <551AE604.6090804@windriver.com>
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org> <551AE604.6090804@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 21:12:01 +0100
Message-ID: <CAJTo0LY2H0-fUdBRuisL80V2wDDDYckMydSUmMyQ5MW9etic5w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 20:12:21 -0000
Content-Type: multipart/alternative; boundary=001a1139976c5f2af205129b37e6

--001a1139976c5f2af205129b37e6
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 19:23, Mark Hatle <mark.hatle@windriver.com> wrote:

> The easiest way to debug all of this is to edit
> meta/classes/package.bbclass,
> find the following lines:
>

Or change the files that are chowned to exist somewhere else that doesn't
get touched by fixup, like /testing/foo/bar.

Ross

--001a1139976c5f2af205129b37e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2015 at 19:23, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":33a" class=
=3D"a3s" style=3D"overflow:hidden">The easiest way to debug all of this is =
to edit meta/classes/package.bbclass,<br>
find the following lines:<br></div></blockquote></div><br>Or change the fil=
es that are chowned to exist somewhere else that doesn&#39;t get touched by=
 fixup, like /testing/foo/bar.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a1139976c5f2af205129b37e6--
