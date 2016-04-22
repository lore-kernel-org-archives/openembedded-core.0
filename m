Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 02EE86E6B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:07:36 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id d62so23672723iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N1pPwxzX+EWH3LHKGzqVwa5Lx8FrjkhB6pFPQi26tcw=;
	b=jk+N9dNRAXC/HJlkS9Kg5p70xJnks6ISxJpTYoEVjwhACSgzLjKTdfMNpURuwNKy/D
	kRXqIyHq3NERd2CwVYVWJ4Xax7xrNOYi2hhRCd3ykfI74xzgDGcO8l8U5eEOvsfs8viV
	NcAP6+00Y3X3g9LOK+CVWbIw7Fo50TLx8+Gy/dLSzquWKq6qkPRCyE2mgJ+wkpQrRGrx
	9cWlmvZ95EHeVkN3Ilwv5WhKEKMeYARxzsh4hfhmI/mfaNB4XHqAXAJU2b9Wa5TYTO5F
	dKZa1Qb/pEGFyucqmy+urwxQW+xVXj15xWNx3a1x5fZrA+VpdsNKndpS6Taqumv0HDEa
	PAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N1pPwxzX+EWH3LHKGzqVwa5Lx8FrjkhB6pFPQi26tcw=;
	b=gAYPgoDvBRlUegSbJXiY8YQx4373z5joQ75/xaYfv+bNRWKDz7RfGvZW+Rxg7rEJVe
	CQWqx360WJWfS9FDj88MxUH/mRmoFzNkSoyiUpYrlfx0UqNSQnl9gemidQ/aOf2geZqi
	0pG21/gj/pv2orf9XBiExX33vTRBooQZJcwX8kbCeAK4W9vLu8M21heHguEBAWjnxEtA
	U1DV1MeNNgnYAPmmiBnopH5WF5iMp8D7T/SqE3L7u/X/9+jMBiPWhG9wzy789+h0++jP
	qe8HBP+ugZWPQafJRM6waGsOR4X/tF0R1zDMG5XWUe0a6FNzRJ6OO7q2hUhACvz4B+PU
	waHA==
X-Gm-Message-State: AOPr4FWxnjLuKVxAS1GQFa9DncAWbOcWK9/TFkRQasRX5gJLCp97eeGca+ZUawEHMCveFTC5dA9FztBKG1TQXZhF
X-Received: by 10.107.16.104 with SMTP id y101mr21518224ioi.148.1461326857113; 
	Fri, 22 Apr 2016 05:07:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 22 Apr 2016 05:07:17 -0700 (PDT)
In-Reply-To: <1461320780-50763-1-git-send-email-noor_ahsan@mentor.com>
References: <1461320780-50763-1-git-send-email-noor_ahsan@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Apr 2016 13:07:17 +0100
Message-ID: <CAJTo0LZ2U9JjhW93v72tQR4q6DP3jFuWORa2+Thk6+V-B5nzvQ@mail.gmail.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cups.inc: Fix ldflags warning.
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
X-List-Received-Date: Fri, 22 Apr 2016 12:07:37 -0000
Content-Type: multipart/alternative; boundary=001a113ff0203831c5053111aca4

--001a113ff0203831c5053111aca4
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 11:26, Noor, Ahsan <noor_ahsan@mentor.com> wrote:

> +               "DSOFLAGS='${LDFLAGS}'"
>

No trailing slash so this doens't parse.  You shouldn't need double quoting
either.

Ross

--001a113ff0203831c5053111aca4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2016 at 11:26, Noor, Ahsan <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:noor_ahsan@mentor.com" target=3D"_blank">noor_ahsan@mentor.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hx" class=3D"a3=
s aXjCH">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;DSOF=
LAGS=3D&#39;${LDFLAGS}&#39;&quot;<br></div></blockquote></div><br>No traili=
ng slash so this doens&#39;t parse.=C2=A0 You shouldn&#39;t need double quo=
ting either.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a113ff0203831c5053111aca4--
