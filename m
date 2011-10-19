Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RGR5z-0006il-75
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:01:51 +0200
Received: by ywm39 with SMTP id 39so1369945ywm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lyynMq+pPFQoi6c1Az2fxXpqnQW8VYR51LcjnBpMR+8=;
	b=xPfpE7S03mcq5n7xwBXyByIxq/hj/LZ8q0IbJclKC5RmLYiz1HNhGQ6y7MUPdk1we3
	M1RDQ4wtYzE3ysOewszUs7jueWID17BhYhh4kcHmvXDP3vPvFZ3O0zOwr2IRyPI1emki
	g+oZmZBm2qBKSNkjJPnFh5wo+22Qt6rmKXLp8=
MIME-Version: 1.0
Received: by 10.236.155.170 with SMTP id j30mr8081569yhk.19.1319010958069;
	Wed, 19 Oct 2011 00:55:58 -0700 (PDT)
Received: by 10.147.124.18 with HTTP; Wed, 19 Oct 2011 00:55:58 -0700 (PDT)
In-Reply-To: <cover.1318976197.git.josh@linux.intel.com>
References: <cover.1318976197.git.josh@linux.intel.com>
Date: Wed, 19 Oct 2011 09:55:58 +0200
Message-ID: <CAAQYJAs4KXjEQ5qTWCeidZ_1UzheuJi4bZy5PKRQ+C6DeTxwMg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Update tzdata and gst-plugins-good
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
X-List-Received-Date: Wed, 19 Oct 2011 08:01:51 -0000
Content-Type: multipart/alternative; boundary=20cf302d49849c4dcb04afa22b92

--20cf302d49849c4dcb04afa22b92
Content-Type: text/plain; charset=ISO-8859-1

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

--20cf302d49849c4dcb04afa22b92
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Oct 19, 2011 at 12:24 AM, Joshua Lock <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Per mailing requests, here are updates to the tzdata and gst-plugins-good r=
ecipes.<br>
<br>
Joshua<br>
<br>
The following changes since commit 95d0ff5e070c690314ab87665200099a52d37ebf=
:<br>
<br>
 =A0tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58 -0700)=
<br></blockquote></div><br>Thanks for the tzdata fix.<br>Now, we have the s=
ame recipes in meta-oe with a slightly different do_install and packaging: =
I&#39;m referring to /etc/localtime and /etc/timezone: which package do pro=
vide those in oe-core?<br>
<br>(We&#39;ll remove the tzdata/tzcodes from meta-oe once the recipes are =
matching)<br><br>Regards<br><br>Andrea<br><br>

--20cf302d49849c4dcb04afa22b92--
