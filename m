Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id EC1856FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 22:01:59 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 38so3338204iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Z+TJCFqaR95UsvUyYVTdwFZWEXL1mWQ4hZPJyAZjkNA=;
	b=vlK/vMQQuhbq+7+4c1eqlq1eYSU8lD/wHRxDDeheBQizhsQ0TlgZyEw7YE/o/I1W1H
	C7rSy66ceWv7rh6baLIrBEHCkTp5gq+qmRPydAmVq3dqqVTIm2oxeQw4trfFSZStnH6q
	ADYlXUisiBblkKOfqGm2CXwu6v/ZMh+3w9OD4I3SO0/oPTE9t9uU2lFts3WmReQ7Pg2k
	NcD298Y3U8+N43TLm8wO9/ENuuE4aPE+LXwFPIgJkRQUCUHO0GcMr9P7SShg5oBvdOTa
	MHGNDVe+qjzvMdw2W1x6iVR22kRYh8pUckXqIeVZi/OWLayOMVIlLInW2GaXw2ZvfA3R
	4qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Z+TJCFqaR95UsvUyYVTdwFZWEXL1mWQ4hZPJyAZjkNA=;
	b=S9CNmmF8W7Hq5ieS3RY+n2OW1FY/mmX/heBkML+vD/44iIENhdq/sIrs86Zpb7usYr
	GsaZbzDQLj5uWUZBm6zbUeN5HDPT/r8UykvSnudFJocaq0dOWQry5vYuhNQ08gsQIyCw
	giRMyWI0s0A+r7zAIE7IOUs69SE4RVGXPlO9iLhVbZ/SMexlH8Idp5bDi9J+v1ZjNPVF
	8IiCEQ5X/C5QlgWS1seVdNVOIpDC3uA4UZ9XstG0ForDB4jkomXeolkQCookLbSlort9
	sTFnEK5BK+Ng2bm8Nd84VIpptUjfVYS0StCQkMql+9LrdtSLVQaH1NBTsgBKnOWGbLpT
	dROA==
X-Gm-Message-State: ALyK8tLfJiVmXWKS/+lDevQko4armKJcn1iVBNBmfCzlZWs+SryBJc8RBgLLu/Wc91wPdFxwBC4ZXNy+xMUC4+pl
X-Received: by 10.107.154.196 with SMTP id c187mr6905415ioe.99.1468879320048; 
	Mon, 18 Jul 2016 15:02:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 15:01:40 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 23:01:40 +0100
Message-ID: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Removal of uclibc from oe-core?
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
X-List-Received-Date: Mon, 18 Jul 2016 22:02:00 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e172bef0537f01eb9

--001a1140e81e172bef0537f01eb9
Content-Type: text/plain; charset=UTF-8

Hi,

Now that musl is fairly mature I think it's time to take uclibc out to
pasture, where the pasture is possibly called meta-uclibc.

Carrying excessive numbers of C libraries in OE Core isn't really ideal,
and musl approximates the size of uclibc whilst being far more feature
complete.  I have a patch to remove the uclibc recipes from OE Core whilst
keeping the infrastructure so a meta-uclibc would be possible if someone is
interested in keeping in alive going forward.  Is anyone interested in
creating and maintaining a meta-uclibc?  Is anyone horrified at the
prospect of uclibc being removed from oe-core?

Feedback welcome!

Ross

--001a1140e81e172bef0537f01eb9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Now that musl is fairly mature I th=
ink it&#39;s time to take uclibc out to pasture, where the pasture is possi=
bly called meta-uclibc.</div><div><br></div><div>Carrying excessive numbers=
 of C libraries in OE Core isn&#39;t really ideal, and musl approximates th=
e size of uclibc whilst being far more feature complete.=C2=A0 I have a pat=
ch to remove the uclibc recipes from OE Core whilst keeping the infrastruct=
ure so a meta-uclibc would be possible if someone is interested in keeping =
in alive going forward.=C2=A0 Is anyone interested in creating and maintain=
ing a meta-uclibc?=C2=A0 Is anyone horrified at the prospect of uclibc bein=
g removed from oe-core?</div><div><br></div><div>Feedback welcome!</div><di=
v><br></div><div>Ross</div></div>

--001a1140e81e172bef0537f01eb9--
