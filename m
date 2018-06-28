Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8118874966
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 15:31:19 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 188-v6so5556985oid.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tlLIQ/oR7JWMR6B1EV9huulthHNMLFZGzlw67CjGHTY=;
	b=AzoeEuRJaYjFQoEjL9+R+c9IaIpmoSpV2ozduG0azc0fdt3XYbOQ/pYzhYtGJRxkLW
	uYFLEldXVcidr/acRZSkDYCOI5WWTvtYNpi3+I6ZZVmC+S10E5Wt1hfFiSGIngW9/IQV
	j6nN5D4sc4Ak0b83tHtVLG9nxH4v2T/PyJdDJPTqOk1GJw08yRCd0I4P7ucH1SN20v7j
	l78yAkGMfT3zsGOo5Ao2zKR4rcVCfEIc39j7/fipqpuEM5zKeCN9f0BJU+Ngr6vGVClr
	3ujjX5ENrHxlYynXsJzI9dqjJxqx7tcg4d66Mhdf0X/2v5HI+UzmqhcCTs3ir2qHSLpl
	uuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tlLIQ/oR7JWMR6B1EV9huulthHNMLFZGzlw67CjGHTY=;
	b=uJNesdBRgCotzCPLr2OUse+v87hde34a+yi62pDgFOzZSf4QsvCYEkoywWRkDjN/4C
	HUSGMMujDxA5KRIbZuCZz5lLLq6KY+oyfY1cr2PunHZHqGA5v9/TUu//wUe3yUjhXuas
	W4g6fl6j526X3zPTdpgHr+OKMoeWFtFNsC1lCTo//d6mgt58VF5uEUgjhVYhXRGiiVh7
	+1b/eqAk25GcQEBnHA4Uj3dnRE/o057VnzSO/5jctKgjXOw1KdkmULN6zakg3HQ1OvtT
	xSleifv67iQC3j0MDU3wrs4vMc0ZsDTt+qabu5tFTqIvZqSiyvTZzY5nHGtkcxh03SjD
	pfiA==
X-Gm-Message-State: APt69E15kuG4wdDUEiH/RbWg1B15AJSvwdNC7POe20/ur5LHh8GQtqLP
	eO30VrzJuUhLe6v8MDD+3+G7+sHKUejMYi/Vp5E=
X-Google-Smtp-Source: AAOMgpf7cNjldu4Gkz+yLA07Vp14o2jrfKovIKQkWvKM+5WhrPaVaEbym2SzXxRo+PazEkSRkHTuUVsdQk4cYE3NJv8=
X-Received: by 2002:aca:b285:: with SMTP id
	b127-v6mr6229440oif.130.1530199880120; 
	Thu, 28 Jun 2018 08:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
	<4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
	<257c6bc25cc803109799796700bae278d3803d33.camel@linuxfoundation.org>
In-Reply-To: <257c6bc25cc803109799796700bae278d3803d33.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 28 Jun 2018 08:31:08 -0700
Message-ID: <CABcZANkB3nH2VGMAGxtTYZu2XZfsfLc0Ch55GkpmY7peN+cdSw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH 1/2] image: Set COREBASE as the git directory for timestamp
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
X-List-Received-Date: Thu, 28 Jun 2018 15:31:19 -0000
Content-Type: multipart/alternative; boundary="0000000000004a41c0056fb56ca8"

--0000000000004a41c0056fb56ca8
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 28, 2018 at 8:29 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2018-06-28 at 15:18 +0000, Peter Kjellerstedt wrote:
> > There is no guarantee that ${COREBASE} refers to a path that is
> > under Git control. E.g., in our case it refers to a directory that is
> > under repo control. "${COREBASE}/meta" is probably a better option.
>
> You could make that argument about /meta too.
>
> I'd suggest the code checks for ${COREBASE}/.git and if that doesn't
> exist, fall back to the timestamp of the
> ${COREBASE}/meta/conf/bitbake.conf file.
>

That's a good idea, but I'd suggest using bb.utils.which() to locate
conf/bibake.conf rather than hardcoding that path.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000004a41c0056fb56ca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Jun 28, 2018 at 8:29 AM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Thu, 2018-06-28 at 15:18 +0000, P=
eter Kjellerstedt wrote:<br>
&gt; There is no guarantee that ${COREBASE} refers to a path that is<br>
&gt; under Git control. E.g., in our case it refers to a directory that is<=
br>
&gt; under repo control. &quot;${COREBASE}/meta&quot; is probably a better =
option.<br>
<br>
You could make that argument about /meta too.<br>
<br>
I&#39;d suggest the code checks for ${COREBASE}/.git and if that doesn&#39;=
t<br>
exist, fall back to the timestamp of the<br>
${COREBASE}/meta/conf/bitbake.conf file.<br></blockquote><div><br></div><di=
v>That&#39;s a good idea, but I&#39;d suggest using bb.utils.which() to loc=
ate conf/bibake.conf rather than hardcoding that path.<br></div></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth a=
t gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior So=
ftware Engineer, Mentor Graphics</div></div></div></div></div>

--0000000000004a41c0056fb56ca8--
