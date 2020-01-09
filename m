Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7960C7FE63
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 11:26:49 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id w67so1870550vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1NbkPXdFygoGyKUsDT1kvZevbwAw4UoG8RYD7ivVAwk=;
	b=DgZdu+FeAWmeKPQbWoGCAeikTzxihkA4wdn333jta4jNyHUNl3Jxo1g9LIjuv7HPlq
	5NWalAX8cBM4yq2Y/XGmH3RDg7/U9jRSJmq6+nNfLLMS6tSy4gvx16cBRAZ4cz5DIyzb
	5+CtdheYsLp8y1VQb1WRmD3twvsGkVij/I3aSzG5dFwhXvz7MMWYf4hksOZKjnOzJkwp
	rUPbqTX7C+w2Rq5nkYnBQn51cfsMiKY+p4giqif5EzoxqKs8uHYt3nAuOZmi8+QPZNPK
	fjgjW5a0FrKM+iFOqqha86JdfwrSIqMaIDU3q91kBtGBMWXFrj1c8B5b0f2ibz9Z1Ve9
	cPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1NbkPXdFygoGyKUsDT1kvZevbwAw4UoG8RYD7ivVAwk=;
	b=OSzKun+/GmlxdcBvphPOx+A1hoO0uEhIXgIRJAhizjeHbyf5TWq48Zh0+czCw54NSl
	9CU10c2X1g5892MVqLvTekq/WQsZxhroCrJ3JrBow9w00I/emYKj110vJ6pVqUFICttI
	903JKvPLHCI7u6622YQTtifkcODYCNSN9lzGoH5UR6OOWcOQE6MVMfMTEV6cP9ahYRH6
	bup04BLKIaKck/Kt/eUf0g2PZHY3vbcPExLCdRC5LBFyNNrK5S3XkNHBlSOWCAGrND7U
	mCXzWoQaAkRCaPuE0bgRapyHLkOrCa8AxlLEkT9MTPDt3nt4VrO95uQLATULhF7YM/nM
	FzwQ==
X-Gm-Message-State: APjAAAX3jBT8bbpGubLRMsJj9yj3CwL3ikvIs1Ou2XFQYL528n+atecE
	zsvf4mnAj5eQvQq0LyTszS4W/NuXgDoSA1EnGoo/YhTuB5Q=
X-Google-Smtp-Source: APXvYqykR/CZ5VOX2bMcnyvGSasGAotiGoGvAbFNhW3FvRiqI/lFVvYGPdjUroTdDsaBO6iqcCPFu5GfVgMSsL7+ifo=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr6291951vkc.1.1578569210270; 
	Thu, 09 Jan 2020 03:26:50 -0800 (PST)
MIME-Version: 1.0
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
In-Reply-To: <f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 12:26:39 +0100
Message-ID: <CANNYZj9=RiMKS-wcHg=Dxmwb4Rn8E_j+jWV9Qb4hHP3mCuV_Cw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Rich Persaud <persaur@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 11:26:49 -0000
Content-Type: multipart/alternative; boundary="000000000000081945059bb34934"

--000000000000081945059bb34934
Content-Type: text/plain; charset="UTF-8"

I think you can do this with a little help from devtool:

devtool upgrade component
devtool finish component layer-path
git add/commit layer-path
bitbake component

This has the added benefit of keeping things deterministic and reproducible.

You can further automate these steps with help from AUH:
https://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/about/

Alex

On Thu, 9 Jan 2020 at 11:52, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-01-08 at 13:10 +0100, Pascal Huerst wrote:
> > I'm looking for a way in yocto to build tagged releases or actually
> > to build the newest tagged release from repositories.
> >
> > There is a way to specify a branch or a tag in a recipe, but no way
> > to always clone the newest tagged release, that I'm aware of. I
> > submitted a patch to bitbake's mailing list with a proposal [1], that
> > would use bitbake's `latest_versionstring()`, to always find, fetch
> > and build the latest tagged release. Unfortunately there wasn't much
> > of a reaction on that proposal, so I'm taking a step back, collecting
> > ideas on how this could be achieved properly.
> >
> > Please share your ideas...
>
> I did look at and think a bit about your patch. The trouble for me (as
> the bitbake maintainer) is that:
>
> a) it isn't clear/obvious from the variable name what it does (or even
>    from the code)
> b) it adds yet more options to the fetcher which increases the test
>    matrix and possible ways things can break
> c) the test doesn't actually test it does what its supposed to (no
>    check is made on which output is downloaded for a given revision)
>
> Some of these can be fixed, some are much harder and I can't decide if
> supporting this kind of edge case is going to be an overall good thing
> for the project or not. I don't want to give you false hope by fixing
> c) only to say "no".
>
> Add in Khem's valid concerns about reproducibility and it makes it a
> tough one even to give feedback on.
>
> If we have a ton of users saying "yes we really need this", that would
> help but I haven't seen that as yet...
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000081945059bb34934
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think you can do this with a little help from devto=
ol:</div><div><br></div><div>devtool upgrade component</div><div>devtool fi=
nish component layer-path</div><div>git add/commit layer-path</div><div>bit=
bake component</div><div><br></div><div>This has the added benefit of keepi=
ng things deterministic and reproducible.</div><div><br></div><div>You can =
further automate these steps with help from AUH:</div><div><a href=3D"https=
://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/about/">https://g=
it.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/about/</a></div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 9 Jan 2020 at 11:52, Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@lin=
uxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, 2020-01-08 at 13:10 +0100, Pascal Huerst wrote:<br>
&gt; I&#39;m looking for a way in yocto to build tagged releases or actuall=
y<br>
&gt; to build the newest tagged release from repositories.<br>
&gt; <br>
&gt; There is a way to specify a branch or a tag in a recipe, but no way<br=
>
&gt; to always clone the newest tagged release, that I&#39;m aware of. I<br=
>
&gt; submitted a patch to bitbake&#39;s mailing list with a proposal [1], t=
hat<br>
&gt; would use bitbake&#39;s `latest_versionstring()`, to always find, fetc=
h<br>
&gt; and build the latest tagged release. Unfortunately there wasn&#39;t mu=
ch<br>
&gt; of a reaction on that proposal, so I&#39;m taking a step back, collect=
ing<br>
&gt; ideas on how this could be achieved properly.<br>
&gt; <br>
&gt; Please share your ideas...<br>
<br>
I did look at and think a bit about your patch. The trouble for me (as<br>
the bitbake maintainer) is that:<br>
<br>
a) it isn&#39;t clear/obvious from the variable name what it does (or even =
<br>
=C2=A0 =C2=A0from the code)<br>
b) it adds yet more options to the fetcher which increases the test <br>
=C2=A0 =C2=A0matrix and possible ways things can break<br>
c) the test doesn&#39;t actually test it does what its supposed to (no <br>
=C2=A0 =C2=A0check is made on which output is downloaded for a given revisi=
on)<br>
<br>
Some of these can be fixed, some are much harder and I can&#39;t decide if<=
br>
supporting this kind of edge case is going to be an overall good thing<br>
for the project or not. I don&#39;t want to give you false hope by fixing<b=
r>
c) only to say &quot;no&quot;.<br>
<br>
Add in Khem&#39;s valid concerns about reproducibility and it makes it a<br=
>
tough one even to give feedback on.<br>
<br>
If we have a ton of users saying &quot;yes we really need this&quot;, that =
would<br>
help but I haven&#39;t seen that as yet...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000081945059bb34934--
