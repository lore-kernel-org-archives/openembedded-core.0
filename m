Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6F76086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 21:16:39 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id fo13so3742632lab.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 14:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=nZx4UBY/RdTsFpkbq9OllARSLOTE4BmCOJY7/XgzEvI=;
	b=iWyANDbJk41d38T2KiHy+pWXay77jBbzXTS1Pv8EfS+SxDHh5hwnHfLZoG6Nf8AgII
	3phBhIGKe8vwr2tyCWlUhxQR8T/sweifR6dRYiwOqwohwtnk/f8IXT4Pl9gibkgX1cAb
	yOe4i8AmGxw6JH3nLEt68zih99rLunPRYMPvlunLtQwo7xPq1ZpDzTdiW0ZOFZlbc5W/
	/1mo2g4nH1Jg6wr7mIJaZK1ssm8BY18tQFuYjfTCyYlPAN0GTMps9QUU4Lf5SUfxLdb8
	5dY7IHBUKLh15J8joTBMr7USk173AJs28WAIlQCYyAZx5WjMJmncGZQ5t+7s61XwAPkD
	h/Gw==
X-Received: by 10.152.8.231 with SMTP id u7mr7427119laa.27.1369343798959; Thu,
	23 May 2013 14:16:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.141.74 with HTTP; Thu, 23 May 2013 14:16:18 -0700 (PDT)
In-Reply-To: <1369334701-18752-3-git-send-email-ross.burton@intel.com>
References: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
	<1369334701-18752-3-git-send-email-ross.burton@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 23 May 2013 14:16:18 -0700
X-Google-Sender-Auth: ZE4bngg6y-eQFzrFnIobg2fw3r0
Message-ID: <CABcZANkm2AKE3-Y1RP-kbw-zA5rOMZLxEzAtiQe7vCNS-J92oQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] utils: add trim_version() function
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
X-List-Received-Date: Thu, 23 May 2013 21:16:39 -0000
Content-Type: multipart/alternative; boundary=089e0158ad74b663e904dd6932ac

--089e0158ad74b663e904dd6932ac
Content-Type: text/plain; charset=UTF-8

On Thu, May 23, 2013 at 11:45 AM, Ross Burton <ross.burton@intel.com> wrote:

> +def trim_version(version, num_parts=2):
> +    """
> +    Return just the first <num_parts> of <version>, split by periods.  For
> +    example, trim_version("1.2.3", 2) will return "1.2".
> +    """
> +    if type(version) is not str:
> +        raise TypeError("Version should be a string")
> +    if num_parts < 1:
> +        raise ValueError("Cannot split to parts < 1")
> +
> +    parts = version.split(".")
> +    trimmed = ".".join(parts[:num_parts])
> +    return trimmed
>

Another option would be to do something like:

def trim_version(version, num_parts=2):
    v = distutils.version.LooseVersion(version)
    return v.version[:num_parts]
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0158ad74b663e904dd6932ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 23, 2013 at 11:45 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":4p0" style=3D"overflow:hidden">+=
def trim_version(version, num_parts=3D2):<br>
+ =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+ =C2=A0 =C2=A0Return just the first &lt;num_parts&gt; of &lt;version&gt;, =
split by periods. =C2=A0For<br>
+ =C2=A0 =C2=A0example, trim_version(&quot;1.2.3&quot;, 2) will return &quo=
t;1.2&quot;.<br>
+ =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+ =C2=A0 =C2=A0if type(version) is not str:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0raise TypeError(&quot;Version should be a stri=
ng&quot;)<br>
+ =C2=A0 =C2=A0if num_parts &lt; 1:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(&quot;Cannot split to parts &=
lt; 1&quot;)<br>
+<br>
+ =C2=A0 =C2=A0parts =3D version.split(&quot;.&quot;)<br>
+ =C2=A0 =C2=A0trimmed =3D &quot;.&quot;.join(parts[:num_parts])<br>
+ =C2=A0 =C2=A0return trimmed</div></blockquote></div><br>Another option wo=
uld be to do something like:</div><div class=3D"gmail_extra" style><br></di=
v><div class=3D"gmail_extra" style>def trim_version(version, num_parts=3D2)=
:</div><div class=3D"gmail_extra" style>

=C2=A0 =C2=A0 v =3D distutils.version.LooseVersion(version)<br></div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0 return v.version[:num_parts]<br>-- <br>C=
hristopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenE=
mbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e0158ad74b663e904dd6932ac--
