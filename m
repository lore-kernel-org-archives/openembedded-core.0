Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QhIlB-0000mo-TM
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 12:03:10 +0200
Received: by gxk3 with SMTP id 3so30732gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gDK5+fauhC36JUni/MCFTQfGu5OrOcUTz7SrbLsHFww=;
	b=iufjL+qad5VeawySN4hetoyPURWpz887ERKQUbksHlWoHIQ2UOpfVVeCHvbTLE+MLI
	dn2BD54OAUx5NYLeFEQQ9OJxC0Ci7JpDS/Ip+F/rACIpMiw/dCdz8JvTNqaaonbOqwMV
	rLNiyFtGBXLeqDjOT493m8oeLvLIXbYMBp20w=
MIME-Version: 1.0
Received: by 10.101.21.11 with SMTP id y11mr444240ani.97.1310637549836; Thu,
	14 Jul 2011 02:59:09 -0700 (PDT)
Received: by 10.100.167.2 with HTTP; Thu, 14 Jul 2011 02:59:09 -0700 (PDT)
In-Reply-To: <201107141033.53014.paul.eggleton@linux.intel.com>
References: <CAGiJk9epBnpXunG0nJGyJUvBfcm6w3XK2RxCEU-CkACwdnAqag@mail.gmail.com>
	<19B4D9B5-F086-47C4-8817-94DC7D6A6CB6@dominion.thruhere.net>
	<201107141033.53014.paul.eggleton@linux.intel.com>
Date: Thu, 14 Jul 2011 11:59:09 +0200
Message-ID: <CAGiJk9c8C8-8hgBxMVtPmY3QK4tVRs-3KVxmy7qAopHQB1Ba1w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error running bitbake with a fresh copy of OE-Core
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
X-List-Received-Date: Thu, 14 Jul 2011 10:03:10 -0000
Content-Type: multipart/alternative; boundary=0050450176339657ac04a804955e

--0050450176339657ac04a804955e
Content-Type: text/plain; charset=ISO-8859-1

2011/7/14 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Thursday 14 July 2011 10:25:28 Koen Kooi wrote:
> > Op 14 jul 2011, om 10:52 heeft Samuel Stirtzel het volgende geschreven:
> > > File name too long:
> > >
> '/home/*user*/oe-core/setup-scripts/build/sstate-cache/sstate-gcc-cross-
> > >
> initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0+svnr175127-x86_64_armv5t
> > > e-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.tgz.siginfo'
> >
> > That seems to be filesystem related, I know ext3, ext4 and xfs work fine,
> > which one are you using?
>
> ecryptfs (encrypted home directory) perhaps? I thought we had a check for
> long
> filename creation in sanity.bbclass, maybe it isn't being tripped here for
> some
> reason...
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

The filesystem of this pc is ext4 with encrypted home directory, so moving
my OE-Core directory out of my home directory could resolve my problems?
I will try this and write back if it worked.


Regards
--Samuel

--0050450176339657ac04a804955e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/14 Paul Eggleton <span dir=3D"ltr=
">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.=
intel.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Thursday 14 July 2011 10:25:28 Koen Kooi wrote:<br>
&gt; Op 14 jul 2011, om 10:52 heeft Samuel Stirtzel het volgende geschreven=
:<br>
&gt; &gt; File name too long:<br>
&gt; &gt; &#39;/home/*user*/oe-core/setup-scripts/build/sstate-cache/sstate=
-gcc-cross-<br>
&gt; &gt; initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0+svnr175127-x86_6=
4_armv5t<br>
&gt; &gt; e-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.tgz.siginfo&#39=
;<br>
&gt;<br>
&gt; That seems to be filesystem related, I know ext3, ext4 and xfs work fi=
ne,<br>
&gt; which one are you using?<br>
<br>
</div>ecryptfs (encrypted home directory) perhaps? I thought we had a check=
 for long<br>
filename creation in sanity.bbclass, maybe it isn&#39;t being tripped here =
for some<br>
reason...<br><br></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Cheers,<br>
Paul<br>
<font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></blockquote></div><meta http-equiv=3D"content-type" content=3D"text=
/html; charset=3Dutf-8"><div><br></div><div>The filesystem of this pc is ex=
t4 with encrypted home directory, so moving my OE-Core directory out of my =
home directory could resolve my problems?</div>
<div>I will try this and write back if it worked.</div><div><br></div><div>=
<br></div><div>Regards</div><div>--Samuel</div>

--0050450176339657ac04a804955e--
