Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 18ABA7F2F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 20:27:34 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id m8so64031223vsj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cQU+8gNExfDvdXbOYaa20aHByveE60P/vHUqgRpKTGI=;
	b=HoKUBMV1vBXYqvXb+gLwVUuwZgccAukTWFXLDeapDxCZOvPGYX3oFKhvQoxCq8qSBA
	plxM2pUkNCqkUFv34Z3beWAxKk2jQa2EcYYrrB5tsjh3+bqsp0EHTH5uA3TGSsm1VAfd
	7U/50ZdDanup/YJgoci0LxgACJyRGjdHaDkxOBspL9C4WMdWNbSA+0QidJuawBOXDWxf
	0z/bTsfRprwkwt4p+vwMh2cQpB6vzxqKNukC1rg7Bk7VT0G+kWKYHiy0MPGduO92Tdbe
	dUgCEddeSUX2FfuZtowA0g0gY0i1w5ws7C7G84/fnXB91865uasw7Rso/Twa3joo+AXc
	5h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cQU+8gNExfDvdXbOYaa20aHByveE60P/vHUqgRpKTGI=;
	b=ewP+HBVUpllMo92qAZKl5P2d88nEn546HGKVSj7R1qlqRD5uknvoBKofcJxkpUCrlG
	F5NSK6pURqqmSR3r2oMlNTrMCnFLTyzLYUH94FeD099J9GVhWMjOev5BLehXHymRxxLY
	qul0WD/yHY1RKixRO+aApbrVxqGQUkZ5fEo7erpvr/IJtV/fa/RKF+0LfM/UD4nbh7ek
	2rV+Kp+Bzqr2yzpwpYJPttU0hFJbW091V/ZnG2GftfG3FRVF0xW4KQ1m9tIys1c70Ksy
	KqCv93q/ImOXOuuzI+wjUAspo0iQAk4yq9MdzGiiGq9H1wOdmBmevoBfnE+bG045pjVl
	gdWA==
X-Gm-Message-State: APjAAAUVkDrhJ0Q8Gv9RpjXgn94JsyGiLUqg/fIy81cl7lDVDtK1jgz/
	QTaNXWytnInsZlEXI0njEB7z+qobpzNISYJZXJsAvw==
X-Google-Smtp-Source: APXvYqxMkgn9XZ7IAd3F2PIhYwj3AM/QB5iWG3UtgXJOs51sIkk9+x13ZHLd+8dNdr0NKPLRLt0+nn4buN5m6ZwyHoM=
X-Received: by 2002:a67:8042:: with SMTP id b63mr11652905vsd.23.1565296055948; 
	Thu, 08 Aug 2019 13:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<3413405.x9v3DxCAyA@localhost.localdomain>
	<BYAPR02MB6005C04842C60A8C3A4DDF26B9710@BYAPR02MB6005.namprd02.prod.outlook.com>
	<BYAPR02MB6005A1297BC34875CB9623C0B9D70@BYAPR02MB6005.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB6005A1297BC34875CB9623C0B9D70@BYAPR02MB6005.namprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Aug 2019 22:27:24 +0200
Message-ID: <CANNYZj9BTxaV4_2Tojp16ac5d+suXmaLXWEuCeAGzfFNMe0S2w@mail.gmail.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Bruce Ashfield <brucea@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] standard.py: Provide an additional option for devtool reset
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
X-List-Received-Date: Thu, 08 Aug 2019 20:27:35 -0000
Content-Type: multipart/alternative; boundary="0000000000006218d3058fa0e3c2"

--0000000000006218d3058fa0e3c2
Content-Type: text/plain; charset="UTF-8"

For what it's worth I am firmly in the camp that finds the non-deletion of
sources annoying. When I run 'devtool reset', there is never any unsaved
work left in there, but I am in too much of a hurry to do the extra 'rm' on
those sources, and so much later (sometimes months later) it has to be done
just prior to starting work on something else entirely (but with the same
upstream component).

