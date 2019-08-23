Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 673887ECC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 10:21:18 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id b204so2283020vka.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q2QW2ghDmDzUcV3GmW9puQBcp2JNJu9NObWpOucLlJY=;
	b=pukutCt5PAEFclywBpPppttC7gLhztoNbVG3dgIq/T1Zd7ZW0ux8V7/7NX6GONOOqr
	EwGna+4nUAgNqPvp7cGkBa1+gsV19yKJyK3oZYumjGiE+EXu7N3YYCoEYPGSa7SKTEW1
	RvbJS/IoTD0qzvUR5vU9tU1VOibnOR7Jc32+pwr9Gnp6VLM11e+Go5/cj58trfwY1l+f
	f0F2uRqiIa03ey0QQNV8ve6VvdWf72WbzYWz1zCk1JsWeEbo60skVYrBVcjV3/V4kjls
	6HuCrYmii7vQJabhYMjfTPA3VtuP3qisknexZMa8Z5ztRs3D3jmHDlqNPLY3G/YHyqQI
	/OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q2QW2ghDmDzUcV3GmW9puQBcp2JNJu9NObWpOucLlJY=;
	b=PR2kWbSBjH1zJw2oTPEDqsluC095Fkdkzm1C3B/a4q9bEhGr3EcNBVaZoKAI1kmhqA
	htIoeKZn2o/Q7uktprM59aM8gVdY3S0jVO+2ZgxdHp7lfcVgCwU9ef57pr143OY5YKFR
	ciaj5zECElpjurPdwXaGxlHwklvrWAFxrn0cy8JxVll289wDscoQsbiIvY5LF9JhA1P/
	+Vx9YMftq9+1URooPU9VzXBFKIx5BkRopI14jwDLTzvG0aseFV2ZubYdYokHd8KgcJBu
	73rhcETKmeuEf+CnBtcBbPeYsg6BVZ1LFXFuQr9vqjm1BUuieBDX2lXY9lvXcXziYol9
	NG0w==
X-Gm-Message-State: APjAAAVEBPs43SV9RyM+E0LMdfOlZvNar5ddHmUykkoi4PJTxfBv4Ao/
	aYmQwpX1Ml1+OVGDmQz4cnuo6ID5ZTr5r35K6v8=
X-Google-Smtp-Source: APXvYqwZDfrTHZNH8a890JzvRIbuBNLbR/Hn7Ww9k25GaST4Xnam664g24gIypJGAOYpD+HyxsFjf1IsSuQSh5tiVZY=
X-Received: by 2002:a1f:ec41:: with SMTP id k62mr2029548vkh.32.1566555679159; 
	Fri, 23 Aug 2019 03:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190823081945.49883-1-kai.kang@windriver.com>
In-Reply-To: <20190823081945.49883-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2019 12:21:07 +0200
Message-ID: <CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libwacom: add recipe
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
X-List-Received-Date: Fri, 23 Aug 2019 10:21:18 -0000
Content-Type: multipart/alternative; boundary="000000000000c6fe130590c62a50"

--000000000000c6fe130590c62a50
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2019 at 10:20, <kai.kang@windriver.com> wrote:

> Package libinput has a package config 'libwacom'. When it is set,
> package libwacom is required. So add the recipe of libwacom.
>

This recipe probably needs to go to meta-oe? Why oe-core?

Alex

--000000000000c6fe130590c62a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 23 Aug 2019 at 10:20, &lt;<a href=
=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Package libinput has a package config &#39;libwacom&#39;. When i=
t is set,<br>
package libwacom is required. So add the recipe of libwacom.<br></blockquot=
e><div><br></div><div>This recipe probably needs to go to meta-oe? Why oe-c=
ore?</div><div><br></div><div>Alex<br></div></div></div>

--000000000000c6fe130590c62a50--
