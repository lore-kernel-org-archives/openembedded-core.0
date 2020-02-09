Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9201360CA0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:37:21 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g3so3491731wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z7Afr2rEmGrj/t2f0A6ABZ/IiwILcKrCW9SAN/PmHtU=;
	b=TYDQToX/c842CK2SH8JYC2BbIH4q40NwvcHja+ZZfI+UyyuZVr6soCye7hhaCJK2QC
	HCmcNPDh7FNiqLg6Z0ebuRb1lq7ksUcaru6RBNSEa4xGWaeEgEFLK48HWlcgHZtaUh2T
	N4l+IZWGN/+dYhaFHPbqOxAhDAHbaXxIDd3QLjL5jeL8EBrpoFATKVoB8DmnV1joGfYY
	0v1qhh61/tHg70E6n7g/ZMSSMzo/YJ6I5TtadfqxalzsBETcPOiJNKq+xJYvfZFkgY4C
	qLsNSKGtNwB1mbxzb5l+vA6riuTbrFRbWcO6p+39wM+0ykZUCAwSj2gYFzZmLVfA/M4+
	A77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z7Afr2rEmGrj/t2f0A6ABZ/IiwILcKrCW9SAN/PmHtU=;
	b=sVhUXTMPR5NLICcrKXL4H6IoJKSWbGgMZQgphqTXI5HcIeTS+jEI9nUBmngQs9VlXv
	oMVzN33eZELzjPYfARfyljypgmam3n+MUN4PepLhuCNKsar1xwja4BVDWNt+yUciLhus
	Ifmv2y1BgDNvGdLt4vvsK2hWaR3j7j/37+FbdcX6BB1ZVbCmCQ8xtZmccOsnRMX6qoG2
	5ES/jdMsf5XmjXPYsCmVejr6CxJgOJNmuqM3iS+jlJAyFTmysYa0fRv4Re2nX+sgn5EX
	FqqiIu1TRHF19kFVt1Asgo4KgCLAAgmuGOx7SWSyw0sGlxO/aYzZ4ynjPe5dm8n1ZFgo
	OJjw==
X-Gm-Message-State: APjAAAVujuytDXA1bb4n8ek59VCUtmvKkj9xFaAtzsfhuxfejtoGEhFE
	NFahpb9fnLZGqctUKUrtCxS1nl0jc/7EfUPvWeo=
X-Google-Smtp-Source: APXvYqy5nGA5K0rZPc/DXS+cGhakpmK0Biya8bBe5j0wUmqSzcHGokNYuRWZlLPjfAYiw70NYJZBwUjr/SzdvfH8m50=
X-Received: by 2002:adf:f4cb:: with SMTP id h11mr11980663wrp.90.1581266242173; 
	Sun, 09 Feb 2020 08:37:22 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
	<CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
	<BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR1201MB248219E5E090A8B5691CCB098B1E0@BN6PR1201MB2482.namprd12.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 9 Feb 2020 10:37:10 -0600
Message-ID: <CAJdd5GZ7De+yGrCitp4rcPQs+suZdHS+7N4c9N1gdG-6V-deZA@mail.gmail.com>
To: chris.laplante@agilent.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Sun, 09 Feb 2020 16:37:21 -0000
Content-Type: multipart/alternative; boundary="000000000000a8fe8a059e273c91"

--000000000000a8fe8a059e273c91
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 8, 2020, 6:24 PM chris.laplante--- via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Hi Richard,
>
> > > > Anecdotally, we are running Zeus for nightly builds with three
> > > > multiconfigs. I cherry-picked your "bitbake: fix2" and "bitbake:
> > > > fixup" patches and haven't seen any of the BB_UNIHASH errors since.
> > > > Granted it's only been a week. But before that, hash equiv +
> > > > multiconfig was unusable due to the BB_UNIHASH errors.
> > >
> > > That is a really helpful data point, thanks. I should probably clean up
> > > those bitbake patches and get them merged then, I couldn't decide if
> > > they were right or not...
> > >
> >
> > I just picked all your pending changes out of master-next into our
> > local patch queue - will let you know how it looks when it's finished
> > cooking!
>
> There are two small issues I have observed.
>
> One is occasionally I get a lot of undeterministic metadata errors when
> BB_CACHE_POLICY = "cache", multiconfig, and hash equiv are enabled. The
> errors are all on recipes for which SRCREV = "${AUTOREV}". It doesn't
> always happen. But it did just now when I rebased our "zeus-modified"
> branch onto the upstream "zeus" branch, to get the changes starting with
> 7dc72fde6edeb5d6ac6b3832530998afeea67cbc.
>
> Two is that, sometimes "Initializing tasks" stage appears stuck at 44% for
> a couple minutes. I traced it down to this code in runqueue.py (line 1168
> on zeus):
>
>         # Iterate over the task list and call into the siggen code
>         dealtwith = set()
>         todeal = set(self.runtaskentries)
>         while len(todeal) > 0:
>             for tid in todeal.copy():
>                 if len(self.runtaskentries[tid].depends - dealtwith) == 0:
>                     dealtwith.add(tid)
>                     todeal.remove(tid)
>                     self.prepare_task_hash(tid)
>
> When I instrument the loop to print out the size of "todeal", I see it
> decrease very slowly, sometimes only a couple at a time. I'm guessing this
> is because prepare_task_hash is contacting the hash equiv server, in a
> serial manner here. I'm over my work VPN which makes things extra slow. Is
> there an opportunity for batching here?
>