Alex


On Thu, 8 Aug 2019 at 22:17, Manjukumar Harthikote Matha <
MANJUKUM@xilinx.com> wrote:

> Hi Paul,
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-core-bounces@lists.openembedded.org> On Behalf Of
> > Manjukumar Harthikote Matha
> > Sent: Monday, March 4, 2019 3:27 PM
> > To: Paul Eggleton <paul.eggleton@linux.intel.com>; openembedded-
> > core@lists.openembedded.org; Chandana Kalluri <ckalluri@xilinx.com>
> > Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an
> > additional option for devtool reset
> >
> > Hi Paul,
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > > Paul Eggleton
> > > Sent: Monday, March 04, 2019 12:17 PM
> > > To: openembedded-core@lists.openembedded.org; Chandana Kalluri
> > > <ckalluri@xilinx.com>
> > > Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide
> > > an additional option for devtool reset
> > >
> > > On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kalluri
> wrote:
> > > > The devtool reset command cleans the sysroot for a recipe in
> workspace.
> > > > It also removes the append file but leaves the source code as in
> > > > workspace. The source is not cleaned intentionally and the user has
> > > > to manually remove it before calling devtool modify again.
> > > >
> > > > Provide the user with an option to remove the source code from
> > > > workspace by adding a flag to the devtool reset command. The
> > > > --rm-source option for the devtool reset command will also clean the
> > > > source code from the workspace along with the sysroot and the append
> file.
> > > > Ex: devtool reset --rm-source zip or devtool reset -r zip
> > >
> > > When I wrote this I made a conscious decision not to delete the
> > > source, in case the user has unsaved work in the source tree; at least
> > > then the user has to take an explicit step (an additional rm -rf) in
> > > order to delete it. You might argue that adding an option is the same
> > > as that explicit step, but I am still hesitant as you might for
> > > example pick a previously used command from your command history with
> > > -r in it and only realise after you've run it that you've just blown
> away a bunch
> > of your work.
> > >
> > > However, I have received the feedback from a number of people that
> > > they find it annoying that they have to delete the source themselves
> > > before being able to run devtool on the recipe again. I'd like to hear
> > > from the wider community on the following two questions:
> > >
> > > 1) Does the convenience of having this kind of option outweigh the
> > > potential danger of deleting unsaved work?
> > >
> > > 2) Are there issues that anyone is experiencing that force you to run
> > > devtool clean/finish and then re-run devtool modify (or add, or
> > > upgrade), making this kind of situation come up more frequently? Or is
> > > it mostly that the source directories end up being left around to
> stumble over
> > some time later?
> >
> > We have seen source directories end up being left around (taking more
> disk
> > space on certain projects), hence a solution to remove it might be
> optimal. If the
> > preference is not have "-r" option to avoid command history mistake,
> then a full
> > command like devtool reset --rm-source is acceptable as well
> >
>
>
> Any update on this?  Is there a reason not to merge this feature?
>
> Thanks,
> Manju
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006218d3058fa0e3c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For what it&#39;s worth I am firmly in the camp that =
finds the non-deletion of sources annoying. When I run &#39;devtool reset&#=
39;, there is never any unsaved work left in there, but I am in too much of=
 a hurry to do the extra &#39;rm&#39; on those sources, and so much later (=
sometimes months later) it has to be done just prior to starting work on so=
mething else entirely (but with the same upstream component).</div><div><br=
></div><div>Alex<br></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 8 Aug 2019 at 22:17, Manjukumar Harth=
ikote Matha &lt;<a href=3D"mailto:MANJUKUM@xilinx.com">MANJUKUM@xilinx.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Paul,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a><=
br>
&gt; &lt;<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org=
" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a>&gt=
; On Behalf Of<br>
&gt; Manjukumar Harthikote Matha<br>
&gt; Sent: Monday, March 4, 2019 3:27 PM<br>
&gt; To: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com"=
 target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>; Chandana Kalluri &lt;<a href=3D"mailto:ckalluri=
