Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC8877FCA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 12:47:58 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id y184so480268vkc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 04:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PlyIsuS2qtS7URko8ydYzJfskHlQa5MFFp3SjHkysPY=;
	b=oe9EREl7nyOZPI6ymrm97fzkz5f05wR/Rf/5JJBqY8glP8Bz4xOiRbnbhgCjq8o0BT
	fsSHRFI0lXhFyH4UK5dxMKwwGsXLjlv2Egaa3F6f4iyetUBwFGUcaMD4iGmyXaUGMuTj
	EufDiOwh8Xd3DU1fYPbVuq8hkyzD9qNd8nKs/+Z0RaMucj2K91Go3W1CJP6cNpOF86xd
	BrGbh1egatk9U40KwracsU4GuK24DY2qoF22UvL44RVjuqFYH2LYzmikx+MVCzlynBfV
	5zW1hBoOfPm1L1Hb+81UajOIVMLeSwM0uU3V+a0uUQ//4TWa5udYeu3rSIdadCaTPYQl
	X2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PlyIsuS2qtS7URko8ydYzJfskHlQa5MFFp3SjHkysPY=;
	b=uLEYfUYvviwI1Zpce8OfdBeARrZjvgQs7A8zGxSJ7RdTfIYqU7sdq/TfBD/U3eyx02
	d6OzXFC8GLMpWhf+R97C23JJZuZz4YEuqTxKiJYhKH3aSFxEBOMko/yBe3cmwyvGNZwH
	1ZNjok9RQ3g1E+ovown6gf0tS5bOC5old6u1h8Q7WkrK/ffAJz+tE0LFkZ4snnVtweXE
	NrBVJqt0MuLvHeFGhLCrCp3hB5NjUoeFiQqNYX4u2HxpNZu6fIrQ4pialaKNpf0YArG0
	X6nqEJ/p0mFuE3sWjXVZAz5fU5ytxu2WJka2UArZEeLfVguiJ8M3TVm3R0omHr4StFaA
	lKtg==
X-Gm-Message-State: APjAAAXWDFhOBDgG3NRUZQ3A61e0jYMJvC9qNswCEZORSLc4wYfjHCVp
	MTRBPNPMYGDskzBMZfqVEVr29UXgYxH2rXsmU2OCBQ==
X-Google-Smtp-Source: APXvYqxetmG9YCUk2Omkq9HjhqLI7wwBmwaEgYlntwywPjrT8uiWk1+P358JbjKKpCIfRwlXT6TchIdyPwCHpauj4Eo=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr1694597vkq.49.1579870079609; 
	Fri, 24 Jan 2020 04:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-10-alex.kanavin@gmail.com>
	<20200120173722.GA15172@joraj-alpa>
In-Reply-To: <20200120173722.GA15172@joraj-alpa>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2020 13:47:48 +0100
Message-ID: <CANNYZj943ssJ9U99R_J9HmD_GVkNU6S-T5VLG=+RmHXp7Gbu+Q@mail.gmail.com>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: jeremie.galarneau@efficios.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/24] ptests: exclude lttng-tools
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
X-List-Received-Date: Fri, 24 Jan 2020 12:47:59 -0000
Content-Type: multipart/alternative; boundary="000000000000e2f073059ce22aa7"

--000000000000e2f073059ce22aa7
Content-Type: text/plain; charset="UTF-8"

I have traced the failing tests to missing supplementary shell scripts that
apparently are newly added, and weren't packaged to the target.

Also, /tmp indeed wasn't big enough.

With those issues addressed (patch is coming), I am still having two
failures:

#     Failed test
(../../../../../lttng-tools-2.11.0/tests/regression/tools/live/live_test.c:main()
at line 707)
# Got first packet index with offset 0 and len 4096
not ok 6 - Get metadata, received 0 bytes
FAIL: tools/live/test_ust_tracefile_count 6 - Get metadata, received 0 bytes

# Got first packet index with offset 0 and len 4096
not ok 6 - Get metadata, received 0 bytes
FAIL: tools/live/test_ust 6 - Get metadata, received 0 bytes

What's weird is that sometimes they pass. Could there be a race or some
timing issue in the test?

Alex

On Mon, 20 Jan 2020 at 18:37, Jonathan Rajotte-Julien <
jonathan.rajotte-julien@efficios.com> wrote:

