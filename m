Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRQX0-0005LB-5g
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 16:39:10 +0100
Received: by faat2 with SMTP id t2so4558902faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 07:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4R1OzwCsAjk9GyPFXv3sn3gya8WA77PBKOtSpoWfspo=;
	b=tTOnS4Va6wF1tE9Kxq2xJGLQfDVwdAa/JTuV2qGANO8GUuy+Q6RWOKdC6i7E+3tPlc
	mmA04y+as4VL4z24g2mCqBTE3w+JJp/Psnub2OhowgSi0exUx6thG7pFxVRZZaci4zri
	nmmFNAU1y2WdoCU31jutU/fhv7miTKRXM1QJM=
MIME-Version: 1.0
Received: by 10.152.102.148 with SMTP id fo20mr2236630lab.51.1321630363783;
	Fri, 18 Nov 2011 07:32:43 -0800 (PST)
Received: by 10.152.24.36 with HTTP; Fri, 18 Nov 2011 07:32:43 -0800 (PST)
In-Reply-To: <1321610734.29435.195.camel@phil-desktop>
References: <1321575634-24108-1-git-send-email-raj.khem@gmail.com>
	<1321610734.29435.195.camel@phil-desktop>
Date: Fri, 18 Nov 2011 07:32:43 -0800
Message-ID: <CAMKF1spWMzLWp38o45ddf+MFsL+TFsc5X7ANnQixUGwMpOpFcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a
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
X-List-Received-Date: Fri, 18 Nov 2011 15:39:10 -0000
Content-Type: multipart/alternative; boundary=f46d040716215b912604b2040c20

--f46d040716215b912604b2040c20
Content-Type: text/plain; charset=UTF-8

On Friday, November 18, 2011, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-11-17 at 16:20 -0800, Khem Raj wrote:
>> Backport fix for PR 47551 fixes the ICE seen on armv7-a/qt4-x11-free
>> Bump up SRCREV past gcc 4.6.2 release
>
> I thought it was our policy to keep SRCREV aligned with releases as far
> as possible rather than jumping to some random-ish checkin.  Are you
> saying that the fix for the ice requires both the patch and the SRCREV
> update?

Ice fix does not need it but then all the fixes on the branch are PR fixes
strictly
It would not deteriorate the quality but make it better

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d040716215b912604b2040c20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, November 18, 2011, Phil Blundell &lt;<a href=3D"mailto:p=
hilb@gnu.org">philb@gnu.org</a>&gt; wrote:<br>&gt; On Thu, 2011-11-17 at 16=
:20 -0800, Khem Raj wrote:<br>&gt;&gt; Backport fix for PR 47551 fixes the =
ICE seen on armv7-a/qt4-x11-free<br>
&gt;&gt; Bump up SRCREV past gcc 4.6.2 release<br>&gt;<br>&gt; I thought it=
 was our policy to keep SRCREV aligned with releases as far<br>&gt; as poss=
ible rather than jumping to some random-ish checkin. =C2=A0Are you<br>&gt; =
saying that the fix for the ice requires both the patch and the SRCREV<br>
&gt; update?<br><br>Ice fix does not need it but then all the fixes on the =
branch are PR fixes strictly<br>It would not deteriorate the quality but ma=
ke it better<br><br>&gt;<br>&gt; p.<br>&gt;<br>&gt;<br>&gt;<br>&gt; _______=
________________________________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--f46d040716215b912604b2040c20--
