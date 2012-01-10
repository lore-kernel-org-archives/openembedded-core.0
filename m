Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RkgJp-0006ul-II
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:21:09 +0100
Received: by wgbdt11 with SMTP id dt11so2912739wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 10:13:39 -0800 (PST)
Received: by 10.180.76.8 with SMTP id g8mr17646519wiw.3.1326219219541; Tue, 10
	Jan 2012 10:13:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.100.82 with HTTP; Tue, 10 Jan 2012 10:13:17 -0800 (PST)
X-Originating-IP: [79.115.118.211]
In-Reply-To: <CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
	<CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
	<4F0C637E.8050704@gherzan.ro>
	<CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Jan 2012 20:13:17 +0200
Message-ID: <CAK18fxF_iQADUWaASY=O4JcFfjrd3MRYHw+ooSOyXWNydV16XA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 18:21:09 -0000
Content-Type: multipart/alternative; boundary=f46d043893c5799d0904b630799c

--f46d043893c5799d0904b630799c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 18:34, Chris Larson <clarson@kergoth.com> wrote:

> On Tue, Jan 10, 2012 at 9:12 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > No worries. Anyway, you are right about the "+" mechanism but right now
> this
> > is a fast and complete solution.
>
> Indeed, nice work on this.
> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

On Tue, Jan 10, 2012 at 19:05, Chris Larson <clarson@kergoth.com> wrote:

> On Tue, Jan 10, 2012 at 9:55 AM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
> > Agreed!
>

Thank you.



On Tue, Jan 10, 2012 at 19:05, Chris Larson <clarson@kergoth.com> wrote:

> On Tue, Jan 10, 2012 at 9:55 AM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
> > Agreed! One note about "+". There is still a discussion about "or
> > greater" licensing within the SPDX community about how "or greater"
> > should be dealt with.
> >
> >
> http://www.spdx.org/wiki/proposal-2010-11-16-1-or-later-version-licensing
> > https://bugs.linuxfoundation.org/show_bug.cgi?id=591
>
> Interesting.
>
> > I'm partial to, as a stop gap, re-including L/GPL-x.0+ license files
> > into common-licenses until they hash it out and treating "+" as just
> > part of the license name. It's not a perfect solution but it should
> > solve most "or greater" use cases.
>
> I've been thinking about something like this.
>
> LICENSE_EXPANSIONS += "GPL-2.0+:GPL-2.0,GPL-3.0"
>
> Then process the license, turning GPL-2.0+ into an OR operation.
> Replace with (GPL-2.0 | GPL-3.0).
>
> Perhaps coupled with something like https://gist.github.com/1590028 to
> express distributor preferences, we then get a sanitized, SDPX, flat
> string with the licenses we're going to be using for this. Then we run
> this against each binary package's LICENSE (if different than recipe)
> and ensure our emitted binary packages match up with our license
> choices.
> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Christopher's solution crossed my mind as well. Actually i tried something
like this but i didn't want to modify more from this patch and i didn't
really know how to define those expansions.
Another problem here that i faced and dropped the idea for, was the the
scenario where a developer wants to exclude only GPLv3+. This case needed a
another couple of "if"s and so on.

So my solution seemed to deal most of the situations even if it looks a
little... childish.

--f46d043893c5799d0904b630799c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"text-align:center"><div align=3D"left" style=3D"font-family:&=
#39;Times New Roman&#39;;font-size:medium"><br></div></div><div class=3D"gm=
ail_quote">On Tue, Jan 10, 2012 at 18:34, Chris Larson <span dir=3D"ltr">&l=
t;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.=
com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Tue, Jan 10, 2012 at 9:12 AM, Andrei=
 Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@=
gherzan.ro</a>&gt; wrote:<br>



&gt; No worries. Anyway, you are right about the &quot;+&quot; mechanism bu=
t right now this<br>
&gt; is a fast and complete solution.<br>
<br>
</div>Indeed, nice work on this.<br>
<span><font color=3D"#888888">--<br>
Christopher Larson<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><div><br></div><div>On Tue, Jan 10, 2012 a=
t 19:05, Chris Larson=A0<span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@ker=
goth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span>=A0wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin-top:0px;margin-right:0px;=
margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex">


