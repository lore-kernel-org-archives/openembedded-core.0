Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DF98971DE8;
	Mon,  1 May 2017 11:59:48 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id u65so86437122wmu.1;
	Mon, 01 May 2017 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nxuTkMqGDE5q9V/AmyJUUMzEs+8a9CL59KDI4xSidig=;
	b=Cvvkh1g6zS/mkLUUies7lzrBRfGrjvDiA3we2FpSoSEQn8X0qIb3RWPmyUhmV28cuu
	I9krAIDI0P+lhVM0res8g8M4mpbnl15D4b4GRvZIk/WLmwJ+D5OzWKprq6/4W/pOcL5h
	5nOEH+rK0gU5FjFeVSuhr5xVjX9m0EXEiMppYZmmoEBeucUZ1NChde7QeNo9jMWgqXOW
	/vX78iuAoA3hI40AADtNQKe3Y6fwG6/6GXoDw89Xi5sybwMI1q9Pk9DR6FH7YI0R7h2R
	hnOiw+Je4HM7qxxWgVAxpW+CHJpbrYZIxLUKCavNU2p52iLY389KaUOEGmUVue7FqWy+
	Y3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nxuTkMqGDE5q9V/AmyJUUMzEs+8a9CL59KDI4xSidig=;
	b=fAXXCPCdN5F6GJaTj30ZHFIriPGRci77j3mbGJWxBOkJ3iJIzFvd/c/fF4cvPGM8nD
	Vd3ReN+R9PuCRTLQz+EKKQIP9zF+1PTwG6yQjywYl+8xbI119EBjKhhIyhTNYgvD9tfu
	KeDGXA0mACWctIgrClWNAZn29nST51qBJ+WGedqKdBOeA1gsBl/zMovYxe5p7zUyqBXp
	u/UifC1GlE+ZPc8LuqS2NoMXOFjR65+WFA1Yhu4U742tw4xauZl9fnMIk0C+HW3qsh+0
	UqOtYnLTTvjjlWX+eBrYTFVn0kVJccrCbRxK+ilz3nuiwi3bg+2uBc3UKxWRpR7Sz38I
	gH+w==
X-Gm-Message-State: AN3rC/4KoHgtscVZLrgW0McAn/VRrpwzC2YQhVPfHHncYbm9RE7vJOQd
	nELU71sTrg7Nq671pS1IE8aelXg+uA==
X-Received: by 10.80.165.16 with SMTP id y16mr19142607edb.64.1493639989176;
	Mon, 01 May 2017 04:59:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Mon, 1 May 2017 04:59:48 -0700 (PDT)
In-Reply-To: <2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
	<1493638943.23535.36.camel@linuxfoundation.org>
	<2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 1 May 2017 13:59:48 +0200
Message-ID: <CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-members@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 11:59:49 -0000
Content-Type: multipart/alternative; boundary=f403045c0b36fa2f7e054e752820

--f403045c0b36fa2f7e054e752820
Content-Type: text/plain; charset=UTF-8

I had to change the password on the login, but then it worked for me.

I've added Andrea and Andrei to the list.

On Mon, May 1, 2017 at 1:46 PM, Philip Balister <philip@balister.org> wrote:

> On 05/01/2017 07:42 AM, Richard Purdie wrote:
> > On Mon, 2017-05-01 at 13:07 +0200, Nicolas Dechesne wrote:
> >> well, it's the same for me. In the 'view source' page, i can see
> >> this:
> >>
> >> ==
> >> You do not have permission to edit this page, for the following
> >> reason:
> >> The action you have requested is limited to users in the group:
> >> Administrators.
> >
> > Right, it is totally broken.
> >
> > Someone has messed up the group access permissions, likely related to
> > spam protection. Right now it appears only the admins can change
> > anything. I could try and fix it but I should probably understand who
> > did what and why to cause this first.
> >
> > Who has changed the group permissions recently?
>
> I'll check with Bill Traynor.
>
> Philip
>
> >
> > Cheers,
> >
> > Richard
> > _______________________________________________
> > Openembedded-architecture mailing list
> > Openembedded-architecture@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c0b36fa2f7e054e752820
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I had to change the password on the login, but then it wor=
ked for me.<div><br></div><div>I&#39;ve added Andrea and Andrei to the list=
.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On M=
on, May 1, 2017 at 1:46 PM, Philip Balister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 05/0=
1/2017 07:42 AM, Richard Purdie wrote:<br>
&gt; On Mon, 2017-05-01 at 13:07 +0200, Nicolas Dechesne wrote:<br>
&gt;&gt; well, it&#39;s the same for me. In the &#39;view source&#39; page,=
 i can see<br>
&gt;&gt; this:<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D<br>
&gt;&gt; You do not have permission to edit this page, for the following<br=
>
&gt;&gt; reason:<br>
&gt;&gt; The action you have requested is limited to users in the group:<br=
>
&gt;&gt; Administrators.<br>
&gt;<br>
&gt; Right, it is totally broken.<br>
&gt;<br>
&gt; Someone has messed up the group access permissions, likely related to<=
br>
&gt; spam protection. Right now it appears only the admins can change<br>
&gt; anything. I could try and fix it but I should probably understand who<=
br>
&gt; did what and why to cause this first.<br>
&gt;<br>
&gt; Who has changed the group permissions recently?<br>
<br>
</span>I&#39;ll check with Bill Traynor.<br>
<br>
Philip<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<span class=3D"im HOEnZb">&gt; ______________________________<wbr>_________=
________<br>
&gt; Openembedded-architecture mailing list<br>
&gt; <a href=3D"mailto:Openembedded-architecture@lists.openembedded.org">Op=
enembedded-architecture@<wbr>lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-architecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>architecture</a><br>
&gt;<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045c0b36fa2f7e054e752820--
