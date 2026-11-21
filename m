Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25979.1795302836687920307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 15:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cuOyOZ2A;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3866a784546so2405799eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 15:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795302836; cv=none;
        d=google.com; s=arc-20260327;
        b=SQ51xd3Us0uOR4S5W+TPoyui9ZDhlmxrZoWKmM/gidNfWtepsCnEpWTerIXTYvl6VN
         G0hxTzm7tLoqeFljqFuSE5N+SIaT+asn4rKVAK8LIOV0GcaExDtS0GgdQI/yDXAgpO1o
         veUt4siXj9undjREXoW8P8OLDNkmKv0HFH36qLptx7ySxzFxLncYxOngfMGNie+PBJ/s
         1ZqVdvyLuyATOZnWaU1rSq2c725Z0jU6sutxKQvuVaw6vHbwjta3S3FjzAQxP/qw+c++
         ubMaiWBzMpzmnM7xj42zD9VsDGPxwznkGtOBRQLGR6u6LKCHN815PcSNTjJHjYGfKC3E
         ggEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+lhhbFMfCI9OiobsWLx4eBLlrGIhJawwdUDK5t46gKU=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=hgr57gW6/rymmmuXnRCgSHbsaWkxhpYgeEoP0WoLUalMZkLa+24OQguUU9u9fs9SUG
         yNhzBQIVDOxZ+4BfdaljlMyuBtnJHbx9z0DAMTz7K/jtNH9OyOcQs2/+D2YdGWlMSEyJ
         tPO/lazlgP+IFOY/7fcAjXsqjGfhlQ/oCksG0er9YKjflYsQN3Tu4ElW9jz7VzMGK+lz
         crI6VNNje8uxrfEsv9kYuBdZd264G3z/OpflXdLblDZ4r+VYwSmnm71/M8iCkGqGIyji
         rkUxGQVoR90SmgXIWotfNMcDsJG4SkYBdZjLzpGa3nl5GPBv/wPBOFtMXilGGAT+oTnS
         M3qQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795302836; x=1795907636; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lhhbFMfCI9OiobsWLx4eBLlrGIhJawwdUDK5t46gKU=;
        b=cuOyOZ2ARd4DffiTIsR5t5N1gBO1t9yJbcJUl+UebkUtgiMQf+O5oU169ci8AmqApX
         PbLEniRGv0MEPkZm9XiGi7RgqD3/MM899RgGcNwvXijVWwb1FdWTkwpwUTYgpLJSW4cY
         NyQeAZqea/V8YAQ9DkZh99J3JyHuS6NqUt2Od/Y+ILANFc/pFOgIyi28t57TYB6McvpG
         Np6EKDJtHrt5GhF/mmCIYsSCOSP5wp6TESh/9T4fNWv+tPUhmtvMQ28C3vlg3zjfR65G
         /M7+YJ+dmude3LLa3nxwxuHvvMcfwwVWmbDhwqDFXig5g3cRHPb6nIlZmo5cDd/n0lU4
         ZdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302836; x=1795907636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+lhhbFMfCI9OiobsWLx4eBLlrGIhJawwdUDK5t46gKU=;
        b=Uy5gajFM4dRWaJabeAoyGEN4odObDbSLf2uNDxlKCmI2JtA8waRAdp/ZNytQR2mGtA
         887GVkFqkYBjqDKDSG7G4OExcHECLzk2t4fnX/VXdcmLjZKz/dtckJq5VsoQPsgwquEM
         KucUVgiWUxzxPnjb35NtOXExLB4atZCScQ5TnPcrDhZiXV/UF+cHCYGL5LWt04nV9lkP
         qxyiuBYlAkcwr+yLnaC/2qiCULSdpNRpDjZrjF96+0yPTgpAr53bmpkrczkUUoQqAfMO
         oE3VAXnB3g1xwHnqpDaLWZUfTQTwBW1oeazs/PevlrQqrs98vnT61FwIbCQu2Mun2hr+
         hdNg==
X-Gm-Message-State: APuU4Z/JtbjpJjixfO0Bd0nv29NqHHhe88MAQtoMDJdOkm1SIQHAB5hh
	0chcqP/gXfTl6LzIP68od8JAizx5XeJBxeS9YnVq+U2EIf5oYidw+ev6HvZIoP+Jt5R8NQxDD9r
	JG71PafhM3rn+3ZA62m8H1y4yWX9TawxFZSTDxvWBiGTTYGjV57Adc76tCsOYYUwMi1o+dNM=
X-Gm-Gg: AZFdTZf3RmDCEFLb/zbIYwT9Uk+plrcg0gYfJMrWRSU2WSPNCdqlUVDnx9D34yWMwTp
	sjuHB1UZWrPCsIkvCfFBL2nmJhsUH6eDCFh8ikBjuKSMayHomW42W97fFuQ5J/3DAUEW3LBaJN/
	Dh0/hF5cPk5wI9rma/Kh7PuN74ZloOHXlauaZ7NArZGEx94tC9+LXKr+1arzOXyfK1WJNp51uL6
	oxKsY4TwFmzwaOPiD3Ghuj/q/ZxR6pom0Lt98DRLk9C95mRPVajTe8PpaC39XnMeXrZ2ikaME/v
	ngWJquzqvhgPw6HeF6GtHYJYynRFmXn2nUr4yrsSiIvOtQ9hTUAXTTQHyOm963WXwwdSlQDF6Df
	T2nAlacmaFTcrltxopIcwZYu3EQxJ10LeFlzz
X-Received: by 2002:a05:7301:6e9a:b0:37b:e01b:9f15 with SMTP id
 5a478bee46e88-3857025f802mr7938069eec.24.1795302835923; Sat, 21 Nov 2026
 15:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20261117073849.3089566-1-ragaprasanth@gmail.com> <DN19P4D41RQC.J6VXZC0CZ5L8@smile.fr>
In-Reply-To: <DN19P4D41RQC.J6VXZC0CZ5L8@smile.fr>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Sun, 22 Nov 2026 08:13:44 +0900
X-Gm-Features: Aa3M54q4cdEmuXQcCLlcfLe8zouicl7zpHXxiV7IKw6D0P_5FdEwYJVf8dG-imY
Message-ID: <CAG7eodEvJJaUjWMj_jQa1wE_hLf6owq=xwHj_9Sy3tgc8qN_qQ@mail.gmail.com>
Subject: Re: [scarthgap][PATCH 1/2] u-boot: fix CVE-2026-29009
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ccb1e30660d18317"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 23:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250858

--000000000000ccb1e30660d18317
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=91=8D

Prasanth Ramesh reacted via Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

--000000000000ccb1e30660d18317
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=91=8D",
  "version": 1
}
--000000000000ccb1e30660d18317
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=91=8D<=
/p><p style=3D"margin-top:10px;margin-bottom:0">Prasanth Ramesh reacted via=
 <a href=3D"https://www.google.com/gmail/about/?utm_source=3Dgmail-in-produ=
ct&amp;utm_medium=3Det&amp;utm_campaign=3Demojireactionemail#app">Gmail</a>=
</p></div>

--000000000000ccb1e30660d18317--
