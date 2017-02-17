Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAE171AC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 14:55:44 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id u25so46010325qki.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GuCfaofN8O6tlSzysQd7KHrUSSl1U7GRC0M9r2SAZgA=;
	b=0oZOKalaxGW4n9UuzxO83sqCWWj5l04DP1eCy4cDFNUj88z06TnBduYDb5N1He6St6
	egoTZxPuUEMN3QZLy44i2Zo0dGNTK9QDyRtAvJpDdfpj9wasJ9BnclpUy5V6cvhzyK4i
	FdVEWof0KVH4+zHB5DbE6KN1d7k0KXugdIddtfmo/BLKOiohPSGQ3US64aJbiZm17FLn
	3VAnVX+dNOq+SdLINEKDVh+4HFX8YZGyRaF5CaxpTkrF9MbQc1zqIeIGmD5+tNSs3r9d
	IXkNe5o9XIgh3lWDvJOTGfYglJTRwdt/atglu4eTWnICG3l2gOZ0TLbIPSuEuKOPmKMZ
	tW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GuCfaofN8O6tlSzysQd7KHrUSSl1U7GRC0M9r2SAZgA=;
	b=j+BGao24BHDLHzaZz/EIHxkKUA/mQMu/ys8bV5Ayy34aehyBpZEZ9UFhd4o9omkhMS
	kSl5PWxO2xdmqgnaGs4L3Tzhb/0ypMhr+nkQcazy8LAsqGKlT/RBa+0eb84oo98oWzsg
	RHeu3Lj8OaMqYXVaie98B7muX9bXBQrmspFE5eugG3ydU7zQgB5uqJLsCMDnjoaiVmeU
	eT+vTwigwHPqFP/DPavoWconn+LT7WigLAtzNGYFIsfZTx+fary8F0TsZbA+3pKX/Am1
	OVpgP5cO7rLxl5KyPvW64GMIrrOh2tG5Joxmnz6KznojnXqq45ck/X5xCLvZ18UBb1+k
	YK2g==
X-Gm-Message-State: AMke39mRcjZ6iTzUpiUKZ2zRSQfeKsqbXalTivnbpCzk6ozWO3KIdjHlrJ6tV4JvKp/4gJQr2w06BWmWoLXNMKFn
X-Received: by 10.55.1.134 with SMTP id u6mr9016060qkg.36.1487343344394; Fri,
	17 Feb 2017 06:55:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 06:55:23 -0800 (PST)
In-Reply-To: <CAHiDW_G-ijuEC9CvPOpQ1+S2NYciDMJiJQnzOecMycL5y2ojQg@mail.gmail.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
	<741d53dfad8951845bcae6ad8f7dfb75936db620.1487065337.git.jussi.kukkonen@intel.com>
	<20170214224203.GA3023@jama>
	<CAHiDW_G-ijuEC9CvPOpQ1+S2NYciDMJiJQnzOecMycL5y2ojQg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 14:55:23 +0000
Message-ID: <CAJTo0LZsZdWN3+7ipSP_bzeXBz-UA5ZiKmvUMTcd4S5dxq068Q@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] mesa: Upgrade 13.0.4 -> 17.0.0
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
X-List-Received-Date: Fri, 17 Feb 2017 14:55:48 -0000
Content-Type: multipart/alternative; boundary=001a114046c4b3f6d60548bb1b6b

--001a114046c4b3f6d60548bb1b6b
Content-Type: text/plain; charset=UTF-8

On 15 February 2017 at 09:06, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Ross, let me know if you'd like me to re-submit (the piglit changes should
> be fine with current mesa though).
>

Thats fine, I'll just drop the mesa upgrade.

Ross

--001a114046c4b3f6d60548bb1b6b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2017 at 09:06, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Ross, let=
 me know if you&#39;d like me to re-submit (the piglit changes should be fi=
ne with current mesa though).=C2=A0</div><span class=3D"HOEnZb"><font color=
=3D"#888888"><div></div></font></span></blockquote></div><br>Thats fine, I&=
#39;ll just drop the mesa upgrade.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114046c4b3f6d60548bb1b6b--
