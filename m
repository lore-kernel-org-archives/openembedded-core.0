Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10813.1792510975789643596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LRRHhUMC;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679e86015e2so830602d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792510975; cv=none;
        d=google.com; s=arc-20260327;
        b=pZGIexxcXkMd1CmfOHjXsXvqEkTKuUN+Hq2jwxoEJdkCRk1zlEiT+SRSHFgRhiuWr2
         gMnu/xxLzKBJjP9DRUErvm60Cr3sMqxx1dRpMWecBnsV4H1yJJ9bpu8Z6EeUtY/ZQlvv
         WoonsSwlXsFxEjBEtLlNeZOetYsF65K4eMh7zqhrVFv34oNrJcuOjOmAHJhCrnVr31Le
         xsoAzJL6XUhw3o7lsuazIKmC4CntUNgF0FtTw2L/ixT9VlyfcNtVXUifoMm6dc/dE6Ss
         Rh9iVFHajEDtscgITXAQ5BiQIkc8RhI3OkUptiHtkSk5PFUVfecO5M1rwW9KmXiZ72Rc
         fOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+sNluq3DB8MD9w5AKFWYcVYFEAWWwSEGZ1HUqmL4cLo=;
        fh=TwfL0NBaaK6xM4zel1VItsAhL49JOpnCuVACFQdgGjA=;
        b=pUmbZ1n3lJW6Cfa9yW6SO3tww9RtVlGKg7eKaFFRqplJR+KQSw1LNcKRazMwa4f76R
         E8lSpZm/293bHiCan+pv4lNeyfGD0PH4Q1iUmbAh4FDE35PcZjm6sMCGc48NGHfDrrO8
         7ZnaK7SjGcyITemMlWUa/aHPJ3Uts/QsPaiV3l33cyKfdcjE6EQq7VJbFztft27zxQSS
         ZsGcN7RcbceE2O6X+NfWWRq7P5RrgdZUplhxGDShtu3oJzStoLhonstnoAEJbaKaczwY
         aoG31PGvNCUEwCyH0Xs+faGV8DnYWN115b8+n/RVEbuKjtoKuEPB2l+ZbR2WKPbgNgo/
         XfXw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510975; x=1793115775; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sNluq3DB8MD9w5AKFWYcVYFEAWWwSEGZ1HUqmL4cLo=;
        b=LRRHhUMC3YKw/6mJvwZDoiLk4NZY+8OTU9DZrGmBtGHWGKNO6dIEVEeSxt+iJMMbSo
         OaFZsZ7bN6gZO0f9xnNdHocYpwYY8/o5O4hSNHBs85f+Ed4gsg0hqmH+ue3tLJLqQoXv
         uXGzKn5yiXJxEfBxvv9bQhbpi2ugBHIpRXcH7Ig994eP1SXDP49KVutrtYNYjVbxTPyw
         k11OXB6SVQOtOumYcPEvlX8/gCdZQDZUDYPh/nNUAfi967IM04ebVsbVmvld+bcDhdTq
         6LSH/Y6ZPQGZTsbpeTGWq4OO2w9FTIKbQySEXZkps0stq7JB2t33/GXG2lEmW9M7Uq1E
         kVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510975; x=1793115775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+sNluq3DB8MD9w5AKFWYcVYFEAWWwSEGZ1HUqmL4cLo=;
        b=PJ+QDC9K0G7uLpq48Jv3gz0cP1ElkSJOaAsVQGOdrxCIKe6RTC+MXh0rZqIa7Mmv1M
         RYB7Occ2mla51SV9sq2OB/bQm4s1Rb465bG4U0N/1X4H4+CEeVOaVl9ekN6k6Q5roEHf
         eSlDW5GiD1/ZEkWbI33mrYY8qgiv/rTp61gNcwOthEcZkKvUkj6iVoL+wH/q43SS4OpA
         ltZ8k+pkj3Pmpo2i46yDMNfAGS7Rk9ojpgN+xK6rPSy2oF2Xo+sIEYAjra9kBujG/1qc
         NeXUYa3yISJXIn+AGdcYX4FJMLP1LI9eFzQ5V4fGRu+9lJWJXPN5UKDFixQ5zRZRyoLK
         Mh6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZPjAWg80fT9Ou1xXEQE2b7lphaHNbsRBqM4QoHu0Enm518tlL3MbwmY11DhsSUF9S6NfUHQUkIQ9GqfjWrilBQA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL1o6VMsVx6pqhXWPft9CjhRIvKVbLcSfABaJXSmNd0SasD344+
	wB5YL5vTF+E85R7DKw5GDRoihGjpa1mGtSwKJIpVxqJaN+x0XpGGdbyG8Ktngvaup2Bf09/wN+4
	ft3Iu+AINex2207y3Snyclu/ht5Nil4SC6g==
