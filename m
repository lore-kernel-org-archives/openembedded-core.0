Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id AF96A7852F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 20:02:26 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id x42so14894779ita.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m5nBBwfMxfUPLPPnHIQYCQQ7XKAvJf8jqzeoKgHB52U=;
	b=LyeFX4q5sEb+Ta/j02jpxPH003xkzmBQdgVN4zQipJZmfalSKiS8hJJu06LxiIjSSM
	rigyUt9OR7AzVrKPmzmMg32krtaHEcJ+Ui4GudMw/6v1c4vqCEtGJuSgQUaa2oqii4q1
	jLowQce0naiLkfst9lEUU3JLxz0QxR36qvu7iBrLdtsiOMstiaAuJPQMocSnLRLtaURk
	tYNmTMcTFm5ncDS9vJ2PyyqDyfzL3UpDB9VmYaKxnGduSp8ejSiq0AVBLhe2YLpW04/W
	ROtd8ioTl5fAlyfY/Jtr5+QilAcsWlBISlFgGx2Wt8oLpmJSAlPnnhH7x5AvYZqrA6tf
	c8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m5nBBwfMxfUPLPPnHIQYCQQ7XKAvJf8jqzeoKgHB52U=;
	b=fny6Mnpl1ZOHAN/z0KvqzfRY9t0G6DbYbYcbKzYeXtci0lP6B6rhIpJ/bOKJ4fzr+1
	8JNQtr2Grsg0db8Eno2JPqK8rIijACsZ0iH7cMIJKDlUGYKz/78rhRXvybfZUIv4ekEG
	A/kiz2w9AQ1IEq7y6z1LSw52OeeDMKjXFPbcalWb9+t5lY3SOHROxLf8DKiome3+pda6
	5zgpFmf76fHxwCbZzxVmwJcdpADu8el1EUL1WJQlAPtKybkDHZ+TljGqGtUmSZyqv+sP
	kMku495L+1AxxH83l0vZ2WGJBJ2maOpj2Ep20M69x8OslqNdLzPeEuQIL6FOpTnkDGXh
	Bozw==
X-Gm-Message-State: AKwxytfXu9dPxeC3geIf5jjmA/JvNzchyDgTGUhiOGR2sxei8IeVvhMv
	Gn3LMHqhiKVIKvLVRs+7e/2y2Gw0QLL1fKvV0B/VYA==
X-Google-Smtp-Source: ACJfBotmJcIkhmgWV9osUhoKKnCxc2i4rFochoOQJp2XSi5nRhPd2rH6o7R+nS6huQ+4qptCD7a1bXPcU8A7Eds83vc=
X-Received: by 10.36.85.206 with SMTP id e197mr21561525itb.124.1516305747188; 
	Thu, 18 Jan 2018 12:02:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Thu, 18 Jan 2018 12:02:06 -0800 (PST)
In-Reply-To: <20180118191245.9490-1-alistair.francis@xilinx.com>
References: <20180118191245.9490-1-alistair.francis@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jan 2018 20:02:06 +0000
Message-ID: <CAJTo0LZBo8PT1=PUXpTVo6di2xYGZ6cA_OSj=sxyXPjZSH7cgw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Re-add the gettext depend
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
X-List-Received-Date: Thu, 18 Jan 2018 20:02:26 -0000
Content-Type: multipart/alternative; boundary="001a113992426ec23c0563127126"

--001a113992426ec23c0563127126
Content-Type: text/plain; charset="UTF-8"

On 18 January 2018 at 19:12, Alistair Francis <alistair.francis@xilinx.com>
wrote:

> Commit "glib-2.0: rationalise build dependencies"
> (8b0ca0cb54c91611213556bdb99316d5e7ac5b3b) broke mingw glib builds with
> the following error:
>

The error is missing from the log, but is this the libintl problem?  If so
that's what the libintl dependency a few lines up is for, the problem is in
meta-mingw.  I submitted a patch earlier but it wasn't merged by the
maintainer so I just pushed it myself.

Ross

--001a113992426ec23c0563127126
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 January 2018 at 19:12, Alistair Francis <span dir=3D=
"ltr">&lt;<a href=3D"mailto:alistair.francis@xilinx.com" target=3D"_blank">=
alistair.francis@xilinx.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Commit &quot=
;glib-2.0: rationalise build dependencies&quot;<br>
(<wbr>8b0ca0cb54c91611213556bdb99316<wbr>d5e7ac5b3b) broke mingw glib build=
s with<br>
the following error:<br></blockquote><div><br></div><div>The error is missi=
ng from the log, but is this the libintl problem?=C2=A0 If so that&#39;s wh=
at the libintl dependency a few lines up is for, the problem is in meta-min=
gw.=C2=A0 I submitted a patch earlier but it wasn&#39;t merged by the maint=
ainer so I just pushed it myself.</div><div><br></div><div>Ross=C2=A0</div>=
</div></div></div>

--001a113992426ec23c0563127126--
