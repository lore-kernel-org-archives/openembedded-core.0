Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2716860125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 10:19:59 +0000 (UTC)
Received: by qgev79 with SMTP id v79so84473874qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 03:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EGaAFhbsEWfue+GOJAmhOB7ulaOVKhJizPpDZeSFeJc=;
	b=SWqAV6W9NhWCckvTsvHhuYfTcTsmsIq0853FqL/KcZgwnOMl9lIcpVI8L7JiB/s4AF
	sXlwb3UhTP2XJO9bVnb3VOPuJ3d6Lj8eHmVslBnz52AL/nt/bz93JUbRHbDFHrNIjqnT
	nytBqhiAvuhU+xP+LXjBiHIKtQmYrCxWXDoprxua7LPFMcvHM3YeUNvosQFWy1y4TzrI
	Bw8ddVzoyCEUiWMb5YchoCGF+MWeKXsQn37TvFybPp8Lr7t3p9vNNiNkvBzIz90wNAhR
	EZooNY1yVBDBzCpdlxO53Pr0+J7F1MUeYqInpSrEQVK3yCP9NM8/evcU7UESR7bXJ8Mw
	fDGA==
X-Gm-Message-State: ALoCoQnQnuoafBX1MEgcJi78rBVt7uzf4ZsqpfyAT5LQOSlRiyI80Kq+cmFN8hOtpHYdLRcj/E8P
X-Received: by 10.140.235.147 with SMTP id g141mr21576329qhc.22.1442830799327; 
	Mon, 21 Sep 2015 03:19:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 21 Sep 2015 03:19:39 -0700 (PDT)
In-Reply-To: <174AD7CFE5F468498ACCFE3FEE0EF1EB142C089D@IRSMSX102.ger.corp.intel.com>
References: <6871706.tbebiTIoD4@peggleto-mobl.ger.corp.intel.com>
	<1442565245-16632-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<174AD7CFE5F468498ACCFE3FEE0EF1EB142C089D@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 11:19:39 +0100
Message-ID: <CAJTo0LaMfcabqJ9iLqq61eD=H+bfv4jpB5W=P_KBDZZS-4VK8Q@mail.gmail.com>
To: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] selftest/buildoptions: pexpect not a builtin module
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
X-List-Received-Date: Mon, 21 Sep 2015 10:20:00 -0000
Content-Type: multipart/alternative; boundary=001a11376e6e43efb805203f39c9

--001a11376e6e43efb805203f39c9
Content-Type: text/plain; charset=UTF-8

On 21 September 2015 at 09:37, Istrate, Daniel AlexandruX <
daniel.alexandrux.istrate@intel.com> wrote:

> Just want to point out that 'pexpect' is an unused import in
> buildoptions.py. Unused imports are also unittest and logging.
> Instead of try-catch an import that is not used I think it's best to get
> rid of them.
>

Totally agreed.  Can you send a quick patch?

Ross

--001a11376e6e43efb805203f39c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2015 at 09:37, Istrate, Daniel AlexandruX <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blan=
k">daniel.alexandrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div id=3D":4a2" class=3D"a3s" style=3D"overflow:hidden=
">Just want to point out that &#39;pexpect&#39; is an unused import in buil=
doptions.py. Unused imports are also unittest and logging.<br>
Instead of try-catch an import that is not used I think it&#39;s best to ge=
t rid of them.</div></blockquote><div><br></div><div>Totally agreed.=C2=A0 =
Can you send a quick patch?</div><div><br></div><div>Ross=C2=A0</div></div>=
</div></div>

--001a11376e6e43efb805203f39c9--
