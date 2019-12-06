Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD697F7CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:16:03 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id u189so2217211vkf.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 05:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=miEjGEpC5dp+HL7vMwihvQ5rI82iG6CeYB9KgcGRfCw=;
	b=jTxmvp7dwXv71JkSbT9CHUL9PJ7zkb3B49Kqq5No4ETcHNrtEqvLirN0wbfURfOTmD
	N4A//pOfbW3EIfTbSQ67PdeawGXljdiVP6blPKrorVo5HTQqX89D0sy2md68GLme8xxF
	57vcixCDT3pHYPoe1uSc5H0ksKe6qCb/MflXdi85oalaWOYzRLDhGj+vW5Y/9rMj+p7q
	rMY1BAvX8o1Q3HXMJICVN5F0G5Nr8mpZeNk3Cu1Ku4rxNbwyAi26G1Eq8qVkPQO9sV4u
	3t5WhWUj9RGqL+zIWWE5ZI7d+llpetfGvEL8pixyzGuJ7SgABJoxUJvLtNM2NXGkslzH
	onkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=miEjGEpC5dp+HL7vMwihvQ5rI82iG6CeYB9KgcGRfCw=;
	b=qlOGwjUzgNka8ExARNP+ECC2/fPB1XDzaKNtQ3M5JzYKE/QAuleZsagQ4LlAHOYjuh
	/jL8V6yrofHoPxQ2B3x6LR4er0fwh1wUsDhvERZEL+kLjU4hB55ScTiaeOJ58n5KKzeb
	fwwEpO6x2FiowTpxxnDdfqn43tId/896Ct/Wid7UnZEDQ091rU4mytuCNSXZhIgqsfse
	bVhYZMeqxRxZLUYevBy8bLp4SPck5y5RBaf10wFfYtejU564o98OdxUjAK7PHkBa70ZN
	4zStSAHEmx+dJ/AqiQypM8bKt2eDSOUqVX1Z6LJIgtT9TbHVQGoQb3c4mtq8mICCVZTM
	SO5A==
X-Gm-Message-State: APjAAAXCPBfeikfYxyudsrvDImLVnf4argbzewzXFS5l6CKG3GxfQmrN
	aClT9bDVfRi3Dt3tWF5Pit7OdgudYKFJQ4VIVfk=
X-Google-Smtp-Source: APXvYqyh6d4JMlytYavRi+9s/6O2KGhAIRne1yaNRWG6hPFMiBwUrd+CuUo9qu/iSVoCctqvnFX5IaC91EOn7uY2TTs=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr10043112vkq.49.1575638164048; 
	Fri, 06 Dec 2019 05:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-15-alex.kanavin@gmail.com>
	<5ba2ff8d-0d22-67f4-38bb-e000ea505ead@intel.com>
In-Reply-To: <5ba2ff8d-0d22-67f4-38bb-e000ea505ead@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Dec 2019 14:15:52 +0100
Message-ID: <CANNYZj-jGCuPgi_7WPeKTN6s8retagVDxVXhySdwZ2zDRVECxA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/24] sysklogd: update to 2.0.3
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
X-List-Received-Date: Fri, 06 Dec 2019 13:16:03 -0000
Content-Type: multipart/alternative; boundary="00000000000010112e059908d9ec"

--00000000000010112e059908d9ec
Content-Type: text/plain; charset="UTF-8"

Thanks, I fixed this and will resend.

Alex

On Fri, 6 Dec 2019 at 00:48, Ross Burton <ross.burton@intel.com> wrote:

> On 05/12/2019 15:43, Alexander Kanavin wrote:
> > Drop all patches as they are no longer necessary with autotools,
> > fix problems that are addressed upstream, or (in case of
> no-vectorization.patch)
> > don't apply to the old version either, which means no one is using that
> hw target
> > anymore.
> >
> > Remove custom systemd configs (provided by upstream), and custom
> > syslog config (also provided by upstream but not installed by default).
>
> Sorry, but:
>
> ERROR: sysklogd-2.0.3-r0 do_package: SYSTEMD_SERVICE_sysklogd value
> syslogd.service does not exist
>
> Ross
>
>

--00000000000010112e059908d9ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I fixed this and will resend.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, 6 Dec 2019 at 00:48, Ross Burton &lt;<a hre=
f=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 05/12/2019 15:43=
, Alexander Kanavin wrote:<br>
&gt; Drop all patches as they are no longer necessary with autotools,<br>
&gt; fix problems that are addressed upstream, or (in case of no-vectorizat=
ion.patch)<br>
&gt; don&#39;t apply to the old version either, which means no one is using=
 that hw target<br>
&gt; anymore.<br>
&gt; <br>
&gt; Remove custom systemd configs (provided by upstream), and custom<br>
&gt; syslog config (also provided by upstream but not installed by default)=
.<br>
<br>
Sorry, but:<br>
<br>
ERROR: sysklogd-2.0.3-r0 do_package: SYSTEMD_SERVICE_sysklogd value <br>
syslogd.service does not exist<br>
<br>
Ross<br>
<br>
</blockquote></div>

--00000000000010112e059908d9ec--
