Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7C15C77E68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:58:52 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id m36so56700824qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oc1ilDvHRgUJBj/5BFZQXqVFqiPeCDpls3t1I7ySQF4=;
	b=Yu6ypQo9aygQj9P5zcvEBmpRHWnW8s0tKLkVnliM0Jgy4AxJD94Z/q9bTrSaDYhw9Y
	GTmAiuvi2+WsZTa7QE00jiH7KvjZbrCaQe5FHmrsH5mL1Gx8Wl0FMMLsHwWcaQ5T4Go8
	Q+4dqlIVyH2FpJYxYXNY+BWXSOpHunxka2aDVvL22tcsyKG9cke35Xqf5Q364uGUilLL
	6uvPyRhel65ywWkB0AO021+iPIyqnyAEETnc6yPEHCIVAyJkYPLx0hA7jiG1OIHnGNog
	9grAq6NFHJnifCDAW4g0yt49y6LU9F8p8Dh7TGjeZiHI/2vczvvQBukVVCXH4Xrl5+O3
	YIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oc1ilDvHRgUJBj/5BFZQXqVFqiPeCDpls3t1I7ySQF4=;
	b=h6cJcIgrSdn/EDF3qLqCjAX8FN05nLM0lEaqHhwMPTC0yKsOdqrv/XuJLNgOgO4qAJ
	zwIE7Eb4WSrOwEL8KrOqzx5Xng6wO//gh8Bmhrxp+aaf36bDdcKhF5PXXOpCKi0PO9Dd
	QPCGcgREutwNz8lq8tj8f57YnJLvjWdiabZGUrI2MRPrWilrIWqrsZptgvaIT9a94MPp
	yDSyww5QZ3uRzQdTlWP/CVj2auzYFpR/V7IkXCMR+bvb/6rVdWUMF1uclhkyNukcx5RQ
	obYnzFob5EJOkkuIacae3rSEJqzELY/7LzfX2tD0yidtQSpwo2IByUxs6piUoGkl2lAl
	ovnw==
X-Gm-Message-State: AN3rC/4jqb4GiQSY2NrOY/tn8XujcqWyK/LCS8r221l86u56h8FbH1xn
	ugRWin8dqZK9QmYptw1QWnfNJUZi7f/h
X-Received: by 10.200.46.26 with SMTP id r26mr5308407qta.197.1492124333478;
	Thu, 13 Apr 2017 15:58:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 15:58:33 -0700 (PDT)
In-Reply-To: <1492050276.4358.256.camel@intel.com>
References: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
	<1492010715.26846.1.camel@linuxfoundation.org>
	<1492050276.4358.256.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 23:58:33 +0100
Message-ID: <CAJTo0LZrN4JcO1AjyjqY4j7DcoSoF3oq98nmVY6zURKUseXx0w@mail.gmail.com>
To: "Wold, Saul" <saul.wold@intel.com>
Cc: "Ng, Wei Tee" <wei.tee.ng@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/3] Set linux-firmware to correct license
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
X-List-Received-Date: Thu, 13 Apr 2017 22:58:52 -0000
Content-Type: multipart/alternative; boundary=001a114708ccdbaa89054d14443a

--001a114708ccdbaa89054d14443a
Content-Type: text/plain; charset=UTF-8

On 13 April 2017 at 03:24, Wold, Saul <saul.wold@intel.com> wrote:

> I would like to advocate that this is similar to the kernel, there are
> new firmware packages available for new hardware and if we want to be
> supporting leading edge hardware, we need to have the latest versions
> of linux-firmware.
>
> This is what I consider a leaf recipe, it does not directly affect
> other and is therefore fairly safe to take the latest version.
>
> Please consider this for 2.3, thanks!
>

FWIW, I tend to agree: new firmware just makes more hardware work and is
very unlikely to break old hardware.

Ross

--001a114708ccdbaa89054d14443a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 03:24, Wold, Saul <span dir=3D"ltr">&lt;<a href=3D"mail=
to:saul.wold@intel.com" target=3D"_blank">saul.wold@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1hn" class=3D"a3s aX=
jCH m15b6520d1bde8068">I would like to advocate that this is similar to the=
 kernel, there are<br>
new firmware packages available for new hardware and if we want to be<br>
supporting leading edge hardware, we need to have the latest versions<br>
of linux-firmware.<br>
<br>
This is what I consider a leaf recipe, it does not directly affect<br>
other and is therefore fairly safe to take the latest version.<br>
<br>
Please consider this for 2.3, thanks!</div></blockquote></div><br>FWIW, I t=
end to agree: new firmware just makes more hardware work and is very unlike=
ly to break old hardware.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a114708ccdbaa89054d14443a--