X-Gm-Gg: AYBFou24J2Nd8/HPljH39Zb31BpBsvq1Txig7VTe9vWL4rmeWhs4JTztiRhMB+vNaJB
	Lfs1k4rSPRgmBrUTxnPbfLxqoqZLy3GnapipVzUivjBy9qntNcZ/Opt8ueYIuq3a+NocbEZENUc
	WYgNXa9Ui8ToEiYhbRVAoCmKAZLDNPCYePDN7Mj2vIYwq6Pbv9hses20N3dVehnl9Dt6wjARD5w
	KWa6wvvA4GxkI1H3PR+UIrvMaDYd2Zbu0q3GAofAVFHNeqTfm7vKf0s6f+siOwU4tcalMyk0ujD
	TFSiRzMsx8mks0xzErR6XdsEjmtvmkGnLEuLw+MVuYOy74WkW11w6oqhispuVhEqc18m3F1ywos
	KG9j5UmnvS3LKRiTjZlfcsCa8zVKZW8iUrjc5O7hI2B5TGk4+1C81pQtsDs097KuDoMPPuW7Cg9
	BDxt9UwMG7BPoli68f7XiShhbx/vR7ttWscDp6CefzMTZeWL65JuKirW9w6lB1idzUNHyExNWR1
	/7+sExtU21WxktNYiq2Trj7bzViVCeDrVXQWCK7XkMOadVN417egfw25f7qF8iTATIhf5BvOHRM
	xHINvnEm758ErFWHTGdnz/iCZJgARK41/r9AfOM=
X-Received: by 2002:a05:690c:a20e:10b0:8b0:a171:65f7 with SMTP id
 00721157ae682-8b120166338mr6188597b3.19.1792510974765; Tue, 20 Oct 2026
 08:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
 <20261020092931.4330-2-jaipaul.cheernam@est.tech> <DM9Q75SEZA82.3LDAH4WKTQUCF@bootlin.com>
 <5d063647-f13a-48cc-afff-a2ef9688e281@est.tech>
In-Reply-To: <5d063647-f13a-48cc-afff-a2ef9688e281@est.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Oct 2026 08:42:28 -0700
X-Gm-Features: AclHuK-1v9AiWleRxfynbQnTK_b2GSwcmjLQTc_azegVgxnlCR3FEOgWjqb9ut4
Message-ID: <CAMKF1sqynWn=yh8wvGovnKXzSbA3dzYwF8AOGfNrfg3z+J2B-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] elfutils: upgrade 0.196 -> 0.197
To: jaipaul.cheernam@est.tech
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e82e65065e477b28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248305

--000000000000e82e65065e477b28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:33=E2=80=AFAM Jaipaul Cheernam via lists.openembe=
dded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

>
> On 2026-10-20 16:13, Mathieu Dubois-Briand wrote:
> > The log in there is really verbose. I hope you can extract some useful
> > data from these few thousand lines of ptest log.
>
> Hi Mathieu,
>
> Able to identify the problem and verified locally and sent v2.
>
> Actually recipe is expecting two test cases to fail but those are
> passing now after upgrade and dropped that change.
>
>
>
elfutils ptests have had additional failures with musl in past. Would be
good to check that. There are also failures when using clang if you want
to be adventurous might look into validating with clang build as well.


> Regards,
>
> Jaipaul
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248303):
> https://lists.openembedded.org/g/openembedded-core/message/248303
> Mute This Topic: https://lists.openembedded.org/mt/121846288/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e82e65065e477b28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20,=
 2026 at 8:33=E2=80=AFAM Jaipaul Cheernam via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;jaipaul.cheernam=3D<a href=3D"m=
ailto:est.tech@lists.openembedded.org">est.tech@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2026-10-20 16:13, Mathieu Dubois-Briand wrote:<br>
&gt; The log in there is really verbose. I hope you can extract some useful=
<br>
&gt; data from these few thousand lines of ptest log.<br>
<br>
Hi Mathieu,<br>
<br>
Able to identify the problem and verified locally and sent v2.<br>
<br>
Actually recipe is expecting two test cases to fail but those are <br>
passing now after upgrade and dropped that change.<br>
<br>
<br></blockquote><div><br></div><div>elfutils ptests have had additional=C2=
=A0failures=C2=A0with musl in=C2=A0past. Would be</div><div>good to check t=
hat. There are also failures when using clang if you want</div><div>to be a=
dventurous might look into validating with clang build as well.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Jaipaul<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248303): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248303" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248303</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121846288/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121846288/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e82e65065e477b28--
