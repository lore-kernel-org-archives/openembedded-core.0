Return-Path: <andrei@gherzan.ro>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id C885A6E719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 20:29:09 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id oz11so3758150veb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 12:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=x8qTVAHc+0YzoeRH4TEBx8d2pqqw5Hzxq74a/IvhQHg=;
	b=NkPHztJPWofQjKTYcSkxpYK5bq64PWDEN+v1NEMA420QuCARQBbNeAcVkcCGaJN8ED
	/SyiEawLd+RhvCFvHFQKTSO3c8VXp3naD5mtHnuh122xiFPmvjWwzmN1SkFkEgOPV2fc
	dimDW0gd22wfct6BJ28sQLbFjETEfcz2yNw3EXRvoyzpZ/ru+X1rgTxP/ca7Jx+vZZ4n
	O66HalQ/+TQTqK5pWaKy78oXPbAqnU5X1trqCf37aOsM6B1g1dJXYMTYJS7ovfVhjOGB
	jfEAZkLSAYR4pLU2COMVn0PYVwn+pA5zZTcCBmOZnERiwvO51E3iQCVIArNXFGfCj+jU
	mb1A==
X-Gm-Message-State: ALoCoQlXusigg7V6XUpQYfW6tlrsws9dl1EEtUB8ttXkmeKyq49FIJuFANsSrLFsbS0APHCVoKix
MIME-Version: 1.0
X-Received: by 10.58.181.230 with SMTP id dz6mr177593vec.35.1390854550046;
	Mon, 27 Jan 2014 12:29:10 -0800 (PST)
Received: by 10.58.244.138 with HTTP; Mon, 27 Jan 2014 12:29:09 -0800 (PST)
X-Originating-IP: [109.166.137.248]
Received: by 10.58.244.138 with HTTP; Mon, 27 Jan 2014 12:29:09 -0800 (PST)
In-Reply-To: <CA+0k_w968Jt7sQktJnH9PLrxnLqs6pF37S6tba8PYn=QksoqNA@mail.gmail.com>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<CAK18fxH2YHgqinv=jFqyQ_eZDNAVprv8p+-DAwWm0DNoH1GSgA@mail.gmail.com>
	<CAK18fxG9OuEF+p-frXP2SN2Ha-SpqP=c4VanXV+F8MEut9KcHw@mail.gmail.com>
	<1482714.ZdRsQTRoCZ@helios> <20140119180827.GB5660@gmail.com>
	<CA+0k_w968Jt7sQktJnH9PLrxnLqs6pF37S6tba8PYn=QksoqNA@mail.gmail.com>
Date: Mon, 27 Jan 2014 22:29:09 +0200
Message-ID: <CAK18fxFEFSd_zBwCLzgu_0p5U4E0kT2ojHF4j6gagqSnfEpD8A@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Alexandru Niculita <alexnick87@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Mon, 27 Jan 2014 20:29:11 -0000
Content-Type: multipart/alternative; boundary=047d7b673bda63e85204f0f98fe2

--047d7b673bda63e85204f0f98fe2
Content-Type: text/plain; charset=ISO-8859-1

On Jan 27, 2014 12:20 PM, "Alexandru Niculita" <alexnick87@gmail.com> wrote:
>
> Hi,
>
> I could not find a way to avoid using TexturePacker.
> TexturePacker is used by XMBC to compile all images used
>  in a skin into a single file.
> I took the info from here:
http://wiki.xbmc.org/index.php?title=TexturePacker
>

Would be great to have this soon so we can have xbmc support.

ag

--047d7b673bda63e85204f0f98fe2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jan 27, 2014 12:20 PM, &quot;Alexandru Niculita&quot; &lt;<a href=3D"mai=
lto:alexnick87@gmail.com">alexnick87@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I could not find a way to avoid using TexturePacker.<br>
&gt; TexturePacker is used by XMBC to compile all images used<br>
&gt; =A0in a skin into a single file.<br>
&gt; I took the info from here:=A0 <a href=3D"http://wiki.xbmc.org/index.ph=
p?title=3DTexturePacker">http://wiki.xbmc.org/index.php?title=3DTexturePack=
er</a><br>
&gt;</p>
<p dir=3D"ltr">Would be great to have this soon so we can have xbmc support=
. </p>
<p dir=3D"ltr">ag</p>

--047d7b673bda63e85204f0f98fe2--
