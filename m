Return-Path: <halstead@happypunch.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4006E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:56:23 +0000 (UTC)
Received: by ykfs79 with SMTP id s79so265890952ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 13:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=happypunch.com; s=google;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1WOyF/qfQYvG2Te49WmIzpJUTnFQiN3KWhk5XE4vZaE=;
	b=KBq/LxVr8JH7qoE+OdDZ2ZxIiFc+lYpCBkXsgsNK2gk+APvFaIfCunFIC+ObAyxkhK
	Wm/CuuwOn9Bv+D191wiCfH3wRXBwzRDkgda/NyFg943JWZYz3mZUpj2haHTwFP9QOUZn
	GUwjTYMwlwpfv23d2dRqtXwmHMo/jp+B1Cxz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1WOyF/qfQYvG2Te49WmIzpJUTnFQiN3KWhk5XE4vZaE=;
	b=mfo3v5tzmeq/VKlKcn1uCxZM09xje7czzAtkn7xt4M/8i0TId01uUkRdMAIzTlLg4K
	5/aqd7bx9Ja6WQMPBYilf5aKNfCd74/Io9zkybjHqeOjrs9OV9oC1UMBPvVsCSdH6eyG
	E2RrIdvsXLAx41rBOEjrWsYH9aXOvpDbvcdyijwpKjZa1Wdu30Dzh1oixs6u0bVqpT0d
	dCRAGe4/qH+xVfDJvCyQd8W1J35hOATtMP9kxl/WC7zqnW1vzQq25/vP+g6DqsW0iO7Z
	hNWA1wfmhJAdDM3JP0A07w1FfiNJ6hB1Rvo7YK4LCyo3/HthpaZZFFw6OyQ7knoYmtPB
	iO+A==
X-Gm-Message-State: ALoCoQmd+b3kMX0ZJk/Iijk8j+SEOhhwt/8z7irINVtp0Qn8wdW2j4lY3cZP38a/vrKYVw35VMlT
MIME-Version: 1.0
X-Received: by 10.129.93.133 with SMTP id r127mr25705490ywb.109.1447710983051; 
	Mon, 16 Nov 2015 13:56:23 -0800 (PST)
Sender: halstead@happypunch.com
Received: by 10.37.231.214 with HTTP; Mon, 16 Nov 2015 13:56:22 -0800 (PST)
Received: by 10.37.231.214 with HTTP; Mon, 16 Nov 2015 13:56:22 -0800 (PST)
In-Reply-To: <20151116205235.GB2240@jama>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
	<447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
	<56465E1B.8040900@yoctoproject.org> <20151116205235.GB2240@jama>
Date: Mon, 16 Nov 2015 13:56:22 -0800
X-Google-Sender-Auth: u8lKb3cOrd8Rwf5bB9Nbg539XM8
Message-ID: <CA+f-kVLqbm=TpPiG5WyxmQuLbg1qgD8dSSdPsmPT-dcOwRG4Yg@mail.gmail.com>
From: Michael Halstead <michael@yoctoproject.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Mon, 16 Nov 2015 21:56:25 -0000
Content-Type: multipart/alternative; boundary=001a114d8bc6e2124b0524af7ac3

--001a114d8bc6e2124b0524af7ac3
Content-Type: text/plain; charset=UTF-8