@xilinx.com" target=3D"_blank">ckalluri@xilinx.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide a=
n<br>
&gt; additional option for devtool reset<br>
&gt; <br>
&gt; Hi Paul,<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembed=
ded.org" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org=
</a><br>
&gt; &gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openemb=
edded.org" target=3D"_blank">openembedded-core-bounces@lists.openembedded.o=
rg</a>] On Behalf Of<br>
&gt; &gt; Paul Eggleton<br>
&gt; &gt; Sent: Monday, March 04, 2019 12:17 PM<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a>; Chandana Kal=
luri<br>
&gt; &gt; &lt;<a href=3D"mailto:ckalluri@xilinx.com" target=3D"_blank">ckal=
luri@xilinx.com</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Prov=
ide<br>
&gt; &gt; an additional option for devtool reset<br>
&gt; &gt;<br>
&gt; &gt; On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kall=
uri wrote:<br>
&gt; &gt; &gt; The devtool reset command cleans the sysroot for a recipe in=
 workspace.<br>
&gt; &gt; &gt; It also removes the append file but leaves the source code a=
s in<br>
&gt; &gt; &gt; workspace. The source is not cleaned intentionally and the u=
ser has<br>
&gt; &gt; &gt; to manually remove it before calling devtool modify again.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Provide the user with an option to remove the source code fr=
om<br>
&gt; &gt; &gt; workspace by adding a flag to the devtool reset command. The=
<br>
&gt; &gt; &gt; --rm-source option for the devtool reset command will also c=
lean the<br>
&gt; &gt; &gt; source code from the workspace along with the sysroot and th=
e append file.<br>
&gt; &gt; &gt; Ex: devtool reset --rm-source zip or devtool reset -r zip<br=
>
&gt; &gt;<br>
&gt; &gt; When I wrote this I made a conscious decision not to delete the<b=
r>
&gt; &gt; source, in case the user has unsaved work in the source tree; at =
least<br>
&gt; &gt; then the user has to take an explicit step (an additional rm -rf)=
 in<br>
&gt; &gt; order to delete it. You might argue that adding an option is the =
same<br>
&gt; &gt; as that explicit step, but I am still hesitant as you might for<b=
r>
&gt; &gt; example pick a previously used command from your command history =
with<br>
&gt; &gt; -r in it and only realise after you&#39;ve run it that you&#39;ve=
 just blown away a bunch<br>
&gt; of your work.<br>
&gt; &gt;<br>
&gt; &gt; However, I have received the feedback from a number of people tha=
t<br>
&gt; &gt; they find it annoying that they have to delete the source themsel=
ves<br>
&gt; &gt; before being able to run devtool on the recipe again. I&#39;d lik=
e to hear<br>
&gt; &gt; from the wider community on the following two questions:<br>
&gt; &gt;<br>
&gt; &gt; 1) Does the convenience of having this kind of option outweigh th=
e<br>
&gt; &gt; potential danger of deleting unsaved work?<br>
&gt; &gt;<br>
&gt; &gt; 2) Are there issues that anyone is experiencing that force you to=
 run<br>
&gt; &gt; devtool clean/finish and then re-run devtool modify (or add, or<b=
r>
&gt; &gt; upgrade), making this kind of situation come up more frequently? =
Or is<br>
&gt; &gt; it mostly that the source directories end up being left around to=
 stumble over<br>
&gt; some time later?<br>
&gt; <br>
&gt; We have seen source directories end up being left around (taking more =
disk<br>
&gt; space on certain projects), hence a solution to remove it might be opt=
imal. If the<br>
&gt; preference is not have &quot;-r&quot; option to avoid command history =
mistake, then a full<br>
&gt; command like devtool reset --rm-source is acceptable as well<br>
&gt; <br>
<br>
<br>
Any update on this?=C2=A0 Is there a reason not to merge this feature?<br>
<br>
Thanks,<br>
Manju<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000006218d3058fa0e3c2--
