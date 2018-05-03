Return-Path: <srifenbark@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id D95B1748B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 12:42:33 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id 15-v6so5592143otn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MULBEYYO8f9TxQkhti+cTS3e3ZlhSMIe7SqzZbqXsfI=;
	b=nhbXNNE7pabZFarTpUBR1WQUHsz7+YmSbqEMMxKAfEGc+U5/QL0IY54sLwzm9AsR2/
	LvVI+idQk1n6UbAGUyg6J6zIZv8svaWwOTzxruhlPmXjTukZKaX2q2oivZX44Lkhl3rl
	hn1YQsmBAnFbCjZc/UQfCKJ1Q1Z1DMq4M6Eq0yHltpZEsD+ZVxDvnvlz/fQMP9ClJPW1
	0wfCuSkQ7zBEFIFVjCvnjwIN31HXyUr6fuG2KcXJmCLXw7fFUyMnvrkoL24P8FrHpcru
	DLlIS9/8/+jTfXIlFNk/Rueg4SKSJVFmEyfRkFwoYgYuQGmG7RB41xNs2NKbFvzEMmKp
	7c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MULBEYYO8f9TxQkhti+cTS3e3ZlhSMIe7SqzZbqXsfI=;
	b=YoEw5Z0BYHf4YfRyaPkJqTBZVQD+/g738VfpykNCOy1ZwKVG0KialruzP4K+2ZGKFr
	zenmKUiSB4JNNdguKqcE9JapIXsTExPcRBh2pzE8udmmvxr3vk7mQtjsBzswQP+ruoKR
	HLSlmXMwcfdUmNJRJ1C13srmq23+RjAXLmcse2Hx4UTh0bFS+x8GWrJLwBI73oB53F7n
	N3MkxYMXXcia3x/XWlqvwPaHx7bwxhMW72lVxFzCaO8acx6JJQupRhswgJhT9GdBq7CX
	QqEcOv4Rzou70+MuctwhS2TZFZTVDlao7STBlYTiZTHEEkbm4ipZlEICq++lINnObugz
	gspg==
X-Gm-Message-State: ALQs6tAaNCKVRskAzKveUs+MBTdXbiQhPA3gg3y+WzPiYZMQ8ZMcOQF9
	MY+4dKQGF2j9j0HPSkNrkXlMVypC/70fE2bBzL8=
X-Google-Smtp-Source: AB8JxZrOknFE0qOZ0HrPYx0kE66GARE07gXNag+le9vnkkzwGqnaIh4Ry0jvm64rgcnkxJT1G/Wh7jpmRZYCSWWe4pU=
X-Received: by 2002:a9d:fad:: with SMTP id
	d42-v6mr15628306otd.358.1525351354593; 
	Thu, 03 May 2018 05:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <1524154643.18865.113.camel@linuxfoundation.org>
	<39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
	<1525186011.25196.117.camel@linuxfoundation.org>
	<CAFNP8Ov2waP_aG81Y9_AJRNbm4FicjhkC7Yy-M5OU=SXLmJarg@mail.gmail.com>
	<5e09a0d81b0a48a1bebdc3e8ed542f52@XBOX02.axis.com>
In-Reply-To: <5e09a0d81b0a48a1bebdc3e8ed542f52@XBOX02.axis.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Thu, 03 May 2018 12:42:23 +0000
Message-ID: <CAFNP8Os4NUUoFWPxX=5KFKmNsmsUD_8Gd0E+UUmhhq-LStWxNQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: 2.6 planning proposals and meeting
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
X-List-Received-Date: Thu, 03 May 2018 12:42:34 -0000
Content-Type: multipart/alternative; boundary="000000000000a5f746056b4c89db"

--000000000000a5f746056b4c89db
Content-Type: text/plain; charset="UTF-8"

Peter,

Sorry I missed this.  My fault for not monitoring that mail list close
enough.  I will take a look at this and get back to you.

Regarding special processes for getting doc changes done.  Any form of
contact with me "should" work.  What you did should have been caught.  An
email directly to me will work.  A chat over #yocto over IRC will work.

Thanks,
Scott

On Thu, May 3, 2018, 1:29 AM Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

