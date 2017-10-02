Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFAB771F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 22:05:59 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id 85so9320103ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 15:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KkTbNtK9eLUPgZB8km8c5gIs6zFqUzGSpAI537uLe6A=;
	b=bLXRVCO27d9/3m8FK1HhxX9V55rGkl+8r1/cePD/t3SpY0qTTo7Cjc1tCBIK4FahIc
	SHWUdpXL4B2ImDSx7fQqzdg1txp8oE92O40T0FRG6Q5RKRIBY0thtcq8yeBLDLz7Wklj
	gGHEVIwO0oQXbG8nd75pVvY9LAbYV8pF5h9SRodefCFg7Ux7GteUs7UKsxjpjpc37qyd
	sXY/FcxtyZNJNTqNjGDvELNO0fEiKBG0l4aE6GLtCG+wd2R5Oq8UzjZOR1oNmTx/Bpe/
	xy/hcsbQN3ocnc6CWYVajU0/QTC9m3a1QwP8P/dwt3je12NBs86EVPs4Fp3fbTnjKKpP
	ak6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KkTbNtK9eLUPgZB8km8c5gIs6zFqUzGSpAI537uLe6A=;
	b=b9q/aAoEMqRzKroRCBB9g6Q154rIlb+T95vJC143Df13t84rEldWHXeIUP12cFPhZ2
	r/uuhwrb8rjc1RCAE3DFSUEPgDVhuTcHruH6pWGqfTru1MKCFPP6l0Ck5T2nRcLd153M
	t4ESaWnc1+NK5l79788IbggzCVAw6OPlYkVSJDnWuubiI4QUGFytlOXJU7mPY06D7iHb
	yhaV/Af/SG4N32dHxcT5ReYSwPZZC/UfiJEC5ZFygzPFYukbxUFG5tPeGotCE8ngOmAK
	zsHf4V6DFN7nrV7wDmQoKAtQmdruCTANGQkG7sDFV8ZDUjSbpHTHJt9LHylxpK9/0OWc
	dDgA==
X-Gm-Message-State: AMCzsaWycci6qM+oLpB+Y4iqO1ZJzP+zwriDkF+mW2kx8Q/2He8pTorm
	jhhcRvIUZ275eTElfcJHIOjt5uLMxRrn7oU6hTxrnQ==
X-Google-Smtp-Source: AOwi7QCt68eLY6ykpvJIxmz79mgdtFc6macGWGFedv/pxBIkfI71NF92jard+5CGJyvRLaOzlm3k8sqBIMWjZB6vm6o=
X-Received: by 10.36.162.67 with SMTP id o3mr2758113iti.27.1506981961350; Mon,
	02 Oct 2017 15:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Mon, 2 Oct 2017 15:05:40 -0700 (PDT)
In-Reply-To: <CAP71WjwMd7F1ZB+et7W_rBhh=dmk-g1OXqyEjTGF7+-py9GGYA@mail.gmail.com>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
	<CAMKF1src=fX9LRauodhyBtWOBgpYSRYKukFN2x9t5srkPxAsrA@mail.gmail.com>
	<CAP71WjwMd7F1ZB+et7W_rBhh=dmk-g1OXqyEjTGF7+-py9GGYA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Oct 2017 23:05:40 +0100
Message-ID: <CAJTo0LbBTXoPGJWs-eU7T4uKA06Y5RP2A6zDnKBAq5c7EKFekQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] gstreamer1.0: upgrade to 1.12.3
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
X-List-Received-Date: Mon, 02 Oct 2017 22:06:00 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a27d695a055a9794f3"

--f403045fb2a27d695a055a9794f3
Content-Type: text/plain; charset="UTF-8"

On 2 October 2017 at 21:49, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> I have seen these patches on master-next at some point, and they got
> dropped. Was there any specific issue?


They were pulled in briefly for a test build to check for any serious
problems, but as I'm sure you're aware from the weekly status emails sent
every Monday master is currently frozen solid as we built the first 2.4
release candidate last week.  The current schedule is that we release 2.4
around October 20th (again, this is in the weekly status emails sent every
Monday), once that has been released (or maybe earlier) master will reopen
and patches such as this will be merged.

Ross

--f403045fb2a27d695a055a9794f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 2 October 2017 at 21:49, Nicolas Dechesne <span dir=3D"=
ltr">&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">n=
icolas.dechesne@linaro.org</a>&gt;</span> wrote:<br><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I have seen t=
hese patches on master-next at some point, and they got<br>
dropped. Was there any specific issue?</blockquote><div><br></div><div>They=
 were pulled in briefly for a test build to check for any serious problems,=
 but as I&#39;m sure you&#39;re aware from the weekly status emails sent ev=
ery Monday master is currently frozen solid as we built the first 2.4 relea=
se candidate last week.=C2=A0 The current schedule is that we release 2.4 a=
round October 20th (again, this is in the weekly status emails sent every M=
onday), once that has been released (or maybe earlier) master will reopen a=
nd patches such as this will be merged.</div><div><br></div><div>Ross</div>=
</div></div></div>

--f403045fb2a27d695a055a9794f3--
