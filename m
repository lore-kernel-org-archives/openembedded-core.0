Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B8992719C8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 21:06:31 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 188so9559564wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 13:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T+J4/SDTEqIVy3v4PZnDQsNjA40ssEiQjod1tvMyi4E=;
	b=BzcOQTkH++3vCxyAIT6ujSH+cMZLW4I6JFVyMKxttXsVfEHGFnuCnL/H8qWrQLtwq/
	nnEhK7LqjcKI/iJFy+FQ1wUoxN2UlVXEmvspR7hNAqlvvFnyTSiqF5bVrFyEckgqce/r
	K3V2s5hY/m9QtCVt3V4SFuozP3of/RNGwymF9jyUDReRhyuomiWA7OSp8IBWYuYEBqiZ
	h8k2UoR6FS/Pr9sZkfmcg33A+hZjS3G6Z91SDruJHh7xiyhNdQw5iGA8o0oavY8hBh/f
	idoHv3fB9M4+DXRcwJ/p1bEMnECIe7wxQtZ4XhIVyBSxoVKJuBD5Fv2go5IVOiI4kYwP
	T66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T+J4/SDTEqIVy3v4PZnDQsNjA40ssEiQjod1tvMyi4E=;
	b=nGm/m5MeoKr9ASn7uOtvyLuXxUnNAz2M/MoPDLtiMbNutNdqrhjGN6WGHdScp9w9cs
	B2SKD7/H5cJQEjkfK8/MBNQrxjrcIt+M2bOeMHRAWPH1RjipyjZUAoH2DcQK2vQHE0FY
	gQWUX5BfbUwVoe80rc+CPz62CVb9XTMVQIkPDXu66b0siZKbcK8lAW4CpYqVycKkDpti
	gfTW7MbPm9816jER/Y1P1QFnlGljmDILGdyOGAIuETfQw7i4UaO7uZSyaBclfiAGreZy
	fWEjfqBEd5BdB3fxW0S8/4uW+xvVpoU7aqqEEBQM4Vnr9p6KEC3obwEh7dnRWIjeQb7G
	M9BA==
X-Gm-Message-State: AElRT7HhK814Nsip5RHhXSAolTe8HpPXpS0D92mJBDraZ3RALXT68F91
	N7IfB/jmeHqPRlfjd95TaYObBDfwMDMq5Z/qykk=
X-Google-Smtp-Source: AG47ELtzF1tSBz0FYaTgEquACZ/BHQrHXBHbA0+tidJnnMghsrC1CJ4my1NA2z5qnQgo9l1eIm93nx59b4cWXo2SS54=
X-Received: by 10.28.3.68 with SMTP id 65mr1874174wmd.17.1520715992554; Sat,
	10 Mar 2018 13:06:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sat, 10 Mar 2018 13:06:31 -0800 (PST)
In-Reply-To: <CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
	<1520706468.10851.164.camel@linuxfoundation.org>
	<CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Mar 2018 22:06:31 +0100
Message-ID: <CA+chaQeZH3vzsnX_4Z_YHheZ3V7ceUyz45-LX0tBAr9Jts5ajg@mail.gmail.com>
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
X-List-Received-Date: Sat, 10 Mar 2018 21:06:31 -0000
Content-Type: multipart/alternative; boundary="001a114527ec8a61000567154823"

--001a114527ec8a61000567154823
Content-Type: text/plain; charset="UTF-8"

If you and/or Juro want, I can do the rebase and send the cherry-picks for
all 3 release branches.

