Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RWPoA-0002GS-1i
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 10:53:31 +0100
Received: by bkbzv15 with SMTP id zv15so2847046bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 01:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=60xXi/1d2fcBlICtx1uUva+5dV1N8Ah/OGbyC/vKzj0=;
	b=v9aqi2bFZUk5FJYDShvq1rd5BSpRRnsboXv0iHUlSsplVXnBTCEvl7U8+4a7ljcOR9
	tO/YETwBn+vSvI4RhEXmcCho3rE0DtiCKRy3ioNjKTakO4ZXb1e5Brv9MDz667YfRHsy
	vfGg0vs4EN+iLGBnRwUnyN8b61yyKw//mS34k=
MIME-Version: 1.0
Received: by 10.180.106.70 with SMTP id gs6mr4233304wib.41.1322819207687; Fri,
	02 Dec 2011 01:46:47 -0800 (PST)
Received: by 10.180.8.199 with HTTP; Fri, 2 Dec 2011 01:46:47 -0800 (PST)
In-Reply-To: <4ED7ABF9.5000109@emagii.com>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<4ED53438.9040903@emagii.com>
	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
	<4ED77E14.1080309@balister.org>
	<878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net>
	<4ED7ABF9.5000109@emagii.com>
Date: Fri, 2 Dec 2011 10:46:47 +0100
Message-ID: <CACW_hTZcKvb3cvzvy=mq5=pGo2bWn0=iMaPQa-CU-wJR070vUw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Fri, 02 Dec 2011 09:53:33 -0000
Content-Type: multipart/alternative; boundary=f46d0444ef2df9edb804b318d8a2

--f46d0444ef2df9edb804b318d8a2
Content-Type: text/plain; charset=ISO-8859-1

2011/12/1 Ulf Samuelsson <openembedded-core@emagii.com>

>  2011-12-01 16:37, Koen Kooi skrev:
>
> Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende geschreven:
>
>
>  On 11/29/2011 03:06 PM, Koen Kooi wrote:
>
>  Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:
>
>
>  On 2011-11-29 16:03, Richard Purdie wrote:
>
>   2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" <ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz> is no longer
> available.
>         tzdata , same problem.
>         The recipe is located in two places.
>         meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
> problem
>         This is what the build uses.
>
>  This is something to raise with the meta-oe maintainers. I think there
> isn't a problem in OECore.
>
>  Since we now have a large number of layers, maybe it is a good
> idea to define in each layer,  how the "git send email" should behave in
> by providing a better ".git/config" file in the trunk?
>
>
> I.E:
>
> [sendemail]
>   to = openembedded-core@lists.openembedded.org
>
> or
> meta-angstrom/.git/config
> [sendemail]
>   to = angstrom-distro-devel@linuxtogo.org
> [format]
>   subjectprefix = "[meta-angstrom]"
>
>
> No need to look in the README file with this.
>
>  That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers
>
>  Even if it is not the preferred way, it would direct the discussion to
> the appropriate list. This would reduce the number of mis-directed
> emails to this list.
>
>  You can't fix stupid, sadly.
>
>
> Tend to disagree.
> The whole purpose of OE is to make it possible for people,
> stupid or not, to go off and make things which they would
> not be able to do on their own.
>
> As I see it, it is no real drawback of adding this, and at least some
> benefit.
>
> As for not beeing the preferred way, I think that people that engage
> themselves
> in a layer should adopt the preferred way.
>
> Anyone seeing a bad layer, applicable only to a small subset of users,
> interfering with their build should not be expected
> to put a lof of effort into the fix, except reporting it.
> Then the mailing list is probably the easiest thing to use.
>
> If this is not there, expect them to send it to the official list.
> BR
> Ulf
>

My two cents:
If I see a small problem in a layer that I am not working on and submitting
a patch is easy (e.g. committing the patch, doing a send-email) I would
probably do so.
If it becomes harder (since I have to find what list it needs to be send
to) chances that the effort is made become smaller and actually depending
on the time at hand
If i have to set up a git mirror just for this single patch, forget it.

