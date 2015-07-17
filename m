Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id A5D5C65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 11:48:11 +0000 (UTC)
Received: by qged69 with SMTP id d69so16229627qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 04:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/0F6VWaWSxLQqbIT2du76OH4iBCzGjf8kHVuZV9a1UE=;
	b=BQjG43dGIbARi+pz+Y2k4F0Ovnl+iPR3a0d7yct3/aqMY8lLGsHep54d0yv7Lbc1t/
	/Mt18IfvZ9p+ffCKmeUEmAirMPKGMgYmkQH80AnDMYqsuzsVgPppNprPyqg3hoYYtdm5
	HVENL7kljci8InvUwI40lc5V5rB38CK34IuHobDe29HbTXJh1+7jFUVJJ03Zxijihptm
	DFxJIxO1ee42uMwjirZcdOWK54++JHcJfQhWgSfGO2at0GCLbsawXtOQJ0ttwsLf9qS/
	sMLy2pIWbDZ45UjEWQVlFOe7d98L1gy6bucHFSB6hvZdxd5AjlrT+yVOuCmLpDv2Z35i
	dDAg==
X-Gm-Message-State: ALoCoQl+nmFNLPweKZICQ0oHtknsoJAvASrK+rmg0W7Sbf6teKCaxuXYf1DLDKaSooH/8k0SL6bP
X-Received: by 10.140.43.100 with SMTP id d91mr25143702qga.77.1437133691317;
	Fri, 17 Jul 2015 04:48:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 04:47:52 -0700 (PDT)
In-Reply-To: <420375e6b2530660687099c64dc948dc05c86e0b.1436147616.git.kai.kang@windriver.com>
References: <cover.1436147616.git.kai.kang@windriver.com>
	<420375e6b2530660687099c64dc948dc05c86e0b.1436147616.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 12:47:52 +0100
Message-ID: <CAJTo0LaW6LJ0SrJ5CkxeqDpjEm3iFpL0niqnDRdQjX0i3MNZtQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] volatile-binds: correct path of command umount
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
X-List-Received-Date: Fri, 17 Jul 2015 11:48:12 -0000
Content-Type: multipart/alternative; boundary=001a113a989c2a812d051b10c391

--001a113a989c2a812d051b10c391
Content-Type: text/plain; charset=UTF-8

On 6 July 2015 at 02:59, Kai Kang <kai.kang@windriver.com> wrote:

> +               -e "/^ExecStop=/s/sbin/bin/" \
>

Should't that be something like ${bindir}?

Ross

--001a113a989c2a812d051b10c391
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2015 at 02:59, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
ai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4i3" class=3D"a3s"=
 style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &quot;/^ExecStop=3D/s/sbin/bin/&quot; \<br></div></blockquote>=
</div><br>Should&#39;t that be something like ${bindir}?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a989c2a812d051b10c391--
