Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCCFE78449
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 17:34:59 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id m11so16277527iob.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 09:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qx4sxQItwOfiX6Gp3NBGTYJ+6uLzCa78TakHD46D08U=;
	b=tTsPjd5b+V7nb3acPTRg9Rf0ncGELU68ZWYdxjVkdgIMQSwx0ABad1glfzErfB0lBz
	FJx534XUz12alLq7RJzQS0IfDsia7U09ov2emPQoUKZ2dNjkivPe/q390wXHwsD6RsF9
	KBMlLKDDWLZBITK8teXJc9X2sVhZ+bSYH06wp/bQfF+rWz0pjpCYBlp1Ng0uLeCSoc6Q
	dndT8qQl/4EgFExLeWL3LlBpIyE6KULjh1gD+2hVwbMh3VqejOwBspExZo5fQMMb0QeM
	UwYQkXZdqHai7B+mRTxnpFAIydP1JrreIA11rKL85TnuVuHpxTR+dMPbllk59P1E0s8Y
	BKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qx4sxQItwOfiX6Gp3NBGTYJ+6uLzCa78TakHD46D08U=;
	b=iUMYA5Y/MjZEYsw7MeWCzgH/StgzplRum5vHbRzQlFeRiqhWwSlOTK9zax/VPa1+ab
	i4eGNIPtCRYSU6s74ClyGaEvg8B0hTPFHCPkuOVvi+4ACfjyyavH9GTJM4IljZEgpEXR
	65sbJqubzL0ogefxCXTOieqdz2/+EMyXL5WxIPjOH4lT+hn1XXLPYh4r51hedQDVAuOT
	x9ruwP+aHUmmeW+A6E70ZXNSHUymzP5aLqax3SH3x9hgWmWAO0aRHl8TRmo8imwubjkz
	RN/TDklP1BtqkCGYNwO/xgVfaX9onIzXK+vsdj+f3LAWhUc2yCwiCDDGtV3TNzNRhYaR
	NGCA==
X-Gm-Message-State: AKwxyteMj5mdg8Uup21bBxPK1ry1pGOgYsYaO+WNnbEz5Vx9Y8zG5931
	usUZVwTu8tzuJDgt9oOT/QAYwjG2bw0tedvXf8HQHw==
X-Google-Smtp-Source: ACJfBouAaY55ch0Wg1GJU2iM8w27htnNIse7uyET0psaf0pdLL7Nb76DS3m7kECsKa9AIiYA8zfxYRAcHK1/WfZOXrI=
X-Received: by 10.107.186.86 with SMTP id k83mr15138816iof.208.1516296900793; 
	Thu, 18 Jan 2018 09:35:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Thu, 18 Jan 2018 09:34:40 -0800 (PST)
In-Reply-To: <5377d8ea-0b83-a972-eece-a0dbd3129f31@windriver.com>
References: <cover.1515461823.git.Qi.Chen@windriver.com>
	<a320979ef8fb138981c66b8c0ead607a9804cee0.1515461823.git.Qi.Chen@windriver.com>
	<CAJTo0LayZCc=psjBv7QjsXNi3drktBT4wmZcXd37cVGHYbAJcg@mail.gmail.com>
	<5377d8ea-0b83-a972-eece-a0dbd3129f31@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jan 2018 17:34:40 +0000
Message-ID: <CAJTo0LanxcbSTOatAxbD_hn6meS1Rwkvjug_+DPryMUcW1nAQA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Thu, 18 Jan 2018 17:34:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a702587d40563106254"

--94eb2c076a702587d40563106254
Content-Type: text/plain; charset="UTF-8"

On 18 January 2018 at 16:47, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2018-01-11 11:18 AM, Burton, Ross wrote:
>
>> On 9 January 2018 at 01:40, Chen Qi <Qi.Chen@windriver.com <mailto:
>> Qi.Chen@windriver.com>> wrote:
>>
>>     * hostname is explicitly enabled to keep the same with previous
>> recipe's
>>        behaviour.
>>
>>
>> But buildhistory-diff:
>>
>> packages/corei7-64-poky-linux/coreutils/coreutils: FILELIST: added
>> "/usr/bin/hostname"
>>
>> So the old coreutils wasn't building hostname at all (we use
>> /bin/hostname from busybox).
>>
>

> Are you asking Chen to package coreutils.hostname and
> use the alternatives mechanism with busybox's hostname as the default?
> (busybox hostname has annoyed me in a past life!)
>

I'm not sure what I'm asking, just pointing out that the log is wrong as
the old coreutils wasn't building a hostname binary.

If someone sets base_bindir and bindir to the same directory then there
will be a conflict, so this does need to be sorted somehow.

Ross

--94eb2c076a702587d40563106254
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 January 2018 at 16:47, Randy MacLeod <span dir=3D"lt=
r">&lt;<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">ran=
dy.macleod@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 2018-01-11 1=
1:18 AM, Burton, Ross wrote:<span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 9 January 2018 at 01:40, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver=
.com" target=3D"_blank">Qi.Chen@windriver.com</a> &lt;mailto:<a href=3D"mai=
lto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<=
wbr>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 * hostname is explicitly enabled to keep the same with previo=
us recipe&#39;s<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 behaviour.<br>
<br>
<br>
But buildhistory-diff:<br>
<br>
packages/corei7-64-poky-linux/<wbr>coreutils/coreutils: FILELIST: added &qu=
ot;/usr/bin/hostname&quot;<br>
<br>
So the old coreutils wasn&#39;t building hostname at all (we use /bin/hostn=
ame from busybox).<br>
</blockquote>
</span></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Are you=
 asking Chen to package coreutils.hostname and<br>
use the alternatives mechanism with busybox&#39;s hostname as the default?<=
br>
(busybox hostname has annoyed me in a past life!)<br></blockquote><div><br>=
</div><div>I&#39;m not sure what I&#39;m asking, just pointing out that the=
 log is wrong as the old coreutils wasn&#39;t building a hostname binary.</=
div><div><br></div><div>If someone sets base_bindir and bindir to the same =
directory then there will be a conflict, so this does need to be sorted som=
ehow.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c076a702587d40563106254--