On Sat, Mar 10, 2018 at 10:04 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Feel free to ignore my feedback.
>
> I didn't mean it as strong objection to get this merged as-is.
>
> It was rather an advice for next time or in case another version is sent
> (e.g. with that missing patch from Khem) and Juro decides to rework it in
> order to save himself some time later when preparing the changes for pyro
> and rocko (as he said in the e-mail that he plans to prepare). It shouldn't
> be too difficult to rework anyway, because Andre already has the
> cherry-picks for morty and Juro can do just rebase of his change on top of
> that to get those new patches in separate commit.
>
> Regards,
>
> On Sat, Mar 10, 2018 at 7:27 PM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> On Sat, 2018-03-10 at 08:46 +0100, Martin Jansa wrote:
>> > On Fri, Mar 09, 2018 at 11:56:58PM +0000, Bystricky, Juro wrote:
>> > >
>> > > I forgot to mention that if there are no objections against this
>> > > patchset, I intend to do the same/equivalent upgrades for other
>> > > releases with gcc 6x (rocko, pyro, ...)  and also upgrade gcc5.x
>> > > and 4.9x where present.
>> > Thanks for this work.
>> >
>> > It might be a bit easier to do and review this by starting with rocko
>> > (with just small change on top with newly backported changes) and
>> > just
>> > cherry-picking the necessary changes down to pyro and then few more
>> > down
>> > to morty (similar to Andre's backports in his branch).
>> >
>> > With single big patch it's difficult to make sure that all the
>> > branches
>> > got all the changes and to review what's "new" compared to 6.4.0
>> > which
>> > used to be in master.
>>
>> I do agree with you that in an ideal world, this is how it should be
>> done.
>>
>> I also realise part of the problem here is a few different companies
>> have patched gcc 6.x in older releases and not submitted the changes
>> with upstream stable. I appreciate there could be a ton of different
>> reasons for that. It would be nice to try and share this work earlier
>> and more often to avoid having patchsets quite this large.
>>
>> It is tough to have someone step up and try and make changes to gcc in
>> OE-Core since the test matrix is quite large and fixing all the issues
>> that can come up is non-trivial.
>>
>> I'm therefore very grateful for Juro taking this on and I don't
>> particularly want to have him go back and redo the patches again,
>> particularly for feedback at v2.
>>
>> I've been doing my best to guide Juro, equally I'm trying to do a
>> number of things at the moment (M3 still isn't ready and the
>> autobuilder is a wreak) and I clearly haven't given Juro enough
>> guidance to get this 'right'. For that I do feel bad.
>>
>> So now I have a horrible choice. Do I push this back to Juro and have
>> him do this again as you comment. I know I'll have to provide mode
>> guidance, I'm travelling and its hard on everyone. Do I feel guilty for
>> my part in this and sort the splitting up myself to avoid impacting
>> Juro (with the impact on my time/sanity that entails)? Or do I take the
>> patch and risk upsetting some of our key contributors for ignoring
>> review?
>>
>> I'm spelling out the issues here because as a community/team, we need
>> to get better at guiding people through things like this. It does have
>> an impact on whether people step up in the first place and may be part
>> of the reason nobody wants to touch gcc in the first place...
>>
>> Cheers,
>>
>> Richard
>>
>>
>

--001a114527ec8a61000567154823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you and/or Juro want, I can do the rebase and send the =
cherry-picks for all 3 release branches.</div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sat, Mar 10, 2018 at 10:04 PM, Martin Jansa=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"=
_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Feel free to ignore my feedback.<div><br></d=
iv><div>I didn&#39;t mean it as strong objection to get this merged as-is.<=
/div><div><br></div><div>It was rather an advice for next time or in case a=
nother version is sent (e.g. with that missing patch from Khem) and Juro de=
cides to rework it in order to save himself some time later when preparing =
the changes for pyro and rocko (as he said in the e-mail that he plans to p=
repare). It shouldn&#39;t be too difficult to rework anyway, because Andre =
already has the cherry-picks for morty and Juro can do just rebase of his c=
hange on top of that to get those new patches in separate commit.</div><div=
><br></div><div>Regards,</div></div><div class=3D"HOEnZb"><div class=3D"h5"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Mar 10, =
2018 at 7:27 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@<wbr>linu=
xfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an>On Sat, 2018-03-10 at 08:46 +0100, Martin Jansa wrote:<br>
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
</div></div></blockquote></div><br></div>

--001a114527ec8a61000567154823--