<div>On Tue, Jan 10, 2012 at 9:55 AM, Flanagan, Elizabeth<br>&lt;<a href=3D=
"mailto:elizabeth.flanagan@intel.com" target=3D"_blank">elizabeth.flanagan@=
intel.com</a>&gt; wrote:<br>&gt; Agreed!=A0</div></blockquote></div><br><di=
v>

Thank you.</div>
<div><br></div><div><br><br><div class=3D"gmail_quote">On Tue, Jan 10, 2012=
 at 19:05, Chris Larson=A0<span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@k=
ergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span>=A0wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin-top:0px;margin-right:0p=
x;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex">


<div>On Tue, Jan 10, 2012 at 9:55 AM, Flanagan, Elizabeth<br>&lt;<a href=3D=
"mailto:elizabeth.flanagan@intel.com" target=3D"_blank">elizabeth.flanagan@=
intel.com</a>&gt; wrote:<br>&gt; Agreed! One note about &quot;+&quot;. Ther=
e is still a discussion about &quot;or<br>


&gt; greater&quot; licensing within the SPDX community about how &quot;or g=
reater&quot;<br>&gt; should be dealt with.<br>&gt;<br>&gt;=A0<a href=3D"htt=
p://www.spdx.org/wiki/proposal-2010-11-16-1-or-later-version-licensing" tar=
get=3D"_blank">http://www.spdx.org/wiki/proposal-2010-11-16-1-or-later-vers=
ion-licensing</a><br>


&gt;=A0<a href=3D"https://bugs.linuxfoundation.org/show_bug.cgi?id=3D591" t=
arget=3D"_blank">https://bugs.linuxfoundation.org/show_bug.cgi?id=3D591</a>=
<br><br></div>Interesting.<br><div><br>&gt; I&#39;m partial to, as a stop g=
ap, re-including L/GPL-x.0+ license files<br>


&gt; into common-licenses until they hash it out and treating &quot;+&quot;=
 as just<br>&gt; part of the license name. It&#39;s not a perfect solution =
but it should<br>&gt; solve most &quot;or greater&quot; use cases.<br>

<br>
</div>I&#39;ve been thinking about something like this.<br><br>LICENSE_EXPA=
NSIONS +=3D &quot;GPL-2.0+:GPL-2.0,GPL-3.0&quot;<br><br>Then process the li=
cense, turning GPL-2.0+ into an OR operation.<br>Replace with (GPL-2.0 | GP=
L-3.0).<br>


<br>Perhaps coupled with something like=A0<a href=3D"https://gist.github.co=
m/1590028" target=3D"_blank">https://gist.github.com/1590028</a>=A0to<br>ex=
press distributor preferences, we then get a sanitized, SDPX, flat<br>strin=
g with the licenses we&#39;re going to be using for this. Then we run<br>


this against each binary package&#39;s LICENSE (if different than recipe)<b=
r>and ensure our emitted binary packages match up with our license<br>choic=
es.<br><div><div>--<br>Christopher Larson<br>
<br>_______________________________________________<br>Openembedded-core ma=
iling list<br><a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br><a href=3D=
"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core" tar=
get=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core</a><br>


</div><div><br></div></div></blockquote><div><br></div><div>Christopher&#39=
;s=A0solution crossed my mind as well. Actually i tried something like this=
 but i didn&#39;t want to modify more from this patch and i didn&#39;t real=
ly know how to define those expansions.</div>


<div>Another problem here that i faced and dropped the idea for, was the th=
e scenario where a developer wants to exclude only GPLv3+. This case needed=
 a another couple of &quot;if&quot;s and so on.</div><div><br></div><div>


So my solution seemed to deal most of the situations even if it looks a lit=
tle... childish.=A0</div></div></div>

--f46d043893c5799d0904b630799c--