> Could you point me toward reports for the failing tests?
>
> I just want to make sure they are not actual regression.
>
> A yocto specific patch was dropped that allowed ptest to pass when
> lttng-ust is not present. This can be a source of problems.
> OE commit:015aea5d93614676decd18578a8ae2d68417cfc5
>
> Also some tests required a minimum requirement for /tmp that could lead to
> problem for image/test setup with limited memory since AFAIK /tmp size is
> derived from the available memory (at least when using qemu test image).
>
> Cheers
>
> On Mon, Jan 20, 2020 at 06:24:56PM +0100, Alexander Kanavin wrote:
> > These tests are producing failures that appear and
> > disappear randomly. This requires investigation
> > by someone with expertise, so let's disable until then.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/ptest-packagelists.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> > index 49cb9046c6c..f42e90bd187 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -58,6 +58,7 @@ PTESTS_FAST = "\
> >  #    rt-tests-ptest \ # Needs to be checked whether it runs at all
> >  #    bash-ptest \ # Test outcomes are non-deterministic by design
> >  #    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one
> of the tests
> > +#    lttng-tools-ptest \ # Random failures that are difficult to
> reproduce
> >  #"
> >
> >  PTESTS_SLOW = "\
> > @@ -67,7 +68,6 @@ PTESTS_SLOW = "\
> >      glib-2.0-ptest \
> >      gstreamer1.0-ptest \
> >      libevent-ptest \
> > -    lttng-tools-ptest \
> >      openssh-ptest \
> >      openssl-ptest \
> >      perl-ptest \
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Jonathan Rajotte-Julien
> EfficiOS
>

--000000000000e2f073059ce22aa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have traced the failing tests to missing supplement=
ary shell scripts that apparently are newly added, and weren&#39;t packaged=
 to the target.</div><div><br></div><div>Also, /tmp indeed wasn&#39;t big e=
nough.<br></div><div><br></div><div>With those issues addressed (patch is c=
oming), I am still having two failures:</div><div><br></div><div># =C2=A0 =
=C2=A0 Failed test (../../../../../lttng-tools-2.11.0/tests/regression/tool=
s/live/live_test.c:main() at line 707)<br># Got first packet index with off=
set 0 and len 4096<br>not ok 6 - Get metadata, received 0 bytes<br>FAIL: to=
ols/live/test_ust_tracefile_count 6 - Get metadata, received 0 bytes<br></d=
iv><div><br></div><div># Got first packet index with offset 0 and len 4096<=
br>not ok 6 - Get metadata, received 0 bytes<br>FAIL: tools/live/test_ust 6=
 - Get metadata, received 0 bytes<br></div><div><br></div><div>What&#39;s w=
eird is that sometimes they pass. Could there be a race or some timing issu=
e in the test?<br></div><div><br></div><div>Alex<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Jan 2020 at =
18:37, Jonathan Rajotte-Julien &lt;<a href=3D"mailto:jonathan.rajotte-julie=
n@efficios.com" target=3D"_blank">jonathan.rajotte-julien@efficios.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Could=
 you point me toward reports for the failing tests?<br>
<br>
I just want to make sure they are not actual regression.<br>
<br>
A yocto specific patch was dropped that allowed ptest to pass when<br>
lttng-ust is not present. This can be a source of problems.<br>
OE commit:015aea5d93614676decd18578a8ae2d68417cfc5<br>
<br>
Also some tests required a minimum requirement for /tmp that could lead to<=
br>
problem for image/test setup with limited memory since AFAIK /tmp size is<b=
r>
derived from the available memory (at least when using qemu test image).<br=
>
<br>
Cheers<br>
<br>
On Mon, Jan 20, 2020 at 06:24:56PM +0100, Alexander Kanavin wrote:<br>
&gt; These tests are producing failures that appear and<br>
&gt; disappear randomly. This requires investigation<br>
&gt; by someone with expertise, so let&#39;s disable until then.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/ptest-packagelists.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc<br>
&gt; index 49cb9046c6c..f42e90bd187 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -58,6 +58,7 @@ PTESTS_FAST =3D &quot;\<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 rt-tests-ptest \ # Needs to be checked whether it=
 runs at all<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 bash-ptest \ # Test outcomes are non-deterministi=
c by design<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 mdadm-ptest \ # Multiple failures; mdmon crashes =
in at least one of the tests<br>
&gt; +#=C2=A0 =C2=A0 lttng-tools-ptest \ # Random failures that are difficu=
lt to reproduce<br>
&gt;=C2=A0 #&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PTESTS_SLOW =3D &quot;\<br>
&gt; @@ -67,7 +68,6 @@ PTESTS_SLOW =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 glib-2.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gstreamer1.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libevent-ptest \<br>
&gt; -=C2=A0 =C2=A0 lttng-tools-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 openssh-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 openssl-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-ptest \<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
-- <br>
Jonathan Rajotte-Julien<br>
EfficiOS<br>
</blockquote></div></div>

--000000000000e2f073059ce22aa7--
