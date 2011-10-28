Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RJhnO-0007ZB-Q6
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 10:28:10 +0200
Received: by ggnj1 with SMTP id j1so3412098ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 01:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vWZ6oeBHmlPVvn7MgLQuqPC3pT0fZIAhXgsCqrpzAuY=;
	b=c1ZNhcUAQfmFwQtRMj6iSiFsJ6yhRqJkOdgS5+7mqT9ghqd3i7fC9aGr5CRAmBBWwJ
	Kv0p+qoqKK4PK3tJgQ+vTlTCBRXsSEam1wang/rrwKkdvZN0ZFytZO6/Jq5cdi/t+Sp8
	pLYY9Kvhk0FXPHgp4CbGHszFjkYEQsdWLQvXg=
MIME-Version: 1.0
Received: by 10.236.181.234 with SMTP id l70mr1825730yhm.49.1319790128756;
	Fri, 28 Oct 2011 01:22:08 -0700 (PDT)
Received: by 10.147.145.5 with HTTP; Fri, 28 Oct 2011 01:22:08 -0700 (PDT)
In-Reply-To: <1319785517.10032.48.camel@localhost.localdomain>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
Date: Fri, 28 Oct 2011 10:22:08 +0200
Message-ID: <CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: niqingliang@insigma.com.cn, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to set time zone
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
X-List-Received-Date: Fri, 28 Oct 2011 08:28:10 -0000
Content-Type: multipart/alternative; boundary=20cf305b14cecd78f404b05795f6

--20cf305b14cecd78f404b05795f6
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 28, 2011 at 9:05 AM, Ni Qingliang <niqingliang@insigma.com.cn>wrote:

> THANKS!
>
> I still want the native support by oe-core/yocto:-). If no, I will try
> by myself.
>
>
I've asked three or four time the oe-core crow to improve the recipe...last
one:

On Wed, Oct 19, 2011 at 12:24 AM, Joshua Lock <josh@linux.intel.com> wrote:

> Per mailing requests, here are updates to the tzdata and gst-plugins-good
> recipes.
>
> Joshua
>
> The following changes since commit
> 95d0ff5e070c690314ab87665200099a52d37ebf:
>
>  tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58 -0700)
>

Thanks for the tzdata fix.
Now, we have the same recipes in meta-oe with a slightly different
do_install and packaging: I'm referring to /etc/localtime and /etc/timezone:
which package do provide those in oe-core?

(We'll remove the tzdata/tzcodes from meta-oe once the recipes are matching)

Regards



Andrea

--20cf305b14cecd78f404b05795f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Oct 28, 2011 at 9:05 AM, Ni Qingliang <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:niqingliang@insigma.com.cn">niqinglia=
ng@insigma.com.cn</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
THANKS!<br>
<br>
I still want the native support by oe-core/yocto:-). If no, I will try<br>
by myself.<br>
<div><div></div><br></div></blockquote></div><br>I&#39;ve asked three or fo=
ur time the oe-core crow to improve the recipe...last one:<br><br><div clas=
s=3D"im"><div class=3D"gmail_quote">On Wed, Oct 19, 2011 at 12:24 AM, Joshu=
a Lock <span dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com" target=
=3D"_blank">josh@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Per mailing requests, here are updates to the tzdata and gst-plugins-good r=
ecipes.<br>
<br>
Joshua<br>
<br>
The following changes since commit 95d0ff5e070c690314ab87665200099a52d37ebf=
:<br>
<br>
 =A0tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58 -0700)=
<br></blockquote></div><br></div>Thanks for the tzdata fix.<br>Now,
 we have the same recipes in meta-oe with a slightly different=20
do_install and packaging: I&#39;m referring to /etc/localtime and=20
/etc/timezone: which package do provide those in oe-core?<br>
<br>(We&#39;ll remove the tzdata/tzcodes from meta-oe once the recipes are =
matching)<br><br>Regards<br><br><br><br>Andrea<br>

--20cf305b14cecd78f404b05795f6--
