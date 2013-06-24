Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id D80D96ABBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:23:48 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id 12so7668414vbf.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 00:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=b+e1aywj6+7b03H+a0Jqz5EFGr2znrwgzEAN+xEhmNI=;
	b=YGe/6NCgoyI4NtMH5EuDYbJsGLpSaRCQhIxZwsGjh3MgZurBC+6RkIvg+YkVyEdFJH
	M9GWs8vdGZ0NOrU1GP96V/Zmkccy9tEQ++tILQApWIuqlaDStbaB3bc2qvJQ9kVs3+nM
	ZF8XURyn22FHWgIsL9zmznKbMIK2qWM7xelt24JxtekbJJjY9r/jEZeAmfMp1RAD+ZU+
	x7U+K6BG9w+V4g+XQXPRRfcmYOsW2RFIoHkLzCF7G2WjQtrGIVF6FxvTsC39R/go8v9I
	UNp3NCR9/bpPp+J3hfIKJ6TGMWjoBhulyW9TcIb0Mq4MoQubSQUMQfUlDIrHs8j1IKBu
	iLWQ==
MIME-Version: 1.0
X-Received: by 10.221.4.138 with SMTP id oc10mr10733505vcb.26.1372058629077;
	Mon, 24 Jun 2013 00:23:49 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Mon, 24 Jun 2013 00:23:48 -0700 (PDT)
Received: by 10.220.195.201 with HTTP; Mon, 24 Jun 2013 00:23:48 -0700 (PDT)
In-Reply-To: <d520d4fc66725801e83d4719e6c71f9015d8c9b0.1371807568.git.jackie.huang@windriver.com>
References: <cover.1371807568.git.jackie.huang@windriver.com>
	<d520d4fc66725801e83d4719e6c71f9015d8c9b0.1371807568.git.jackie.huang@windriver.com>
Date: Mon, 24 Jun 2013 08:23:48 +0100
X-Google-Sender-Auth: dnqk0Do_fSLd3sc_sxs2_-JWY_Q
Message-ID: <CANyK_8desSo69SzZqb4PNL1WHDV1EgrCGegGTYse8zwTN_iymw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: jackie.huang@windriver.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Limit the kbdrate application to x86, mips and sparc.
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
X-List-Received-Date: Mon, 24 Jun 2013 07:23:49 -0000
Content-Type: multipart/alternative; boundary=089e011847103283a204dfe14bbf

--089e011847103283a204dfe14bbf
Content-Type: text/plain; charset=ISO-8859-1

On 24 Jun 2013 07:28, <jackie.huang@windriver.com> wrote:
>
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The code relies on hardware specific memory locations to access
> and modify the keyboard repeat rate.  It also requires read/write
> access to /dev/port which doesn't exist on every architecture's
> root fs.  The defect was raised for Qemu PowerPC but it also fails on
> ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop Bus)
> device and not compatible with an Intel driver.  There's also no
> indication in the documentation that the code should work on
> anything other than Intel architecture but it also works on MIPS.
>

> ++#if !(  defined(__i386__)   \
> ++     || defined(__x86_64__) \
> ++     || defined(__mips__)   \
> ++     || defined(__sparc___))
> ++
> ++      fprintf(stderr,
> ++              "ERROR:  %s should only be used on MIPS, x86 and Sparc
archicture boards\n", basename(argv[0]));
> ++        exit(1);
> ++#endif

Would it be better to detect the target platform in the build system and
skip building the kbdrate program for architectures it won't work on rather
than building and installing a known broken program?

> ++      set_progname(argv[0]);
> +       set_progname(argv[0]);

Accidental repeat?

--

Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--089e011847103283a204dfe14bbf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 24 Jun 2013 07:28, &lt;<a href=3D"mailto:jackie.huang@win=
driver.com">jackie.huang@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com">j=
ackie.huang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; The code relies on hardware specific memory locations to access<br>
&gt; and modify the keyboard repeat rate. =A0It also requires read/write<br=
>
&gt; access to /dev/port which doesn&#39;t exist on every architecture&#39;=
s<br>
&gt; root fs. =A0The defect was raised for Qemu PowerPC but it also fails o=
n<br>
&gt; ARM. =A0The keyboard emulation in qemuppc is for an ADB (Apple Desktop=
 Bus)<br>
&gt; device and not compatible with an Intel driver. =A0There&#39;s also no=
<br>
&gt; indication in the documentation that the code should work on<br>
&gt; anything other than Intel architecture but it also works on MIPS.<br>
&gt;</p>
<p dir=3D"ltr">&gt; ++#if !( =A0defined(__i386__) =A0 \<br>
&gt; ++ =A0 =A0 || defined(__x86_64__) \<br>
&gt; ++ =A0 =A0 || defined(__mips__) =A0 \<br>
&gt; ++ =A0 =A0 || defined(__sparc___))<br>
&gt; ++<br>
&gt; ++ =A0 =A0 =A0fprintf(stderr,<br>
&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;ERROR: =A0%s should only be used o=
n MIPS, x86 and Sparc archicture boards\n&quot;, basename(argv[0]));<br>
&gt; ++ =A0 =A0 =A0 =A0exit(1);<br>
&gt; ++#endif</p>
<p dir=3D"ltr">Would it be better to detect the target platform in the buil=
d system and skip building the kbdrate program for architectures it won&#39=
;t work on rather than building and installing a known broken program?</p>

<p dir=3D"ltr">&gt; ++ =A0 =A0 =A0set_progname(argv[0]);<br>
&gt; + =A0 =A0 =A0 set_progname(argv[0]);</p>
<p dir=3D"ltr">Accidental repeat?</p>
<p dir=3D"ltr">--</p>
<p dir=3D"ltr">Paul Barker</p>
<p dir=3D"ltr">Email: <a href=3D"mailto:paul@paulbarker.me.uk">paul@paulbar=
ker.me.uk</a><br>
<a href=3D"http://www.paulbarker.me.uk">http://www.paulbarker.me.uk</a></p>

--089e011847103283a204dfe14bbf--
