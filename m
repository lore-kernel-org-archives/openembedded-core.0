Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2037851A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 21:04:30 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id q83so9748825wme.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FIharKyuzIa7tnEH+R/26L4DTwSSvf+DhKD6r32DDGc=;
	b=H7YBKAW+8ZEDW5a5q7tn0fUwFnOMKNWio5QxTAeDpR88F32k+h8sdIRSSaYnh4pNHS
	JT+F3nHQ5P8lyhzIHUP622js9NSehEs1kJCE7ZzUKpbZgZu+TGNofQ4iW8+gJUt4T3mx
	GRWYZJIpafue3dy7l8Hv4KhWmW6WePq9y3n1EE+mF05WOJmt2Y3RrZ9QodJOwZGLy0wQ
	gNQvf8iarQ/0BP4M/tA4NtSWo//bhCTybXA6O2TUoa8jKSnvaT24zh1gxks9nspYckkw
	z5p3cRi4HQlYzqRTS2kzM3zG8YrvI8JNH4/WdE4hoMA/p+8n+UrmxryBPUwl2w7hPUvX
	0viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FIharKyuzIa7tnEH+R/26L4DTwSSvf+DhKD6r32DDGc=;
	b=XCxYfN86EeGtHGRZH6ok/SazFUVgQvvh7Jrv6xXULHVQlbGVi3/fJRzNPlxztfezQ/
	YCEymrlew299AFBwLYqazKrLKDqym3V71RBw2MsQSMQSDhBvpzK4n8qSBVF9d1PCpDDB
	9NVCplmYCRXJayhnWJ+ExuLxCmO2jEnbepirGu5Epq9T3BIO3Jld9gauv6bJTBo3Rsqb
	bT6rVsU7q4rMasGreXJj5zdERmyGVCfTJuxY5FxCa/6s6GtpwwXGgjPtLJ8HneaP+0g6
	IJYxaio372OIj838sTuKyCGPODTX5l/kqnMaherBXShwbj4IwRvjTHuJL4khLcN/xzPK
	YobQ==
X-Gm-Message-State: AElRT7EsTA6uO7Ce+Aaeo3U8C8Zf5NoSGgvj3zC51S2LQEdi4TrwSNmt
	VKo1BsZTOyX2UHuee3HGk6P3K9aq/4YOHMLYrBQ=
X-Google-Smtp-Source: AG47ELuIfTbYSpvp6hcslMCgKRjxCX4N5i880AUeYdsF4zJsG62n0LgMuh750tl3cZNDsjTJw/wcgtOFMPHHcrlQKl8=
X-Received: by 10.28.87.211 with SMTP id l202mr1731148wmb.32.1520715871181;
	Sat, 10 Mar 2018 13:04:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sat, 10 Mar 2018 13:04:30 -0800 (PST)
In-Reply-To: <1520706468.10851.164.camel@linuxfoundation.org>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
	<1520706468.10851.164.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Mar 2018 22:04:30 +0100
Message-ID: <CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 21:04:30 -0000
Content-Type: multipart/alternative; boundary="001a11442e384e623c05671541fc"

--001a11442e384e623c05671541fc
Content-Type: text/plain; charset="UTF-8"

Feel free to ignore my feedback.

I didn't mean it as strong objection to get this merged as-is.

It was rather an advice for next time or in case another version is sent
(e.g. with that missing patch from Khem) and Juro decides to rework it in
order to save himself some time later when preparing the changes for pyro
and rocko (as he said in the e-mail that he plans to prepare). It shouldn't
be too difficult to rework anyway, because Andre already has the
cherry-picks for morty and Juro can do just rebase of his change on top of
that to get those new patches in separate commit.

Regards,

