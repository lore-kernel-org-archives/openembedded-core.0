Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TtIgI-00072g-LX
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 15:00:34 +0100
Received: by mail-la0-f45.google.com with SMTP id ep20so584064lab.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/2vNurW+lrE2u4vdxAvt9dYJ+0CyGG7TR68Vbw+7820=;
	b=zzfR+B+G0i8arooaXVZhGKgdSBbBcnq4YuEVBJJjKoDV/fvIRkEPAbSXH90Wtp89d0
	hTNfWWPu3mp2dW6OwZmiPwQ8bA+UAFviH5aOI+rbnMsxJdBMCdopGFAu8iJPOx4k7pT6
	HRxgsJInfi0p+OlLdWc6dpDwi5yaGwREpQZFFGDoXR6vYRCdPzu/LtvkpP6pC3vcIrPm
	isAwflhh8jpnuFq8pi5d9cVKMbMmZr5VT+qP6rhVu4WkE1iSYrfbR8WdPJDQBQZfg73S
	ITqm0QPNhCQ1gg7bt0wU7AhKnvjKdm1HvGvjDydPvKgxbT8zf9h/wkf0+RnUGSuxHhz3
	5QAw==
MIME-Version: 1.0
Received: by 10.152.144.71 with SMTP id sk7mr68771336lab.29.1357825517271;
	Thu, 10 Jan 2013 05:45:17 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Thu, 10 Jan 2013 05:45:17 -0800 (PST)
In-Reply-To: <50EC3002.8050209@intel.com>
References: <50EC3002.8050209@intel.com>
Date: Thu, 10 Jan 2013 08:45:17 -0500
Message-ID: <CADkTA4NFq_EoFY8H800ewKQMWEOMjfroqT0t3okRKJz5jEYZzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-modules, do we need it anymore?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 14:00:35 -0000
Content-Type: multipart/alternative; boundary=e89a8f2347059fb87004d2ef6399

--e89a8f2347059fb87004d2ef6399
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 8, 2013 at 9:41 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> Hi all,
>
> While working on making all postinstalls run on host, I saw that we
> still use update-modules script. However, neither the kmod modprobe nor
> the busybox one read /etc/modules.conf file anymore which is created by
> update-modules script. Both scan /etc/modprobe.d/*.conf files.
>
> So, does anybody know why do we still have it around? Most modern
> distributions declared update-modules as obsolete and /etc/modules.conf
> doesn't exist anymore. Am I missing something?
>

I've been using the autoload functionality (not heavily, but from time to
time)
that is currently tied to update-modules. I did a quick scan of the
alternatives
in oe-core, and didn't immediately see that the same thing is possible via
kmod. Is that the case, or am I missing something as well ?

Cheers,

Bruce


>
> Thanks,
> Laurentiu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f2347059fb87004d2ef6399
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 8, 2013 at 9:41 AM, Laurentiu Palcu <span dir=3D"ltr">&=
lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurentiu=
.palcu@intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi all,<br>
<br>
While working on making all postinstalls run on host, I saw that we<br>
still use update-modules script. However, neither the kmod modprobe nor<br>
the busybox one read /etc/modules.conf file anymore which is created by<br>
update-modules script. Both scan /etc/modprobe.d/*.conf files.<br>
<br>
So, does anybody know why do we still have it around? Most modern<br>
distributions declared update-modules as obsolete and /etc/modules.conf<br>
doesn&#39;t exist anymore. Am I missing something?<br></blockquote><div><br=
></div><div>I&#39;ve been using the autoload functionality (not heavily, bu=
t from time to time)=A0</div><div>that is currently tied to update-modules.=
 I did a quick scan of the alternatives</div>
<div style>in oe-core, and didn&#39;t immediately see that the same thing i=
s possible via</div><div style>kmod. Is that the case, or am I missing some=
thing as well ?</div><div style><br></div><div style>Cheers,</div><div styl=
e>
<br></div><div style>Bruce</div><div>=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">

<br>
Thanks,<br>
Laurentiu<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--e89a8f2347059fb87004d2ef6399--