I'll get that fixed asap. Probably about 2 hours.
On Nov 16, 2015 1:52 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Fri, Nov 13, 2015 at 02:03:07PM -0800, Michael Halstead wrote:
> >
> > On 11/13/2015 01:50 PM, Khem Raj wrote:
> > >> On Nov 13, 2015, at 1:45 PM, Michael Halstead <
> michael@yoctoproject.org> wrote:
> > >>
> > >> Bitbake is disabled with the note:
> > >>
> > >> # interferes with patchwork sice it sends emails after the patches are
> > >> closed
> > >> # we could re-enable it if the mails went to someother ml may be
> > >> bitbake-commits
> > >>
> > >> This happens because it was mailing
> bitbake-devel@lists.openembedded.org
> > >>
> > >> We can mail openembedded-commits@lists.openembedded.org which would
> work
> > >> fine. Or I can create a bitbake-commits@lists.openembedded.org.
> Which is
> > >> better?
> > > I think mailing to openembedded-commits@lists.openembedded.org might
> be ok. with [bitbake] in message subject for filtering help.
> >
> > I've altered the script to include [reponame] in the subject of all
> > e-mails and enabled for bitbake.
>
> Seems to be causing some new warnings when pushing to the repo:
>
> OE @ ~/meta-openembedded $ git push origin master
> Counting objects: 204, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (193/193), done.
> Writing objects: 100% (204/204), 38.00 KiB | 0 bytes/s, done.
> Total 204 (delta 147), reused 0 (delta 0)
> remote: Scalar found where operator expected at /home/git/git-notify line
> 140, near "$subject"
> remote:         (Missing semicolon on previous line?)
> remote: Global symbol "@openembedded" requires explicit package name at
> /home/git/git-notify line 60.
> remote: syntax error at /home/git/git-notify line 140, near "$subject "
> remote: Execution of /home/git/git-notify aborted due to compilation
> errors.
> remote: E: failed to find patch for rev
> 7df2b574f1c4ad445b1656666878cb2ceffca2e0.
> remote: E: failed to find patch for rev
> ea5bc66444a1e9b5fb330d8a6d42dc95e4bc9500.
> remote: E: failed to find patch for rev
> 1ec69e6b3891c01734e57a908a2a675128f126eb.
> remote: E: failed to find patch for rev
> a1d3dce036f80867d30993742d55abb17c6bc057.
> ...
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a114d8bc6e2124b0524af7ac3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I&#39;ll get that fixed asap. Probably about 2 hours.</p>
<div class=3D"gmail_quote">On Nov 16, 2015 1:52 PM, &quot;Martin Jansa&quot=
; &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, =
Nov 13, 2015 at 02:03:07PM -0800, Michael Halstead wrote:<br>
&gt;<br>
&gt; On 11/13/2015 01:50 PM, Khem Raj wrote:<br>
&gt; &gt;&gt; On Nov 13, 2015, at 1:45 PM, Michael Halstead &lt;<a href=3D"=
mailto:michael@yoctoproject.org">michael@yoctoproject.org</a>&gt; wrote:<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bitbake is disabled with the note:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; # interferes with patchwork sice it sends emails after the pa=
tches are<br>
&gt; &gt;&gt; closed<br>
&gt; &gt;&gt; # we could re-enable it if the mails went to someother ml may=
 be<br>
&gt; &gt;&gt; bitbake-commits<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This happens because it was mailing <a href=3D"mailto:bitbake=
-devel@lists.openembedded.org">bitbake-devel@lists.openembedded.org</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; We can mail <a href=3D"mailto:openembedded-commits@lists.open=
embedded.org">openembedded-commits@lists.openembedded.org</a> which would w=
ork<br>
&gt; &gt;&gt; fine. Or I can create a <a href=3D"mailto:bitbake-commits@lis=
ts.openembedded.org">bitbake-commits@lists.openembedded.org</a>. Which is<b=
r>
&gt; &gt;&gt; better?<br>
&gt; &gt; I think mailing to <a href=3D"mailto:openembedded-commits@lists.o=
penembedded.org">openembedded-commits@lists.openembedded.org</a> might be o=
k. with [bitbake] in message subject for filtering help.<br>
&gt;<br>
&gt; I&#39;ve altered the script to include [reponame] in the subject of al=
l<br>
&gt; e-mails and enabled for bitbake.<br>
<br>
Seems to be causing some new warnings when pushing to the repo:<br>
<br>
OE @ ~/meta-openembedded $ git push origin master<br>
Counting objects: 204, done.<br>
Delta compression using up to 8 threads.<br>
Compressing objects: 100% (193/193), done.<br>
Writing objects: 100% (204/204), 38.00 KiB | 0 bytes/s, done.<br>
Total 204 (delta 147), reused 0 (delta 0)<br>
remote: Scalar found where operator expected at /home/git/git-notify line 1=
40, near &quot;$subject&quot;<br>
remote:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Missing semicolon on previous lin=
e?)<br>
remote: Global symbol &quot;@openembedded&quot; requires explicit package n=
ame at /home/git/git-notify line 60.<br>
remote: syntax error at /home/git/git-notify line 140, near &quot;$subject =
&quot;<br>
remote: Execution of /home/git/git-notify aborted due to compilation errors=
.<br>
remote: E: failed to find patch for rev 7df2b574f1c4ad445b1656666878cb2ceff=
ca2e0.<br>
remote: E: failed to find patch for rev ea5bc66444a1e9b5fb330d8a6d42dc95e4b=
c9500.<br>
remote: E: failed to find patch for rev 1ec69e6b3891c01734e57a908a2a675128f=
126eb.<br>
remote: E: failed to find patch for rev a1d3dce036f80867d30993742d55abb17c6=
bc057.<br>
...<br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</blockquote></div>

--001a114d8bc6e2124b0524af7ac3--
