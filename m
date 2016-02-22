Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id B8BB777196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 14:27:44 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id z135so178709573iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4Qa8IKMq5KCUL7oqeCifW7iMFGASd/on5nQpEIaxyuk=;
	b=WZuLlSsAWxsKh1GKoCJLSUN0+B1onJXy9lbYe+o/HniMpRZ8uJLkf1dDA/0DaFzJMr
	fS5yeR9D1c5lP2iU1kJKnl4cbRuDTb4No1ZPWTmaN7fhJWB4fLtChtR3cjqlaAWnUddi
	plO83lBCaRt95hlWIupeH1+xFkZf38RodUXoZDo0w9lzpOhYVt88/ZP/7MPpu9vEIDA9
	mPX+AVDn6DPnHgProTCDCR93zrPgT1H6r14PE2WY74vWcv2/pOcGxNGNnE6HoJCRlvNY
	pF33afLo0gHdgWjCQ4p/dn3qZriPWdDms1tJVE1QIKoo3s1are6+hf9U4zdwrFTtcLCV
	Z+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4Qa8IKMq5KCUL7oqeCifW7iMFGASd/on5nQpEIaxyuk=;
	b=Uwa5+DR4CmgnXkTZR0FX7109+oJvAhG59vaKmJb2L44+rZ6M5krTp4PRZ1CM2C9pMa
	kWpKURceuA6s/g2yH/wKQuK5q22iTXI524p3jCHoCkYrMPHfhptulkJYpRQd7KdBbfMB
	EExzNo4MXOzLXUeSVr7H84bef4YJ7i4UDKDq0tid3KVZjFmEaojkHK9//xt++jGj5k82
	GPSD+9ewG+/5MzSjVPQ6hxqoULRr5lFalvamcwl+mQK2frvGyjESgiI+LhXWy+hhBXnF
	0qEY7qULLmlXD6UIDYqOEGEIQCF7tHUs9CVzf4yh+vt0QW2WsMJdz8mwFUwqSUVbB1Qe
	YOOQ==
X-Gm-Message-State: AG10YOSFuk0ubfwjCpgLRgujTho4/QFRNDt4X3uMXtTZnTmhJVNhkYx48Kdbm1h6NzcT1FHRZ04M5J9CMokLhA==
MIME-Version: 1.0
X-Received: by 10.107.137.92 with SMTP id l89mr31349493iod.133.1456151264992; 
	Mon, 22 Feb 2016 06:27:44 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 22 Feb 2016 06:27:44 -0800 (PST)
In-Reply-To: <1447858828-17286-1-git-send-email-jussi.kukkonen@intel.com>
References: <25d92033bc37e480de35f031f12e0515fc942068.1447847724.git.jussi.kukkonen@intel.com>
	<1447858828-17286-1-git-send-email-jussi.kukkonen@intel.com>
Date: Mon, 22 Feb 2016 15:27:44 +0100
Message-ID: <CALbNGRT1HfMsy19Q55GgbauJjG3uqBMdAUV7bhr-CFr3gG_6ug@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] mesa: Make gl libraries RRECOMMEND mesa-megadriver
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
X-List-Received-Date: Mon, 22 Feb 2016 14:27:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 18, 2015 at 4:00 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> This makes e.g. core-image-weston actually work out-of-the-box
> on hardware that uses megadriver drivers.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>
> Ross pointed out that the part about mesa-gl was not actually true,
> especially with regards to swrast: e.g. RPi still probably want it.
> So I've removed the conditional bit: all mesa gl libraries now
> RRECOMMEND megadriver.
>
> This is force pushed to branch 'jku/weston'.
>
>  meta/recipes-graphics/mesa/mesa.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 13a8b9d..424e8b7 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -114,7 +114,9 @@ python __anonymous() {
>          d.appendVar("RREPLACES_" + fullp, pkgs)
>          d.appendVar("RPROVIDES_" + fullp, pkgs)
>          d.appendVar("RCONFLICTS_" + fullp, pkgs)
> -
> +
> +        d.appendVar("RRECOMMENDS_" + fullp, "mesa-megadriver")
> +
I leading space is required " mesa-megadriver" - otherwise this fails
if RRECOMMENDS is not empty.

Andreas

