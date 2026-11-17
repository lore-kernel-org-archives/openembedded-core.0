Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.702.1794936052994049456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 09:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yzXLaG2t;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67bee1f693bso4279213d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936052; cv=none;
        d=google.com; s=arc-20260327;
        b=AIwrwpX9hJUcwh4ToJb3ZYub44Q8VF6Z96pbzYQYl3t6ioAjIRdAjmwBm6NcnSL7+b
         7eIqyVSm6ZCi2L4MxibA+nlWQLPlRXgdH6S6S4r+ZHgck8OmTjGcEbsps7E1Jh9jZxQF
         xAeRZdkUiyTIw1WAwxahs0KBd5jq0h36cEvdU1CclyEuSoBisDpMWbPgg6kmgI43xkX7
         WYlcvp6B09qDatXTxywLSrGSSSqH1YthfYwtH9HaiJ42kYikCXIDHUe0wEVz6edTGZEv
         ntGNQ64QJVovle2PZ2DDrhqL4vrF9L3HPodjy6pbFhoZRNzjFPVmzka321JL5O6qI9Wf
         YfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3TwduS5B0+feaeElxfksi8n43Ardc3Le0gWumx2TyHM=;
        fh=3jpKGew6zlpWCwWVOSA3RmOSWYw205GYmcif9DMUcIg=;
        b=kyPJn2WnZ/yUYGkI8q7rEtipkbSgmROFHDUxJY2RLfGoovUVgVZWyR3A/6R7X5Fe48
         WMH97I3gQGUFwsOR8RDEE0VgBgq+++XCcWUcXc1WOmE+By+VYYEy4clGD1TMvmFLqLm/
         ExvbzVsPIzzW2n+rCK/7NX93ngIYydJy3QhTedOcSQ7i5GwxOGox5szzg4wO1oPDYKBC
         mM+j1ahH85jFS0+G9hT4gjC+o4FVkX3a3uwzZL8LJmE6SMNw8t3UedkoH7sG9lPURmZy
         WMP0blryOcBTARuySgPL9dYglVo3N1AobkcQQc5+EHGdXyO5qgJqS9i30hP8ARTh9HRL
         t7BQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936052; x=1795540852; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TwduS5B0+feaeElxfksi8n43Ardc3Le0gWumx2TyHM=;
        b=yzXLaG2tjyEwFBDP5swA5fzuy0ywW5AEL3OLVwfZYWj92AHFJ55fQbcYx3JugJ0hBW
         72gf9pj0axILYokZGQ8gnnS4693rDaKfBv4yQtzRk7RPtCG/RbIxZmC7Icmtoqk+hnjl
         w7cv2d/0lYSZEKfYolnYH2oJ2MJb9jwBX1uQmQp41GAW/h9ZCAoVrR0eQFVlM5iK+NK4
         pIFhuMsiwbZiiWjuW/5vA7Buiy+QliCVEMQXfF3srx4+XN3UtoXxoBfXaJIzrw4w9xcN
         3ByytFtumgQvFcKitMDxPlAcUBB9fxNxOYaAjtK+BPNP5Vvx7BEp/UUTwWA6dGGXxf/p
         Pi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936052; x=1795540852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3TwduS5B0+feaeElxfksi8n43Ardc3Le0gWumx2TyHM=;
        b=z6iHKVaum+9ypj8VTNhbZO6/gjqx7J6KX6ddSRYHdhjJVF368LxMaUFxYYpxts85yk
         rjDLiKgxbd82ao7+KdrwlW50yHYocsncUvr+dsNSs50SqTpvkXx6knUzvcoqCUXsptKp
         jUwkegGKdD3vMCctS3fgKGiMt+SMcuXf5LDQ2m93iTyA+WFrL+V+VCdzV5+6RZy/INNb
         V2Apy48W47a6zYW37qjJZ0ctwNjYj9E10TLFk6rJjx0YxobDX01AxVcBGBUfK/BsJSKy
         ktOPbVo56RPEpzvuSYkdSW2Qm7VlK/V83mLZmwsHptAB8F0fuu5MeIpUyhcVAQMdS8ix
         DPgw==
X-Forwarded-Encrypted: i=1; AL+hErGGgDBH2tSEBfHZ61Svh0XXGPy0US+7AuPm/THLGjijNLcMQdQW0awBUiRvz9Yt2NagNd9m3gquWYKXj5Bdpligsw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/Hf9Yv6uKNyOmV5Ud5FyvR9TGzGjpmhLxNdnoBu9P/9tJjKpzn
	BF/y+xNlyWit34I0vJrYQGDptTOva6GSe5Eg10kfmOk1WIv/+c92fL1YY0iGJjSnVi1ObJeQlnc
	aEybNSLTqmjE2VdA78HIV2aZJa8MYpuM=