On Sat, Mar 10, 2018 at 7:27 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2018-03-10 at 08:46 +0100, Martin Jansa wrote:
> > On Fri, Mar 09, 2018 at 11:56:58PM +0000, Bystricky, Juro wrote:
> > >
> > > I forgot to mention that if there are no objections against this
> > > patchset, I intend to do the same/equivalent upgrades for other
> > > releases with gcc 6x (rocko, pyro, ...)  and also upgrade gcc5.x
> > > and 4.9x where present.
> > Thanks for this work.
> >
> > It might be a bit easier to do and review this by starting with rocko
> > (with just small change on top with newly backported changes) and
> > just
> > cherry-picking the necessary changes down to pyro and then few more
> > down
> > to morty (similar to Andre's backports in his branch).
> >
> > With single big patch it's difficult to make sure that all the
> > branches
> > got all the changes and to review what's "new" compared to 6.4.0
> > which
> > used to be in master.
>
> I do agree with you that in an ideal world, this is how it should be
> done.
>
> I also realise part of the problem here is a few different companies
> have patched gcc 6.x in older releases and not submitted the changes
> with upstream stable. I appreciate there could be a ton of different
> reasons for that. It would be nice to try and share this work earlier
> and more often to avoid having patchsets quite this large.
>
> It is tough to have someone step up and try and make changes to gcc in
> OE-Core since the test matrix is quite large and fixing all the issues
> that can come up is non-trivial.
>
> I'm therefore very grateful for Juro taking this on and I don't
> particularly want to have him go back and redo the patches again,
> particularly for feedback at v2.
>
> I've been doing my best to guide Juro, equally I'm trying to do a
> number of things at the moment (M3 still isn't ready and the
> autobuilder is a wreak) and I clearly haven't given Juro enough
> guidance to get this 'right'. For that I do feel bad.
>
> So now I have a horrible choice. Do I push this back to Juro and have
> him do this again as you comment. I know I'll have to provide mode
> guidance, I'm travelling and its hard on everyone. Do I feel guilty for
> my part in this and sort the splitting up myself to avoid impacting
> Juro (with the impact on my time/sanity that entails)? Or do I take the
> patch and risk upsetting some of our key contributors for ignoring
> review?
>
> I'm spelling out the issues here because as a community/team, we need
> to get better at guiding people through things like this. It does have
> an impact on whether people step up in the first place and may be part
> of the reason nobody wants to touch gcc in the first place...
>
> Cheers,
>
> Richard
>
>

--001a11442e384e623c05671541fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Feel free to ignore my feedback.<div><br></div><div>I didn=
&#39;t mean it as strong objection to get this merged as-is.</div><div><br>=
</div><div>It was rather an advice for next time or in case another version=
 is sent (e.g. with that missing patch from Khem) and Juro decides to rewor=
k it in order to save himself some time later when preparing the changes fo=
r pyro and rocko (as he said in the e-mail that he plans to prepare). It sh=
ouldn&#39;t be too difficult to rework anyway, because Andre already has th=
e cherry-picks for morty and Juro can do just rebase of his change on top o=
f that to get those new patches in separate commit.</div><div><br></div><di=
v>Regards,</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Sat, Mar 10, 2018 at 7:27 PM, Richard Purdie <span dir=3D"ltr">&lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ric=
hard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Sat, 2018-03-10 at 08:46 +0100, Martin Ja=
nsa wrote:<br>
&gt; On Fri, Mar 09, 2018 at 11:56:58PM +0000, Bystricky, Juro wrote:<br>
&gt; &gt;<br>
&gt; &gt; I forgot to mention that if there are no objections against this<=
br>
&gt; &gt; patchset, I intend to do the same/equivalent upgrades for other<b=
r>
&gt; &gt; releases with gcc 6x (rocko, pyro, ...)=C2=A0=C2=A0and also upgra=
de gcc5.x<br>
&gt; &gt; and 4.9x where present.<br>
&gt; Thanks for this work.<br>
&gt;<br>
&gt; It might be a bit easier to do and review this by starting with rocko<=
br>
&gt; (with just small change on top with newly backported changes) and<br>
&gt; just<br>
&gt; cherry-picking the necessary changes down to pyro and then few more<br=
>
&gt; down<br>
&gt; to morty (similar to Andre&#39;s backports in his branch).<br>
&gt;<br>
&gt; With single big patch it&#39;s difficult to make sure that all the<br>
&gt; branches<br>
&gt; got all the changes and to review what&#39;s &quot;new&quot; compared =
to 6.4.0<br>
&gt; which<br>
&gt; used to be in master.<br>
<br>
</span>I do agree with you that in an ideal world, this is how it should be=
<br>
done.<br>
<br>
I also realise part of the problem here is a few different companies<br>
have patched gcc 6.x in older releases and not submitted the changes<br>
with upstream stable. I appreciate there could be a ton of different<br>
reasons for that. It would be nice to try and share this work earlier<br>
and more often to avoid having patchsets quite this large.<br>
<br>
It is tough to have someone step up and try and make changes to gcc in<br>
OE-Core since the test matrix is quite large and fixing all the issues<br>
that can come up is non-trivial.<br>
<br>
I&#39;m therefore very grateful for Juro taking this on and I don&#39;t<br>
particularly want to have him go back and redo the patches again,<br>
particularly for feedback at v2.<br>
<br>
I&#39;ve been doing my best to guide Juro, equally I&#39;m trying to do a<b=
r>
number of things at the moment (M3 still isn&#39;t ready and the<br>
autobuilder is a wreak) and I clearly haven&#39;t given Juro enough<br>
guidance to get this &#39;right&#39;. For that I do feel bad.<br>
<br>
So now I have a horrible choice. Do I push this back to Juro and have<br>
him do this again as you comment. I know I&#39;ll have to provide mode<br>
guidance, I&#39;m travelling and its hard on everyone. Do I feel guilty for=
<br>
my part in this and sort the splitting up myself to avoid impacting<br>
Juro (with the impact on my time/sanity that entails)? Or do I take the<br>
patch and risk upsetting some of our key contributors for ignoring<br>
review?<br>
<br>
I&#39;m spelling out the issues here because as a community/team, we need<b=
r>
to get better at guiding people through things like this. It does have<br>
an impact on whether people step up in the first place and may be part<br>
of the reason nobody wants to touch gcc in the first place...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div>

--001a11442e384e623c05671541fc--
