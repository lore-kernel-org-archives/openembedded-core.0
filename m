Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 484D36013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:53:05 +0000 (UTC)
Received: by qcaz10 with SMTP id z10so8594707qca.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 06:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ujRXdPB1zdzKXG/CIXmiUfe7iJrYnam4DzL0xJbwVS8=;
	b=lTAC2CGTvENnqDlLZ8S4QIqwXq8xM1KPawBQqiJSrdfRlgxOaNv7e5TO7OU36+NeK0
	+vxfdUFFoXOXUSjwcYp0ncpEmLPNMPFWpE6bKFjO3nOlLqfsvdW/xlZ8lq5My+VHSXj8
	gkRVVIYaonR3NP+jKO7QThYDVfgX1hOOfNhtwcOyujUpj6qUc2qcsgF9Ai1IqX2ccPkz
	1vUvhPwdDsc+4nkImU7brfiHnRw+TK+GRACBpVVH8pFhZLI1SC/nd+hl5WhfkLo7rQ8S
	05DMLoQfXJrlYNQIBFqAwajT/V3yvPIQ8vzWKn1crSUDc1btvJJ74phl5lt/o5igYGeJ
	dkVw==
X-Gm-Message-State: ALoCoQnuXCiLbndBJsS+5IuAN40VIjZHCapBk8Nd34JtK4/FymWOGRMLtIexOYbP/Q6KSf+JNIxV
X-Received: by 10.55.42.17 with SMTP id q17mr118016008qkh.61.1426600387256;
	Tue, 17 Mar 2015 06:53:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 17 Mar 2015 06:52:47 -0700 (PDT)
In-Reply-To: <55083132.4090702@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<82c728adf7229f85982233033cf23c1c6041069c.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LYgteZ1kuHLj4WJr6D12_9JRD2+McYtO7TVrCAOoUDtKg@mail.gmail.com>
	<55081BFD.40607@windriver.com>
	<CAJTo0LYcmMzAd-q84HhmCO38XJjWmdnGPQAe+X-EqieBoUER-Q@mail.gmail.com>
	<55083132.4090702@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 15:52:47 +0200
Message-ID: <CAJTo0LZNKoLUhpp8otudX45Aqp-DAcRR0Xq1Vijx5-4kE5M6+Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] perf: drop PR
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
X-List-Received-Date: Tue, 17 Mar 2015 13:53:06 -0000
Content-Type: multipart/alternative; boundary=001a11473b1651c0e205117c493e

--001a11473b1651c0e205117c493e
Content-Type: text/plain; charset=UTF-8

On 17 March 2015 at 15:50, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Great. So you'll just drop my PR patch, and the keep the other.
> Just making sure that I don't need a resend, since I'm heading
> for a flight and won't be around for the next 6 or 7 hours :)
>

Yeah don't bother re-sending, I dropped that patch and merged the rest.

Ross

--001a11473b1651c0e205117c493e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2015 at 15:50, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Great. S=
o you&#39;ll just drop my PR patch, and the keep the other.<br>
Just making sure that I don&#39;t need a resend, since I&#39;m heading<br>
for a flight and won&#39;t be around for the next 6 or 7 hours :)<br></bloc=
kquote></div><div class=3D"gmail_extra"><br></div>Yeah don&#39;t bother re-=
sending, I dropped that patch and merged the rest.<br></div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11473b1651c0e205117c493e--
