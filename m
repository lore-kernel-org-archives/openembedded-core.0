Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3070F76E2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 20:02:18 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so11372435qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UWL5fnMvk4lV01/3fCvjhM2KML18JxmU6FFuet1sBcg=;
	b=EDbekZPMvqVIqcwIjA3GXCfZ7W03RTZbI2SQ4vtMYIxHcCuJe/FvchPRF8zCBx+fLv
	cpKyS+d1PQizHT4pEQLxcbViG7TUcuXnNcQKr/5wAAA8/3o7iyGn2ijokm5oXIviFuCv
	gOyD7SzXx1HUjKXBNS0Q3NM+zFt+hixfuJF5TSyi6H0dcLjk2r0HcFYhS8xpQsBKcfPW
	iI/4t8pwqRynr3He0J71UaJtk7S6E9X6Krhm6o628Or6PHi97QDjuNAE/9Y4HE5m9RMs
	oQ5huXMwfeEw8PGSp1CZQE4M31C9OX3oKa/Qf7uHsOy7hksLA7bUdYsJANI2Cakuxtf+
	ns+w==
X-Gm-Message-State: ALoCoQmWxP7WH2rge39gkV+JgKq49F/9SWFvRnlcP6Jsv5YPhu7GucGJmEtD35xlIIcCpO2W5P07
X-Received: by 10.55.197.213 with SMTP id k82mr1691528qkl.49.1442520138135;
	Thu, 17 Sep 2015 13:02:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 17 Sep 2015 13:01:58 -0700 (PDT)
In-Reply-To: <4071162f4a5c0b32224c8c87b9e0deab82011787.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<4071162f4a5c0b32224c8c87b9e0deab82011787.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Sep 2015 21:01:58 +0100
Message-ID: <CAJTo0LY5DQ9WQnf9N0T23+HZPrDaxF+pWBAfFAqJjEuS=yQnOg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] prserv/serv.py: Better messaging when starting/stopping the server with port=0
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
X-List-Received-Date: Thu, 17 Sep 2015 20:02:18 -0000
Content-Type: multipart/alternative; boundary=001a1149a4826a7817051ff6e4b0

--001a1149a4826a7817051ff6e4b0
Content-Type: text/plain; charset=UTF-8

On 15 September 2015 at 15:59, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> +        sys.stderr.write("WARNING: Server is listening at port %s instead
> of %s\n"
> +                         % (rport,port))
>

I wouldn't call this a warning: port=0 means "pick your own", so it's not a
warning that a different port was changed, it's useful information.

Ross

--001a1149a4826a7817051ff6e4b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 September 2015 at 15:59,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leo=
nardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandova=
l.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":26d" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sys.stderr.write(&quot;WARNING: Server is listening at=
 port %s instead of %s\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0% (rport,port))<br></div></blockquote></div><br>I wouldn&#=
39;t call this a warning: port=3D0 means &quot;pick your own&quot;, so it&#=
39;s not a warning that a different port was changed, it&#39;s useful infor=
mation.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a1149a4826a7817051ff6e4b0--
