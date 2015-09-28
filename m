Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89B50755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 14:43:12 +0000 (UTC)
Received: by qkap81 with SMTP id p81so68718697qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PV1qZ68z2bcdoQBC7YROLHpFPNY4dA2qw7Foo8jNlvg=;
	b=A3ZPVbXc7e4W0+vgeajaRYWH5PrkgcUnTGAiI/QjNyDH6cZs6sDJQCryHkSjyd11NG
	UNMXtGTXx+XbavZy6RJHL8O351zUcKxjXs9++ZXmsjM+4gHo1JggAzdxdMzMmjJnlWax
	4P+iy12hB/YjCrH+qycqk5M9nC8yGbU8USI50so+ffgjD65ZRCGjynUWjNKJkjefU6jy
	Mm6wMIGKEgmd8XXJvJRrtj3iS2qDA3Vb+HAcAc+2UDByLi3nnmdB5dQoB1VW8P3Ha7VL
	LDYVr9tNt2vB12JK08aXsHyTtxPt9iIsNHqGG+3dWQvoO8G/Dfgk9A722l0JyULY+/Or
	Vu6A==
X-Gm-Message-State: ALoCoQmfBLA/r5gzGTnptkQGGD6wKhD+CHrguREiZPSmiBBAzVYjeMX66AOK+RNyWdFrLhukhtn3
X-Received: by 10.55.43.132 with SMTP id r4mr20764558qkr.104.1443451392451;
	Mon, 28 Sep 2015 07:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 28 Sep 2015 07:42:52 -0700 (PDT)
In-Reply-To: <62b26729361a797eff29928054777d7a5aebdead.1443162720.git.mariano.lopez@linux.intel.com>
References: <cover.1443162720.git.mariano.lopez@linux.intel.com>
	<62b26729361a797eff29928054777d7a5aebdead.1443162720.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Sep 2015 15:42:52 +0100
Message-ID: <CAJTo0LaSKjRjqR5D74W5TtJrPBEjhendtkk=iPDrJYPHqhdEkw@mail.gmail.com>
To: mariano.lopez@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemurunner: Sanitize output from qemu and qemu pid
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
X-List-Received-Date: Mon, 28 Sep 2015 14:43:13 -0000
Content-Type: multipart/alternative; boundary=001a1147af6a7f7b890520cfb790

--001a1147af6a7f7b890520cfb790
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 07:33, <mariano.lopez@linux.intel.com> wrote:

>      def log(self, msg):
>          if self.logfile:
> +            # It is needed to sanitize the data received from qemu
> +            # because is possible to have control characters or Unicode
> +            msg = cmdline = "".join(filter(lambda x:x in
> string.printable, msg))
>              with open(self.logfile, "a") as f:
>                  f.write("%s" % msg)
>

cmdline looks like a copy/paste typo?

Would it be sensible in the future to support UTF-8 for the logging?

Ross

--001a1147af6a7f7b890520cfb790
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 25 September 2015 at 07:33, =
 <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.lopez@linux.intel.com" tar=
get=3D"_blank">mariano.lopez@linux.intel.com</a>&gt;</span> wrote:<br><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6ny" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0def log(self, msg):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.logfile:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # It is needed to sanitize the d=
ata received from qemu<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # because is possible to have co=
ntrol characters or Unicode<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D cmdline =3D &quot;&quot;=
.join(filter(lambda x:x in string.printable, msg))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(self.logfile, &qu=
ot;a&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot=
;%s&quot; % msg)</div></blockquote></div><br>cmdline looks like a copy/past=
e typo?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Would it be sensible in the future to support UTF-8 for the logging?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a1147af6a7f7b890520cfb790--
