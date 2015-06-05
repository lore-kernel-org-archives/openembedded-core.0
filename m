Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id B7CE8606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:34:34 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so27845846qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jun 2015 02:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nC0j58wBnKQfK4OHsSR354ZS0RO/0QkB6REGRLdnn58=;
	b=JC+L0orHoZs5//3AWwNe1ZPY/5fCwRya4DrKX935oUUNmH7EXfSO8eLynvWOzqwExM
	b/XXl6LT6rPjVp4HlHAnMqlbrppoPB4tnN9q1rPRjcQjlPgrzgX/KGHF4zcJ9jV9+/Lc
	fZWfh45Lc7ix/K58VXASJSsd7KjqvZ6YM2CAf1INCjPGDYKkePzpVvoMv6/mk48dLMq9
	qHHOpVlfk8TYe7I1Gf67kgXgPFFoPhi+s5j2CsOng5FH0OY3ZL49rvZF7MiLr64S+CPa
	ZNBKgMs/LWI2HPPaUg+5z/qg1Anpq3NCUCRPpy0lslg2L3+Kf34NgRsVqRY0kAL9reRK
	bmmw==
X-Gm-Message-State: ALoCoQlLhxibkfcgeBYzloUtAGsE26iFcYHiVEuqr43u9UcslM3PXR64X7x12zz84adk5i7ygwMx
X-Received: by 10.140.235.195 with SMTP id g186mr3093194qhc.64.1433496875501; 
	Fri, 05 Jun 2015 02:34:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 5 Jun 2015 02:34:15 -0700 (PDT)
In-Reply-To: <55716C4B.7070100@communistcode.co.uk>
References: <1433397478-3927-1-git-send-email-kai.kang@windriver.com>
	<55701920.2050101@communistcode.co.uk> <5571005A.8020401@windriver.com>
	<55716C4B.7070100@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jun 2015 10:34:15 +0100
Message-ID: <CAJTo0LaDfrLb+HTMfbouMH0B8BQWLK=gi5F30jWEeEKS8DG9Jg@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: add dependency glib-2.0
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
X-List-Received-Date: Fri, 05 Jun 2015 09:34:36 -0000
Content-Type: multipart/alternative; boundary=001a11354c8a0d1fca0517c20040

--001a11354c8a0d1fca0517c20040
Content-Type: text/plain; charset=UTF-8

On 5 June 2015 at 10:30, Jack Mitchell <ml@communistcode.co.uk> wrote:

> Ok, it's just quite a heavy dependancy for a package which is feasible to
> be installed on very small systems; as you have proved by glib-2.0 not
> beiing available in a non-x11 build. In this case I guess the way round it
> would be to split out the alsa-tools packages, but that is also a lot of
> work. The patch is fine and I don't use alsa-tools so I have no strong
> feelings; I just like to keep and eye on and question bloat.
>

If someone feels strongly they can submit a patch to alsa-tools to make the
glib dependency optional.

Alternatively, split the alsa-tools packaging in some way.

Ross

--001a11354c8a0d1fca0517c20040
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2015 at 10:30, Jack Mitchell <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ml@communistcode.co.uk" target=3D"_blank">ml@communistcode.co.uk</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":293" class=3D=
"a3s" style=3D"overflow:hidden">Ok, it&#39;s just quite a heavy dependancy =
for a package which is feasible to be installed on very small systems; as y=
ou have proved by glib-2.0 not beiing available in a non-x11 build. In this=
 case I guess the way round it would be to split out the alsa-tools package=
s, but that is also a lot of work. The patch is fine and I don&#39;t use al=
sa-tools so I have no strong feelings; I just like to keep and eye on and q=
uestion bloat.<br></div></blockquote></div><br>If someone feels strongly th=
ey can submit a patch to alsa-tools to make the glib dependency optional.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Alterna=
tively, split the alsa-tools packaging in some way.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354c8a0d1fca0517c20040--