>
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *Scott
> Rifenbark
> *Sent:* den 1 maj 2018 16:56
> *To:* Richard Purdie <richard.purdie@linuxfoundation.org>
> *Cc:* openembedded-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] 2.6 planning proposals and meeting
>
>
>
> On Tue, May 1, 2018 at 7:46 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
> Hi,
>
> On Fri, 2018-04-20 at 08:02 -0400, Daniel F. Dickinson wrote:
> > I'm relatively new to OE; I've written a couple of pre-alpha layers
> > to try some idea, and worked on meta-openembedded, but I've not had a
> > chance to go in depth on the Yocto documentation, and at the some
> > there see to be things (based on the lists) that are out of date, or
> > new things that aren't even mentioned, which makes getting up speed
> > somewhat difficult.
>
> Writing down where you think there are issues would be a help so that
> we can see if there is some way we can improve that.
>
>
>
> Yes - please indicate any areas in the documentation you believe need
> updated, changed, or added.  I have been trying to bring things up-to-date
> in several manuals during the 2.5 process.  So, identifying areas in the
> 2.5 manual set would be very helpful.  To be sure you are viewing 2.5
> manuals use the following form for the URL:
>
>       yoctoproject.org/docs/2.5/<manual_folder>/<manual_folder>.html
>
>       where <manual_folder> is
>
>            brief-yoctoprojectqs
>
>            bsp-guide
>
>            overview-manual
>
>            dev-manual
>
>            sdk-manual
>
>            profile-manual
>
>            kernel-dev
>
>            ref-manual
>
>            toaster-manual
>
>            bitbake-user-guide
>
> Thanks
>
> Scott
>
> Is there any special process to get manual updates accepted? I am asking
> because I sent an update for the BUILDHISTORY_FEATURES variable to the
> Yocto mailing list (
> https://lists.yoctoproject.org/pipermail/yocto/2018-January/039787.html)
> at the end of January (last pinged a month ago) and it still has not made
> it into the manual AFAICT and it has not received any feedback.
>
> //Peter
>
>
>

--000000000000a5f746056b4c89db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Peter,<div dir=3D"auto"><br></div><div dir=3D"auto">Sorry=
 I missed this.=C2=A0 My fault for not monitoring that mail list close enou=
gh.=C2=A0 I will take a look at this and get back to you.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Regarding special processes for getting d=
oc changes done.=C2=A0 Any form of contact with me &quot;should&quot; work.=
=C2=A0 What you did should have been caught.=C2=A0 An email directly to me =
will work.=C2=A0 A chat over #yocto over IRC will work.=C2=A0=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">=
Scott</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Ma=
y 3, 2018, 1:29 AM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-4183545661330850359WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.=
org" target=3D"_blank" rel=3D"noreferrer">openembedded-core-bounces@lists.o=
penembedded.org</a> [mailto:<a href=3D"mailto:openembedded-core-bounces@lis=
ts.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core=
-bounces@lists.openembedded.org</a>]
<b>On Behalf Of </b>Scott Rifenbark<br>
<b>Sent:</b> den 1 maj 2018 16:56<br>
<b>To:</b> Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundatio=
n.org</a>&gt;<br>
<b>Cc:</b> openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core@li=
sts.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] 2.6 planning proposals and meeting<u></u><u><=
/u></span></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, May 1, 2018 at 7:46 AM,=
 Richard Purdie &lt;</span><a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank" rel=3D"noreferrer"><span lang=3D"EN-US">richard.pur=
die@linuxfoundation.org</span></a><span lang=3D"EN-US">&gt; wrote:<u></u><u=
></u></span></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">Hi,<br>
<br>
On Fri, 2018-04-20 at 08:02 -0400, Daniel F. Dickinson wrote:<br>
&gt; I&#39;m relatively new to OE; I&#39;ve written a couple of pre-alpha l=
ayers<br>
&gt; to try some idea, and worked on meta-openembedded, but I&#39;ve not ha=
d a<br>
&gt; chance to go in depth on the Yocto documentation, and at the some<br>
&gt; there see to be things (based on the lists) that are out of date, or<b=
r>
&gt; new things that aren&#39;t even mentioned, which makes getting up spee=
d<br>
&gt; somewhat difficult.<br>
<br>
Writing down where you think there are issues would be a help so that<br>
we can see if there is some way we can improve that.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Yes - please indicate=
 any areas in the documentation you believe need updated, changed, or added=
.=C2=A0 I have been trying to bring things up-to-date in several manuals du=
ring the 2.5 process.=C2=A0 So, identifying areas
 in the 2.5 manual set would be very helpful.=C2=A0 To be sure you are view=
ing 2.5 manuals use the following form for the URL:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">=C2=A0 =C2=A0 =C2=A0 =
<a href=3D"http://yoctoproject.org/docs/2.5/" target=3D"_blank" rel=3D"nore=
ferrer">
yoctoproject.org/docs/2.5/</a>&lt;manual_folder&gt;/&lt;manual_folder&gt;.h=
tml<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">=C2=A0 =C2=A0 =C2=A0 =
where &lt;manual_folder&gt; is <u></u>
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 brief-yocto=
projectqs<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 bsp-guide<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 overview-ma=
nual<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 dev-manual<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 sdk-manual<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 profile-man=
ual<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 kernel-dev<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ref-manual<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 toaster-man=
ual<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 bitbake-user-guide<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-right:0cm;margin-bottom:12.0pt;margi=
n-left:5.25pt">
Scott<span style=3D"color:#943634"><u></u><u></u></span></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">Is ther=
e any special process to get manual updates accepted? I am asking because I=
 sent an update for the BUILDHISTORY_FEATURES variable to the Yocto mailing=
 list (<a href=3D"https://lists.yoctoproject.org/pipermail/yocto/2018-Janua=
ry/039787.html" target=3D"_blank" rel=3D"noreferrer">https://lists.yoctopro=
ject.org/pipermail/yocto/2018-January/039787.html</a>)
 at the end of January (last pinged a month ago) and it still has not made =
it into the manual AFAICT and it has not received any feedback.<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">//Peter=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
</div>
</div>

</blockquote></div>

--000000000000a5f746056b4c89db--
