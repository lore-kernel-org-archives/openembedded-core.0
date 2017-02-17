Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 533897732E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:30:14 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id x49so46008812qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kVxY2K05IPGVXyPT1tuLyArIM/cNXAw+vBEZJiV0dX0=;
	b=nMNmyMsUCLDQiruJTM2CBViXDg18GmlbSX/oU+7KVcBiAv+sT00jTn0ytvEGqT2tTx
	JmfiX6rfwpJFQANTOY5+NGcpgR7F3jhr80QgDoT2MeR2HWcnLR0Hxyxb7CZlzlIRqHSg
	MltHgxaMhc9meUtJUf7YAZsee6dGDV8k4qHdfD5Brt43BxCGb1T/aK1fZ3ijgrBARE/v
	8fFjKMLlbqLwly/mgYAMAsp1oF1hZx5BtUFxfgBj64TiepapxYOQI2FHq/JUBDKGytey
	UjFXRROz01Sli/WtzR4ojGQxK/0U/UJNi4qxwYFDpgX+UcBlkBk9LG3UAUwzDjr43Y9n
	SiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kVxY2K05IPGVXyPT1tuLyArIM/cNXAw+vBEZJiV0dX0=;
	b=cRHrh6B1VehcK/TIUV+i3dIXOJ7tx2LxRGX59cI1sX9hG6hnE6zRWkgffgjtYdtDJR
	d9vNCxhJ1H9oPOK8h/nlxjQlYVK97ZpS+ZSA0yC+QHYfFzkf9MhBpGM4d/oJcByh8V7p
	FUtD4imIVj3tOpJd6CUTtKcab/7GRmgQ/mRCOLG8w3cE3ndnyGvwBO88Cixc1g9M5vb0
	YECcvpOvxmRZM+mG3BBFF5vWe91zW7r0xB5A4s3PGjctoazUnH5RhYesD4LwWvAKvzOV
	ImOx4wrwE/Smv3sJngf2pRi4mIqc3a7u+JIw11kPD9tFaoCg/YpJn4LpWzPSNTtTNSQc
	6CEQ==
X-Gm-Message-State: AMke39nN+CM4j/oqKHuJGVa+q5mLNgfpfubqEv5RNoRuCcw8Gy0XqDvdGn3aIyOHvHWohAVjdoBj6MR/R86GTSfq
X-Received: by 10.237.39.148 with SMTP id a20mr8929781qtd.65.1487352615171;
	Fri, 17 Feb 2017 09:30:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 09:29:54 -0800 (PST)
In-Reply-To: <20170216211957.23670-1-raj.khem@gmail.com>
References: <20170216211957.23670-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 17:29:54 +0000
Message-ID: <CAJTo0LayVZF5CjD6r3UXZfBORY1TNn3GPUf8ZUTYwyeJdmHdEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] qemu-native: Point python to python2 on build host
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
X-List-Received-Date: Fri, 17 Feb 2017 17:30:15 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d84895c20548bd44ff

--f403045ee6d84895c20548bd44ff
Content-Type: text/plain; charset=UTF-8

On 16 February 2017 at 21:19, Khem Raj <raj.khem@gmail.com> wrote:

> On buildhosts where default python has switched to using python3
> qemu-native fails configure like this
>

What distro is this that ships python as python3?

Ross

--f403045ee6d84895c20548bd44ff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 February 2017 at 21:19, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":14h" class=3D"a3s aXj=
CH m15a48cc6e2f50f46">On buildhosts where default python has switched to us=
ing python3<br>
qemu-native fails configure like this<br></div></blockquote></div><br>What =
distro is this that ships python as python3?</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f403045ee6d84895c20548bd44ff--