X-Gm-Gg: AZFdTZdKSntyXmfk4/DTjcjVyN8qZKtUZCAj8TRp8bYZGkNl4GGTniLzji77JlftnLo
	Gx1VOqkoQkPZ8vO7ORN3HUHpoTjzOhFgfaCvAuewh/2EG8LCmL1QHLiwvtP/Xn1BSgWcakgKD0a
	//AGTwZuq95YW1mK4E7Fk1IVAurIToiy/V2fORPQF7nymQNGK0XT3hAV68VmxChkH7G+KN8taLO
	XzBVb+8exjlHPpl78SUaEys3K182QjoqAcc1uvQknlvKU6a0+T5wf+A9Adb37tZ5YjABhJkjgbq
	abak5PBvypuSFyhTP14XjcnLnZsp/9vIRWQO5z8XbHRQOUJ3ftxhoENWDAPyYxpKaCcu6reIbRr
	doSbo16nwPawPYTpJcpabzX/0Udn/InChyfU0oX5U2HA3NcYjK/kv8rJ1ohpIN8xu51D0YWOvgN
	GHVGIEy+/UZqYlGKlXJ+BrY0GNXz0plhlIqoujDA3gHGNOoGwBdyzNPYcxJVhAhsNzwj/c0pOzm
	6R2AEalSHiBdDo4dKnhu8w+XNLJ3zyrpyu2zGOaGqzeFxmIH+fiadmiMM7BuJFZmwzPQW276Rc3
	WCWvk5PSDRfGigucJM/Bv2YJk9QFt46xtppwvRqIpPU2Gt7PzX3xiZILWGIiCzFxPxGNkDJuU1W
	xV3X58zpY2Bch2+gRNlSEGA==
X-Received: by 2002:a05:690e:1442:b0:67d:b023:9643 with SMTP id
 956f58d0204a3-67dd3f6a9c0mr135675d50.42.1794936051839; Tue, 17 Nov 2026
 09:20:51 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1soWija+eU3x0oK34cdankotbZbz+Z056eDKeyq2TzqG6g@mail.gmail.com>
 <20261116184219.361983-1-khem.raj@oss.qualcomm.com> <DMXD8QI18JYE.139J07RM2331Y@pbarker.dev>
In-Reply-To: <DMXD8QI18JYE.139J07RM2331Y@pbarker.dev>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Nov 2026 09:20:25 -0800
X-Gm-Features: AclHuK_zuR3zCHVC9YyUqmGD0ody2PPmp3MtiEAtL8NDw4cuwpguuDgUwrOwkow
Message-ID: <CAMKF1soGizfJfZisRNfg+rnzfV+DcemrEqWfTVAa31dSH_4JSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
To: Paul Barker <paul@pbarker.dev>
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3b4ef06607c1da4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 17:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250464

--000000000000c3b4ef06607c1da4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:07=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Mon Nov 16, 2026 at 6:42 PM GMT, Khem Raj wrote:
> > ping. Is there any concern about this change?
>
> I think we just need to confirm whether all recipes which have a
> dependency on consolekit are compatible with its v2.0.0 release. IIRC
> there were a number of backwards-incompatible changes.
>

In OE-Core, pulseaudio is the only consumer
Pulseadio also only uses object paths from GetSessionsForUnixUser and the
Seat signals.
It then calls GetUnixUser on those paths. All of these still return paths
in 2.0
so it should work without changes. It skips ConsoleKit when logind is
running.

are you or anyone else aware of something else that is impacted ?


> We may have to carry separate `consolekit` and `consolekit2` recipes if
> there are recipes which aren't ready for consolekit v2.0.0.
>
> This is still in the queue as no-one has yet had the time to go and look
> in to that. Sorry Khem!
>
> Best regards,
>
> --
> Paul Barker
>
>

--000000000000c3b4ef06607c1da4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17,=
 2026 at 1:07=E2=80=AFAM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev=
">paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Mon Nov 16, 2026 at 6:42 PM GMT, Khem Raj wrote:<br>
&gt; ping. Is there any concern about this change?<br>
<br>
I think we just need to confirm whether all recipes which have a<br>
dependency on consolekit are compatible with its v2.0.0 release. IIRC<br>
there were a number of backwards-incompatible changes.<br></blockquote><div=
><br></div><div>In OE-Core, pulseaudio is the only consumer</div><div>Pulse=
adio also only uses object paths from GetSessionsForUnixUser and the Seat s=
ignals.</div><div>It then calls GetUnixUser on those paths. All of these st=
ill return paths in 2.0</div><div>so it should work without changes. It ski=
ps ConsoleKit when logind is running.</div><div><br></div><div>are you or a=
nyone else aware of something else that is impacted ?</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We may have to carry separate `consolekit` and `consolekit2` recipes if<br>
there are recipes which aren&#39;t ready for consolekit v2.0.0.<br>
<br>
This is still in the queue as no-one has yet had the time to go and look<br=
>
in to that. Sorry Khem!<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>

--000000000000c3b4ef06607c1da4--