Batching is hard because the hashes you request might depend on hashes
previous received from the server. It might be possible to figure out these
dependencies and submit multiple batch requests, but this would require
some work in the code. Another option would be to have some multi-level
caching scheme where you can have a local database that mirrors your
centralized server.

If you have any ideas on how to make it faster, we would love to hear your
opinion :)



> Thanks,
> Chris
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a8fe8a059e273c91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Feb 8, 2020, 6:24 PM chris.laplante--- via Ope=
nembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Richard,<b=
r>
<br>
&gt; &gt; &gt; Anecdotally, we are running Zeus for nightly builds with thr=
ee<br>
&gt; &gt; &gt; multiconfigs. I cherry-picked your &quot;bitbake: fix2&quot;=
 and &quot;bitbake:<br>
&gt; &gt; &gt; fixup&quot; patches and haven&#39;t seen any of the BB_UNIHA=
SH errors since.<br>
&gt; &gt; &gt; Granted it&#39;s only been a week. But before that, hash equ=
iv +<br>
&gt; &gt; &gt; multiconfig was unusable due to the BB_UNIHASH errors.<br>
&gt; &gt;<br>
&gt; &gt; That is a really helpful data point, thanks. I should probably cl=
ean up<br>
&gt; &gt; those bitbake patches and get them merged then, I couldn&#39;t de=
cide if<br>
&gt; &gt; they were right or not...<br>
&gt; &gt;<br>
&gt; <br>
&gt; I just picked all your pending changes out of master-next into our<br>
&gt; local patch queue - will let you know how it looks when it&#39;s finis=
hed<br>
&gt; cooking!<br>
<br>
There are two small issues I have observed.=C2=A0 <br>
<br>
One is occasionally I get a lot of undeterministic metadata errors when BB_=
CACHE_POLICY =3D &quot;cache&quot;, multiconfig, and hash equiv are enabled=
. The errors are all on recipes for which SRCREV =3D &quot;${AUTOREV}&quot;=
. It doesn&#39;t always happen. But it did just now when I rebased our &quo=
t;zeus-modified&quot; branch onto the upstream &quot;zeus&quot; branch, to =
get the changes starting with 7dc72fde6edeb5d6ac6b3832530998afeea67cbc. <br=
>
<br>
Two is that, sometimes &quot;Initializing tasks&quot; stage appears stuck a=
t 44% for a couple minutes. I traced it down to this code in runqueue.py (l=
ine 1168 on zeus):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Iterate over the task list and call into the =
siggen code<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dealtwith =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 todeal =3D set(self.runtaskentries)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while len(todeal) &gt; 0: <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tid in todeal.copy():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(self.runtask=
entries[tid].depends - dealtwith) =3D=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dealt=
with.add(tid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 todea=
l.remove(tid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.=
prepare_task_hash(tid)<br>
<br>
When I instrument the loop to print out the size of &quot;todeal&quot;, I s=
ee it decrease very slowly, sometimes only a couple at a time. I&#39;m gues=
sing this is because prepare_task_hash is contacting the hash equiv server,=
 in a serial manner here. I&#39;m over my work VPN which makes things extra=
 slow. Is there an opportunity for batching here? <br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Batching is hard because =
the hashes you request might depend on hashes previous received from the se=
rver. It might be possible to figure out these dependencies and submit mult=
iple batch requests, but this would require some work in the code. Another =
option would be to have some multi-level caching scheme where you can have =
a local database that mirrors your centralized server.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">If you have any ideas on how to make it fast=
er, we would love to hear your opinion :)</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Chris<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"noreferr=
er noreferrer" target=3D"_blank">Openembedded-core@lists.openembedded.org</=
a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000a8fe8a059e273c91--
