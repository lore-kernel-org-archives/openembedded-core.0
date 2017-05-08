Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 261F371A21
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 11:34:21 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id b68so27742155ywe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vHWDAh+Z+cutr5HEWJqJNJbNwnpr6Q3zRG8+XgU4tmo=;
	b=kI97Be5BzyUFS3xforuRAkvJXS2g5ep3aGsBOTWuS0cVXiCzCeTwTWH1HCqw0716Rq
	ShE9QWnnGK/nJ+GKw6tZGFsanRFtXaPqkZvd+EV7dBOezF+akNb0YF0G4o2u1xGekxyw
	aGS8F49LgWEjr0UL7l2rlfUcwXTYhkps4yq/eHapdfuS+Kh2Ggsx4JKd8lhfwpGo9nX+
	8eBG9zhsBSZFR+3K2nwQAuyDK5QS4VQTVfPRIEt7lIHsBU/5GNAZ9JcBUPTOG9+RfdpQ
	od7zxvfgDlL9tU6dbGZ64mnbzB1HgHjl274aA5k33D8/TRJVS0lJe1OCY4BYRvrZgmHv
	7VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vHWDAh+Z+cutr5HEWJqJNJbNwnpr6Q3zRG8+XgU4tmo=;
	b=NklnkrnzswdyW/hIZESNmRCJVZXvXWasr9M94HF7E01xHj95ajxwMy90wJiFJNYQTU
	C1YcNVTXDwgd2pk/mK0d7owkTp0bmuufUQv2tSCIeH37J4EaaYqJCNAOMZ77ZPy786Q6
	GoMQDNRvtup4e2v2kIcljCoYS/bB2jkcdVQNtHhao9Dwgopk9fXEYW0dcZtvGeROyQ2T
	Yodtb16DZypCh5Wh4nSfAl3fd2nXq/1qHPrWhJDVxfm3bdeMJsLxflnse7lcdfB/m0hd
	+OV9f2dYCTQCPe/ZmIwK8zcpOXyPD2AqyfMrFUUsrkZ6oL/MFI4wXGFjlOHXEqDPP6tb
	Rd2w==
X-Gm-Message-State: AN3rC/7WeqodT1mOqwxFSkGztzApBrJ6ohi84v9rs/FvQ/eVMCaOVegC
	5GeWE9qcF1GApO+lGfqItLGyn3pJvCNx
X-Received: by 10.129.99.139 with SMTP id x133mr28003870ywb.59.1494243262901; 
	Mon, 08 May 2017 04:34:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Mon, 8 May 2017 04:33:52 -0700 (PDT)
In-Reply-To: <1494240698452.53619@mentor.com>
References: <1494240698452.53619@mentor.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 8 May 2017 14:33:52 +0300
Message-ID: <CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 08 May 2017 11:34:22 -0000
Content-Type: multipart/alternative; boundary=001a114916c4e4f38f054f019e8b

--001a114916c4e4f38f054f019e8b
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 13:51, Belal, Awais <Awais_Belal@mentor.com> wrote:
>
> Hi,
>
> Can anyone please shed some light on why OE only provides SATO based
images (core-image-sato) when it comes to GUI based images? There are other
solutions like LXDE, have these been evaluated? Is there a specific reason
to go with SATO?

Sato is extremely lightweight (not just runtime-wise but with regards to
build time and maintenance effort). I admit I'm not familiar with LXDE but
other DEs known as lightweight are in reality on another level compared to
Sato... Sato projects themselves are tiny and depend on very little: this
is quite beneficial since it keeps the automated test runtimes reasonable.

The other big reason is that it's there and mostly works (not as a modern
DE for daily use but as a test platform for Xorg, mesa, GTK+, GStreamer,
etc). If someone was committed to bringing in a more modern alternative
that wouldn't ruin our build times or bring in vast amounts of new recipes,
I'm sure it would be considered. Note that at this point at least I would
hope "modern" would mean "handles wayland case in some manner"...

My 2c,
  Jussi

--001a114916c4e4f38f054f019e8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 May 2017 at 13:51, Belal, Awais &lt;<a href=3D"mailto=
:Awais_Belal@mentor.com">Awais_Belal@mentor.com</a>&gt; wrote:<br>&gt;<br>&=
gt; Hi,<br>&gt;<br>&gt; Can anyone please shed some light on why OE only pr=
ovides SATO based images (core-image-sato) when it comes to GUI based image=
s? There are other solutions like LXDE, have these been evaluated? Is there=
 a specific reason to go with SATO?<br><br>Sato is extremely lightweight (n=
ot just runtime-wise but with regards to build time and maintenance effort)=
. I admit I&#39;m not familiar with LXDE but other DEs known as lightweight=
 are in reality on another level compared to Sato... Sato projects themselv=
es are tiny and depend on very little: this is quite beneficial since it ke=
eps the automated test runtimes reasonable.<br><div><br></div><div>The othe=
r big reason is that it&#39;s there and mostly works (not as a modern DE fo=
r daily use but as a test platform for Xorg, mesa, GTK+, GStreamer, etc). I=
f someone was committed to bringing in a more modern alternative that would=
n&#39;t ruin our build times or bring in vast amounts of new recipes, I&#39=
;m sure it would be considered. Note that at this point at least I would ho=
pe &quot;modern&quot; would mean &quot;handles wayland case in some manner&=
quot;...</div><div><br></div><div>My 2c,</div><div>=C2=A0 Jussi</div></div>

--001a114916c4e4f38f054f019e8b--
