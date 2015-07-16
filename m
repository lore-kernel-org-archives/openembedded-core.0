Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id BAD8573BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:07:05 +0000 (UTC)
Received: by qged69 with SMTP id d69so8622480qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p3eDWA+IWfdhD4y2c1zk6CXBOeaQmLtCAy0y19YfFeo=;
	b=ERcLOQT8sCLFbOc+5EDZlHg+zonkgWmS1Wqmr6Xbq8f8BZ2FH3RazOkI+KpYFKiupL
	7hw3WwQ8ED5qbUcyvPNFz9NMFyHoLNk7IcfUAGYx8FTqum9mSPReZnRDP3zzsWJ+iaAK
	Wea47135FSueO1gKbfzi903ivyKyWzA5lpYAa28Hs5d9SuL+ezhyzUxZZ4yzOp9uVV/O
	Z5p7zr3R2U8lYGNs6Ooqkb9pM/f7+gjnqKLOHLdv4AjEXNwIjKP6ViAXEH61aomMpIHd
	FYk3s3hZa8dvleJ/dRal0+ZpnNGH5WHGdMDsNTqWrrpArkSPvAuFtwtBubcttXBQp0wD
	RgbA==
X-Gm-Message-State: ALoCoQkZTxotUXxBk0t1kQxZldlPPT//vobd2KDhCEG1GNaG4HqWgLx0NPqBV3I+Cfz300qExzoe
X-Received: by 10.140.89.100 with SMTP id u91mr19862495qgd.15.1437077225552;
	Thu, 16 Jul 2015 13:07:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 13:06:46 -0700 (PDT)
In-Reply-To: <1436943842-17512-1-git-send-email-zhixiong.chi@windriver.com>
References: <1436943842-17512-1-git-send-email-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 21:06:46 +0100
Message-ID: <CAJTo0LayV6KNWX8Na4VU4xdtguHBQTe1A3RZ9bb4Nhr6V4142Q@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix segment fault in lib/psm.c
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
X-List-Received-Date: Thu, 16 Jul 2015 20:07:09 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e8b551c051b039d47

--001a11c1334e8b551c051b039d47
Content-Type: text/plain; charset=UTF-8

On 15 July 2015 at 08:04, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:

> Add null pointer checking for rpmpsmStage() function in lib/psm.c
>

This doesn't apply to current master, please rebase.

(and fix the capitalisation in Upstream-Status: Pending)

Ross

--001a11c1334e8b551c051b039d47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2015 at 08:04, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zhixiong.chi@windriver.com" target=3D"_blank">zhixiong.chi@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1s0" =
class=3D"a3s" style=3D"overflow:hidden">Add null pointer checking for rpmps=
mStage() function in lib/psm.c<br></div></blockquote></div><br>This doesn&#=
39;t apply to current master, please rebase.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">(and fix the capitalisation in Upstr=
eam-Status: Pending)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11c1334e8b551c051b039d47--
