Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 030C2784DC;
	Thu, 22 Feb 2018 20:37:44 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id y186so1872167pfb.2;
	Thu, 22 Feb 2018 12:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=f9hsO+Xyv+uXSZ4o71jL/AxqarlLQsk5by2sNnS1VZc=;
	b=WEH2JmpntGddDUzzqLNAmVIRAsEBqypcblujjI8M6ko0eLfU4VvbciFozTtc/LHP6a
	UWDvddPYpwCkOOUL/Q3Vw9v0rJY/Z9myov8zSFF0ttzVEl4FzReGPds76/F+VjzdaisM
	hkaJ8hSLEUFerWoUIonIx6KH86BUnoIqiJA+S8+dml9IVD+EQ+yMydmcMWQHfmrHmaYH
	7o18s8ANbVkr3vAzwRdUJR+9PHvP6TCHE1sGb3iiWIBppT/YyWc9TfIt1Y6pQ0S8RIk7
	qDZ17MXmqwyXZPgWAYakB661Cyq+cLXUjV3GGsZBRnAlOadHKGGzNFjz+bLxa2oNWo5A
	kmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=f9hsO+Xyv+uXSZ4o71jL/AxqarlLQsk5by2sNnS1VZc=;
	b=Z04yzStjpsfK2TZz/yQmrVlS6x+u29bokosLXzwBjMqo5Is/S4EPSYvcGnCA/Ivyft
	FwmkO7cABLM86vDMS8GmpmvyMojRfqHuAym7nENHBAjWp+lQoSUl/badrM09Hif7TESV
	9OtXbwxIWOAxRFwjDF7gdUhlrFHNnIh+7DElpD4gQnlZUqcj5sw+nbM9sPJHruNpFG2s
	KJ0Q+wOtEtbYRTaj6bb7Qf+K7DiNkj2mfFKvlIkWTkRmGJuzUIT2gzGK3HosHiDiJUW1
	ISp9ILHpBh5x8G+LKXBPFAwjCPmZGMRSlvpN2tQabf5HuttCZ2zfKKeRXBFy+K9FwFWg
	dfFA==
X-Gm-Message-State: APf1xPDgm5DD/8foG30/kTLtYyOL22aCfot7Oqg9oUB+8WvKkf0uQw1V
	sMX+utrOjn9o33Xp7Mf46okFpA==
X-Google-Smtp-Source: AH8x226Wb/biuxAhiCuUd+wAGmGN2n3pPRAqyZsFyFQkrrJwFo+qjfmcvrmBhz8OQHIu/jOJ/tBUQA==
X-Received: by 10.99.143.69 with SMTP id r5mr6570665pgn.160.1519331865916;
	Thu, 22 Feb 2018 12:37:45 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:18a7:7dde:bcc7:31a7?
	([2601:202:4000:1184:18a7:7dde:bcc7:31a7])
	by smtp.gmail.com with ESMTPSA id
	j25sm1302602pgn.92.2018.02.22.12.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 12:37:45 -0800 (PST)
To: Andrea Adami <andrea.adami@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAAQYJAudtnFaY1S2j6FF_pN9B1OJhN-6fEBY8nWCtM73Kx8tSw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0bb858dc-a43f-ae14-01c9-2a42855e4409@gmail.com>
Date: Thu, 22 Feb 2018 12:37:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAAQYJAudtnFaY1S2j6FF_pN9B1OJhN-6fEBY8nWCtM73Kx8tSw@mail.gmail.com>
Subject: Re: [RFC] Rename meta-openembedded to openembedded-extras
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
X-List-Received-Date: Thu, 22 Feb 2018 20:37:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/21/2018 11:55 PM, Andrea Adami wrote:
> All,
> it seems there is some consensus about reordering/cleaning the
> "OpenEmbedded layers".
>
> I think that before starting any cleaning *inside* we should finally
> clean up the confusion about meta-oe meta-openembedded
> openembedded-layers, etc..
>
> I think it would be advisable to rename the repository from
> meta-openembedded to openembedded-extras, matching the
> openembedded-core naming schema.
Renaming an existing repo will cause more damage than what benefit one
thinks it may solve.=C2=A0

I think openembededd-core is incorrect. it should have been
meta-openbedded-core or meta-core.

- armin
>
> Regards
> Andrea
>
>
> P.S.
> One layer of this repo would be the (in)famous meta-oe.
> I can't imagine right now a definition for it: it contains old
> versions of oe-core recipes, expunged recipes, tools and libraries
> needed by other layers (i.e. tslib), etc. etc.
> This one will need a separate thread.



