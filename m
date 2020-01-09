Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id BEE2D7FD62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 14:36:18 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b4so4290967vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 06:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FRWNqiYOQPg5KTASK3uzg3KUaH4OzmywPYDlDFFP/Us=;
	b=Cp1sq9i81Q6VhnGslnYNUfV0KafMW2c0uTq9VsQiM1S4vEz7u5zindGGIyJIdTZKN0
	SNLxXT0r3amoJ2Nc4spOdmWqzwN7Q+2VoeFhjjrd2o5HcuThE9nELAxHemjJwre8yfa5
	w3IRuvln2NBXHDlcZlLPjoEgfumvFC1IyZXKmUsLXnAmm0iMkabNhgSkZhlEy30HaQWt
	AK3V8OMPlMThN7dnbKzQdGqvGg4hdL0GHL1J05M4PxyITXVo+G7tCIsJgb+twtoWy4b8
	CuFVDRJ/cUaCWZOK2z+lp8jhc+qkGDKIafPUywks2TmTZjImlx/rfM3yislMV4VnAWJr
	WndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FRWNqiYOQPg5KTASK3uzg3KUaH4OzmywPYDlDFFP/Us=;
	b=ik0iUCp5YoOFMYCa75JT750LPwEKuWnP7VygjkKE27nm91S40GysFG88YzFUtr2H1y
	pDxepFdj2ldlFg6Z7H7edTrCY4/UMT/mGqjJCM0+scdLxuTNlQbiFHhfC/5BIrw4fQOG
	uAjT8TRGzhLSRImMsDNxn9H9c8vg2qcxttTMLPQSZKa2sCpeYvJwsCEQYv9G0iDQ8jJf
	5TgujNicY08SaCP3ZTMiDTUI+mcIiC2tHnVjKPuMW0f9srP4trOpbKW/RJnPwGDtuSjV
	UVd2VqIX3w5TgpZd0+fVNo6wfiMYbV2pBKDew0D9Q179y5c0UvSNXlcl/QlRUaaGsw3t
	XZfg==
X-Gm-Message-State: APjAAAXZTirnmk/5vbhMJMC3vZ08LhMCRP3yW3l1v2OZLzUSjlHk/89I
	wx/GFqb5/jRRM3EX8cLHGgK9tcO8MxaoWX4l+ho=
X-Google-Smtp-Source: APXvYqypWso89L8UVNn43nQKfyjn23OFZgkx+eRO9ZtIhe7hIviIeKHB9/rp5LptTmKn184bhfFzkHjTc4b6czZ6GyA=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr5937647vsa.25.1578580579322; 
	Thu, 09 Jan 2020 06:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
In-Reply-To: <e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 15:36:08 +0100
Message-ID: <CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 14:36:18 -0000
Content-Type: multipart/alternative; boundary="000000000000ae0f64059bb5ee97"

--000000000000ae0f64059bb5ee97
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 14:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> That may be but I think this is an oversight, not an intention and we
> should support busybox-free images...
>

Right, I'll fix the build, but the implementation of runtime testing is up
to people who need this kind of feature.

Alex

--000000000000ae0f64059bb5ee97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 14:55, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
That may be but I think this is an oversight, not an intention and we<br>
should support busybox-free images...<br></blockquote><div><br></div><div>R=
ight, I&#39;ll fix the build, but the implementation of runtime testing is =
up to people who need this kind of feature.</div><div><br></div><div>Alex<b=
r></div></div></div>

--000000000000ae0f64059bb5ee97--