I think if we want to encourage people fixing and submitting patches it
helps to have a mailing address in the config file.
But of course if you prefer to do maintenance only with the happy few, this
is less desirable (but then you should probably consider not accepting
mailed patches at all)

frans

--f46d0444ef2df9edb804b318d8a2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/12/1 Ulf Samuelsson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:openembedded-core@emagii.com">openembedded-core@em=
agii.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">

 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    2011-12-01 16:37, Koen Kooi skrev:
    <div><div></div><div class=3D"h5"><blockquote type=3D"cite">
      <pre>Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende gesc=
hreven:

</pre>
      <blockquote type=3D"cite">
        <pre>On 11/29/2011 03:06 PM, Koen Kooi wrote:
</pre>
        <blockquote type=3D"cite">
          <pre>Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende =
geschreven:

</pre>
          <blockquote type=3D"cite">
            <pre>On 2011-11-29 16:03, Richard Purdie wrote:
</pre>
            <blockquote type=3D"cite">
              <pre></pre>
              <blockquote type=3D"cite">
                <pre>2.    <a href=3D"ftp://elsie.nci.nih.gov/pub/tzcode201=
1i.tar.gz" target=3D"_blank">&quot;ftp://elsie.nci.nih.gov/pub/tzcode2011i.=
tar.gz&quot;</a> is no longer
available.
        tzdata , same problem.
        The recipe is located in two places.
        meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
problem
        This is what the build uses.
</pre>
              </blockquote>
              <pre>This is something to raise with the meta-oe maintainers.=
 I think there
isn&#39;t a problem in OECore.
</pre>
            </blockquote>
            <pre>Since we now have a large number of layers, maybe it is a =
good
idea to define in each layer,  how the &quot;git send email&quot; should be=
have in
by providing a better &quot;.git/config&quot; file in the trunk?


I.E:

[sendemail]
  to =3D <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a>

or
meta-angstrom/.git/config
[sendemail]
  to =3D <a href=3D"mailto:angstrom-distro-devel@linuxtogo.org" target=3D"_=
blank">angstrom-distro-devel@linuxtogo.org</a>
[format]
  subjectprefix =3D &quot;[meta-angstrom]&quot;


No need to look in the README file with this.
</pre>
          </blockquote>
          <pre>That assumes git-send-email is the preferred way, which it i=
sn;&#39;t for a lot of layers
</pre>
        </blockquote>
        <pre>Even if it is not the preferred way, it would direct the discu=
ssion to
the appropriate list. This would reduce the number of mis-directed
emails to this list.
</pre>
      </blockquote>
      <pre>You can&#39;t fix stupid, sadly.
</pre>
    </blockquote>
    <br></div></div>
    Tend to disagree.<br>
    The whole purpose of OE is to make it possible for people,<br>
    stupid or not, to go off and make things which they would<br>
    not be able to do on their own.<br>
    <br>
    As I see it, it is no real drawback of adding this, and at least
    some benefit.<br>
    <br>
    As for not beeing the preferred way, I think that people that engage
    themselves<br>
    in a layer should adopt the preferred way.<br>
    <br>
    Anyone seeing a bad layer, applicable only to a small subset of
    users,<br>
    interfering with their build should not be expected<br>
    to put a lof of effort into the fix, except reporting it.<br>
    Then the mailing list is probably the easiest thing to use.<br>
    <br>
    If this is not there, expect them to send it to the official list.<br>
    BR<br><font color=3D"#888888">
    Ulf</font><br></div></blockquote></div><br>My two cents:<br>If I see a =
small problem in a layer that I am not working on and submitting a patch is=
 easy (e.g. committing the patch, doing a send-email) I would probably do s=
o.<br>
If it becomes harder (since I have to find what list it needs to be send to=
) chances that the effort is made become smaller and actually depending on =
the time at hand<br>If i have to set up a git mirror just for this single p=
atch, forget it.<br>
<br>I think if we want to encourage people fixing and submitting patches it=
 helps to have a mailing address in the config file.<br>But of course if yo=
u prefer to do maintenance only with the happy few, this is less desirable =
(but then you should probably consider not accepting mailed patches at all)=
<br>
<br>frans<br>

--f46d0444ef2df9edb804b318d8a2--
